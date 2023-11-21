-- -------------------------------------------------------------
-- TablePlus 5.6.2(516)
--
-- https://tableplus.com/
--
-- Database: qwebit_iot_a
-- Generation Time: 2023-11-21 8:32:14.0370 PM
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


DROP TABLE IF EXISTS `q_devices`;
CREATE TABLE `q_devices` (
  `auto_inc` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_key` varchar(50) NOT NULL,
  `device_id` varchar(35) NOT NULL,
  `device_name` varchar(20) NOT NULL,
  `device_status` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '0: not approved, 1: approved',
  `approved_devices` tinyint(3) unsigned NOT NULL,
  `pin_status` char(32) NOT NULL COMMENT '101010... 32 digit varchar',
  `reg_date` datetime NOT NULL,
  `user_ip` varchar(17) NOT NULL,
  `access_time` datetime NOT NULL,
  PRIMARY KEY (`auto_inc`),
  UNIQUE KEY `index_key_id` (`customer_key`,`device_id`),
  KEY `idx_device_id` (`device_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;;

INSERT INTO `q_devices` (`auto_inc`, `customer_key`, `device_id`, `device_name`, `device_status`, `approved_devices`, `pin_status`, `reg_date`, `user_ip`, `access_time`) VALUES
(68, '18a24c07502c8d05111eec696e66d0c4', '37C:9E:BD:C0:AE:FC:VTLI16', '', 1, 8, '1111111100000000', '2023-04-13 03:59:28', '103.172.73.15', '2023-04-25 22:00:40'),
(69, '18a24c07502c8d05111eec696e66d0c4', '384:0D:8E:D6:A4:D4:PJHI06', '', 1, 4, '1000000000000000', '2023-06-09 15:41:33', '102.0.3.100', '2023-07-04 15:39:44'),
(70, '18a24c07502c8d05111eec696e66d0c4', '384:0D:8E:D6:A4:D4:VTHT16', '', 1, 4, '0010000000000000', '2023-07-05 19:43:29', '102.0.3.100', '2023-07-05 21:21:27');

CREATE TABLE `q_power` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` varchar(35) NOT NULL,
  `voltage` double NOT NULL,
  `amp` double NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `device_id_index` (`device_id`),
  CONSTRAINT `fk_device_id` FOREIGN KEY (`device_id`) REFERENCES `q_devices` (`device_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;