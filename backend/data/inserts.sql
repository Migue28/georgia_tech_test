CREATE TABLE IF NOT EXISTS Partners
(
    partner_code INTEGER PRIMARY KEY, 
    partner_name VARCHAR
);

CREATE TABLE IF NOT EXISTS Products
(
    product_code INTEGER PRIMARY KEY, 
    product_name VARCHAR
);

CREATE TABLE IF NOT EXISTS Imports
(
    import_value INTEGER,
    partner_code INTEGER,
    product_code INTEGER,
    import_year INTEGER,   
    FOREIGN KEY(partner_code)
    REFERENCES Partners(partner_code),
    FOREIGN KEY(product_code)
    REFERENCES Products(product_code),
    PRIMARY KEY(import_value, partner_code, product_code, import_year)
);

CREATE TABLE temporal
(
    import_year INTEGER,
    partner_code INTEGER,
    partner_name VARCHAR,
    product_code INTEGER,
    product_name VARCHAR,
    import_value INTEGER
);

INSERT INTO Partners(partner_code, partner_name)
SELECT partner_code, partner_name
FROM temporal 
GROUP BY partner_code, partner_name
ORDER BY partner_name;

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
