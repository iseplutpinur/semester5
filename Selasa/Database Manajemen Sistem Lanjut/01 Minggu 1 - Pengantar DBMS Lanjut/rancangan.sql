CREATE TABLE `jenis` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nama` varchar(255),
  `keterangan` text,
  `status` int COMMENT '0 Tidak Aktif | 1 Aktif',
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME ON UPDATE CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `satuan` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nama` varchar(255),
  `keterangan` text,
  `status` int COMMENT '0 Tidak Aktif | 1 Aktif',
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME ON UPDATE CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `obat` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nama` varchar(255),
  `stok` int,
  `jenis_id` int,
  `satuan_id` int,
  `harga_beli` bigint,
  `harga_jual` bigint,
  `status` int COMMENT '0 Tidak Aktif | 1 Aktif',
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME ON UPDATE CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `distributor` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nama` varchar(255),
  `email` varchar(255),
  `no_telepon` varchar(255),
  `alamat` text,
  `keterangan` text,
  `status` int COMMENT '0 Tidak Aktif | 1 Aktif',
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME ON UPDATE CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `pegawai` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nip` varchar(255),
  `nama_depan` varchar(255),
  `nama_belakang` varchar(255),
  `email` varchar(255),
  `password` varchar(255),
  `no_telepon` varchar(255),
  `alamat` text,
  `status` int COMMENT '0 Tidak Aktif | 1 Aktif',
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME ON UPDATE CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `pengadaan` (
  `kode` varchar(255) PRIMARY KEY,
  `pegawai_id` int,
  `distributor_id` int,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME ON UPDATE CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `pengadaan_detail` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `pengadaan_kode` varchar(255),
  `obat_id` int,
  `jumlah` int,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME ON UPDATE CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `pembeli` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nama` varchar(255),
  `email` varchar(255),
  `no_telepon` varchar(255),
  `alamat` text,
  `status` int COMMENT '0 Tidak Aktif | 1 Aktif',
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME ON UPDATE CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `penjualan` (
  `kode` varchar(255) PRIMARY KEY,
  `pegawai_id` int,
  `pembeli_id` int,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME ON UPDATE CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `penjualan_detail` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `penjualan_kode` varchar(255),
  `obat_id` int,
  `jumlah` int,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME ON UPDATE CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE `obat` ADD FOREIGN KEY (`jenis_id`) REFERENCES `jenis` (`id`);

ALTER TABLE `obat` ADD FOREIGN KEY (`satuan_id`) REFERENCES `satuan` (`id`);

ALTER TABLE `pengadaan` ADD FOREIGN KEY (`distributor_id`) REFERENCES `distributor` (`id`);

ALTER TABLE `pengadaan` ADD FOREIGN KEY (`pegawai_id`) REFERENCES `pegawai` (`id`);

ALTER TABLE `pengadaan_detail` ADD FOREIGN KEY (`pengadaan_kode`) REFERENCES `pengadaan` (`kode`);

ALTER TABLE `pengadaan_detail` ADD FOREIGN KEY (`obat_id`) REFERENCES `obat` (`id`);

ALTER TABLE `penjualan` ADD FOREIGN KEY (`pembeli_id`) REFERENCES `pembeli` (`id`);

ALTER TABLE `penjualan` ADD FOREIGN KEY (`pegawai_id`) REFERENCES `pegawai` (`id`);

ALTER TABLE `penjualan_detail` ADD FOREIGN KEY (`penjualan_kode`) REFERENCES `penjualan` (`kode`);

ALTER TABLE `penjualan_detail` ADD FOREIGN KEY (`obat_id`) REFERENCES `obat` (`id`);
