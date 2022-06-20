WITH BASE AS (
  SELECT
    *
  FROM
    `logee-data-prod.logee_datalake_raw_development.visibility_dma_logee_drivers`
  WHERE _date_partition >= "2022-06-08"
)

SELECT
  IF(REPLACE(JSON_EXTRACT(data, '$.driverId'), '"', '') = "", NULL, REPLACE(JSON_EXTRACT(data, '$.driverId'), '"', ''))  AS driver_id,
  IF(REPLACE(JSON_EXTRACT(data, '$.name'), '"', '') = "", NULL, REPLACE(JSON_EXTRACT(data, '$.name'), '"', ''))  AS name,
  IF(REPLACE(JSON_EXTRACT(data, '$.phone'), '"', '') = "", NULL, REPLACE(JSON_EXTRACT(data, '$.phone'), '"', ''))  AS phone,
  IF(REPLACE(JSON_EXTRACT(data, '$.email'), '"', '') = "", NULL, REPLACE(JSON_EXTRACT(data, '$.email'), '"', ''))  AS email_id,
  REPLACE(JSON_EXTRACT(data, '$.email'), '"', '') AS email,
  REPLACE(JSON_EXTRACT(data, '$.placeOfBirth'), '"', '') AS place_of_birth,
  CAST(IF(REPLACE(JSON_EXTRACT(data, '$.dateOfBirth'), '"', '') = '', NULL, REPLACE(JSON_EXTRACT(data, '$.dateOfBirth'), '"', '')) AS TIMESTAMP) AS date_of_birth,
  REPLACE(JSON_EXTRACT(data, '$.ktpNum'), '"', '') AS ktp_num,
  REPLACE(JSON_EXTRACT(data, '$.simType'), '"', '') AS sim_type,
  REPLACE(JSON_EXTRACT(data, '$.simNum'), '"', '') AS sim_num,
  REPLACE(JSON_EXTRACT(data, '$.address'), '"', '') AS address,
  REPLACE(JSON_EXTRACT(data, '$.companyId'), '"', '') AS company_id,
  REPLACE(JSON_EXTRACT(data, '$.companyName'), '"', '') AS company_name,
  CAST(IF(REPLACE(JSON_EXTRACT(data, '$.simExpired'), '"', '') = '', NULL, REPLACE(JSON_EXTRACT(data, '$.simExpired'), '"', '')) AS TIMESTAMP) AS sim_expired,
  data AS original_data,
  ts AS published_timestamp
FROM
  BASE