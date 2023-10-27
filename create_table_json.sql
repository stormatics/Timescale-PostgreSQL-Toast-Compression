drop table hit_uncompressed;
CREATE TABLE hit_uncompressed
(
    WatchID BIGINT NOT NULL,
    JavaEnable SMALLINT NOT NULL,
    Title TEXT NOT NULL,
    GoodEvent SMALLINT NOT NULL,
    EventTime TIMESTAMPTZ NOT NULL,
    EventDate Date NOT NULL,
    CounterID INTEGER NOT NULL,
    ClientIP INTEGER NOT NULL,
    RegionID INTEGER NOT NULL,
    UserID BIGINT NOT NULL,
    CounterClass SMALLINT NOT NULL,
    OS SMALLINT NOT NULL,
    UserAgent SMALLINT NOT NULL,
    URL TEXT NOT NULL,
    Referer TEXT NOT NULL,
    IsRefresh SMALLINT NOT NULL,
    RefererCategoryID SMALLINT NOT NULL,
    RefererRegionID INTEGER NOT NULL,
    URLCategoryID SMALLINT NOT NULL,
    URLRegionID INTEGER NOT NULL,
    ResolutionWidth SMALLINT NOT NULL,
    ResolutionHeight SMALLINT NOT NULL,
    ResolutionDepth SMALLINT NOT NULL,
    FlashMajor SMALLINT NOT NULL,
    FlashMinor SMALLINT NOT NULL,
    FlashMinor2 TEXT NOT NULL,
    NetMajor SMALLINT NOT NULL,
    NetMinor SMALLINT NOT NULL,
    UserAgentMajor SMALLINT NOT NULL,
    UserAgentMinor TEXT NOT NULL,
    CookieEnable SMALLINT NOT NULL,
    JavascriptEnable SMALLINT NOT NULL,
    IsMobile SMALLINT NOT NULL,
    MobilePhone SMALLINT NOT NULL,
    MobilePhoneModel TEXT NOT NULL,
    Params TEXT NOT NULL,
    IPNetworkID INTEGER NOT NULL,
    TraficSourceID SMALLINT NOT NULL,
    SearchEngineID SMALLINT NOT NULL,
    SearchPhrase TEXT NOT NULL,
    AdvEngineID SMALLINT NOT NULL,
    IsArtifical SMALLINT NOT NULL,
    WindowClientWidth SMALLINT NOT NULL,
    WindowClientHeight SMALLINT NOT NULL,
    ClientTimeZone SMALLINT NOT NULL,
    ClientEventTime TIMESTAMPTZ NOT NULL,
    SilverlightVersion1 SMALLINT NOT NULL,
    SilverlightVersion2 SMALLINT NOT NULL,
    SilverlightVersion3 INTEGER NOT NULL,
    SilverlightVersion4 SMALLINT NOT NULL,
    PageCharset TEXT NOT NULL,
    CodeVersion INTEGER NOT NULL,
    IsLink SMALLINT NOT NULL,
    IsDownload SMALLINT NOT NULL,
    IsNotBounce SMALLINT NOT NULL,
    FUniqID BIGINT NOT NULL,
    OriginalURL TEXT NOT NULL,
    HID INTEGER NOT NULL,
    IsOldCounter SMALLINT NOT NULL,
    IsEvent SMALLINT NOT NULL,
    IsParameter SMALLINT NOT NULL,
    DontCountHits SMALLINT NOT NULL,
    WithHash SMALLINT NOT NULL,
    HitColor CHAR NOT NULL,
    LocalEventTime TIMESTAMPTZ NOT NULL,
    Age SMALLINT NOT NULL,
    Sex SMALLINT NOT NULL,
    Income SMALLINT NOT NULL,
    Interests SMALLINT NOT NULL,
    Robotness SMALLINT NOT NULL,
    RemoteIP INTEGER NOT NULL,
    WindowName INTEGER NOT NULL,
    OpenerName INTEGER NOT NULL,
    HistoryLength SMALLINT NOT NULL,
    BrowserLanguage TEXT NOT NULL,
    BrowserCountry TEXT NOT NULL,
    SocialNetwork TEXT NOT NULL,
    SocialAction TEXT NOT NULL,
    HTTPError SMALLINT NOT NULL,
    SendTiming INTEGER NOT NULL,
    DNSTiming INTEGER NOT NULL,
    ConnectTiming INTEGER NOT NULL,
    ResponseStartTiming INTEGER NOT NULL,
    ResponseEndTiming INTEGER NOT NULL,
    FetchTiming INTEGER NOT NULL,
    SocialSourceNetworkID SMALLINT NOT NULL,
    SocialSourcePage TEXT NOT NULL,
    ParamPrice BIGINT NOT NULL,
    ParamOrderID TEXT NOT NULL,
    ParamCurrency TEXT NOT NULL,
    ParamCurrencyID SMALLINT NOT NULL,
    OpenstatServiceName TEXT NOT NULL,
    OpenstatCampaignID TEXT NOT NULL,
    OpenstatAdID TEXT NOT NULL,
    OpenstatSourceID TEXT NOT NULL,
    UTMSource TEXT NOT NULL,
    UTMMedium TEXT NOT NULL,
    UTMCampaign TEXT NOT NULL,
    UTMContent TEXT NOT NULL,
    UTMTerm TEXT NOT NULL,
    FromTag TEXT NOT NULL,
    HasGCLID SMALLINT NOT NULL,
    RefererHash BIGINT NOT NULL,
    URLHash BIGINT NOT NULL,
    CLID INTEGER NOT NULL,
	payload jsonb NOT NULL DEFAULT create_jsonb_random()
);


