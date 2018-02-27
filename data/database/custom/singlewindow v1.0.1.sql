/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : singlewindow

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-02-26 16:43:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `sw_applications`
-- ----------------------------
DROP TABLE IF EXISTS `sw_applications`;
CREATE TABLE `sw_applications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `current_step` int(10) unsigned NOT NULL,
  `sd_consignee_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sd_cus_ref_num` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sd_vat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sd_consignee_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sd_recipient_country` int(10) unsigned DEFAULT NULL,
  `sd_recipient_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sd_recipient_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sd_reg_custom` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cn_gross_weight` decimal(10,2) DEFAULT NULL,
  `cn_comm_num` decimal(10,2) DEFAULT NULL,
  `cn_billing_terms_id` int(10) unsigned DEFAULT NULL,
  `cn_cargo_type_id` int(10) unsigned DEFAULT NULL,
  `ir_inspection_loc` int(10) unsigned DEFAULT NULL,
  `ir_inspection_date` date DEFAULT NULL,
  `ir_inspection_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `od_country` int(10) unsigned DEFAULT NULL,
  `att_agreement` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `att_ecd_invoice` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `did_num` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `td_car_license` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `td_driver_license` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `td_driver_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `td_car_total_weight` decimal(10,2) DEFAULT NULL,
  `td_car_net_weight` decimal(10,2) DEFAULT NULL,
  `fd_bill_num` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fd_vessel_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fd_call_sign` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fd_imo_num` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fd_total_weight` decimal(10,2) DEFAULT NULL,
  `fd_net_weight` decimal(10,2) DEFAULT NULL,
  `fd_fr_line_id` int(10) unsigned DEFAULT NULL,
  `fd_shipping_port` int(10) unsigned DEFAULT NULL,
  `fd_final_dest` int(10) unsigned DEFAULT NULL,
  `fd_expected_arr_date` date DEFAULT NULL,
  `fd_shippment_date` date DEFAULT NULL,
  `fd_trip_num` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fd_forwarder_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fd_forwarder_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fd_agent_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fd_agent_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `att_ini_shippment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `att_pack` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sad_num` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `applications_company_id_foreign` (`company_id`),
  KEY `applications_created_by_foreign` (`created_by`),
  KEY `applications_current_step_foreign` (`current_step`),
  KEY `applications_sd_recipient_country_foreign` (`sd_recipient_country`),
  KEY `applications_cn_billing_terms_id_foreign` (`cn_billing_terms_id`),
  KEY `applications_cn_cargo_type_id_foreign` (`cn_cargo_type_id`),
  KEY `applications_ir_inspection_loc_foreign` (`ir_inspection_loc`),
  KEY `applications_od_country_foreign` (`od_country`),
  KEY `applications_fd_fr_line_id_foreign` (`fd_fr_line_id`),
  KEY `applications_fd_shipping_port_foreign` (`fd_shipping_port`),
  KEY `applications_fd_final_dest_foreign` (`fd_final_dest`),
  CONSTRAINT `applications_cn_billing_terms_id_foreign` FOREIGN KEY (`cn_billing_terms_id`) REFERENCES `sw_billing_terms` (`id`),
  CONSTRAINT `applications_cn_cargo_type_id_foreign` FOREIGN KEY (`cn_cargo_type_id`) REFERENCES `sw_cargo_types` (`id`),
  CONSTRAINT `applications_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `sw_companies` (`id`),
  CONSTRAINT `applications_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `sw_user` (`id`),
  CONSTRAINT `applications_current_step_foreign` FOREIGN KEY (`current_step`) REFERENCES `sw_application_steps` (`id`),
  CONSTRAINT `applications_fd_final_dest_foreign` FOREIGN KEY (`fd_final_dest`) REFERENCES `sw_shipping_ports` (`id`),
  CONSTRAINT `applications_fd_fr_line_id_foreign` FOREIGN KEY (`fd_fr_line_id`) REFERENCES `sw_freight_lines` (`id`),
  CONSTRAINT `applications_fd_shipping_port_foreign` FOREIGN KEY (`fd_shipping_port`) REFERENCES `sw_shipping_ports` (`id`),
  CONSTRAINT `applications_ir_inspection_loc_foreign` FOREIGN KEY (`ir_inspection_loc`) REFERENCES `sw_inspection_locations` (`id`),
  CONSTRAINT `applications_od_country_foreign` FOREIGN KEY (`od_country`) REFERENCES `sw_countries` (`id`),
  CONSTRAINT `applications_sd_recipient_country_foreign` FOREIGN KEY (`sd_recipient_country`) REFERENCES `sw_countries` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sw_applications
