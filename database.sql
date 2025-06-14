-- LANGKAH 1: BUAT DATABASE

CREATE DATABASE IF NOT EXISTS bengkelin_db;
USE bengkelin_db;

-- LANGKAH 2: BUAT TABEL

-- Tabel pelanggan
CREATE TABLE IF NOT EXISTS pelanggan (
  id_pelanggan VARCHAR(10) PRIMARY KEY,
  nama VARCHAR(50) NOT NULL,
  no_telepon VARCHAR(15),
  alamat TEXT,
  is_member BOOLEAN DEFAULT FALSE
);

-- Tabel spare_part
CREATE TABLE IF NOT EXISTS spare_part (
  kode_part VARCHAR(10) PRIMARY KEY,
  nama VARCHAR(50) NOT NULL,
  harga DOUBLE NOT NULL,
  stok INT NOT NULL,
  jumlah_digunakan INT DEFAULT 0
);

-- Tabel transaksi
CREATE TABLE IF NOT EXISTS transaksi (
  no_transaksi VARCHAR(10) PRIMARY KEY,
  id_pelanggan VARCHAR(10),
  tanggal DATE NOT NULL,
  biaya_service DOUBLE NOT NULL,
  total_biaya DOUBLE NOT NULL,
  FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan)
);

-- Tabel transaksi_spare_part
CREATE TABLE IF NOT EXISTS transaksi_spare_part (
  no_transaksi VARCHAR(10),
  kode_part VARCHAR(10),
  jumlah INT NOT NULL,
  PRIMARY KEY (no_transaksi, kode_part),
  FOREIGN KEY (no_transaksi) REFERENCES transaksi(no_transaksi),
  FOREIGN KEY (kode_part) REFERENCES spare_part(kode_part)
);

-- LANGKAH 3: MASUKKAN DATA DUMMY

-- Data dummy pelanggan
INSERT INTO pelanggan (id_pelanggan, nama, no_telepon, alamat, is_member) VALUES 
('PL001', 'John Doe', '0812345678', 'Jl. Merdeka No.1', FALSE),
('PL002', 'Jane Smith', '0812987654', 'Jl. Sudirman No.45', TRUE);

-- Data dummy spare_part
INSERT INTO spare_part (kode_part, nama, harga, stok, jumlah_digunakan) VALUES
('SP001', 'Kampas Rem', 150000, 20, 0),
('SP002', 'Oli Mesin', 80000, 50, 0);