ALTER TABLE hit_uncompressed ALTER COLUMN FromTag SET STORAGE external;
ALTER TABLE hit_uncompressed ALTER COLUMN UTMTerm SET STORAGE external;
ALTER TABLE hit_uncompressed ALTER COLUMN UTMContent SET STORAGE external;
ALTER TABLE hit_uncompressed ALTER COLUMN UTMCampaign SET STORAGE external;
ALTER TABLE hit_uncompressed ALTER COLUMN UTMMedium SET STORAGE external;
ALTER TABLE hit_uncompressed ALTER COLUMN UTMSource SET STORAGE external;
ALTER TABLE hit_uncompressed ALTER COLUMN OpenstatSourceID SET STORAGE external;
ALTER TABLE hit_uncompressed ALTER COLUMN OpenstatAdID SET STORAGE external;
ALTER TABLE hit_uncompressed ALTER COLUMN OpenstatCampaignID SET STORAGE external;
ALTER TABLE hit_uncompressed ALTER COLUMN OpenstatServiceName SET STORAGE external;
ALTER TABLE hit_uncompressed ALTER COLUMN ParamCurrency SET STORAGE external;
ALTER TABLE hit_uncompressed ALTER COLUMN ParamOrderID SET STORAGE external;
ALTER TABLE hit_uncompressed ALTER COLUMN SocialSourcePage SET STORAGE external;
ALTER TABLE hit_uncompressed ALTER COLUMN SocialAction SET STORAGE external;
ALTER TABLE hit_uncompressed ALTER COLUMN SocialNetwork SET STORAGE external;
ALTER TABLE hit_uncompressed ALTER COLUMN BrowserCountry SET STORAGE external;
ALTER TABLE hit_uncompressed ALTER COLUMN BrowserLanguage SET STORAGE external;
ALTER TABLE hit_uncompressed ALTER COLUMN HitColor SET STORAGE external;
ALTER TABLE hit_uncompressed ALTER COLUMN OriginalURL SET STORAGE external;
ALTER TABLE hit_uncompressed ALTER COLUMN PageCharset SET STORAGE external;
ALTER TABLE hit_uncompressed ALTER COLUMN SearchPhrase SET STORAGE external;
ALTER TABLE hit_uncompressed ALTER COLUMN MobilePhoneModel SET STORAGE external;
ALTER TABLE hit_uncompressed ALTER COLUMN UserAgentMinor SET STORAGE external;
ALTER TABLE hit_uncompressed ALTER COLUMN FlashMinor2 SET STORAGE external;
ALTER TABLE hit_uncompressed ALTER COLUMN Referer SET STORAGE external;
ALTER TABLE hit_uncompressed ALTER COLUMN URL SET STORAGE external;
ALTER TABLE hit_uncompressed ALTER COLUMN Title SET STORAGE external;
ALTER TABLE hit_uncompressed ALTER COLUMN Params SET STORAGE external;
ALTER TABLE hit_uncompressed ALTER COLUMN payload SET STORAGE external;



--We are using toast storage here and no compression is performed on the table.



