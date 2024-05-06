/*
SQLyog Community v13.0.1 (64 bit)
MySQL - 8.0.33 : Database - fakeimagedetection
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`fakeimagedetection` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `fakeimagedetection`;

/*Table structure for table `app_complaint_table` */

DROP TABLE IF EXISTS `app_complaint_table`;

CREATE TABLE `app_complaint_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `complaint` varchar(5000) NOT NULL,
  `reply` varchar(5000) NOT NULL,
  `date` date NOT NULL,
  `USER_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_complaint_table_USER_id_3adb8390_fk_app_user_table_id` (`USER_id`),
  CONSTRAINT `app_complaint_table_USER_id_3adb8390_fk_app_user_table_id` FOREIGN KEY (`USER_id`) REFERENCES `app_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `app_complaint_table` */

insert  into `app_complaint_table`(`id`,`complaint`,`reply`,`date`,`USER_id`) values 
(2,'not working','will fix\r\n','2024-04-04',2),
(3,'asddf','pending','2024-04-04',3);

/*Table structure for table `app_feedback_table` */

DROP TABLE IF EXISTS `app_feedback_table`;

CREATE TABLE `app_feedback_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `feedback` varchar(5000) NOT NULL,
  `date` date NOT NULL,
  `USER_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_feedback_table_USER_id_cbe82d6c_fk_app_user_table_id` (`USER_id`),
  CONSTRAINT `app_feedback_table_USER_id_cbe82d6c_fk_app_user_table_id` FOREIGN KEY (`USER_id`) REFERENCES `app_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `app_feedback_table` */

insert  into `app_feedback_table`(`id`,`feedback`,`date`,`USER_id`) values 
(1,'really good','2024-04-01',2),
(2,'hahaaaa','2024-04-04',3);

/*Table structure for table `app_login_table` */

DROP TABLE IF EXISTS `app_login_table`;

CREATE TABLE `app_login_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL,
  `type` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `app_login_table` */

insert  into `app_login_table`(`id`,`username`,`password`,`type`) values 
(1,'admin','123','admin'),
(6,'abhi14','12345','user'),
(7,'abc1','123','user');

/*Table structure for table `app_prediction_table` */

DROP TABLE IF EXISTS `app_prediction_table`;

CREATE TABLE `app_prediction_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `result` varchar(50) NOT NULL,
  `USER_id` bigint NOT NULL,
  `errorlevel` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_prediction_table_USER_id_9b505c0c_fk_app_user_table_id` (`USER_id`),
  CONSTRAINT `app_prediction_table_USER_id_9b505c0c_fk_app_user_table_id` FOREIGN KEY (`USER_id`) REFERENCES `app_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `app_prediction_table` */

insert  into `app_prediction_table`(`id`,`image`,`date`,`result`,`USER_id`,`errorlevel`) values 
(6,'images (3).jpeg','2024-04-06','fake',2,'0.2952734375'),
(7,'557468-JimCarrey-1370101103.jpeg','2024-04-06','real',2,'0.7529854166666666'),
(9,'images (4)_GMrEVzh.jpeg','2024-04-06','Fake',2,'0.5838242385538714'),
(10,'images (2).jpeg','2024-04-06','Fake',3,'0.45076323920999045'),
(11,'IMG_20240319_143913.jpg','2024-04-06','Real',2,'1.8281550176684307'),
(12,'557468-JimCarrey-1370101103_JW01Kan.jpeg','2024-04-06','Real',2,'0.7529854166666666');

/*Table structure for table `app_user_table` */

DROP TABLE IF EXISTS `app_user_table`;

CREATE TABLE `app_user_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(30) NOT NULL,
  `phone` bigint NOT NULL,
  `LOGIN_id` bigint NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_user_table_LOGIN_id_717a8485_fk_app_login_table_id` (`LOGIN_id`),
  CONSTRAINT `app_user_table_LOGIN_id_717a8485_fk_app_login_table_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `app_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `app_user_table` */

