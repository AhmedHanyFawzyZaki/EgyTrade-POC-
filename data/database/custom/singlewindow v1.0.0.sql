/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : singlewindow

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-02-26 00:05:54
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
  `ir_inspection_date` datetime DEFAULT NULL,
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
  KEY `applications_sd_recipeint_country_foreign` (`sd_recipient_country`),
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
  CONSTRAINT `applications_sd_recipeint_country_foreign` FOREIGN KEY (`sd_recipient_country`) REFERENCES `sw_countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sw_applications
-- ----------------------------
INSERT INTO `sw_applications` VALUES ('1', '7', '5', '11', 'con name', '54321', '20', 'address 7', '1', '', '', '', null, null, '3', '1', '1', '2018-02-27 14:30:00', 'address of ins', '63', '1-agreement-151956590178.PNG', '1-invoice-151956590164.PNG', '127489', '014', '025', 'driver name', '15000.00', '14000.00', '9630', null, null, null, null, null, null, '1', '4', '2018-02-27', '2018-02-27', '111', 'APL logistics egypt', '22 شارع كمال الدين حسين شيراتون', null, null, '1-ini_shippment-151959596028.PNG', '1-pack-151959596082.PNG', '659858', '2018-02-24 22:04:27', '2018-02-25 21:59:20');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sw_application_cn
-- ----------------------------
INSERT INTO `sw_application_cn` VALUES ('7', '1', '1', '100.00', '12.00', '2018-02-25 01:11:11', '2018-02-25 01:11:11');
INSERT INTO `sw_application_cn` VALUES ('8', '1', '2', '200.00', null, '2018-02-25 01:11:11', '2018-02-25 01:11:11');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sw_application_cr
-- ----------------------------
INSERT INTO `sw_application_cr` VALUES ('10', '1', '10', '1', '2', '3', '2018-02-25 18:37:15', '2018-02-25 18:37:15');
INSERT INTO `sw_application_cr` VALUES ('11', '1', '20', '2', '3', '1', '2018-02-25 18:37:15', '2018-02-25 18:37:15');
INSERT INTO `sw_application_cr` VALUES ('12', '1', '30', '3', '1', '2', '2018-02-25 18:37:15', '2018-02-25 18:37:15');

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
  `px_weight` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `application_px_application_id_foreign` (`application_id`),
  KEY `application_px_px_type_id_foreign` (`px_type_id`),
  CONSTRAINT `application_px_application_id_foreign` FOREIGN KEY (`application_id`) REFERENCES `sw_applications` (`id`),
  CONSTRAINT `application_px_px_type_id_foreign` FOREIGN KEY (`px_type_id`) REFERENCES `sw_px_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sw_application_px
-- ----------------------------
INSERT INTO `sw_application_px` VALUES ('5', '1', '1', '10.00', '2018-02-25 21:47:22', '2018-02-25 21:47:22');
INSERT INTO `sw_application_px` VALUES ('6', '1', '2', '13.00', '2018-02-25 21:47:22', '2018-02-25 21:47:22');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sw_application_steps
-- ----------------------------
INSERT INTO `sw_application_steps` VALUES ('1', 'Choose the company to create the ecd for', 'إختيار الشركة المراد تقديم اقرار بضائع جديد لها', '', null, null);
INSERT INTO `sw_application_steps` VALUES ('2', 'Sender Details', 'تفاصيل المرسل إليه', '', null, '1');
INSERT INTO `sw_application_steps` VALUES ('3', 'Consignment Details\r\n', 'تفاصيل الشحنة', '', null, '2');
INSERT INTO `sw_application_steps` VALUES ('4', 'Inspection Request Details', 'بيانات طلب الفحص', '', null, '3');
INSERT INTO `sw_application_steps` VALUES ('5', 'Origin Details\r\n', 'تفاصيل المنشأ', '', null, '4');
INSERT INTO `sw_application_steps` VALUES ('6', 'ECD Attachments', 'تحميل ملفات', '', null, '5');
INSERT INTO `sw_application_steps` VALUES ('7', 'Consignment Details', 'تفاصيل الحاويات', '', 'did_num', '6');
INSERT INTO `sw_application_steps` VALUES ('8', 'Transportation Details', 'معلومات عن السيارات', '', 'did_num', '7');
INSERT INTO `sw_application_steps` VALUES ('9', 'Freight Details', 'بيانات الشحن', '', 'did_num', '8');
INSERT INTO `sw_application_steps` VALUES ('10', 'Packaging Details', 'بيانات العبوة', '', 'did_num', '9');
INSERT INTO `sw_application_steps` VALUES ('11', 'Shipping Attachments', 'تحميل الملفات', '', 'did_num', '10');

