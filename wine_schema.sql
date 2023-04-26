CREATE TABLE wine (
    fixed_acidity FLOAT(5),
    volatile_acidity FLOAT(5),
    citric_acid FLOAT(5),
    residual_sugar FLOAT(5),
    chlorides FLOAT(5),
    free_sulfur_dioxide FLOAT(5),
    total_sulfur_dioxide FLOAT(5),
    density FLOAT(8),
    pH FLOAT(5),
    sulphates FLOAT(5),
    alcohol FLOAT(5),
    quality INT(2)
);

CREATE TABLE name (
    Wine Region VARCHAR(40),
    Wine Color VARCHAR(10),
    quality INT(2)
)