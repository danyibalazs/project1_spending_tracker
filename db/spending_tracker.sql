DROP TABLE transactions;
DROP TABLE tags;
DROP TABLE merchants;

CREATE TABLE merchants(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) not null
);

CREATE TABLE tags(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) not null
);

CREATE TABLE transactions(
  id SERIAL PRIMARY KEY,
  merchant_id INT REFERENCES merchants(id),
  tag_id INT REFERENCES tags(id),
  amount FLOAT
)