drop table hit_compressed_lz4;
CREATE TABLE hit_compressed_lz4
(
    WatchID BIGINT NOT NULL,
    JavaEnable SMALLINT NOT NULL,
    Title TEXT COMPRESSION LZ4 NOT NULL ,
    GoodEvent SMALLINT NOT NULL,
    EventTime TIMESTAMPTZ NOT NULL,
    EventDate Date NOT NULL,
    CounterID INTEGER NOT NULL,
    ClientIP INTEGER NOT NULL,
    RegionID INTEGER NOT NULL,
    UserID BIGINT NOT NULL,
    CounterClass SMALLINT NOT NULL,
    OS SMALLINT NOT NULL,
    UserAgent SMALLINT NOT NULL,
    URL TEXT COMPRESSION LZ4 NOT NULL,
    Referer TEXT COMPRESSION LZ4 NOT NULL,
    IsRefresh SMALLINT NOT NULL,
    RefererCategoryID SMALLINT NOT NULL,
    RefererRegionID INTEGER NOT NULL,
    URLCategoryID SMALLINT NOT NULL,
    URLRegionID INTEGER NOT NULL,
    ResolutionWidth SMALLINT NOT NULL,
    ResolutionHeight SMALLINT NOT NULL,
    ResolutionDepth SMALLINT NOT NULL,
    FlashMajor SMALLINT NOT NULL,
    FlashMinor SMALLINT NOT NULL,
    FlashMinor2 TEXT COMPRESSION LZ4 NOT NULL,
    NetMajor SMALLINT NOT NULL,
    NetMinor SMALLINT NOT NULL,
    UserAgentMajor SMALLINT NOT NULL,
    UserAgentMinor TEXT COMPRESSION LZ4 NOT NULL,
    CookieEnable SMALLINT NOT NULL,
    JavascriptEnable SMALLINT NOT NULL,
    IsMobile SMALLINT NOT NULL,
    MobilePhone SMALLINT NOT NULL,
    MobilePhoneModel TEXT COMPRESSION LZ4 NOT NULL,
    Params TEXT COMPRESSION LZ4 NOT NULL,
    IPNetworkID INTEGER NOT NULL,
    TraficSourceID SMALLINT NOT NULL,
    SearchEngineID SMALLINT NOT NULL,
    SearchPhrase TEXT COMPRESSION LZ4 NOT NULL,
    AdvEngineID SMALLINT NOT NULL,
    IsArtifical SMALLINT NOT NULL,
    WindowClientWidth SMALLINT NOT NULL,
    WindowClientHeight SMALLINT NOT NULL,
    ClientTimeZone SMALLINT NOT NULL,
    ClientEventTime TIMESTAMPTZ NOT NULL,
    SilverlightVersion1 SMALLINT NOT NULL,
    SilverlightVersion2 SMALLINT NOT NULL,
    SilverlightVersion3 INTEGER NOT NULL,
    SilverlightVersion4 SMALLINT NOT NULL,
    PageCharset TEXT COMPRESSION LZ4 NOT NULL,
    CodeVersion INTEGER NOT NULL,
    IsLink SMALLINT NOT NULL,
    IsDownload SMALLINT NOT NULL,
    IsNotBounce SMALLINT NOT NULL,
    FUniqID BIGINT NOT NULL,
    OriginalURL TEXT COMPRESSION LZ4 NOT NULL,
    HID INTEGER NOT NULL,
    IsOldCounter SMALLINT NOT NULL,
    IsEvent SMALLINT NOT NULL,
    IsParameter SMALLINT NOT NULL,
    DontCountHits SMALLINT NOT NULL,
    WithHash SMALLINT NOT NULL,
    HitColor CHAR COMPRESSION LZ4 NOT NULL,
    LocalEventTime TIMESTAMPTZ NOT NULL,
    Age SMALLINT NOT NULL,
    Sex SMALLINT NOT NULL,
    Income SMALLINT NOT NULL,
    Interests SMALLINT NOT NULL,
    Robotness SMALLINT NOT NULL,
    RemoteIP INTEGER NOT NULL,
    WindowName INTEGER NOT NULL,
    OpenerName INTEGER NOT NULL,
    HistoryLength SMALLINT NOT NULL,
    BrowserLanguage TEXT COMPRESSION LZ4 NOT NULL,
    BrowserCountry TEXT COMPRESSION LZ4 NOT NULL,
    SocialNetwork TEXT COMPRESSION LZ4 NOT NULL,
    SocialAction TEXT COMPRESSION LZ4 NOT NULL,
    HTTPError SMALLINT NOT NULL,
    SendTiming INTEGER NOT NULL,
    DNSTiming INTEGER NOT NULL,
    ConnectTiming INTEGER NOT NULL,
    ResponseStartTiming INTEGER NOT NULL,
    ResponseEndTiming INTEGER NOT NULL,
    FetchTiming INTEGER NOT NULL,
    SocialSourceNetworkID SMALLINT NOT NULL,
    SocialSourcePage TEXT COMPRESSION LZ4 NOT NULL,
    ParamPrice BIGINT NOT NULL,
    ParamOrderID TEXT COMPRESSION LZ4 NOT NULL,
    ParamCurrency TEXT COMPRESSION LZ4 NOT NULL,
    ParamCurrencyID SMALLINT NOT NULL,
    OpenstatServiceName TEXT COMPRESSION LZ4 NOT NULL,
    OpenstatCampaignID TEXT COMPRESSION LZ4 NOT NULL,
    OpenstatAdID TEXT COMPRESSION LZ4 NOT NULL,
    OpenstatSourceID TEXT COMPRESSION LZ4 NOT NULL,
    UTMSource TEXT COMPRESSION LZ4 NOT NULL,
    UTMMedium TEXT COMPRESSION LZ4 NOT NULL,
    UTMCampaign TEXT COMPRESSION LZ4 NOT NULL,
    UTMContent TEXT COMPRESSION LZ4 NOT NULL,
    UTMTerm TEXT COMPRESSION LZ4 NOT NULL,
    FromTag TEXT COMPRESSION LZ4 NOT NULL,
    HasGCLID SMALLINT NOT NULL,
    RefererHash BIGINT NOT NULL,
    URLHash BIGINT NOT NULL,
    CLID INTEGER NOT NULL,
	payload jsonb COMPRESSION LZ4 NOT NULL create_jsonb_random()
);