-- ----------------------------
-- Table structure for `sw_billing_terms`
-- ----------------------------
DROP TABLE IF EXISTS `sw_billing_terms`;
CREATE TABLE `sw_billing_terms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_ar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sw_billing_terms
-- ----------------------------
INSERT INTO `sw_billing_terms` VALUES ('1', 'FOB', 'FOB');
INSERT INTO `sw_billing_terms` VALUES ('2', 'CIF', 'CIF');
INSERT INTO `sw_billing_terms` VALUES ('3', 'FCA', 'FCA');
INSERT INTO `sw_billing_terms` VALUES ('4', 'XWORK', 'XWORK');

-- ----------------------------
-- Table structure for `sw_cargo_types`
-- ----------------------------
DROP TABLE IF EXISTS `sw_cargo_types`;
CREATE TABLE `sw_cargo_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_ar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sw_cargo_types
-- ----------------------------
INSERT INTO `sw_cargo_types` VALUES ('1', 'Containers', 'حاويات');
INSERT INTO `sw_cargo_types` VALUES ('2', 'General Cargo', 'بضائع عامة');

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
INSERT INTO `sw_company_types` VALUES ('3', 'ss', 'مستخلص');

-- ----------------------------
-- Table structure for `sw_container_capacities`
-- ----------------------------
DROP TABLE IF EXISTS `sw_container_capacities`;
CREATE TABLE `sw_container_capacities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_ar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sw_container_capacities
-- ----------------------------
INSERT INTO `sw_container_capacities` VALUES ('1', 'Container Capacity\r\n1', 'سعة الحاوية\r\n1');
INSERT INTO `sw_container_capacities` VALUES ('2', 'Container Capacity\r\n2', 'سعة الحاوية\r\n2');
INSERT INTO `sw_container_capacities` VALUES ('3', 'Container Capacity\r\n3', 'سعة الحاوية\r\n3');

-- ----------------------------
-- Table structure for `sw_container_owners`
-- ----------------------------
DROP TABLE IF EXISTS `sw_container_owners`;
CREATE TABLE `sw_container_owners` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_ar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sw_container_owners
-- ----------------------------
INSERT INTO `sw_container_owners` VALUES ('1', 'co 1', 'مالك الحاوية\r\n 1');
INSERT INTO `sw_container_owners` VALUES ('2', 'co 2', 'مالك الحاوية\r\n 2');
INSERT INTO `sw_container_owners` VALUES ('3', 'co 3', 'مالك الحاوية\r\n 3');
INSERT INTO `sw_container_owners` VALUES ('4', 'co 4', 'مالك الحاوية\r\n 4');

-- ----------------------------
-- Table structure for `sw_container_types`
-- ----------------------------
DROP TABLE IF EXISTS `sw_container_types`;
CREATE TABLE `sw_container_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_ar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sw_container_types
-- ----------------------------
INSERT INTO `sw_container_types` VALUES ('1', 'Container Type 1', 'نوع الحاوية\r\n 1');
INSERT INTO `sw_container_types` VALUES ('2', 'Container Type 2', 'نوع الحاوية\r\n 2');
INSERT INTO `sw_container_types` VALUES ('3', 'Container Type 3', 'نوع الحاوية\r\n 3');

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
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sw_countries
-- ----------------------------
INSERT INTO `sw_countries` VALUES ('1', 'US', 'United States', 'الولايات المتحدة الأمريكية');
INSERT INTO `sw_countries` VALUES ('2', 'CA', 'Canada', 'كندا');
INSERT INTO `sw_countries` VALUES ('3', 'AF', 'Afghanistan', 'أفغانستان');
INSERT INTO `sw_countries` VALUES ('4', 'AL', 'Albania', 'ألبانيا');
INSERT INTO `sw_countries` VALUES ('5', 'DZ', 'Algeria', 'الجزائر');
INSERT INTO `sw_countries` VALUES ('6', 'DS', 'American Samoa', 'ساموا الأمريكية');
INSERT INTO `sw_countries` VALUES ('7', 'AD', 'Andorra', 'أندورا');
INSERT INTO `sw_countries` VALUES ('8', 'AO', 'Angola', 'أنغولا');
INSERT INTO `sw_countries` VALUES ('9', 'AI', 'Anguilla', 'أنغيلا');
INSERT INTO `sw_countries` VALUES ('10', 'AQ', 'Antarctica', 'القطب الجنوبي');
INSERT INTO `sw_countries` VALUES ('11', 'AG', 'Antigua - Barbuda', 'أنتيغوا - باربودا');
INSERT INTO `sw_countries` VALUES ('12', 'AR', 'Argentina', 'الأرجنتين');
INSERT INTO `sw_countries` VALUES ('13', 'AM', 'Armenia', 'أرمينيا');
INSERT INTO `sw_countries` VALUES ('14', 'AW', 'Aruba', 'أروبا');
INSERT INTO `sw_countries` VALUES ('15', 'AU', 'Australia', 'أستراليا');
INSERT INTO `sw_countries` VALUES ('16', 'AT', 'Austria', 'النمسا');
INSERT INTO `sw_countries` VALUES ('17', 'AZ', 'Azerbaijan', 'أذربيجان');
INSERT INTO `sw_countries` VALUES ('18', 'BS', 'Bahamas', 'الباهاما');
INSERT INTO `sw_countries` VALUES ('19', 'BH', 'Bahrain', 'البحرين');
INSERT INTO `sw_countries` VALUES ('20', 'BD', 'Bangladesh', 'بنغلاديش');
INSERT INTO `sw_countries` VALUES ('21', 'BB', 'Barbados', 'بربادوس');
INSERT INTO `sw_countries` VALUES ('22', 'BY', 'Belarus', 'روسيا البيضاء');
INSERT INTO `sw_countries` VALUES ('23', 'BE', 'Belgium', 'بلجيكا');
INSERT INTO `sw_countries` VALUES ('24', 'BZ', 'Belize', 'بليز');
INSERT INTO `sw_countries` VALUES ('25', 'BJ', 'Benin', 'بنين');
INSERT INTO `sw_countries` VALUES ('26', 'BM', 'Bermuda', 'برمودا');
INSERT INTO `sw_countries` VALUES ('27', 'BT', 'Bhutan', 'بوتان');
INSERT INTO `sw_countries` VALUES ('28', 'BO', 'Bolivia', 'بوليفيا');
INSERT INTO `sw_countries` VALUES ('29', 'BA', 'Bosnia and Herzegovina', 'البوسنة والهرسك');
INSERT INTO `sw_countries` VALUES ('30', 'BW', 'Botswana', 'بوتسوانا');
INSERT INTO `sw_countries` VALUES ('31', 'BV', 'Bouvet Island', null);
INSERT INTO `sw_countries` VALUES ('32', 'BR', 'Brazil', null);
INSERT INTO `sw_countries` VALUES ('33', 'IO', 'British lndian Ocean Territory', null);
INSERT INTO `sw_countries` VALUES ('34', 'BN', 'Brunei Darussalam', null);
INSERT INTO `sw_countries` VALUES ('35', 'BG', 'Bulgaria', null);
INSERT INTO `sw_countries` VALUES ('36', 'BF', 'Burkina Faso', 'بوركينا فاسو');
INSERT INTO `sw_countries` VALUES ('37', 'BI', 'Burundi', 'بوروندي');
INSERT INTO `sw_countries` VALUES ('38', 'KH', 'Cambodia', null);
INSERT INTO `sw_countries` VALUES ('39', 'CM', 'Cameroon', 'الكاميرون');
INSERT INTO `sw_countries` VALUES ('40', 'CV', 'Cape Verde', 'الرأس الأخضر');
INSERT INTO `sw_countries` VALUES ('41', 'KY', 'Cayman Islands', null);
INSERT INTO `sw_countries` VALUES ('42', 'CF', 'Central African Republic', null);
INSERT INTO `sw_countries` VALUES ('43', 'TD', 'Chad', 'تشاد');
INSERT INTO `sw_countries` VALUES ('44', 'CL', 'Chile', null);
INSERT INTO `sw_countries` VALUES ('45', 'CN', 'China', null);
INSERT INTO `sw_countries` VALUES ('46', 'CX', 'Christmas Island', null);
INSERT INTO `sw_countries` VALUES ('47', 'CC', 'Cocos (Keeling) Islands', null);
INSERT INTO `sw_countries` VALUES ('48', 'CO', 'Colombia', null);
INSERT INTO `sw_countries` VALUES ('49', 'KM', 'Comoros', null);
INSERT INTO `sw_countries` VALUES ('50', 'CG', 'Congo', 'الكونغو');
INSERT INTO `sw_countries` VALUES ('51', 'CK', 'Cook Islands', null);
INSERT INTO `sw_countries` VALUES ('52', 'CR', 'Costa Rica', null);
INSERT INTO `sw_countries` VALUES ('53', 'HR', 'Croatia (Hrvatska)', null);
INSERT INTO `sw_countries` VALUES ('54', 'CU', 'Cuba', null);
INSERT INTO `sw_countries` VALUES ('55', 'CY', 'Cyprus', null);
INSERT INTO `sw_countries` VALUES ('56', 'CZ', 'Czech Republic', null);
INSERT INTO `sw_countries` VALUES ('57', 'DK', 'Denmark', null);
INSERT INTO `sw_countries` VALUES ('58', 'DJ', 'Djibouti', null);
INSERT INTO `sw_countries` VALUES ('59', 'DM', 'Dominica', null);
INSERT INTO `sw_countries` VALUES ('60', 'DO', 'Dominican Republic', null);
INSERT INTO `sw_countries` VALUES ('61', 'TP', 'East Timor', null);
INSERT INTO `sw_countries` VALUES ('62', 'EC', 'Ecudaor', null);
INSERT INTO `sw_countries` VALUES ('63', 'EG', 'Egypt', 'مصر');
INSERT INTO `sw_countries` VALUES ('64', 'SV', 'El Salvador', null);
INSERT INTO `sw_countries` VALUES ('65', 'GQ', 'Equatorial Guinea', 'غينيا الإستوائية');
INSERT INTO `sw_countries` VALUES ('66', 'ER', 'Eritrea', 'إريتريا');
INSERT INTO `sw_countries` VALUES ('67', 'EE', 'Estonia', null);
INSERT INTO `sw_countries` VALUES ('68', 'ET', 'Ethiopia', 'أثيوبيا');
INSERT INTO `sw_countries` VALUES ('69', 'FK', 'Falkland Islands (Malvinas)', null);
INSERT INTO `sw_countries` VALUES ('70', 'FO', 'Faroe Islands', null);
INSERT INTO `sw_countries` VALUES ('71', 'FJ', 'Fiji', null);
INSERT INTO `sw_countries` VALUES ('72', 'FI', 'Finland', null);
INSERT INTO `sw_countries` VALUES ('73', 'FR', 'France', null);
INSERT INTO `sw_countries` VALUES ('74', 'FX', 'France, Metropolitan', null);
INSERT INTO `sw_countries` VALUES ('75', 'GF', 'French Guiana', null);
INSERT INTO `sw_countries` VALUES ('76', 'PF', 'French Polynesia', null);
INSERT INTO `sw_countries` VALUES ('77', 'TF', 'French Southern Territories', null);
INSERT INTO `sw_countries` VALUES ('78', 'GA', 'Gabon', 'الغابون');
INSERT INTO `sw_countries` VALUES ('79', 'GM', 'Gambia', 'غامبيا');
INSERT INTO `sw_countries` VALUES ('80', 'GE', 'Georgia', null);
INSERT INTO `sw_countries` VALUES ('81', 'DE', 'Germany', null);
INSERT INTO `sw_countries` VALUES ('82', 'GH', 'Ghana', 'غانا');
INSERT INTO `sw_countries` VALUES ('83', 'GI', 'Gibraltar', null);
INSERT INTO `sw_countries` VALUES ('84', 'GR', 'Greece', null);
INSERT INTO `sw_countries` VALUES ('85', 'GL', 'Greenland', null);
INSERT INTO `sw_countries` VALUES ('86', 'GD', 'Grenada', null);
INSERT INTO `sw_countries` VALUES ('87', 'GP', 'Guadeloupe', null);
INSERT INTO `sw_countries` VALUES ('88', 'GU', 'Guam', null);
INSERT INTO `sw_countries` VALUES ('89', 'GT', 'Guatemala', null);
INSERT INTO `sw_countries` VALUES ('90', 'GN', 'Guinea', 'غينيا');
INSERT INTO `sw_countries` VALUES ('91', 'GW', 'Guinea-Bissau', 'غينيا بيساو');
INSERT INTO `sw_countries` VALUES ('92', 'GY', 'Guyana', null);
INSERT INTO `sw_countries` VALUES ('93', 'HT', 'Haiti', null);
INSERT INTO `sw_countries` VALUES ('94', 'HM', 'Heard and Mc Donald Islands', null);
INSERT INTO `sw_countries` VALUES ('95', 'HN', 'Honduras', null);
INSERT INTO `sw_countries` VALUES ('96', 'HK', 'Hong Kong', null);
INSERT INTO `sw_countries` VALUES ('97', 'HU', 'Hungary', null);
INSERT INTO `sw_countries` VALUES ('98', 'IS', 'Iceland', null);
INSERT INTO `sw_countries` VALUES ('99', 'IN', 'India', null);
INSERT INTO `sw_countries` VALUES ('100', 'ID', 'Indonesia', null);
INSERT INTO `sw_countries` VALUES ('101', 'IR', 'Iran (Islamic Republic of)', null);
INSERT INTO `sw_countries` VALUES ('102', 'IQ', 'Iraq', null);
INSERT INTO `sw_countries` VALUES ('103', 'IE', 'Ireland', null);
INSERT INTO `sw_countries` VALUES ('104', 'IL', 'Israel', null);
INSERT INTO `sw_countries` VALUES ('105', 'IT', 'Italy', null);
INSERT INTO `sw_countries` VALUES ('106', 'CI', 'Ivory Coast', 'ساحل العاج');
INSERT INTO `sw_countries` VALUES ('107', 'JM', 'Jamaica', null);
INSERT INTO `sw_countries` VALUES ('108', 'JP', 'Japan', null);
INSERT INTO `sw_countries` VALUES ('109', 'JO', 'Jordan', null);
INSERT INTO `sw_countries` VALUES ('110', 'KZ', 'Kazakhstan', null);
INSERT INTO `sw_countries` VALUES ('111', 'KE', 'Kenya', 'كينيا');
INSERT INTO `sw_countries` VALUES ('112', 'KI', 'Kiribati', null);
INSERT INTO `sw_countries` VALUES ('113', 'KP', 'Korea, Democratic People\'s Republic of', null);
INSERT INTO `sw_countries` VALUES ('114', 'KR', 'Korea, Republic of', null);
INSERT INTO `sw_countries` VALUES ('115', 'KW', 'Kuwait', null);
INSERT INTO `sw_countries` VALUES ('116', 'KG', 'Kyrgyzstan', null);
INSERT INTO `sw_countries` VALUES ('117', 'LA', 'Lao People\'s Democratic Republic', null);
INSERT INTO `sw_countries` VALUES ('118', 'LV', 'Latvia', null);
INSERT INTO `sw_countries` VALUES ('119', 'LB', 'Lebanon', null);
INSERT INTO `sw_countries` VALUES ('120', 'LS', 'Lesotho', null);
INSERT INTO `sw_countries` VALUES ('121', 'LR', 'Liberia', null);
INSERT INTO `sw_countries` VALUES ('122', 'LY', 'Libyan Arab Jamahiriya', 'الجماهيرية العربية الليبية');
INSERT INTO `sw_countries` VALUES ('123', 'LI', 'Liechtenstein', null);
INSERT INTO `sw_countries` VALUES ('124', 'LT', 'Lithuania', null);
INSERT INTO `sw_countries` VALUES ('125', 'LU', 'Luxembourg', null);
INSERT INTO `sw_countries` VALUES ('126', 'MO', 'Macau', null);
INSERT INTO `sw_countries` VALUES ('127', 'MK', 'Macedonia', null);
INSERT INTO `sw_countries` VALUES ('128', 'MG', 'Madagascar', null);
INSERT INTO `sw_countries` VALUES ('129', 'MW', 'Malawi', 'ملاوي');
INSERT INTO `sw_countries` VALUES ('130', 'MY', 'Malaysia', null);
INSERT INTO `sw_countries` VALUES ('131', 'MV', 'Maldives', null);
INSERT INTO `sw_countries` VALUES ('132', 'ML', 'Mali', 'مالي');
INSERT INTO `sw_countries` VALUES ('133', 'MT', 'Malta', null);
INSERT INTO `sw_countries` VALUES ('134', 'MH', 'Marshall Islands', null);
INSERT INTO `sw_countries` VALUES ('135', 'MQ', 'Martinique', null);
INSERT INTO `sw_countries` VALUES ('136', 'MR', 'Mauritania', null);
INSERT INTO `sw_countries` VALUES ('137', 'MU', 'Mauritius', null);
INSERT INTO `sw_countries` VALUES ('138', 'TY', 'Mayotte', null);
INSERT INTO `sw_countries` VALUES ('139', 'MX', 'Mexico', null);
INSERT INTO `sw_countries` VALUES ('140', 'FM', 'Micronesia, Federated States of', null);
INSERT INTO `sw_countries` VALUES ('141', 'MD', 'Moldova, Republic of', null);
INSERT INTO `sw_countries` VALUES ('142', 'MC', 'Monaco', null);
INSERT INTO `sw_countries` VALUES ('143', 'MN', 'Mongolia', null);
INSERT INTO `sw_countries` VALUES ('144', 'MS', 'Montserrat', null);
INSERT INTO `sw_countries` VALUES ('145', 'MA', 'Morocco', 'المغرب');
INSERT INTO `sw_countries` VALUES ('146', 'MZ', 'Mozambique', 'موزمبيق');
INSERT INTO `sw_countries` VALUES ('147', 'MM', 'Myanmar', null);
INSERT INTO `sw_countries` VALUES ('148', 'NA', 'Namibia', 'ناميبيا');
INSERT INTO `sw_countries` VALUES ('149', 'NR', 'Nauru', null);
INSERT INTO `sw_countries` VALUES ('150', 'NP', 'Nepal', null);
INSERT INTO `sw_countries` VALUES ('151', 'NL', 'Netherlands', null);
INSERT INTO `sw_countries` VALUES ('152', 'AN', 'Netherlands Antilles', null);
INSERT INTO `sw_countries` VALUES ('153', 'NC', 'New Caledonia', null);
INSERT INTO `sw_countries` VALUES ('154', 'NZ', 'New Zealand', null);
INSERT INTO `sw_countries` VALUES ('155', 'NI', 'Nicaragua', null);
INSERT INTO `sw_countries` VALUES ('156', 'NE', 'Niger', 'النيجر');
INSERT INTO `sw_countries` VALUES ('157', 'NG', 'Nigeria', 'نيجيريا');
INSERT INTO `sw_countries` VALUES ('158', 'NU', 'Niue', null);
INSERT INTO `sw_countries` VALUES ('159', 'NF', 'Norfork Island', null);
INSERT INTO `sw_countries` VALUES ('160', 'MP', 'Northern Mariana Islands', null);
INSERT INTO `sw_countries` VALUES ('161', 'NO', 'Norway', null);
INSERT INTO `sw_countries` VALUES ('162', 'OM', 'Oman', null);
INSERT INTO `sw_countries` VALUES ('163', 'PK', 'Pakistan', null);
INSERT INTO `sw_countries` VALUES ('164', 'PW', 'Palau', null);
INSERT INTO `sw_countries` VALUES ('165', 'PA', 'Panama', null);
INSERT INTO `sw_countries` VALUES ('166', 'PG', 'Papua New Guinea', null);
INSERT INTO `sw_countries` VALUES ('167', 'PY', 'Paraguay', null);
INSERT INTO `sw_countries` VALUES ('168', 'PE', 'Peru', null);
INSERT INTO `sw_countries` VALUES ('169', 'PH', 'Philippines', null);
INSERT INTO `sw_countries` VALUES ('170', 'PN', 'Pitcairn', null);
INSERT INTO `sw_countries` VALUES ('171', 'PL', 'Poland', null);
INSERT INTO `sw_countries` VALUES ('172', 'PT', 'Portugal', null);
INSERT INTO `sw_countries` VALUES ('173', 'PR', 'Puerto Rico', null);
INSERT INTO `sw_countries` VALUES ('174', 'QA', 'Qatar', null);
INSERT INTO `sw_countries` VALUES ('175', 'RE', 'Reunion', null);
INSERT INTO `sw_countries` VALUES ('176', 'RO', 'Romania', null);
INSERT INTO `sw_countries` VALUES ('177', 'RU', 'Russian Federation', null);
INSERT INTO `sw_countries` VALUES ('178', 'RW', 'Rwanda', 'رواندا');
INSERT INTO `sw_countries` VALUES ('179', 'KN', 'Saint Kitts and Nevis', null);
INSERT INTO `sw_countries` VALUES ('180', 'LC', 'Saint Lucia', null);
INSERT INTO `sw_countries` VALUES ('181', 'VC', 'Saint Vincent and the Grenadines', null);
INSERT INTO `sw_countries` VALUES ('182', 'WS', 'Samoa', null);
INSERT INTO `sw_countries` VALUES ('183', 'SM', 'San Marino', null);
INSERT INTO `sw_countries` VALUES ('184', 'ST', 'Sao Tome and Principe', null);
INSERT INTO `sw_countries` VALUES ('185', 'SA', 'Saudi Arabia', null);
INSERT INTO `sw_countries` VALUES ('186', 'SN', 'Senegal', null);
INSERT INTO `sw_countries` VALUES ('187', 'SC', 'Seychelles', null);
INSERT INTO `sw_countries` VALUES ('188', 'SL', 'Sierra Leone', null);
INSERT INTO `sw_countries` VALUES ('189', 'SG', 'Singapore', null);
INSERT INTO `sw_countries` VALUES ('190', 'SK', 'Slovakia', null);
INSERT INTO `sw_countries` VALUES ('191', 'SI', 'Slovenia', null);
INSERT INTO `sw_countries` VALUES ('192', 'SB', 'Solomon Islands', null);
INSERT INTO `sw_countries` VALUES ('193', 'SO', 'Somalia', null);
INSERT INTO `sw_countries` VALUES ('194', 'ZA', 'South Africa', null);
INSERT INTO `sw_countries` VALUES ('195', 'GS', 'South Georgia South Sandwich Islands', null);
INSERT INTO `sw_countries` VALUES ('196', 'ES', 'Spain', null);
INSERT INTO `sw_countries` VALUES ('197', 'LK', 'Sri Lanka', null);
INSERT INTO `sw_countries` VALUES ('198', 'SH', 'St. Helena', null);
INSERT INTO `sw_countries` VALUES ('199', 'PM', 'St. Pierre and Miquelon', null);
INSERT INTO `sw_countries` VALUES ('200', 'SR', 'Suriname', null);
INSERT INTO `sw_countries` VALUES ('201', 'SJ', 'Svalbarn and Jan Mayen Islands', null);
INSERT INTO `sw_countries` VALUES ('202', 'SZ', 'Swaziland', null);
INSERT INTO `sw_countries` VALUES ('203', 'SE', 'Sweden', null);
INSERT INTO `sw_countries` VALUES ('204', 'CH', 'Switzerland', null);
INSERT INTO `sw_countries` VALUES ('205', 'SY', 'Syrian Arab Republic', null);
INSERT INTO `sw_countries` VALUES ('206', 'TW', 'Taiwan', null);
INSERT INTO `sw_countries` VALUES ('207', 'TJ', 'Tajikistan', null);
INSERT INTO `sw_countries` VALUES ('208', 'TZ', 'Tanzania, United Republic of', null);
INSERT INTO `sw_countries` VALUES ('209', 'TH', 'Thailand', null);
INSERT INTO `sw_countries` VALUES ('210', 'TG', 'Togo', 'توغو');
INSERT INTO `sw_countries` VALUES ('211', 'TK', 'Tokelau', null);
INSERT INTO `sw_countries` VALUES ('212', 'TO', 'Tonga', null);
INSERT INTO `sw_countries` VALUES ('213', 'TT', 'Trinidad and Tobago', null);
INSERT INTO `sw_countries` VALUES ('214', 'TN', 'Tunisia', 'تونس');
INSERT INTO `sw_countries` VALUES ('215', 'TR', 'Turkey', null);
INSERT INTO `sw_countries` VALUES ('216', 'TM', 'Turkmenistan', null);
INSERT INTO `sw_countries` VALUES ('217', 'TC', 'Turks and Caicos Islands', null);
INSERT INTO `sw_countries` VALUES ('218', 'TV', 'Tuvalu', null);
INSERT INTO `sw_countries` VALUES ('219', 'UG', 'Uganda', 'أوغندا');
INSERT INTO `sw_countries` VALUES ('220', 'UA', 'Ukraine', null);
INSERT INTO `sw_countries` VALUES ('221', 'AE', 'United Arab Emirates', null);
INSERT INTO `sw_countries` VALUES ('222', 'GB', 'United Kingdom', 'المملكة المتحدة');
INSERT INTO `sw_countries` VALUES ('223', 'UM', 'United States minor outlying islands', null);
INSERT INTO `sw_countries` VALUES ('224', 'UY', 'Uruguay', null);
INSERT INTO `sw_countries` VALUES ('225', 'UZ', 'Uzbekistan', null);
INSERT INTO `sw_countries` VALUES ('226', 'VU', 'Vanuatu', null);
INSERT INTO `sw_countries` VALUES ('227', 'VA', 'Vatican City State', null);
INSERT INTO `sw_countries` VALUES ('228', 'VE', 'Venezuela', null);
INSERT INTO `sw_countries` VALUES ('229', 'VN', 'Vietnam', null);
INSERT INTO `sw_countries` VALUES ('230', 'VG', 'Virigan Islands (British)', null);
INSERT INTO `sw_countries` VALUES ('231', 'VI', 'Virgin Islands (U.S.)', null);
INSERT INTO `sw_countries` VALUES ('232', 'WF', 'Wallis and Futuna Islands', null);
INSERT INTO `sw_countries` VALUES ('233', 'EH', 'Western Sahara', null);
INSERT INTO `sw_countries` VALUES ('234', 'YE', 'Yemen', null);
INSERT INTO `sw_countries` VALUES ('235', 'YU', 'Yugoslavia', null);
INSERT INTO `sw_countries` VALUES ('236', 'ZR', 'Zaire', 'زائير');
INSERT INTO `sw_countries` VALUES ('237', 'ZM', 'Zambia', 'زامبيا');
INSERT INTO `sw_countries` VALUES ('238', 'ZW', 'Zimbabwe', 'زيمبابوي');

