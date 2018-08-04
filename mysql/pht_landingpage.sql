/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 10.1.30-MariaDB : Database - pht_landingpage
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1);

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `tbl_album_detail` */

DROP TABLE IF EXISTS `tbl_album_detail`;

CREATE TABLE `tbl_album_detail` (
  `id_parent` int(11) DEFAULT NULL COMMENT 'id album',
  `name_img` varchar(100) COLLATE utf8_vietnamese_ci DEFAULT NULL COMMENT 'tên hình'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

/*Data for the table `tbl_album_detail` */

/*Table structure for table `tbl_album_img` */

DROP TABLE IF EXISTS `tbl_album_img`;

CREATE TABLE `tbl_album_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_vietnamese_ci DEFAULT NULL COMMENT 'tên album',
  `id_customer` int(11) DEFAULT NULL COMMENT 'id khách hàng',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

/*Data for the table `tbl_album_img` */

/*Table structure for table `tbl_cus_theme` */

DROP TABLE IF EXISTS `tbl_cus_theme`;

CREATE TABLE `tbl_cus_theme` (
  `id_theme` int(11) DEFAULT NULL,
  `id_page` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

/*Data for the table `tbl_cus_theme` */

/*Table structure for table `tbl_customer` */

DROP TABLE IF EXISTS `tbl_customer`;

CREATE TABLE `tbl_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_vietnamese_ci DEFAULT NULL COMMENT 'Tên khách hàng',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

/*Data for the table `tbl_customer` */

/*Table structure for table `tbl_page` */

DROP TABLE IF EXISTS `tbl_page`;

CREATE TABLE `tbl_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_customer` int(11) DEFAULT NULL COMMENT 'id khách hàng',
  `name` varchar(100) COLLATE utf8_vietnamese_ci DEFAULT NULL COMMENT 'tên nội dung page',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `link` varchar(2000) COLLATE utf8_vietnamese_ci DEFAULT NULL COMMENT 'link page do mình cung cấp khi khách hàng mua 1 page',
  `expiration_date` date NOT NULL COMMENT 'ngày hết hạn',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

/*Data for the table `tbl_page` */

/*Table structure for table `tbl_page_grid_view` */

DROP TABLE IF EXISTS `tbl_page_grid_view`;

CREATE TABLE `tbl_page_grid_view` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_page` int(11) DEFAULT NULL COMMENT 'id page',
  `num` int(2) DEFAULT NULL COMMENT 'số thứ tự grid view',
  `type` int(1) DEFAULT NULL COMMENT '=0 chỉ có nội dung cấp 1, không chứ nội dung con, = 1 có grid con bên trong, =2 là slider album hình ảnh, =3 là khung chạy video',
  `title` varchar(150) COLLATE utf8_vietnamese_ci DEFAULT NULL COMMENT 'Tiêu đề',
  `content` text COLLATE utf8_vietnamese_ci COMMENT 'Nội dung',
  `link_seo` varchar(2000) COLLATE utf8_vietnamese_ci DEFAULT NULL COMMENT 'link nhúng',
  `flg_show` int(1) DEFAULT NULL COMMENT '=1 hiện, =0 ẩn',
  `link_img` varchar(2000) COLLATE utf8_vietnamese_ci DEFAULT NULL COMMENT 'link hình nếu có',
  `link_video` varchar(2000) COLLATE utf8_vietnamese_ci DEFAULT NULL COMMENT 'link video nếu có',
  `id_album_img` int(11) DEFAULT NULL COMMENT 'id_album nếu là slider',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

/*Data for the table `tbl_page_grid_view` */

/*Table structure for table `tbl_page_grid_view_child` */

DROP TABLE IF EXISTS `tbl_page_grid_view_child`;

CREATE TABLE `tbl_page_grid_view_child` (
  `id_parent` int(11) DEFAULT NULL COMMENT 'id grid cha',
  `num` int(2) DEFAULT NULL COMMENT 'số thứ tự grid view',
  `type` int(1) DEFAULT NULL COMMENT '=2 là slider album hình ảnh, =3 là khung chạy video,=0 là chỉ có nội dung',
  `title` varchar(150) COLLATE utf8_vietnamese_ci DEFAULT NULL COMMENT 'Tiêu đề',
  `content` text COLLATE utf8_vietnamese_ci COMMENT 'Nội dung',
  `link_seo` varchar(2000) COLLATE utf8_vietnamese_ci DEFAULT NULL COMMENT 'link nhúng',
  `flg_show` int(1) DEFAULT NULL COMMENT '=1 hiện, =0 ẩn',
  `link_img` varchar(2000) COLLATE utf8_vietnamese_ci DEFAULT NULL COMMENT 'link hình nếu có',
  `link_video` varchar(2000) COLLATE utf8_vietnamese_ci DEFAULT NULL COMMENT 'link video nếu có',
  `id_album_img` int(11) DEFAULT NULL COMMENT 'id_album nếu là slider'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

/*Data for the table `tbl_page_grid_view_child` */

/*Table structure for table `tbl_theme` */

DROP TABLE IF EXISTS `tbl_theme`;

CREATE TABLE `tbl_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_type` int(5) DEFAULT NULL COMMENT 'id chủ đề',
  `name` varchar(100) COLLATE utf8_vietnamese_ci DEFAULT NULL COMMENT 'tên theme',
  `num_grid` int(2) DEFAULT NULL COMMENT 'số view từ trên xuống',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

/*Data for the table `tbl_theme` */

/*Table structure for table `tbl_themetype` */

DROP TABLE IF EXISTS `tbl_themetype`;

CREATE TABLE `tbl_themetype` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_vietnamese_ci DEFAULT NULL COMMENT 'tên chủ đề',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

/*Data for the table `tbl_themetype` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_customer` int(11) DEFAULT NULL COMMENT 'user thuộc khách hàng nào',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`password`,`remember_token`,`created_at`,`updated_at`,`id_customer`) values (1,'NTP','email@gmail.com','$2y$10$KnKwnlwS/D.eqSRqzXH60Ofe06qDISw5.rfiwtyXUs.9KDH3vFxPi',NULL,'2018-07-19 15:15:53','2018-07-19 15:15:53',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
