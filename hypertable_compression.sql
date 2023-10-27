-- Hypertable and Compression settings

SELECT create_hypertable('hit_hyper_compressed', 'eventtime');

-- Enable Compression 

ALTER TABLE hits SET (timescaledb.compress, timescaledb.compress_orderby = 'counterid, eventdate, userid, eventtime');

-- You can also try on different settings to measure compression ratio for example
-- ALTER TABLE hits SET (timescaledb.compress, timescaledb.compress_orderby = 'counterid,eventtime desc');


SELECT add_compression_policy('hit_hyper_compressed', INTERVAL '1s');

-- Note: Compression is not applied immediately when you run above command. It is scheduled after an interval of time as defined by schedule_interval and initial_start parameters.



--References
-- https://github.com/timescale/timescaledb/issues/4473#issuecomment-1167095245
-- https://docs.timescale.com/timescaledb/latest/how-to-guides/compression/manually-compress-chunks/#compress-chunks-manually