-- ----------------------------

-- ----------------------------
-- Table structure for `sw_application_cn`
-- ----------------------------
DROP TABLE IF EXISTS `sw_application_cn`;
CREATE TABLE `sw_application_cn` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `application_id` int(10) unsigned NOT NULL,
  `cn_hs_code_id` int(10) unsigned NOT NULL,
  `cn_quantity` decimal(10,2) NOT NULL,
  `cn_unit_price` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `application_cn_application_id_foreign` (`application_id`),
  KEY `application_cn_cn_hs_code_id_foreign` (`cn_hs_code_id`),
  CONSTRAINT `application_cn_application_id_foreign` FOREIGN KEY (`application_id`) REFERENCES `sw_applications` (`id`),
  CONSTRAINT `application_cn_cn_hs_code_id_foreign` FOREIGN KEY (`cn_hs_code_id`) REFERENCES `sw_hs_codes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sw_application_cn
-- ----------------------------

-- ----------------------------
-- Table structure for `sw_application_cr`
-- ----------------------------
DROP TABLE IF EXISTS `sw_application_cr`;
CREATE TABLE `sw_application_cr` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `application_id` int(10) unsigned NOT NULL,
  `cr_num` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cr_owner` int(10) unsigned NOT NULL,
  `cr_type` int(10) unsigned NOT NULL,
  `cr_capacity` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `application_cr_application_id_foreign` (`application_id`),
  KEY `application_cr_cr_owner_foreign` (`cr_owner`),
  KEY `application_cr_cr_type_foreign` (`cr_type`),
  KEY `application_cr_cr_capacity_foreign` (`cr_capacity`),
  CONSTRAINT `application_cr_application_id_foreign` FOREIGN KEY (`application_id`) REFERENCES `sw_applications` (`id`),
  CONSTRAINT `application_cr_cr_capacity_foreign` FOREIGN KEY (`cr_capacity`) REFERENCES `sw_container_capacities` (`id`),
  CONSTRAINT `application_cr_cr_owner_foreign` FOREIGN KEY (`cr_owner`) REFERENCES `sw_container_owners` (`id`),
  CONSTRAINT `application_cr_cr_type_foreign` FOREIGN KEY (`cr_type`) REFERENCES `sw_container_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sw_application_cr
-- ----------------------------

-- ----------------------------
-- Table structure for `sw_application_notifications`
-- ----------------------------
DROP TABLE IF EXISTS `sw_application_notifications`;
CREATE TABLE `sw_application_notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `application_id` int(10) unsigned NOT NULL,
  `notif_status_id` int(10) unsigned NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT '0',
  `has_attachment` tinyint(1) NOT NULL DEFAULT '0',
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `message_ar` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `application_notifications_application_id_foreign` (`application_id`),
  KEY `application_notifications_notif_status_id_foreign` (`notif_status_id`),
  CONSTRAINT `application_notifications_application_id_foreign` FOREIGN KEY (`application_id`) REFERENCES `sw_applications` (`id`),
  CONSTRAINT `application_notifications_notif_status_id_foreign` FOREIGN KEY (`notif_status_id`) REFERENCES `sw_notification_status` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sw_application_notifications
-- ----------------------------

