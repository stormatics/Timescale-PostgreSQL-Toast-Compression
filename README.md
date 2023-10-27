# Timescale-PostgreSQL-Toast-Compression
 This test is conducted for comparing Postgresql Toast compression algorithms(PGLZ and LZ4) and Timescale Hypertable compression. 

Following are the tables used:

**hit_uncompressed**: Regular postgreSQL heap table with toast strategy set to external. No compression is applied.
**hit_compressed_pglz**: Regular PostgreSQL heap table with toast strategy set to main. Compression will be applied first. default_toast_compression algorithm is set to PGLZ.
**hit_compressed_lz4**: Regular PostgreSQL heap table with toast strategy set to main. Compression will be applied first. default_toast_compression algorithm is set to LZ4. 
**hit_hyper_compressed**: Compressed hypertable with toast strategy set to main. This table has 22 compressed chunks and default_toast_compression algorithm is set to LZ4. 

This test includes 5 files 

**Create_table.sql** : Holds structure for all tables.
**Create_table_json.sql** : Holds structure for all tables with additional **JSONB** column. 
**hypertable_compression.sql** : Settings for creating hypertable and applying compression
**Helper_queries.sql** : Generic queries to find statistics such as tablesizes, hypertable stats and compression related stats.
**Sample_queries.sql** : Some sql queries to run on dataset(Untested)

We fetched the analytical dataset from clickhouse using the following wget command:
**wget --no-verbose --continue 'https://datasets.clickhouse.com/hits_compatible/hits.tsv.gz'
**

To accomodate JSONB column, we created a random jsonb generator(Check helper_queries.sql) function and inserted above dataset to tables.
