-- ============================================================
-- แบบฝึกหัด SQL สำหรับ phpMyAdmin: SELECT และ INSERT
-- รองรับ MySQL 5.7+ และ MariaDB 10.2+
-- ============================================================

USE s68160204;

CREATE TABLE tbl_customers (
  customer_id INT AUTO_INCREMENT PRIMARY KEY,
  full_name VARCHAR(100) NOT NULL,
  gender ENUM('ชาย', 'หญิง', 'ไม่ระบุ') NOT NULL,
  province VARCHAR(50) NOT NULL,
  email VARCHAR(120) NOT NULL UNIQUE,
  member_level ENUM('Bronze', 'Silver', 'Gold') NOT NULL DEFAULT 'Bronze',
  points INT NOT NULL DEFAULT 0,
  registered_date DATE NOT NULL,
  status ENUM('active', 'inactive') NOT NULL DEFAULT 'active'
) ENGINE=InnoDB;

CREATE TABLE products (
  product_id INT AUTO_INCREMENT PRIMARY KEY,
  product_name VARCHAR(120) NOT NULL,
  category VARCHAR(50) NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  stock INT NOT NULL DEFAULT 0,
  is_active TINYINT(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB;

CREATE TABLE orders (
  order_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT NOT NULL,
  product_id INT NOT NULL,
  quantity INT NOT NULL,
  order_date DATE NOT NULL,
  payment_method ENUM('เงินสด', 'โอนเงิน', 'บัตรเครดิต', 'พร้อมเพย์') NOT NULL,
  order_status ENUM('pending', 'paid', 'shipped', 'cancelled') NOT NULL DEFAULT 'pending',
  CONSTRAINT fk_order_customer FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id),
  CONSTRAINT fk_order_product FOREIGN KEY (product_id)
    REFERENCES products(product_id)
) ENGINE=InnoDB;

INSERT INTO customers
  (full_name, gender, province, email, member_level, points, registered_date, status)
VALUES
  ('กิตติพงษ์ ใจดี', 'ชาย', 'ชลบุรี', 'kittipong@example.com', 'Gold', 1850, '2025-01-12', 'active'),
  ('สุภาวดี แสงทอง', 'หญิง', 'กรุงเทพมหานคร', 'supawadee@example.com', 'Silver', 720, '2025-02-03', 'active'),
  ('ธนกฤต พรหมมา', 'ชาย', 'ระยอง', 'thanakrit@example.com', 'Bronze', 120, '2025-03-18', 'active'),
  ('ณัฐชา วัฒนะ', 'หญิง', 'จันทบุรี', 'natcha@example.com', 'Gold', 2100, '2024-11-25', 'active'),
  ('ปกรณ์ เกษมสุข', 'ชาย', 'ชลบุรี', 'pakorn@example.com', 'Silver', 980, '2025-04-09', 'inactive'),
  ('พิมพ์ชนก รุ่งเรือง', 'หญิง', 'ฉะเชิงเทรา', 'pimchanok@example.com', 'Bronze', 60, '2025-06-14', 'active'),
  ('วรเมธ ศรีสุข', 'ชาย', 'กรุงเทพมหานคร', 'woramet@example.com', 'Gold', 1650, '2024-12-30', 'active'),
  ('ชลธิชา บุญช่วย', 'หญิง', 'ชลบุรี', 'chonticha@example.com', 'Silver', 540, '2025-07-01', 'active'),
  ('อนุชา สายชล', 'ชาย', 'ตราด', 'anucha@example.com', 'Bronze', 0, '2025-07-22', 'inactive'),
  ('กัญญารัตน์ มีสุข', 'หญิง', 'ระยอง', 'kanyarat@example.com', 'Gold', 2450, '2024-10-08', 'active'),
  ('ศุภชัย คงมั่น', 'ชาย', 'ชลบุรี', 'supachai@example.com', 'Bronze', 300, '2025-05-11', 'active'),
  ('วิมลรัตน์ ชื่นใจ', 'หญิง', 'จันทบุรี', 'wimonrat@example.com', 'Silver', 830, '2025-01-28', 'active'),
  ('ภาคภูมิ ทองดี', 'ชาย', 'สระแก้ว', 'pakpoom@example.com', 'Bronze', 40, '2024-09-15', 'inactive'),
  ('ปิยะนุช อ่อนหวาน', 'หญิง', 'กรุงเทพมหานคร', 'piyanuch@example.com', 'Gold', 3200, '2025-02-19', 'active'),
  ('ธีรภัทร กล้าหาญ', 'ชาย', 'ระยอง', 'teerapat@example.com', 'Silver', 610, '2025-06-03', 'active');

INSERT INTO products
  (product_name, category, price, stock, is_active)
VALUES
  ('เมาส์ไร้สาย', 'อุปกรณ์คอมพิวเตอร์', 590.00, 35, 1),
  ('คีย์บอร์ด Mechanical', 'อุปกรณ์คอมพิวเตอร์', 1590.00, 18, 1),
  ('หูฟัง Bluetooth', 'เครื่องเสียง', 1290.00, 0, 1),
  ('ลำโพงพกพา', 'เครื่องเสียง', 990.00, 12, 1),
  ('สายชาร์จ USB-C', 'อุปกรณ์มือถือ', 250.00, 80, 1),
  ('Power Bank 10000mAh', 'อุปกรณ์มือถือ', 890.00, 24, 1),
  ('กระเป๋า Laptop', 'กระเป๋า', 750.00, 9, 1),
  ('Webcam Full HD', 'อุปกรณ์คอมพิวเตอร์', 1190.00, 14, 1),
  ('Smart Watch รุ่น S', 'อุปกรณ์สวมใส่', 2490.00, 7, 1),
  ('ขาตั้งโทรศัพท์', 'อุปกรณ์มือถือ', 190.00, 45, 1),
  ('แฟลชไดรฟ์ 64GB', 'อุปกรณ์คอมพิวเตอร์', 320.00, 30, 1),
  ('ไมโครโฟน USB', 'เครื่องเสียง', 1890.00, 5, 1);

INSERT INTO orders
  (customer_id, product_id, quantity, order_date, payment_method, order_status)
VALUES
  (1, 2, 1, '2026-07-01', 'บัตรเครดิต', 'paid'),
  (2, 5, 2, '2026-07-02', 'พร้อมเพย์', 'shipped'),
  (3, 1, 1, '2026-07-03', 'โอนเงิน', 'pending'),
  (4, 9, 1, '2026-07-03', 'บัตรเครดิต', 'shipped'),
  (5, 3, 1, '2026-07-04', 'พร้อมเพย์', 'cancelled'),
  (6, 10, 3, '2026-07-05', 'เงินสด', 'paid'),
  (7, 12, 1, '2026-07-06', 'โอนเงิน', 'paid'),
  (8, 6, 2, '2026-07-07', 'พร้อมเพย์', 'shipped'),
  (10, 8, 1, '2026-07-08', 'บัตรเครดิต', 'paid'),
  (11, 11, 4, '2026-07-10', 'เงินสด', 'shipped'),
  (12, 7, 1, '2026-07-11', 'โอนเงิน', 'pending'),
  (14, 4, 2, '2026-07-12', 'พร้อมเพย์', 'paid'),
  (15, 6, 1, '2026-07-14', 'บัตรเครดิต', 'shipped'),
  (1, 6, 1, '2026-07-20', 'พร้อมเพย์', 'shipped'),
  (4, 2, 1, '2026-07-21', 'โอนเงิน', 'paid'),
  (7, 8, 2, '2026-07-23', 'บัตรเครดิต', 'cancelled'),
  (10, 12, 1, '2026-07-25', 'พร้อมเพย์', 'shipped'),
  (2, 5, 5, '2026-08-01', 'เงินสด', 'paid');

-- ตรวจสอบจำนวนข้อมูลหลัง Import: customers=15, products=12, orders=18
SELECT 'customers' AS table_name, COUNT(*) AS total_rows FROM customers
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'orders', COUNT(*) FROM orders;