-- ----------------------------
-- Table structure for `sw_application_px`
-- ----------------------------
DROP TABLE IF EXISTS `sw_application_px`;
CREATE TABLE `sw_application_px` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `application_id` int(10) unsigned NOT NULL,
  `px_type_id` int(10) unsigned NOT NULL,
  `application_cn_id` int(10) unsigned NOT NULL,
  `px_weight` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `application_px_application_id_foreign` (`application_id`),
  KEY `application_px_px_type_id_foreign` (`px_type_id`),
  KEY `application_px_application_cn_id_foreign` (`application_cn_id`),
  CONSTRAINT `application_px_application_cn_id_foreign` FOREIGN KEY (`application_cn_id`) REFERENCES `sw_application_cn` (`id`),
  CONSTRAINT `application_px_application_id_foreign` FOREIGN KEY (`application_id`) REFERENCES `sw_applications` (`id`),
  CONSTRAINT `application_px_px_type_id_foreign` FOREIGN KEY (`px_type_id`) REFERENCES `sw_px_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sw_application_px
-- ----------------------------

-- ----------------------------
-- Table structure for `sw_application_steps`
-- ----------------------------
DROP TABLE IF EXISTS `sw_application_steps`;
CREATE TABLE `sw_application_steps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_ar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `waiting_on` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `previous_step` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `application_steps_previous_step_foreign` (`previous_step`),
  CONSTRAINT `application_steps_previous_step_foreign` FOREIGN KEY (`previous_step`) REFERENCES `sw_application_steps` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sw_application_steps
-- ----------------------------

-- ----------------------------
-- Table structure for `sw_billing_terms`
-- ----------------------------
DROP TABLE IF EXISTS `sw_billing_terms`;
CREATE TABLE `sw_billing_terms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_ar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sw_billing_terms
-- ----------------------------

-- ----------------------------
-- Table structure for `sw_cargo_types`
-- ----------------------------
DROP TABLE IF EXISTS `sw_cargo_types`;
CREATE TABLE `sw_cargo_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_ar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sw_cargo_types
-- ----------------------------

-- ----------------------------
-- Table structure for `sw_companies`
-- ----------------------------
DROP TABLE IF EXISTS `sw_companies`;
CREATE TABLE `sw_companies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `customs_ref_num` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_type_id` int(10) unsigned NOT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `companies_company_type_id_foreign` (`company_type_id`),
  KEY `companies_created_by_foreign` (`created_by`),
  CONSTRAINT `companies_company_type_id_foreign` FOREIGN KEY (`company_type_id`) REFERENCES `sw_company_types` (`id`),
  CONSTRAINT `companies_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `sw_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sw_companies
-- ----------------------------
INSERT INTO `sw_companies` VALUES ('4', 'شركة جيت', '12345', '30', 'address 4', '3', '5', null, null);
INSERT INTO `sw_companies` VALUES ('7', 'شركة الحمد ', '54321', '20', 'address 7', '1', '7', null, null);
INSERT INTO `sw_companies` VALUES ('8', 'شركة اس تي سي', '00000', '10', 'address 8', '2', '9', null, null);

-- ----------------------------
-- Table structure for `sw_company_types`
-- ----------------------------
DROP TABLE IF EXISTS `sw_company_types`;
CREATE TABLE `sw_company_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_ar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sw_company_types
-- ----------------------------
INSERT INTO `sw_company_types` VALUES ('1', 'Exporter', 'مصدر');
INSERT INTO `sw_company_types` VALUES ('2', 'Importer', 'مستورد');
INSERT INTO `sw_company_types` VALUES ('3', 'Clearance', 'مستخلص');

-- ----------------------------
-- Table structure for `sw_container_capacities`
-- ----------------------------
DROP TABLE IF EXISTS `sw_container_capacities`;
CREATE TABLE `sw_container_capacities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_ar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sw_container_capacities
-- ----------------------------

