-- Nama		: M Hafzan Wazani
-- NIM		: 24241168
-- Kelas	: PTIE/4
-- Modul	: 3


-- menggunakan database
USE kelas_e_mart;

-- Nilai Literal
-- isi/data dari kolom dalam tabel
-- Penggunaannya dengan SELECT Statement
-- Praktek #1
-- menggunakan SELECT statment untuk menampilkan nilai literal
SELECT 77;  -- tipe data integer

-- Praktek #2
-- menampilkan nilai literal yang beda tipe data
SELECT 77 AS angka, true AS nilai_logika, 'PTI' AS teks;

-- NULL
-- literal khusus yang artinya tidak punya nilai (kosong)
-- Praktek #3
-- menampilkan NULL menggunakan SELECT
SELECT NULL AS kosong;

-- Operator Matematika
-- */+-MOD(sisa bagi)
-- 10 (literal), 11 (literal) 10 (+) 11 
-- derajat operator matematika (), */, +-
-- ex. (10+2)/2 -> 12/2 = 6
-- ex. 10+2/2 -> 10+1 = 11
-- Praktek #4
SELECT 5%2 AS sisa_bagi, 5/2 AS hasil_bagi1, 5 DIV 2 AS hasil_bagi2;

-- Latihan Mandiri Operator Matematika
-- Soal 1: Operasi penjumlahan dan pengurangan sederhana
SELECT 15 + 25 - 10 AS hasil_soal1;

-- Soal 2: Operasi perkalian dan pembagian dengan memperhatikan derajat operator ()
SELECT (100 * 2) / 5 AS hasil_soal2;

-- Soal 3: Menggunakan fungsi MOD atau operator % untuk mencari sisa bagi angka besar
SELECT 125 % 4 AS sisa_bagi_soal3;

-- Praktek 5 
-- mengalikan qty dan harga untuk mendapatkan total bayar dari penjualan
SELECT qty*harga AS total FROM tr_penjualan;

-- Operator Perbandingan 
-- selalu akan menghasilkan nilai true/false
-- Praktek #6
SELECT 5=5, 5<>5, 5<>4, 5!=5, 5!=4, 5>4;

-- Latihan mandiri Operator Perbandingan
-- soal 1: Membandingkan apakah 10 sama dengan 10
SELECT 10 = 10 AS soal_1;

-- soal 2: Membandingkan apakah 10 tidak sama dengan 11 (menggunakan <>)
SELECT 10 <> 11 AS soal_2;

-- Soal 3: Membandingkan apakah 15 lebih besar dari 20
SELECT 15 > 20 AS soal_3;

-- Soal 4: Membandingkan apakah 25 lebih kecil atau sama dengan 25
SELECT 25 <= 25 AS soal_4;

-- Soal 5: Membandingkan nilai teks apakah 'A' sama dengan 'a' (Case Insensitive di MySQL)
SELECT 'A' = 'a' AS soal_5;

-- Soal 6: Membandingkan nilai logika apakah true tidak sama dengan false
SELECT true != false AS soal_6;

-- Gabung dalam 1 query soal 1 - 6
SELECT 
    10 = 10 AS soal_1,
    10 <> 11 AS soal_2,
    15 > 20 AS soal_3,
    25 <= 25 AS soal_4,
    'A' = 'a' AS soal_5,
    true != false AS soaps_6;


-- FUNGSI
-- Praktek #7
SELECT NOW(), YEAR(NOW()), MONTH(NOW()), DAY(NOW()),
datediff(NOW(), '1990-03-12'), datediff('1990-03-12', NOW());

-- Latihan mandiri Fungsi Tanggal & Waktu
-- Soal 1: Menampilkan tanggal hari ini saja menggunakan fungsi CURDATE()
SELECT CURDATE() AS tanggal_hari_ini;

-- Soal 2: Mengambil angka jam dari waktu sekarang menggunakan fungsi HOUR()
SELECT HOUR(NOW()) AS jam_sekarang;

-- Soal 3: Menghitung selisih hari antara tahun baru 2026-01-01 dengan tanggal sekarang
SELECT DATEDIFF('2026-01-01', NOW()) AS selisih_ke_tahun_baru;

-- Soal 4: Menampilkan nama bulan saat ini menggunakan fungsi MONTHNAME()
SELECT MONTHNAME(NOW()) AS nama_bulan_sekarang;

-- Soal 5: Menampilkan nama hari saat ini menggunakan fungsi DAYNAME()
SELECT DAYNAME(NOW()) AS nama_hari_sekarang;


-- Praktek #10
-- Lama pelanggan tidak bertansaksi dalam hari 
SELECT datediff(NOW(), tgl_transaksi) FROM tr_penjualan;

-- WHERE atau Filtering
-- digunakan untuk menyaring atau membatasi jumlah data yang 
-- ditampilkan dari satu query
-- Praktek #11
SELECT nama_produk, qty
FROM tr_penjualan WHERE qty>2;

-- Filtering multi-kriteria atau banyak kriteria
-- Praktek #12
-- ambil semua produk yang qty > 3 dan harga > 200.000
SELECT nama_produk, qty, harga
FROM tr_penjualan
WHERE qty>3 AND harga<200000;

-- Filter menggunakan teks 
-- Praktek #13
-- ambil semua produk yang namanya 'Flashdisk DQLab 32 GB'
SELECT tgl_transaksi, kode_pelanggan, 
nama_produk, qty, harga, qty*harga AS total
FROM tr_penjualan
WHERE nama_produk = 'Flashdisk DQLab 32 GB';

-- Operator LIKE
-- Praktek #14
-- filtering teks dengan pola tertentu
SELECT nama_produk FROM tr_penjualan
WHERE nama_produk LIKE 'f%';

-- latihan Mandiri Filtering & LIKE Operator
-- Soal 1: Ambil data dari tr_penjualan yang harga produknya di atas 100.000
SELECT nama_produk, qty, harga 
FROM tr_penjualan 
WHERE harga > 100000;

-- Soal 2: Ambil data dari tr_penjualan yang nama produknya berakhiran kata 'GB' (Mencari Flashdisk/Harddisk berdasarkan ukuran data)
SELECT nama_produk, harga 
FROM tr_penjualan 
WHERE nama_produk LIKE '%GB';

-- Soal 3: Ambil data transaksi yang dilakukan oleh kode_pelanggan 'cust0002' (Berdasarkan data riil di file CSV)
SELECT tgl_transaksi, kode_pelanggan, nama_produk, qty 
FROM tr_penjualan 
WHERE kode_pelanggan = 'cust0002';

-- Operator logika
-- AND (dan), OR (atau), NOT(negasi)
-- Praktek #15
-- ambil nama produk dan qty yang berawal f dan qty > 2
SELECT nama_produk, qty
FROM tr_penjualan
WHERE nama_produk LIKE 'f%' AND qty>2;