-- ----------------------------
-- Table structure for `sw_freight_lines`
-- ----------------------------
DROP TABLE IF EXISTS `sw_freight_lines`;
CREATE TABLE `sw_freight_lines` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_ar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sw_freight_lines
-- ----------------------------
INSERT INTO `sw_freight_lines` VALUES ('1', 'APL', 'APL');
INSERT INTO `sw_freight_lines` VALUES ('2', 'Name of freight line\r\n1', 'اسم الخط الملاحي\r\nاسم الخط الملاحي\r\n 1');
INSERT INTO `sw_freight_lines` VALUES ('3', 'Name of freight line\r\n2', 'اسم الخط الملاحي\r\n2');
INSERT INTO `sw_freight_lines` VALUES ('4', 'Name of freight line\r\n3', 'اسم الخط الملاحي\r\n3');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sw_hs_codes
-- ----------------------------
INSERT INTO `sw_hs_codes` VALUES ('1', '001', 'Orange', 'برتقال');
INSERT INTO `sw_hs_codes` VALUES ('2', '002', 'Apple', 'تفاح');

-- ----------------------------
-- Table structure for `sw_inspection_locations`
-- ----------------------------
DROP TABLE IF EXISTS `sw_inspection_locations`;
CREATE TABLE `sw_inspection_locations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_ar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sw_inspection_locations
-- ----------------------------
INSERT INTO `sw_inspection_locations` VALUES ('1', 'Inside Customs', 'داخل الجمرك');
INSERT INTO `sw_inspection_locations` VALUES ('2', 'External Comitee', 'لجنة خارجية');

-- ----------------------------
-- Table structure for `sw_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `sw_migrations`;
CREATE TABLE `sw_migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sw_migrations
-- ----------------------------
INSERT INTO `sw_migrations` VALUES ('1', '2017_08_22_113900_create_user_type', '1');
INSERT INTO `sw_migrations` VALUES ('2', '2017_08_22_174600_create_user_table', '1');
INSERT INTO `sw_migrations` VALUES ('3', '2018_02_23_173527_create_company_types', '1');
INSERT INTO `sw_migrations` VALUES ('4', '2018_02_23_174145_create_companies', '1');
INSERT INTO `sw_migrations` VALUES ('5', '2018_02_23_175510_update_user_table', '1');
INSERT INTO `sw_migrations` VALUES ('6', '2018_02_23_181121_create_application_steps_table', '1');
INSERT INTO `sw_migrations` VALUES ('7', '2018_02_23_182920_create_hs_codes_table', '1');
INSERT INTO `sw_migrations` VALUES ('8', '2018_02_23_183213_create_countries_table', '1');
INSERT INTO `sw_migrations` VALUES ('9', '2018_02_23_184036_create_billing_terms_table', '1');
INSERT INTO `sw_migrations` VALUES ('10', '2018_02_23_184230_create_cargo_types_table', '1');
INSERT INTO `sw_migrations` VALUES ('11', '2018_02_23_184512_create_inspection_locations_table', '1');
INSERT INTO `sw_migrations` VALUES ('12', '2018_02_23_184844_create_container_owners_table', '1');
INSERT INTO `sw_migrations` VALUES ('13', '2018_02_23_184958_create_container_types_table', '1');
INSERT INTO `sw_migrations` VALUES ('14', '2018_02_23_185054_create_container_capacities_table', '1');
INSERT INTO `sw_migrations` VALUES ('15', '2018_02_23_185244_create_freight_lines_table', '1');
INSERT INTO `sw_migrations` VALUES ('16', '2018_02_23_185341_create_shipping_ports_table', '1');
INSERT INTO `sw_migrations` VALUES ('17', '2018_02_23_185555_create_px_types_table', '1');
INSERT INTO `sw_migrations` VALUES ('18', '2018_02_23_185705_create_notification_status_table', '1');
INSERT INTO `sw_migrations` VALUES ('19', '2018_02_23_190525_create_applications_table', '1');
INSERT INTO `sw_migrations` VALUES ('20', '2018_02_23_190823_create_application_notifications_table', '1');
INSERT INTO `sw_migrations` VALUES ('21', '2018_02_23_192654_create_application_cn_table', '1');
INSERT INTO `sw_migrations` VALUES ('22', '2018_02_23_192946_create_application_cr_table', '1');
INSERT INTO `sw_migrations` VALUES ('23', '2018_02_23_193348_create_application_px_table', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sw_px_types
-- ----------------------------
INSERT INTO `sw_px_types` VALUES ('1', 'Pack type 1', 'Pack type 1');
INSERT INTO `sw_px_types` VALUES ('2', 'Pack type 2', 'Pack type 2');

-- ----------------------------
-- Table structure for `sw_shipping_ports`
-- ----------------------------
DROP TABLE IF EXISTS `sw_shipping_ports`;
CREATE TABLE `sw_shipping_ports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_ar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sw_shipping_ports
-- ----------------------------
INSERT INTO `sw_shipping_ports` VALUES ('1', 'Shipping port 1', 'ميناء الشحن 1');
INSERT INTO `sw_shipping_ports` VALUES ('2', 'Shipping port 2', 'ميناء الشحن 2');
INSERT INTO `sw_shipping_ports` VALUES ('3', 'Shipping port 3', 'ميناء الشحن 3');
INSERT INTO `sw_shipping_ports` VALUES ('4', 'Shipping port 4', 'ميناء الشحن 4');

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
INSERT INTO `sw_user` VALUES ('7', 'Ahmed.mostafa@elhamed.com', '$2y$10$GTE.kQQaBfHU./mtbJucw.qNTa1ZZ2xwH.XmbTufrhWpuM.RZaGgC', '1', '3', null, null, null, '0.00',null);
INSERT INTO `sw_user` VALUES ('9', 'Hany.louka@stcegypt.com', '$2y$10$GTE.kQQaBfHU./mtbJucw.qNTa1ZZ2xwH.XmbTufrhWpuM.RZaGgC', '1', '3', null, null, null, '0.00',null);

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
INSERT INTO `sw_user_type` VALUES ('1', 'ADMIN', '');
INSERT INTO `sw_user_type` VALUES ('2', 'SUBADMIN', '');
INSERT INTO `sw_user_type` VALUES ('3', 'NORMAL', '');