-- ----------------------------
-- Table structure for `sw_container_owners`
-- ----------------------------
DROP TABLE IF EXISTS `sw_container_owners`;
CREATE TABLE `sw_container_owners` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_ar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sw_container_owners
-- ----------------------------

-- ----------------------------
-- Table structure for `sw_container_types`
-- ----------------------------
DROP TABLE IF EXISTS `sw_container_types`;
CREATE TABLE `sw_container_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_ar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sw_container_types
-- ----------------------------

-- ----------------------------
-- Table structure for `sw_countries`
-- ----------------------------
DROP TABLE IF EXISTS `sw_countries`;
CREATE TABLE `sw_countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_ar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `countries_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sw_countries
-- ----------------------------

-- ----------------------------
-- Table structure for `sw_freight_lines`
-- ----------------------------
DROP TABLE IF EXISTS `sw_freight_lines`;
CREATE TABLE `sw_freight_lines` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_ar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sw_freight_lines
-- ----------------------------

-- ----------------------------
-- Table structure for `sw_hs_codes`
-- ----------------------------
DROP TABLE IF EXISTS `sw_hs_codes`;
CREATE TABLE `sw_hs_codes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hs_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hs_desc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hs_desc_ar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hs_codes_hs_code_unique` (`hs_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sw_hs_codes
-- ----------------------------

-- ----------------------------
-- Table structure for `sw_inspection_locations`
-- ----------------------------
DROP TABLE IF EXISTS `sw_inspection_locations`;
CREATE TABLE `sw_inspection_locations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_ar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sw_inspection_locations
-- ----------------------------

-- ----------------------------
-- Table structure for `sw_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `sw_migrations`;
CREATE TABLE `sw_migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sw_migrations
-- ----------------------------
INSERT INTO `sw_migrations` VALUES ('28', '2017_08_22_113900_create_user_type', '1');
INSERT INTO `sw_migrations` VALUES ('29', '2017_08_22_174600_create_user_table', '1');
INSERT INTO `sw_migrations` VALUES ('30', '2018_02_23_173527_create_company_types', '1');
INSERT INTO `sw_migrations` VALUES ('31', '2018_02_23_174145_create_companies', '1');
INSERT INTO `sw_migrations` VALUES ('32', '2018_02_23_175510_update_user_table', '1');
INSERT INTO `sw_migrations` VALUES ('33', '2018_02_23_181121_create_application_steps_table', '1');
INSERT INTO `sw_migrations` VALUES ('34', '2018_02_23_182920_create_hs_codes_table', '1');
INSERT INTO `sw_migrations` VALUES ('35', '2018_02_23_183213_create_countries_table', '1');
INSERT INTO `sw_migrations` VALUES ('36', '2018_02_23_184036_create_billing_terms_table', '1');
INSERT INTO `sw_migrations` VALUES ('37', '2018_02_23_184230_create_cargo_types_table', '1');
INSERT INTO `sw_migrations` VALUES ('38', '2018_02_23_184512_create_inspection_locations_table', '1');
INSERT INTO `sw_migrations` VALUES ('39', '2018_02_23_184844_create_container_owners_table', '1');
INSERT INTO `sw_migrations` VALUES ('40', '2018_02_23_184958_create_container_types_table', '1');
INSERT INTO `sw_migrations` VALUES ('41', '2018_02_23_185054_create_container_capacities_table', '1');
INSERT INTO `sw_migrations` VALUES ('42', '2018_02_23_185244_create_freight_lines_table', '1');
INSERT INTO `sw_migrations` VALUES ('43', '2018_02_23_185341_create_shipping_ports_table', '1');
INSERT INTO `sw_migrations` VALUES ('44', '2018_02_23_185555_create_px_types_table', '1');
INSERT INTO `sw_migrations` VALUES ('45', '2018_02_23_185705_create_notification_status_table', '1');
INSERT INTO `sw_migrations` VALUES ('46', '2018_02_23_190525_create_applications_table', '1');
INSERT INTO `sw_migrations` VALUES ('47', '2018_02_23_190823_create_application_notifications_table', '1');
INSERT INTO `sw_migrations` VALUES ('48', '2018_02_23_192654_create_application_cn_table', '1');
INSERT INTO `sw_migrations` VALUES ('49', '2018_02_23_192946_create_application_cr_table', '1');
INSERT INTO `sw_migrations` VALUES ('50', '2018_02_23_193348_create_application_px_table', '1');
INSERT INTO `sw_migrations` VALUES ('51', '2018_02_26_131245_update_application_notifications_table', '1');

-- ----------------------------
-- Table structure for `sw_notification_status`
-- ----------------------------
DROP TABLE IF EXISTS `sw_notification_status`;
CREATE TABLE `sw_notification_status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_ar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sw_notification_status
-- ----------------------------

