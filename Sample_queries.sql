--Sample Queries to run(Not tested)

1: SELECT UserID, extract(day FROM EventTime) AS m, SearchPhrase,URL, COUNT(*) FROM hits GROUP BY UserID, m, SearchPhrase,URL where eventtime >= '2013-07-24' and search_phrase <> '' and URL <> '' ORDER BY COUNT(*) DESC LIMIT 10;

check hourly webpage view counts 

2: SELECT
  EXTRACT(hour from eventtime) as hours,
  COUNT(*) as PageViews
FROM hit
WHERE eventtime > '2013-07-31 00:00:00' 
GROUP BY hours;

3: SELECT time_bucket('1 hour', eventtime) AS hour, count(*) as PageViews -> extra for timescale
FROM hit
WHERE eventtime > '2013-07-31 00:00:00'
GROUP BY hour
ORDER BY hour DESC;

4: SELECT RegionID, , COUNT(*) AS PageViews FROM hits WHERE CounterID = 62 AND eventtime >= '2013-07-24' AND eventtime <= '2013-07-31' AND IsRefresh = 0 AND URL URL<> '' GROUP BY RegionID, URL ORDER BY PageViews DESC LIMIT 10;
