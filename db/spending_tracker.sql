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
  merchant_id INT REFERENCES merchants(id) ON DELETE CASCADE,
  tag_id INT REFERENCES tags(id) ON DELETE CASCADE,
  amount FLOAT,
  -- transaction_date DATE,
  day VARCHAR(255),
  month VARCHAR(255)
)