ALTER TABLE hit_compressed_lz4 ALTER COLUMN FromTag SET STORAGE main;
ALTER TABLE hit_compressed_lz4 ALTER COLUMN UTMTerm SET STORAGE main;
ALTER TABLE hit_compressed_lz4 ALTER COLUMN UTMContent SET STORAGE main;
ALTER TABLE hit_compressed_lz4 ALTER COLUMN UTMCampaign SET STORAGE main;
ALTER TABLE hit_compressed_lz4 ALTER COLUMN UTMMedium SET STORAGE main;
ALTER TABLE hit_compressed_lz4 ALTER COLUMN UTMSource SET STORAGE main;
ALTER TABLE hit_compressed_lz4 ALTER COLUMN OpenstatSourceID SET STORAGE main;
ALTER TABLE hit_compressed_lz4 ALTER COLUMN OpenstatAdID SET STORAGE main;
ALTER TABLE hit_compressed_lz4 ALTER COLUMN OpenstatCampaignID SET STORAGE main;
ALTER TABLE hit_compressed_lz4 ALTER COLUMN OpenstatServiceName SET STORAGE main;
ALTER TABLE hit_compressed_lz4 ALTER COLUMN ParamCurrency SET STORAGE main;
ALTER TABLE hit_compressed_lz4 ALTER COLUMN ParamOrderID SET STORAGE main;
ALTER TABLE hit_compressed_lz4 ALTER COLUMN SocialSourcePage SET STORAGE main;
ALTER TABLE hit_compressed_lz4 ALTER COLUMN SocialAction SET STORAGE main;
ALTER TABLE hit_compressed_lz4 ALTER COLUMN SocialNetwork SET STORAGE main;
ALTER TABLE hit_compressed_lz4 ALTER COLUMN BrowserCountry SET STORAGE main;
ALTER TABLE hit_compressed_lz4 ALTER COLUMN BrowserLanguage SET STORAGE main;
ALTER TABLE hit_compressed_lz4 ALTER COLUMN HitColor SET STORAGE main;
ALTER TABLE hit_compressed_lz4 ALTER COLUMN OriginalURL SET STORAGE main;
ALTER TABLE hit_compressed_lz4 ALTER COLUMN PageCharset SET STORAGE main;
ALTER TABLE hit_compressed_lz4 ALTER COLUMN SearchPhrase SET STORAGE main;
ALTER TABLE hit_compressed_lz4 ALTER COLUMN MobilePhoneModel SET STORAGE main;
ALTER TABLE hit_compressed_lz4 ALTER COLUMN UserAgentMinor SET STORAGE main;
ALTER TABLE hit_compressed_lz4 ALTER COLUMN FlashMinor2 SET STORAGE main;
ALTER TABLE hit_compressed_lz4 ALTER COLUMN Referer SET STORAGE main;
ALTER TABLE hit_compressed_lz4 ALTER COLUMN URL SET STORAGE main;
ALTER TABLE hit_compressed_lz4 ALTER COLUMN Title SET STORAGE main;
ALTER TABLE hit_compressed_lz4 ALTER COLUMN Params SET STORAGE main;
ALTER TABLE hit_compressed_lz4 ALTER COLUMN payload SET STORAGE main;




