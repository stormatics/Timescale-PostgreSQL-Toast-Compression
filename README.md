# Timescale-PostgreSQL-Toast-Compression
 This test is conducted for comparing Postgresql Toast compression algorithms(PGLZ and LZ4) and Timescale Hypertable compression. 

Download dataset

`wget --no-verbose --continue 'https://datasets.clickhouse.com/hits_compatible/hits.tsv.gz'`

Decompress it using gzip

`gzip -d hits.tsv.gz`

To load this dataset into your table, run the following command:

` psql -p 5432 -d postgres -t -c '\timing' -c "\\copy hit_uncompressed FROM 'hits.tsv'"`

Following are the tables used:

**hit_uncompressed**: Regular postgreSQL heap table with toast strategy set to external. No compression is applied.

**hit_compressed_pglz**: Regular PostgreSQL heap table with toast strategy set to main. Compression will be applied first. default_toast_compression algorithm is set to PGLZ.

**hit_compressed_lz4**: Regular PostgreSQL heap table with toast strategy set to main. Compression will be applied first. default_toast_compression algorithm is set to LZ4. 

**hit_hyper_compressed**: Compressed hypertable with toast strategy set to main. This table has 22 compressed chunks and default_toast_compression algorithm is set to LZ4. 

This test includes 5 files 

**Create_table.sql** : Holds structure for all tables.

**Create_table_json.sql** : Holds structure for all tables with additional **JSONB** column. To accomodate JSONB column, we created a random jsonb generator(**Check create_jsonb_random() inside helper_queries.sql**) function, set it as default for payload column and then, inserted dataset to tables.

**hypertable_compression.sql** : Hypertable and compression settings for **hit_hyper_compressed** table 

**Helper_queries.sql** : Queries to provide information such as table sizes, compression stats and hyper chunks.

**Sample_queries.sql** : Some sql queries to run on dataset(Untested)

