-- ShopMax Orders Table
CREATE TABLE orders (
  order_id    VARCHAR(50) PRIMARY KEY,
  customer_id VARCHAR(50),
  item_name   VARCHAR(200),
  quantity    INTEGER,
  price       DECIMAL(10,2),
  status      VARCHAR(50),
  created_at  TIMESTAMP DEFAULT NOW()
);

-- ShopMax Customers Table
CREATE TABLE customers (
  customer_id VARCHAR(50) PRIMARY KEY,
  name        VARCHAR(100),
  email       VARCHAR(100) UNIQUE,
  region      VARCHAR(50),
  created_at  TIMESTAMP DEFAULT NOW()
);

-- Insert test orders
INSERT INTO orders VALUES
('ORD-001','CUST-123','Nike Air Max',1,150.00,'placed',NOW()),
('ORD-002','CUST-456','Adidas Ultra',2,220.00,'placed',NOW()),
('ORD-003','CUST-789','Puma RS-X',1,95.00,'placed',NOW());

-- Check data
SELECT * FROM orders;