drop table hit_compressed_pglz;
CREATE TABLE hit_compressed_pglz
(
    WatchID BIGINT NOT NULL,
    JavaEnable SMALLINT NOT NULL,
    Title TEXT  NOT NULL ,
    GoodEvent SMALLINT NOT NULL,
    EventTime TIMESTAMPTZ NOT NULL,
    EventDate Date NOT NULL,
    CounterID INTEGER NOT NULL,
    ClientIP INTEGER NOT NULL,
    RegionID INTEGER NOT NULL,
    UserID BIGINT NOT NULL,
    CounterClass SMALLINT NOT NULL,
    OS SMALLINT NOT NULL,
    UserAgent SMALLINT NOT NULL,
    URL TEXT  NOT NULL,
    Referer TEXT  NOT NULL,
    IsRefresh SMALLINT NOT NULL,
    RefererCategoryID SMALLINT NOT NULL,
    RefererRegionID INTEGER NOT NULL,
    URLCategoryID SMALLINT NOT NULL,
    URLRegionID INTEGER NOT NULL,
    ResolutionWidth SMALLINT NOT NULL,
    ResolutionHeight SMALLINT NOT NULL,
    ResolutionDepth SMALLINT NOT NULL,
    FlashMajor SMALLINT NOT NULL,
    FlashMinor SMALLINT NOT NULL,
    FlashMinor2 TEXT  NOT NULL,
    NetMajor SMALLINT NOT NULL,
    NetMinor SMALLINT NOT NULL,
    UserAgentMajor SMALLINT NOT NULL,
    UserAgentMinor TEXT  NOT NULL,
    CookieEnable SMALLINT NOT NULL,
    JavascriptEnable SMALLINT NOT NULL,
    IsMobile SMALLINT NOT NULL,
    MobilePhone SMALLINT NOT NULL,
    MobilePhoneModel TEXT  NOT NULL,
    Params TEXT  NOT NULL,
    IPNetworkID INTEGER NOT NULL,
    TraficSourceID SMALLINT NOT NULL,
    SearchEngineID SMALLINT NOT NULL,
    SearchPhrase TEXT  NOT NULL,
    AdvEngineID SMALLINT NOT NULL,
    IsArtifical SMALLINT NOT NULL,
    WindowClientWidth SMALLINT NOT NULL,
    WindowClientHeight SMALLINT NOT NULL,
    ClientTimeZone SMALLINT NOT NULL,
    ClientEventTime TIMESTAMPTZ NOT NULL,
    SilverlightVersion1 SMALLINT NOT NULL,
    SilverlightVersion2 SMALLINT NOT NULL,
    SilverlightVersion3 INTEGER NOT NULL,
    SilverlightVersion4 SMALLINT NOT NULL,
    PageCharset TEXT  NOT NULL,
    CodeVersion INTEGER NOT NULL,
    IsLink SMALLINT NOT NULL,
    IsDownload SMALLINT NOT NULL,
    IsNotBounce SMALLINT NOT NULL,
    FUniqID BIGINT NOT NULL,
    OriginalURL TEXT  NOT NULL,
    HID INTEGER NOT NULL,
    IsOldCounter SMALLINT NOT NULL,
    IsEvent SMALLINT NOT NULL,
    IsParameter SMALLINT NOT NULL,
    DontCountHits SMALLINT NOT NULL,
    WithHash SMALLINT NOT NULL,
    HitColor CHAR  NOT NULL,
    LocalEventTime TIMESTAMPTZ NOT NULL,
    Age SMALLINT NOT NULL,
    Sex SMALLINT NOT NULL,
    Income SMALLINT NOT NULL,
    Interests SMALLINT NOT NULL,
    Robotness SMALLINT NOT NULL,
    RemoteIP INTEGER NOT NULL,
    WindowName INTEGER NOT NULL,
    OpenerName INTEGER NOT NULL,
    HistoryLength SMALLINT NOT NULL,
    BrowserLanguage TEXT  NOT NULL,
    BrowserCountry TEXT  NOT NULL,
    SocialNetwork TEXT  NOT NULL,
    SocialAction TEXT  NOT NULL,
    HTTPError SMALLINT NOT NULL,
    SendTiming INTEGER NOT NULL,
    DNSTiming INTEGER NOT NULL,
    ConnectTiming INTEGER NOT NULL,
    ResponseStartTiming INTEGER NOT NULL,
    ResponseEndTiming INTEGER NOT NULL,
    FetchTiming INTEGER NOT NULL,
    SocialSourceNetworkID SMALLINT NOT NULL,
    SocialSourcePage TEXT  NOT NULL,
    ParamPrice BIGINT NOT NULL,
    ParamOrderID TEXT  NOT NULL,
    ParamCurrency TEXT  NOT NULL,
    ParamCurrencyID SMALLINT NOT NULL,
    OpenstatServiceName TEXT  NOT NULL,
    OpenstatCampaignID TEXT  NOT NULL,
    OpenstatAdID TEXT  NOT NULL,
    OpenstatSourceID TEXT  NOT NULL,
    UTMSource TEXT  NOT NULL,
    UTMMedium TEXT  NOT NULL,
    UTMCampaign TEXT  NOT NULL,
    UTMContent TEXT  NOT NULL,
    UTMTerm TEXT  NOT NULL,
    FromTag TEXT  NOT NULL,
    HasGCLID SMALLINT NOT NULL,
    RefererHash BIGINT NOT NULL,
    URLHash BIGINT NOT NULL,
    CLID INTEGER NOT NULL,
	payload jsonb NOT NULL create_jsonb_random()
);

