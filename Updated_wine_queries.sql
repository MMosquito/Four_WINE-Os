-- Creating table wine_chemicals

CREATE TABLE wine_chemicals (
    fixed_acidity FLOAT(5),
    volatile_acidity FLOAT(5),
    citric_acid FLOAT(5),
    residual_sugar FLOAT(5),
    chlorides FLOAT(5),
    free_sulfur_dioxide FLOAT(5),
    total_sulfur_dioxide FLOAT(5),
    id VARCHAR NOT NULL
);

CREATE TABLE wine_properties (
    density FLOAT(8),
    pH FLOAT(5),
    sulphates FLOAT(5),
    alcohol FLOAT(5),
    id VARCHAR NOT NULL
);

CREATE TABLE quality (
    quality INT NOT NULL,
    region VARCHAR(40),
    color VARCHAR(10),
    id INT NOT NULL
);

SELECT * FROM quality;

SELECT * FROM wine_chemicals;

SELECT * FROM wine_properties;

-- Quality Rating between 7 and 9
SELECT quality, region
FROM quality
WHERE quality BETWEEN '7' AND '9'
ORDER BY region, quality

-- Quality Rating quantity 7-9
SELECT COUNT(quality)
FROM quality
WHERE quality BETWEEN '7' AND '9';

--Create inner join (alcohol)
SELECT wine_properties.alcohol,
	quality.quality,
	quality.color,
	quality.region
FROM wine_properties
INNER JOIN quality
ON quality.id = wine_properties.id
ORDER BY alcohol;

-- Create inner join (sugar)
SELECT wine_properties.alcohol,
	wine_chemicals.residual_sugar
FROM wine_properties
INNER JOIN wine_chemicals
ON wine_chemicals.id::integer = wine_properties.id
ORDER BY alcohol;

--Create join for wine_data_preprocessing
SELECT
	wine_chemicals.fixed_acidity,
	wine_chemicals.volatile_acidity,
	wine_chemicals.citric_acid,
	wine_chemicals.residual_sugar,
	wine_chemicals.chlorides,
	wine_chemicals.free_sulfur_dioxide,
	wine_chemicals.total_sulfur_dioxide,
	wine_properties.density,
	wine_properties.pH,
	wine_properties.sulphates,
	quality.quality
FROM quality
JOIN quality_id	
	ON wine_chemicals_id = quality_id.wine_chemicals_id
JOIN wine_properties
	ON wine_properties.id = quality_id.wine_properties_id;

	