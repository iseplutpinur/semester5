-- insert jenis
DELIMITER $$
CREATE PROCEDURE `insertJenis`(
  IN `nama` VARCHAR(255),
  IN `keterangan` TEXT,
  IN `status` ENUM('1','0')
)
BEGIN
	DECLARE hitungJenis INT(11);
    DECLARE result VARCHAR(255);
    SET hitungJenis = (SELECT count(*) FROM jenis WHERE jenis.nama = nama);

    START TRANSACTION;
	INSERT INTO jenis
    VALUES(null, nama, keterangan, status,
           CURRENT_TIMESTAMP(),
           CURRENT_TIMESTAMP());

    IF(hitungJenis > 0) THEN
    	ROLLBACK;
    	SET result = 'Nama Jenis Sudah Digunakan';
    ELSE
    	COMMIT;
    	SET result = 'Jenis berhasil disimpan';
    END IF;
    SELECT result;
END$$
DELIMITER ;

-- insert pengadaan header
DELIMITER $$
CREATE PROCEDURE `insertPengadaanHeader`(
  IN `id` VARCHAR(255),
  IN `pegawai_id` INT(11),
  IN `distributor_id` INT(11)
)
BEGIN
    INSERT INTO pengadaan VALUES(
        id,
    	pegawai_id,
        distributor_id,
        CURRENT_TIMESTAMP(),
        CURRENT_TIMESTAMP()
    );
END$$
DELIMITER ;

-- insert pengadaan body
DELIMITER $$
CREATE PROCEDURE `insertPengadaanBody`(
  IN `pengadaan_id` VARCHAR(255),
  IN `obat_id` INT(11),
  IN `jumlah` INT(11)
)
BEGIN
	UPDATE obat SET stok = (stok + jumlah) WHERE id = obat_id;
  INSERT INTO pengadaan_detail VALUES (
    null, pengadaan_id, obat_id, jumlah,
      CURRENT_TIMESTAMP(),
      CURRENT_TIMESTAMP()
  );
END$$
DELIMITER ;

-- insert pengadaan view
DELIMITER $$
CREATE PROCEDURE `insertPengadaanView`(
  in pengadaan_id varchar(255)
)
BEGIN
  SELECT
    b.id,
    obat.nama as obat_nama,
    (obat.stok - a.jumlah) as stok_asal,
    a.jumlah as tambah_jumlah,
    obat.stok as stok_sekarang,
    concat(pegawai.nama_depan, ' ', pegawai.nama_belakang) as pegawai_nama,
    distributor.nama as distributor_nama
  FROM
    pengadaan_detail as a
  JOIN
    pengadaan as b ON a.pengadaan_id = b.id
  JOIN
    obat ON a.obat_id = obat.id
  JOIN
    pegawai ON b.pegawai_id = pegawai.id
  JOIN
    distributor ON b.distributor_id = distributor.id
  WHERE
    a.pengadaan_id = pengadaan_id;
END$$
DELIMITER ;

-- penjualan
DELIMITER $$
CREATE PROCEDURE `insertPenjualanHeader`(
  in id varchar(255),
  in pegawai_id int(11),
  in pembeli_id int(11)
)
BEGIN
    INSERT INTO penjualan VALUES(
        id,
    	pegawai_id,
        pembeli_id,
        CURRENT_TIMESTAMP(),
        CURRENT_TIMESTAMP()
    );
END$$
DELIMITER ;

-- penjualan
DELIMITER $$
CREATE PROCEDURE `insertPenjualanBody`(
  IN penjualan_id VARCHAR(255),
  IN obat_id INT(11),
  IN jumlah INT(11)
)
BEGIN
	UPDATE obat SET stok = (stok - jumlah) WHERE id = obat_id;
  INSERT INTO penjualan_detail VALUES (
      null, penjualan_id, obat_id, jumlah,
      CURRENT_TIMESTAMP(),
      CURRENT_TIMESTAMP()
    );
END$$
DELIMITER ;

-- penjualan
DELIMITER $$
CREATE PROCEDURE `insertPenjualanView`(
  IN penjualan_id VARCHAR(255)
)
BEGIN
  SELECT
    b.id,
      obat.nama as obat_nama,
      (obat.stok + a.jumlah) as stok_asal,
      a.jumlah as kurang_jumlah,
      obat.stok as stok_sekarang,
      concat(pegawai.nama_depan, ' ', pegawai.nama_belakang) as pegawai_nama,
      pembeli.nama as pembeli_nama
  FROM
    penjualan_detail as a
  JOIN
    penjualan as b ON a.penjualan_id = b.id
  JOIN
    obat ON a.obat_id = obat.id
  JOIN
    pegawai ON b.pegawai_id = pegawai.id
  LEFT JOIN
    pembeli ON b.pembeli_id = pembeli.id
  WHERE
    a.penjualan_id = penjualan_id;
END$$
DELIMITER ;