ALTER TABLE hit_compressed_pglz ALTER COLUMN FromTag SET STORAGE main;
ALTER TABLE hit_compressed_pglz ALTER COLUMN UTMTerm SET STORAGE main;
ALTER TABLE hit_compressed_pglz ALTER COLUMN UTMContent SET STORAGE main;
ALTER TABLE hit_compressed_pglz ALTER COLUMN UTMCampaign SET STORAGE main;
ALTER TABLE hit_compressed_pglz ALTER COLUMN UTMMedium SET STORAGE main;
ALTER TABLE hit_compressed_pglz ALTER COLUMN UTMSource SET STORAGE main;
ALTER TABLE hit_compressed_pglz ALTER COLUMN OpenstatSourceID SET STORAGE main;
ALTER TABLE hit_compressed_pglz ALTER COLUMN OpenstatAdID SET STORAGE main;
ALTER TABLE hit_compressed_pglz ALTER COLUMN OpenstatCampaignID SET STORAGE main;
ALTER TABLE hit_compressed_pglz ALTER COLUMN OpenstatServiceName SET STORAGE main;
ALTER TABLE hit_compressed_pglz ALTER COLUMN ParamCurrency SET STORAGE main;
ALTER TABLE hit_compressed_pglz ALTER COLUMN ParamOrderID SET STORAGE main;
ALTER TABLE hit_compressed_pglz ALTER COLUMN SocialSourcePage SET STORAGE main;
ALTER TABLE hit_compressed_pglz ALTER COLUMN SocialAction SET STORAGE main;
ALTER TABLE hit_compressed_pglz ALTER COLUMN SocialNetwork SET STORAGE main;
ALTER TABLE hit_compressed_pglz ALTER COLUMN BrowserCountry SET STORAGE main;
ALTER TABLE hit_compressed_pglz ALTER COLUMN BrowserLanguage SET STORAGE main;
ALTER TABLE hit_compressed_pglz ALTER COLUMN HitColor SET STORAGE main;
ALTER TABLE hit_compressed_pglz ALTER COLUMN OriginalURL SET STORAGE main;
ALTER TABLE hit_compressed_pglz ALTER COLUMN PageCharset SET STORAGE main;
ALTER TABLE hit_compressed_pglz ALTER COLUMN SearchPhrase SET STORAGE main;
ALTER TABLE hit_compressed_pglz ALTER COLUMN MobilePhoneModel SET STORAGE main;
ALTER TABLE hit_compressed_pglz ALTER COLUMN UserAgentMinor SET STORAGE main;
ALTER TABLE hit_compressed_pglz ALTER COLUMN FlashMinor2 SET STORAGE main;
ALTER TABLE hit_compressed_pglz ALTER COLUMN Referer SET STORAGE main;
ALTER TABLE hit_compressed_pglz ALTER COLUMN URL SET STORAGE main;
ALTER TABLE hit_compressed_pglz ALTER COLUMN Title SET STORAGE main;
ALTER TABLE hit_compressed_pglz ALTER COLUMN Params SET STORAGE main;
ALTER TABLE hit_compressed_pglz ALTER COLUMN payload SET STORAGE main;



