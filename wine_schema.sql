CREATE TABLE wine_chemicals (
    fixed_acidity FLOAT(5),
    volatile_acidity FLOAT(5),
    citric_acid FLOAT(5),
    residual_sugar FLOAT(5),
    chlorides FLOAT(5),
    free_sulfur_dioxide FLOAT(5),
    total_sulfur_dioxide FLOAT(5),
    id INT(5)
);

CREATE TABLE wine_properties (
    density FLOAT(8),
    pH FLOAT(5),
    sulphates FLOAT(5),
    alcohol FLOAT(5),
    id INT(5)
);

CREATE TABLE quality (
    quality INT(2)
    region VARCHAR(40),
    color VARCHAR(10),
    id INT(5)
);