insert  into `app_user_table`(`id`,`email`,`phone`,`LOGIN_id`,`name`) values 
(2,'abhi@gmail.com',12345678,6,'abhi'),
(3,'abc@gamil.com',12345678,7,'abc');

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add login_table',7,'add_login_table'),
(26,'Can change login_table',7,'change_login_table'),
(27,'Can delete login_table',7,'delete_login_table'),
(28,'Can view login_table',7,'view_login_table'),
(29,'Can add user_table',8,'add_user_table'),
(30,'Can change user_table',8,'change_user_table'),
(31,'Can delete user_table',8,'delete_user_table'),
(32,'Can view user_table',8,'view_user_table'),
(33,'Can add prediction_table',9,'add_prediction_table'),
(34,'Can change prediction_table',9,'change_prediction_table'),
(35,'Can delete prediction_table',9,'delete_prediction_table'),
(36,'Can view prediction_table',9,'view_prediction_table'),
(37,'Can add feedback_table',10,'add_feedback_table'),
(38,'Can change feedback_table',10,'change_feedback_table'),
(39,'Can delete feedback_table',10,'delete_feedback_table'),
(40,'Can view feedback_table',10,'view_feedback_table'),
(41,'Can add complaint_table',11,'add_complaint_table'),
(42,'Can change complaint_table',11,'change_complaint_table'),
(43,'Can delete complaint_table',11,'delete_complaint_table'),
(44,'Can view complaint_table',11,'view_complaint_table');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user` */

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(11,'app','complaint_table'),
(10,'app','feedback_table'),
(7,'app','login_table'),
(9,'app','prediction_table'),
(8,'app','user_table'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2024-04-01 06:07:40.881638'),
(2,'auth','0001_initial','2024-04-01 06:07:41.411004'),
(3,'admin','0001_initial','2024-04-01 06:07:41.573314'),
(4,'admin','0002_logentry_remove_auto_add','2024-04-01 06:07:41.590108'),
(5,'admin','0003_logentry_add_action_flag_choices','2024-04-01 06:07:41.602120'),
(6,'app','0001_initial','2024-04-01 06:07:41.892459'),
(7,'contenttypes','0002_remove_content_type_name','2024-04-01 06:07:41.974516'),
(8,'auth','0002_alter_permission_name_max_length','2024-04-01 06:07:42.037870'),
(9,'auth','0003_alter_user_email_max_length','2024-04-01 06:07:42.066719'),
(10,'auth','0004_alter_user_username_opts','2024-04-01 06:07:42.078735'),
(11,'auth','0005_alter_user_last_login_null','2024-04-01 06:07:42.147113'),
(12,'auth','0006_require_contenttypes_0002','2024-04-01 06:07:42.151058'),
(13,'auth','0007_alter_validators_add_error_messages','2024-04-01 06:07:42.159411'),
(14,'auth','0008_alter_user_username_max_length','2024-04-01 06:07:42.221441'),
(15,'auth','0009_alter_user_last_name_max_length','2024-04-01 06:07:42.287474'),
(16,'auth','0010_alter_group_name_max_length','2024-04-01 06:07:42.309799'),
(17,'auth','0011_update_proxy_permissions','2024-04-01 06:07:42.325170'),
(18,'auth','0012_alter_user_first_name_max_length','2024-04-01 06:07:42.380233'),
(19,'sessions','0001_initial','2024-04-01 06:07:42.409562'),
(20,'app','0002_user_table_name','2024-04-01 06:45:15.031827'),
(21,'app','0003_alter_user_table_email','2024-04-01 07:28:27.545409'),
(22,'app','0004_prediction_table_errorlevel','2024-04-06 04:57:12.240594');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('xklfya71qo5ah0npto8lnasn7tge4hlv','eyJsaWQiOjYsImNpZCI6M30:1rszFp:8YnIIPEUbe4HCihNNIY3AX_npMzoAoyLsYIoEzPd4F8','2024-04-20 06:10:17.557965'),
('zvwqxfdluxohaf7uzuls6hcy09ps0sf9','eyJsaWQiOjYsImNpZCI6MX0:1rrELD:0XA52YDcQGn4e99crkETovXLk2j8QqLXnX9FXAjvzeM','2024-04-15 09:52:35.449227');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
