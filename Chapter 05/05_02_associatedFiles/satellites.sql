BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS `satellites` (
	`Name of Satellite, Alternate Names`	TEXT,
	`Country/Org of UN Registry`	TEXT,
	`Country of Operator/Owner`	TEXT,
	`Operator/Owner`	TEXT,
	`Users`	TEXT,
	`Purpose`	TEXT,
	`Detailed Purpose`	TEXT,
	`Class of Orbit`	TEXT,
	`Type of Orbit`	TEXT,
	`Longitude of GEO (degrees)`	NUMERIC,
	`Perigree (km)`	NUMERIC,
	`Apogee (km)`	NUMERIC,
	`Eccentricity`	NUMERIC,
	`Inclination (degrees)`	NUMERIC,
	`Period (minutes)`	NUMERIC,
	`Launch Mass (kg.)`	NUMERIC,
	`Dry Mass (kg.)`	NUMERIC,
	`Power (watts)`	NUMERIC,
	`Date of Launch`	TEXT,
	`Expected Lifetime (yrs.)`	NUMERIC,
	`Contractor`	TEXT,
	`Country of Contractor`	TEXT,
	`Launch Site`	TEXT,
	`Launch Vehicle`	TEXT,
	`COSPAR Number`	NUMERIC,
	`NORAD Number`	NUMERIC,
	`Comments`	TEXT,
	` `	TEXT,
	`Source Used for Orbital Data`	TEXT,
	`Source1`	TEXT,
	`Source2`	TEXT,
	`Source3`	TEXT,
	`Source4`	TEXT,
	`Source5`	TEXT,
	`Source6`	TEXT
);
COMMIT;
-- to import the data, open a terminal window, then...
-- sqlite3 ucs_satellite.db
-- .separator "\t"
-- .import ../UCS_Satellite_Database satellites
