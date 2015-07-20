-- Adminer 4.2.0 MySQL dump

SET NAMES utf8mb4;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_lengkap` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `status` int(2) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `admin` (`id`, `nama_lengkap`, `username`, `password`, `status`) VALUES
(1,	'Administrator',	'admin',	'21232f297a57a5a743894a0e4a801fc3',	1);

DROP TABLE IF EXISTS `artikel`;
CREATE TABLE `artikel` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `judul` varchar(250) DEFAULT NULL,
  `content` text,
  `gambar` varchar(250) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `lastupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(2) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `bank`;
CREATE TABLE `bank` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nama_bank` varchar(50) DEFAULT NULL,
  `nama_akun` varchar(50) DEFAULT NULL,
  `no_rekening` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `bank` (`id`, `nama_bank`, `nama_akun`, `no_rekening`) VALUES
(1,	'BANK BCA',	'Firgiawan Khafidli',	'8680.3634.56'),
(2,	'BANK MANDIRI',	'Firgiawan Khafidli',	'8680.3634.56');

DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `src` text NOT NULL,
  `crop_srrc` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `kategori`;
CREATE TABLE `kategori` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `kategori` (`id`, `nama`) VALUES
(10,	'Baju');

DROP TABLE IF EXISTS `konfirmasi`;
CREATE TABLE `konfirmasi` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(10) DEFAULT NULL,
  `member_id` int(10) DEFAULT NULL,
  `bank_id` int(10) DEFAULT NULL,
  `tgl_transfer` datetime DEFAULT NULL,
  `nominal` float(15,2) DEFAULT NULL,
  `nama_bank` varchar(50) DEFAULT NULL,
  `nama_akun` varchar(50) DEFAULT NULL,
  `no_rekening` varchar(50) DEFAULT NULL,
  `gambar` varchar(250) DEFAULT NULL,
  `status` int(2) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `konfirmasi` (`id`, `order_id`, `member_id`, `bank_id`, `tgl_transfer`, `nominal`, `nama_bank`, `nama_akun`, `no_rekening`, `gambar`, `status`) VALUES
(1,	1,	1,	1,	'2014-06-21 23:40:07',	43900.00,	'BANK BCA',	'Firgiawan Khafidli',	'8680.3634.56',	NULL,	2),
(2,	4,	1,	1,	'2014-06-22 00:00:00',	110700.00,	'BANK BCA',	'Firgiawan Khafidli',	'8680.3634.56',	'asset/upload/0b1d2f5fcea10bac00a0eeb6566f8aa7.jpg',	2);

DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nama_lengkap` varchar(250) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL DEFAULT 'L',
  `email` varchar(50) DEFAULT NULL,
  `telepon` varchar(50) DEFAULT NULL,
  `kota` varchar(50) DEFAULT NULL,
  `kode_pos` varchar(50) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `status` int(2) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `member` (`id`, `nama_lengkap`, `tgl_lahir`, `jenis_kelamin`, `email`, `telepon`, `kota`, `kode_pos`, `alamat`, `username`, `password`, `status`) VALUES
(1,	'Wijaya Kusuma',	'1986-06-27',	'L',	'khafidli@ymail.com',	'088801129001',	'Tangerang',	'15143',	'Jl Rasuna Said No.55',	'member',	'aa08769cdcb26674c6706093503ff0a3',	1),
(2,	'atwinda',	'0000-00-00',	'P',	'nda.kembar@yahoo.com',	'021 5516521',	'tangerang',	'15132',	'jl.garuda 4 no 25',	'nda.kembar@yahoo.com',	'bec2d332fb6019ca4042ceee13a68633',	1),
(3,	'fahmi',	'2015-05-25',	'L',	'fahmi_the_eted@yahoo.co.id',	'32435435435435',	'ertertertert',	'34234234',	'4545245fdgdfg',	'fahmi',	'827ccb0eea8a706c4c34a16891f84e7b',	1),
(4,	'fahmi',	'2015-05-19',	'L',	'fahmi_the_eted@yahoo.co.id',	'32435435435435',	'ertertertert',	'34234234',	'gfgfgcg',	'user',	'ee11cbb19052e40b07aac0ca060c23ee',	1);

DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `no_order` varchar(10) DEFAULT NULL,
  `tgl_order` datetime DEFAULT NULL,
  `tgl_expired` datetime DEFAULT NULL,
  `member_id` int(10) DEFAULT NULL,
  `total_order` int(15) DEFAULT '0',
  `catatan` text,
  `status` int(11) DEFAULT '1' COMMENT '1 = PENDING, 2 = COMPLETED, -1 = CANCELLED',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `order` (`id`, `no_order`, `tgl_order`, `tgl_expired`, `member_id`, `total_order`, `catatan`, `status`) VALUES
(10,	'INV000001',	'2015-06-11 17:17:08',	NULL,	1,	277501,	'',	1);

DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail` (
  `detail_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(10) DEFAULT NULL,
  `produk_id` int(10) DEFAULT NULL,
  `atribut_id` int(10) DEFAULT '0',
  `satuan` varchar(50) DEFAULT NULL,
  `harga` int(10) DEFAULT '0',
  `diskon` int(10) DEFAULT '0',
  `qty` int(10) NOT NULL DEFAULT '1',
  `subtotal` int(15) DEFAULT '0',
  PRIMARY KEY (`detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `order_detail` (`detail_id`, `order_id`, `produk_id`, `atribut_id`, `satuan`, `harga`, `diskon`, `qty`, `subtotal`) VALUES
(17,	10,	1,	0,	'1',	1,	0,	1,	1),
(18,	10,	11,	0,	'77',	5550,	0,	50,	277500);

DROP TABLE IF EXISTS `produk`;
CREATE TABLE `produk` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `kategori_id` int(10) DEFAULT NULL,
  `kode` varchar(10) DEFAULT NULL,
  `nama` varchar(250) DEFAULT NULL,
  `keterangan_singkat` tinytext,
  `keterangan_lengkap` text,
  `gambar` varchar(250) DEFAULT NULL,
  `harga` int(10) DEFAULT NULL,
  `diskon` int(10) DEFAULT '0',
  `satuan` varchar(50) DEFAULT '0',
  `createdate` datetime DEFAULT NULL,
  `lastupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(2) DEFAULT '1' COMMENT '1= available, 0 = non aktif',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `produk` (`id`, `kategori_id`, `kode`, `nama`, `keterangan_singkat`, `keterangan_lengkap`, `gambar`, `harga`, `diskon`, `satuan`, `createdate`, `lastupdate`, `status`) VALUES
(1,	10,	'P000001',	'Baju',	'Murah',	'',	'xxx.png',	11111,	0,	'pcs',	'2015-06-19 13:59:29',	'2015-06-19 06:59:29',	1),
(3,	10,	'P000003',	'Baju',	'Murah',	'',	'sadASDsadsdsd.png',	50000,	0,	'pcs',	'2015-06-19 14:01:15',	'2015-06-19 07:01:15',	1),
(4,	10,	'P000004',	'Baju',	'Murah',	'',	'qwwqeqwe.png',	2323,	0,	'pcs',	'2015-06-19 14:02:10',	'2015-06-19 07:02:10',	1),
(5,	10,	'P000005',	'Baju',	'Murah',	'',	'crew_frsdaasdasdont.png',	676575,	0,	'pcs',	'2015-06-19 14:04:28',	'2015-06-19 07:04:28',	1);

DROP TABLE IF EXISTS `produks`;
CREATE TABLE `produks` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `kategori_id` int(10) DEFAULT NULL,
  `kode` varchar(10) DEFAULT NULL,
  `nama` varchar(250) DEFAULT NULL,
  `keterangan_singkat` tinytext,
  `keterangan_lengkap` text,
  `gambar` varchar(250) DEFAULT NULL,
  `harga` int(10) DEFAULT NULL,
  `diskon` int(10) DEFAULT '0',
  `satuan` varchar(50) DEFAULT '0',
  `createdate` datetime DEFAULT NULL,
  `lastupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(2) DEFAULT '1' COMMENT '1= available, 0 = non aktif',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `produks` (`id`, `kategori_id`, `kode`, `nama`, `keterangan_singkat`, `keterangan_lengkap`, `gambar`, `harga`, `diskon`, `satuan`, `createdate`, `lastupdate`, `status`) VALUES
(1,	10,	'P000008',	'Baju',	'Murah',	'',	'alay.jpg',	1,	0,	'1',	'2015-06-12 09:57:58',	'2015-06-12 02:57:58',	1);

DROP TABLE IF EXISTS `produk_atribut`;
CREATE TABLE `produk_atribut` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `produk_id` int(10) NOT NULL DEFAULT '0',
  `nama` varchar(50) DEFAULT NULL,
  `harga` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `produk_atribut` (`id`, `produk_id`, `nama`, `harga`) VALUES
(3,	12,	'Rasa Coklat',	75000),
(4,	12,	'Rasa Strawbery',	75000);

DROP TABLE IF EXISTS `testimonial`;
CREATE TABLE `testimonial` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `member_id` int(10) NOT NULL DEFAULT '0',
  `komentar` text NOT NULL,
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `testimonial` (`id`, `member_id`, `komentar`, `createdate`, `status`) VALUES
(1,	1,	'Saya selalu beli kue ultah\rdisini, selain harganya murah \rjuga rasanya enak\rT.O.P banget (^^) ',	'2014-06-22 00:03:46',	1),
(2,	4,	'mamamyokero',	'2015-05-29 02:27:43',	1);

-- 2015-06-26 12:27:07
