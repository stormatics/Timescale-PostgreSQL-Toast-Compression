--1: Get Table and Toast size 

SELECT
    c1.relname,
	pg_size_pretty(pg_total_relation_size(c1.relname::regclass)) AS total_size,
    pg_size_pretty(pg_relation_size(c1.relname::regclass)) AS table_size,
pg_size_pretty(pg_indexes_size(c1.relname::regclass)) AS table_index_size,
    c2.relname AS toast_relname,
    pg_size_pretty(pg_relation_size(('pg_toast.' || c2.relname)::regclass)) AS toast_size,
pg_size_pretty(pg_relation_size(('pg_toast.' || c2.relname || '_index')::regclass)) AS toast_index_size
FROM
    pg_class c1
    JOIN pg_class c2 ON c1.reltoastrelid = c2.oid
WHERE
    c1.relname = 'hit_uncompressed'
    AND c1.relkind = 'r';


--2: Change storage of a table column

ALTER TABLE <tablename> ALTER COLUMN <columnname> SET STORAGE main;

 
--3: Get hypertable detailed size(Table + toast only)

 select
    pg_size_pretty(table_bytes) as table_size,
    pg_size_pretty(index_bytes) as index_size,
    pg_size_pretty(toast_bytes) as toast_size,
    pg_size_pretty(total_bytes) as total_size
from
hypertable_detailed_size('hit_hyper_compressed');



--4: Get chunk wise statistics

select  chunk_schema,
        chunk_name,
		pg_size_pretty(table_bytes) as table_size,
        pg_size_pretty(index_bytes) as index_size,
        pg_size_pretty(toast_bytes) as toast_size,
        pg_size_pretty(total_bytes) as total_size
from
chunks_detailed_size('hit_hyper_compressed') ORDER BY chunk_name, node_name;



--5: Generate random json data using function

drop function create_jsonb_random();
CREATE OR REPLACE FUNCTION create_jsonb_random() 
RETURNS json AS
$$
BEGIN
 RETURN json_build_object('payload', gen) from repeat('a', pow(5,floor(random() * 5 + 1))::int) gen;
END;
$$ LANGUAGE plpgsql;



--6: Compress chunks manually with given range

SELECT compress_chunk(i, if_not_compressed => true)

SELECT compress_chunk(<hypertable-chunk-name>);

--Compress with a given range

SELECT compress_chunk(i, if_not_compressed => true)
    FROM show_chunks(
        '<hyper-table-name>',
        <starttime>,
        <EndTime>
    ) i; -- Where i is the chunk name
	
	
--7: Set automated compression policy_compression

ALTER TABLE <HyperTable> SET (
Timescaledb.compress,
Timescaledb.compress_orderby = ‘col1 ASC/DESC… col2’
timescaledb.compress_segmentby = ‘col1,col2….’
);

-- Set Compression Policy

SELECT add_compression_policy('<hypertablename>', '<compress-after-interval>');
	
-- Get information about compression-related settings for hypertables

SELECT * FROM timescaledb_information.compression_settings WHERE hypertable_name = '<hyper-table-name>';

--Get Information about compression job scheduling

SELECT * FROM timescaledb_information.jobs WHERE proc_name='policy_compression';

-- Get Compression stats for Hypertable (Empty result is compression is disabled)

SELECT total_chunks,number_compressed_chunks, pg_size_pretty(before_compression_table_bytes) as before_compression_table_size ,
pg_size_pretty(before_compression_index_bytes) as before_compression_index_size, 
pg_size_pretty(before_compression_toast_bytes) as before_compression_toast_size,
pg_size_pretty(before_compression_total_bytes) as before_compression_total_size,
pg_size_pretty(after_compression_table_bytes) as after_compression_table_size,
pg_size_pretty(after_compression_index_bytes) as after_compression_index_size,
pg_size_pretty(after_compression_toast_bytes) as after_compression_toast_size,
pg_size_pretty(after_compression_total_bytes) as after_compression_total_size
 FROM hypertable_compression_stats('hit_hyper_compressed');


--REFERENCES

-- 
-- https://docs.timescale.com/api/latest/informational-views/
-- https://docs.timescale.com/api/latest/compression/
-- https://docs.timescale.com/use-timescale/latest/compression/

