CREATE TABLE IF NOT EXISTS Partners
(
    partner_code REAL PRIMARY KEY, 
    partner_name VARCHAR
);

CREATE TABLE Products
(
    product_code REAL PRIMARY KEY, 
    product_name VARCHAR
);

CREATE TABLE Imports
(
    import_value REAL,
    partner_code REAL,
    product_code REAL,
    import_year REAL,   
    FOREIGN KEY(partner_code)
    REFERENCES Partners(partner_code),
    FOREIGN KEY(product_code)
    REFERENCES Products(product_code),
    PRIMARY KEY(import_value, partner_code, product_code, import_year)
);

CREATE TABLE temporal
(
    import_year REAL,
    partner_code REAL,
    partner_name VARCHAR,
    product_code REAL,
    product_name VARCHAR,
    import_value REAL
);

INSERT INTO Products(product_code, product_name)
SELECT product_code, product_name
FROM temporal 
GROUP BY product_code, product_name 
ORDER BY product_code;

INSERT INTO Imports(import_value, partner_code, product_code, import_year)
SELECT import_value, partner_code, product_code, import_year
FROM temporal 
GROUP BY import_value, partner_code, product_code, import_year
ORDER BY import_year;
