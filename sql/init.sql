CREATE SCHEMA IF NOT EXISTS ods;

CREATE TABLE IF NOT EXISTS ods.customer_summary (
    customer_id INTEGER PRIMARY KEY,
    customer_name TEXT,
    email TEXT,
    total_amount NUMERIC(12, 2),
    vip TEXT
);

CREATE TABLE IF NOT EXISTS ods.pipeline_logs (
	  loggingDate TIMESTAMP
	, loggingPhase TEXT
	, pipelineName VARCHAR(255)
	, pipelineFilename VARCHAR(255)
	, pipelineStart TIMESTAMP
	, pipelineEnd TIMESTAMP
	, pipelineLogChannelId VARCHAR(36)
	, parentLogChannelId VARCHAR(36)
	, pipelineLogging VARCHAR(1000000)
	, pipelineErrorCount SMALLINT
	, pipelineStatusDescription VARCHAR(32)
	, transformName TEXT
	, transformCopyNr DOUBLE PRECISION
	, transformStatusDescription VARCHAR(100)
	, transformLogChannelId VARCHAR(36)
	, transformLoggingText VARCHAR(1000000)
	, transformLinesRead BIGINT
	, transformLinesWritten BIGINT
	, transformLinesInput BIGINT
	, transformLinesOutput BIGINT
	, transformLinesUpdated BIGINT
	, transformLinesRejected BIGINT
	, transformDataVolume BIGINT
	, transformDataVolumeIn BIGINT
	, transformDataVolumeOut BIGINT
	, transformErrors SMALLINT
	, transformStart TIMESTAMP
	, transformEnd TIMESTAMP
	, transformDuration BIGINT
);