-- ----------------------------
-- Table structure for `sw_px_types`
-- ----------------------------
DROP TABLE IF EXISTS `sw_px_types`;
CREATE TABLE `sw_px_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_ar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sw_px_types
-- ----------------------------

-- ----------------------------
-- Table structure for `sw_shipping_ports`
-- ----------------------------
DROP TABLE IF EXISTS `sw_shipping_ports`;
CREATE TABLE `sw_shipping_ports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_ar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sw_shipping_ports
-- ----------------------------

-- ----------------------------
-- Table structure for `sw_user`
-- ----------------------------
DROP TABLE IF EXISTS `sw_user`;
CREATE TABLE `sw_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `user_type_id` int(10) unsigned NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `wallet` decimal(10,2) NOT NULL DEFAULT '0.00',
  `company_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_email_unique` (`email`),
  KEY `user_user_type_id_foreign` (`user_type_id`),
  KEY `user_company_id_foreign` (`company_id`),
  CONSTRAINT `user_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `sw_companies` (`id`),
  CONSTRAINT `user_user_type_id_foreign` FOREIGN KEY (`user_type_id`) REFERENCES `sw_user_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sw_user
-- ----------------------------
INSERT INTO `sw_user` VALUES ('1', 'ahmed.hany@acmesaico.com', '$2y$10$GTE.kQQaBfHU./mtbJucw.qNTa1ZZ2xwH.XmbTufrhWpuM.RZaGgC', '1', '1', 'DODkljCen1h1JjtsQUpvYiOZMqcHKGlhNCEHIbP64VT3gP50s1QAY9f1EYrc', '2018-02-23 20:42:12', '2018-02-23 23:30:53', '0.00', null);
INSERT INTO `sw_user` VALUES ('5', 'Ali.makram@jet.com', '$2y$10$GTE.kQQaBfHU./mtbJucw.qNTa1ZZ2xwH.XmbTufrhWpuM.RZaGgC', '1', '3', null, null, null, '0.00', null);
INSERT INTO `sw_user` VALUES ('7', 'Ahmed.mostafa@elhamed.com', '$2y$10$GTE.kQQaBfHU./mtbJucw.qNTa1ZZ2xwH.XmbTufrhWpuM.RZaGgC', '1', '3', null, null, null, '0.00', null);
INSERT INTO `sw_user` VALUES ('9', 'Hany.louka@stcegypt.com', '$2y$10$GTE.kQQaBfHU./mtbJucw.qNTa1ZZ2xwH.XmbTufrhWpuM.RZaGgC', '1', '3', null, null, null, '0.00', null);

-- ----------------------------
-- Table structure for `sw_user_type`
-- ----------------------------
DROP TABLE IF EXISTS `sw_user_type`;
CREATE TABLE `sw_user_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_ar` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sw_user_type
-- ----------------------------
INSERT INTO `sw_user_type` VALUES ('1', 'ADMIN', 'ADMIN');
INSERT INTO `sw_user_type` VALUES ('2', 'SUBADMIN', 'SUBADMIN');
INSERT INTO `sw_user_type` VALUES ('3', 'NORMAL', 'NORMAL');