drop table hit_hyper_compressed;
CREATE TABLE hit_hyper_compressed
(
    WatchID BIGINT NOT NULL,
    JavaEnable SMALLINT NOT NULL,
    Title TEXT COMPRESSION LZ4 NOT NULL ,
    GoodEvent SMALLINT NOT NULL,
    EventTime TIMESTAMPTZ NOT NULL,
    EventDate Date NOT NULL,
    CounterID INTEGER NOT NULL,
    ClientIP INTEGER NOT NULL,
    RegionID INTEGER NOT NULL,
    UserID BIGINT NOT NULL,
    CounterClass SMALLINT NOT NULL,
    OS SMALLINT NOT NULL,
    UserAgent SMALLINT NOT NULL,
    URL TEXT COMPRESSION LZ4 NOT NULL,
    Referer TEXT COMPRESSION LZ4 NOT NULL,
    IsRefresh SMALLINT NOT NULL,
    RefererCategoryID SMALLINT NOT NULL,
    RefererRegionID INTEGER NOT NULL,
    URLCategoryID SMALLINT NOT NULL,
    URLRegionID INTEGER NOT NULL,
    ResolutionWidth SMALLINT NOT NULL,
    ResolutionHeight SMALLINT NOT NULL,
    ResolutionDepth SMALLINT NOT NULL,
    FlashMajor SMALLINT NOT NULL,
    FlashMinor SMALLINT NOT NULL,
    FlashMinor2 TEXT COMPRESSION LZ4 NOT NULL,
    NetMajor SMALLINT NOT NULL,
    NetMinor SMALLINT NOT NULL,
    UserAgentMajor SMALLINT NOT NULL,
    UserAgentMinor TEXT COMPRESSION LZ4 NOT NULL,
    CookieEnable SMALLINT NOT NULL,
    JavascriptEnable SMALLINT NOT NULL,
    IsMobile SMALLINT NOT NULL,
    MobilePhone SMALLINT NOT NULL,
    MobilePhoneModel TEXT COMPRESSION LZ4 NOT NULL,
    Params TEXT COMPRESSION LZ4 NOT NULL,
    IPNetworkID INTEGER NOT NULL,
    TraficSourceID SMALLINT NOT NULL,
    SearchEngineID SMALLINT NOT NULL,
    SearchPhrase TEXT COMPRESSION LZ4 NOT NULL,
    AdvEngineID SMALLINT NOT NULL,
    IsArtifical SMALLINT NOT NULL,
    WindowClientWidth SMALLINT NOT NULL,
    WindowClientHeight SMALLINT NOT NULL,
    ClientTimeZone SMALLINT NOT NULL,
    ClientEventTime TIMESTAMPTZ NOT NULL,
    SilverlightVersion1 SMALLINT NOT NULL,
    SilverlightVersion2 SMALLINT NOT NULL,
    SilverlightVersion3 INTEGER NOT NULL,
    SilverlightVersion4 SMALLINT NOT NULL,
    PageCharset TEXT COMPRESSION LZ4 NOT NULL,
    CodeVersion INTEGER NOT NULL,
    IsLink SMALLINT NOT NULL,
    IsDownload SMALLINT NOT NULL,
    IsNotBounce SMALLINT NOT NULL,
    FUniqID BIGINT NOT NULL,
    OriginalURL TEXT COMPRESSION LZ4 NOT NULL,
    HID INTEGER NOT NULL,
    IsOldCounter SMALLINT NOT NULL,
    IsEvent SMALLINT NOT NULL,
    IsParameter SMALLINT NOT NULL,
    DontCountHits SMALLINT NOT NULL,
    WithHash SMALLINT NOT NULL,
    HitColor CHAR COMPRESSION LZ4 NOT NULL,
    LocalEventTime TIMESTAMPTZ NOT NULL,
    Age SMALLINT NOT NULL,
    Sex SMALLINT NOT NULL,
    Income SMALLINT NOT NULL,
    Interests SMALLINT NOT NULL,
    Robotness SMALLINT NOT NULL,
    RemoteIP INTEGER NOT NULL,
    WindowName INTEGER NOT NULL,
    OpenerName INTEGER NOT NULL,
    HistoryLength SMALLINT NOT NULL,
    BrowserLanguage TEXT COMPRESSION LZ4 NOT NULL,
    BrowserCountry TEXT COMPRESSION LZ4 NOT NULL,
    SocialNetwork TEXT COMPRESSION LZ4 NOT NULL,
    SocialAction TEXT COMPRESSION LZ4 NOT NULL,
    HTTPError SMALLINT NOT NULL,
    SendTiming INTEGER NOT NULL,
    DNSTiming INTEGER NOT NULL,
    ConnectTiming INTEGER NOT NULL,
    ResponseStartTiming INTEGER NOT NULL,
    ResponseEndTiming INTEGER NOT NULL,
    FetchTiming INTEGER NOT NULL,
    SocialSourceNetworkID SMALLINT NOT NULL,
    SocialSourcePage TEXT COMPRESSION LZ4 NOT NULL,
    ParamPrice BIGINT NOT NULL,
    ParamOrderID TEXT COMPRESSION LZ4 NOT NULL,
    ParamCurrency TEXT COMPRESSION LZ4 NOT NULL,
    ParamCurrencyID SMALLINT NOT NULL,
    OpenstatServiceName TEXT COMPRESSION LZ4 NOT NULL,
    OpenstatCampaignID TEXT COMPRESSION LZ4 NOT NULL,
    OpenstatAdID TEXT COMPRESSION LZ4 NOT NULL,
    OpenstatSourceID TEXT COMPRESSION LZ4 NOT NULL,
    UTMSource TEXT COMPRESSION LZ4 NOT NULL,
    UTMMedium TEXT COMPRESSION LZ4 NOT NULL,
    UTMCampaign TEXT COMPRESSION LZ4 NOT NULL,
    UTMContent TEXT COMPRESSION LZ4 NOT NULL,
    UTMTerm TEXT COMPRESSION LZ4 NOT NULL,
    FromTag TEXT COMPRESSION LZ4 NOT NULL,
    HasGCLID SMALLINT NOT NULL,
    RefererHash BIGINT NOT NULL,
    URLHash BIGINT NOT NULL,
    CLID INTEGER NOT NULL,
	payload jsonb COMPRESSION LZ4 NOT NULL create_jsonb_random()
);


