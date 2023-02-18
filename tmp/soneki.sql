.schema soneki
CREATE TABLE soneki (
    y_bi TEXT DEFAULT NULL,
    u_bi TEXT DEFAULT NULL,
    ticker TEXT DEFAULT NULL,
    name TEXT DEFAULT NULL,
    b_s TEXT DEFAULT NULL,
    koza TEXT DEFAULT NULL,
    num NUMERIC DEFAULT NULL,
    uri NUMERIC DEFAULT NULL,
    gaku NUMERIC DEFAULT NULL,
    kai NUMERIC DEFAULT NULL,
    soneki NUMERIC DEFAULT NULL
);
.separator ,
.quote "
.import tmp/new.csv soneki

UPDATE soneki SET num = CAST(REPLACE(num, ',', '') AS NUMERIC);
UPDATE soneki SET uri = CAST(REPLACE(uri, ',', '') AS NUMERIC);
UPDATE soneki SET gaku = CAST(REPLACE(gaku, ',', '') AS NUMERIC);
UPDATE soneki SET kai = CAST(REPLACE(kai, ',', '') AS NUMERIC);
UPDATE soneki SET soneki = CAST(REPLACE(soneki, ',', '') AS NUMERIC);