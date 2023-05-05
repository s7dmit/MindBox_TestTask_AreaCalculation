CREATE TABLE product(
id INT PRIMARY KEY IDENTITY, 
name VARCHAR(100));

CREATE TABLE category(
id INT PRIMARY KEY IDENTITY,
name VARCHAR(100));

CREATE TABLE productCategories(
product_id INT NOT NULL,
category_id INT NOT NULL,
FOREIGN KEY(product_id) REFERENCES product(id) ON DELETE CASCADE,
FOREIGN KEY(category_id) REFERENCES category(id) ON DELETE CASCADE);

CREATE UNIQUE INDEX productCategories_UN ON productCategories(product_id, category_id);