SELECT create_hypertable('hit_hyper_compressed', 'eventtime', chunk_time_interval => INTERVAL '1 day');




ALTER TABLE hit_hyper_compressed ALTER COLUMN FromTag SET STORAGE main;
ALTER TABLE hit_hyper_compressed ALTER COLUMN UTMTerm SET STORAGE main;
ALTER TABLE hit_hyper_compressed ALTER COLUMN UTMContent SET STORAGE main;
ALTER TABLE hit_hyper_compressed ALTER COLUMN UTMCampaign SET STORAGE main;
ALTER TABLE hit_hyper_compressed ALTER COLUMN UTMMedium SET STORAGE main;
ALTER TABLE hit_hyper_compressed ALTER COLUMN UTMSource SET STORAGE main;
ALTER TABLE hit_hyper_compressed ALTER COLUMN OpenstatSourceID SET STORAGE main;
ALTER TABLE hit_hyper_compressed ALTER COLUMN OpenstatAdID SET STORAGE main;
ALTER TABLE hit_hyper_compressed ALTER COLUMN OpenstatCampaignID SET STORAGE main;
ALTER TABLE hit_hyper_compressed ALTER COLUMN OpenstatServiceName SET STORAGE main;
ALTER TABLE hit_hyper_compressed ALTER COLUMN ParamCurrency SET STORAGE main;
ALTER TABLE hit_hyper_compressed ALTER COLUMN ParamOrderID SET STORAGE main;
ALTER TABLE hit_hyper_compressed ALTER COLUMN SocialSourcePage SET STORAGE main;
ALTER TABLE hit_hyper_compressed ALTER COLUMN SocialAction SET STORAGE main;
ALTER TABLE hit_hyper_compressed ALTER COLUMN SocialNetwork SET STORAGE main;
ALTER TABLE hit_hyper_compressed ALTER COLUMN BrowserCountry SET STORAGE main;
ALTER TABLE hit_hyper_compressed ALTER COLUMN BrowserLanguage SET STORAGE main;
ALTER TABLE hit_hyper_compressed ALTER COLUMN HitColor SET STORAGE main;
ALTER TABLE hit_hyper_compressed ALTER COLUMN OriginalURL SET STORAGE main;
ALTER TABLE hit_hyper_compressed ALTER COLUMN PageCharset SET STORAGE main;
ALTER TABLE hit_hyper_compressed ALTER COLUMN SearchPhrase SET STORAGE main;
ALTER TABLE hit_hyper_compressed ALTER COLUMN MobilePhoneModel SET STORAGE main;
ALTER TABLE hit_hyper_compressed ALTER COLUMN UserAgentMinor SET STORAGE main;
ALTER TABLE hit_hyper_compressed ALTER COLUMN FlashMinor2 SET STORAGE main;
ALTER TABLE hit_hyper_compressed ALTER COLUMN Referer SET STORAGE main;
ALTER TABLE hit_hyper_compressed ALTER COLUMN URL SET STORAGE main;
ALTER TABLE hit_hyper_compressed ALTER COLUMN Title SET STORAGE main;
ALTER TABLE hit_hyper_compressed ALTER COLUMN Params SET STORAGE main;
ALTER TABLE hit_hyper_compressed ALTER COLUMN Payload SET STORAGE main;