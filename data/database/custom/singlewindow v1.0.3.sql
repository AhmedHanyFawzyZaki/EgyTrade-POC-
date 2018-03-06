/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : singlewindow

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-02-28 12:48:35
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
INSERT INTO `sw_cargo_types` VALUES ('2', 'General Cargo', 'بضائع عامة ');

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
INSERT INTO `sw_companies` VALUES ('7', 'شركة الحمد للتعاملات التجارية', '54321', '20', 'address 7', '1', '7', null, null);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sw_container_capacities
-- ----------------------------
INSERT INTO `sw_container_capacities` VALUES ('1', '20 ft\r\n', '20 قدم\r\n');
INSERT INTO `sw_container_capacities` VALUES ('2', '40 ft\r\n', '40 قدم\r\n');

-- ----------------------------
-- Table structure for `sw_container_owners`
-- ----------------------------
DROP TABLE IF EXISTS `sw_container_owners`;
CREATE TABLE `sw_container_owners` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_ar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sw_container_owners
-- ----------------------------
INSERT INTO `sw_container_owners` VALUES ('1', 'shanghaimetal\r\n', 'shanghaimetal\r\n');
INSERT INTO `sw_container_owners` VALUES ('2', 'msc\r\n', 'msc\r\n');

-- ----------------------------
-- Table structure for `sw_container_types`
-- ----------------------------
DROP TABLE IF EXISTS `sw_container_types`;
CREATE TABLE `sw_container_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_ar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sw_container_types
-- ----------------------------
INSERT INTO `sw_container_types` VALUES ('1', 'Dry Containers\r\n', 'حاويات جافة\r\n');
INSERT INTO `sw_container_types` VALUES ('2', 'Flat Rack Containers\r\n', 'حاويات مسطحة\r\n');
INSERT INTO `sw_container_types` VALUES ('3', 'open top containers\r\n', 'حاويات تفتح من الأعلى\r\n');
INSERT INTO `sw_container_types` VALUES ('4', 'Side Open Storage Container\r\n', 'حاويات تفتح من الجانب\r\n');
INSERT INTO `sw_container_types` VALUES ('5', 'Refrigerated ISO Containers\r\n', 'حاويات ثلاجة\r\n');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sw_freight_lines
-- ----------------------------
INSERT INTO `sw_freight_lines` VALUES ('1', 'APL\r\n', 'APL\r\n');
INSERT INTO `sw_freight_lines` VALUES ('2', 'MAERSK\r\n', 'MAERSK\r\n');
INSERT INTO `sw_freight_lines` VALUES ('3', 'UASC\r\n', 'UASC\r\n');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sw_hs_codes
-- ----------------------------
INSERT INTO `sw_hs_codes` VALUES ('1', '805100010\r\n', '', 'برتقال طازج\r\n');
INSERT INTO `sw_hs_codes` VALUES ('2', '805100050\r\n', '', 'برتقال مجفف\r\n');
INSERT INTO `sw_hs_codes` VALUES ('5', '808100000\r\n', '', 'تفاح طازج\r\n');
INSERT INTO `sw_hs_codes` VALUES ('6', '813300000\r\n', '', 'تفاح مجفف\r\n');
INSERT INTO `sw_hs_codes` VALUES ('7', '810100000\r\n', '', 'فراوله [فريز] طازجه\r\n');
INSERT INTO `sw_hs_codes` VALUES ('8', '811100000\r\n', '', 'فراوله [فريز]غير مطبوخه او مطبوخه بالبخار او مسلوقه في ماء م ج م ده وان احتوت على سكر مضاف او مواد تحليه اخر\r\n');
INSERT INTO `sw_hs_codes` VALUES ('9', '811101000\r\n', '', 'فراوله فريز غير مطبوخه او مطبوخه بالبخار او مسلوقه في ماء م ج م ده بدون سكر مضاف\r\n');
INSERT INTO `sw_hs_codes` VALUES ('10', '811109000\r\n', '', 'فراوله فريز غير مطبوخه اومطبوخه بالبخار اومسلوقه في ماء مجمده مضاف عليها سكر او مواد تحليه اخر\r\n');

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
INSERT INTO `sw_inspection_locations` VALUES ('1', 'External Comitee', 'لجنة خارجية');
INSERT INTO `sw_inspection_locations` VALUES ('2', 'Outside customs', 'داخل الجمرك');

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
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sw_notification_status
-- ----------------------------
INSERT INTO `sw_notification_status` VALUES ('0', '', null);
INSERT INTO `sw_notification_status` VALUES ('1', '', null);
INSERT INTO `sw_notification_status` VALUES ('2', '', null);
INSERT INTO `sw_notification_status` VALUES ('3', '', null);
INSERT INTO `sw_notification_status` VALUES ('4', '', null);
INSERT INTO `sw_notification_status` VALUES ('5', '', null);
INSERT INTO `sw_notification_status` VALUES ('6', '', null);
INSERT INTO `sw_notification_status` VALUES ('7', '', null);
INSERT INTO `sw_notification_status` VALUES ('8', '', null);

-- ----------------------------
-- Table structure for `sw_px_types`
-- ----------------------------
DROP TABLE IF EXISTS `sw_px_types`;
CREATE TABLE `sw_px_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_ar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sw_px_types
-- ----------------------------
INSERT INTO `sw_px_types` VALUES ('1', 'Plastic packaging\r\n', 'عبوة بلاستيك\r\n');
INSERT INTO `sw_px_types` VALUES ('2', 'Carton packaging\r\n', 'عبوة كرتون\r\n');
INSERT INTO `sw_px_types` VALUES ('3', 'Metal packaging\r\n', 'عبوة معدنية\r\n');
INSERT INTO `sw_px_types` VALUES ('4', 'Tinplate packaging\r\n', 'عبوة صفيح\r\n');
INSERT INTO `sw_px_types` VALUES ('5', 'Packed packaging\r\n', 'عبوة مغلفة\r\n');
INSERT INTO `sw_px_types` VALUES ('6', 'Welded packaging\r\n', 'عبوة ملحومة\r\n');
INSERT INTO `sw_px_types` VALUES ('7', 'Refillable packaging\r\n', 'عبوة مفرغة الهواء\r\n');
INSERT INTO `sw_px_types` VALUES ('8', 'Package under discharge\r\n', 'عبوة تحت التفريغ\r\n');
INSERT INTO `sw_px_types` VALUES ('9', 'Moisture proof packaging\r\n', 'عبوة مانعة للرطوبة\r\n');
INSERT INTO `sw_px_types` VALUES ('10', 'Moisture proof packaging\r\n', 'عبوة منفذة للرطوبة\r\n');
INSERT INTO `sw_px_types` VALUES ('11', 'An unfinished cardboard packaging for moisture\r\n', 'عبوة كرتون غير منفذة للرطوبة\r\n');
INSERT INTO `sw_px_types` VALUES ('12', 'Glass bottle\r\n', 'عبوة زجاجية\r\n');
INSERT INTO `sw_px_types` VALUES ('13', 'Polyethylene bags\r\n', 'اكياس بولي ايثلين\r\n');
INSERT INTO `sw_px_types` VALUES ('14', 'Materials laminated\r\n', 'مواد مغلفة\r\n');
INSERT INTO `sw_px_types` VALUES ('15', 'Parchment paper\r\n', 'ورق بارشمنت\r\n');
INSERT INTO `sw_px_types` VALUES ('16', 'tinfoil\r\n', 'ورق المونيوم\r\n');
INSERT INTO `sw_px_types` VALUES ('17', 'Suitable packaging\r\n', 'عبوة مناسبة\r\n');
INSERT INTO `sw_px_types` VALUES ('18', 'Non-metallic packaging\r\n', 'عبوة غير معدنية\r\n');
INSERT INTO `sw_px_types` VALUES ('19', 'Refillable sealant\r\n', 'عبوة محكمة الغلق مانعة لتسرب الرطوبة\r\n');
INSERT INTO `sw_px_types` VALUES ('20', 'Without refill\r\n', 'بدون عبوة\r\n');

-- ----------------------------
-- Table structure for `sw_shipping_ports`
-- ----------------------------
DROP TABLE IF EXISTS `sw_shipping_ports`;
CREATE TABLE `sw_shipping_ports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_ar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1758 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sw_shipping_ports
-- ----------------------------
INSERT INTO `sw_shipping_ports` VALUES ('1', 'Aachen,Germany', 'Aachen,Germany');
INSERT INTO `sw_shipping_ports` VALUES ('2', 'Aalesund,Denmark', 'Aalesund,Denmark');
INSERT INTO `sw_shipping_ports` VALUES ('3', 'Aarhus,Denmark', 'Aarhus,Denmark');
INSERT INTO `sw_shipping_ports` VALUES ('4', 'Abaco,Bahamas', 'Abaco,Bahamas');
INSERT INTO `sw_shipping_ports` VALUES ('5', 'Abakan,Russia', 'Abakan,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('6', 'Abidjan,Ivory Coast', 'Abidjan,Ivory Coast');
INSERT INTO `sw_shipping_ports` VALUES ('7', 'Abu Dhabi,United Arab Emirates', 'Abu Dhabi,United Arab Emirates');
INSERT INTO `sw_shipping_ports` VALUES ('8', 'Aburatsu,Japan', 'Aburatsu,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('9', 'Acajutla,Republic of El Salvador', 'Acajutla,Republic of El Salvador');
INSERT INTO `sw_shipping_ports` VALUES ('10', 'Acapulco,Mexico', 'Acapulco,Mexico');
INSERT INTO `sw_shipping_ports` VALUES ('11', 'Adabiya,Egypt', 'Adabiya,Egypt');
INSERT INTO `sw_shipping_ports` VALUES ('12', 'Addis Ababa,Ethiopia', 'Addis Ababa,Ethiopia');
INSERT INTO `sw_shipping_ports` VALUES ('13', 'Adelaide,South Australia', 'Adelaide,South Australia');
INSERT INTO `sw_shipping_ports` VALUES ('14', 'Aden,Yemen', 'Aden,Yemen');
INSERT INTO `sw_shipping_ports` VALUES ('15', 'Agadir,Morocco', 'Agadir,Morocco');
INSERT INTO `sw_shipping_ports` VALUES ('16', 'Agira (Inland Point),Italy', 'Agira (Inland Point),Italy');
INSERT INTO `sw_shipping_ports` VALUES ('17', 'Ahmedabad,India', 'Ahmedabad,India');
INSERT INTO `sw_shipping_ports` VALUES ('18', 'Ain Sokhna,Egypt', 'Ain Sokhna,Egypt');
INSERT INTO `sw_shipping_ports` VALUES ('19', 'Aitutaki,Cook Islands', 'Aitutaki,Cook Islands');
INSERT INTO `sw_shipping_ports` VALUES ('20', 'Ajman,United Arab Emirates', 'Ajman,United Arab Emirates');
INSERT INTO `sw_shipping_ports` VALUES ('21', 'Akita,Japan', 'Akita,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('22', 'Akmola,Kazakhstan', 'Akmola,Kazakhstan');
INSERT INTO `sw_shipping_ports` VALUES ('23', 'Aktau,Kazakhstan', 'Aktau,Kazakhstan');
INSERT INTO `sw_shipping_ports` VALUES ('24', 'Aktobe,Kazakhstan', 'Aktobe,Kazakhstan');
INSERT INTO `sw_shipping_ports` VALUES ('25', 'Al Aqabah,Jordan', 'Al Aqabah,Jordan');
INSERT INTO `sw_shipping_ports` VALUES ('26', 'AL Iskandariyah,Egypt', 'AL Iskandariyah,Egypt');
INSERT INTO `sw_shipping_ports` VALUES ('27', 'Al Khoms,Libya', 'Al Khoms,Libya');
INSERT INTO `sw_shipping_ports` VALUES ('28', 'Alacahoyuk,Turkey', 'Alacahoyuk,Turkey');
INSERT INTO `sw_shipping_ports` VALUES ('29', 'Alashankou,Mongolia', 'Alashankou,Mongolia');
INSERT INTO `sw_shipping_ports` VALUES ('30', 'Alaska,United States', 'Alaska,United States');
INSERT INTO `sw_shipping_ports` VALUES ('31', 'Albany,United States', 'Albany,United States');
INSERT INTO `sw_shipping_ports` VALUES ('32', 'Alexandria,Egypt', 'Alexandria,Egypt');
INSERT INTO `sw_shipping_ports` VALUES ('33', 'Algeciras,Spain', 'Algeciras,Spain');
INSERT INTO `sw_shipping_ports` VALUES ('34', 'Algiers,Algeria', 'Algiers,Algeria');
INSERT INTO `sw_shipping_ports` VALUES ('35', 'Aliaga,Turkey', 'Aliaga,Turkey');
INSERT INTO `sw_shipping_ports` VALUES ('36', 'Alicante,Spain', 'Alicante,Spain');
INSERT INTO `sw_shipping_ports` VALUES ('37', 'Almaty,Kazakhstan', 'Almaty,Kazakhstan');
INSERT INTO `sw_shipping_ports` VALUES ('38', 'Alotau,Papua New Guinea', 'Alotau,Papua New Guinea');
INSERT INTO `sw_shipping_ports` VALUES ('39', 'Alsancak,Turkey', 'Alsancak,Turkey');
INSERT INTO `sw_shipping_ports` VALUES ('40', 'Altamira,Mexico', 'Altamira,Mexico');
INSERT INTO `sw_shipping_ports` VALUES ('41', 'Ambarli,Turkey', 'Ambarli,Turkey');
INSERT INTO `sw_shipping_ports` VALUES ('42', 'Amman,Jordan', 'Amman,Jordan');
INSERT INTO `sw_shipping_ports` VALUES ('43', 'Amsterdam,Netherlands', 'Amsterdam,Netherlands');
INSERT INTO `sw_shipping_ports` VALUES ('44', 'An Ping,Guangdong Province', 'An Ping,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('45', 'Anacortes,Washington', 'Anacortes,Washington');
INSERT INTO `sw_shipping_ports` VALUES ('46', 'Anchorage,Alaska', 'Anchorage,Alaska');
INSERT INTO `sw_shipping_ports` VALUES ('47', 'Ancona,Italy', 'Ancona,Italy');
INSERT INTO `sw_shipping_ports` VALUES ('48', 'Anderson,South Carolina', 'Anderson,South Carolina');
INSERT INTO `sw_shipping_ports` VALUES ('49', 'Angamos,Chile', 'Angamos,Chile');
INSERT INTO `sw_shipping_ports` VALUES ('50', 'Annaba,Algeria', 'Annaba,Algeria');
INSERT INTO `sw_shipping_ports` VALUES ('51', 'Anqing,Anhui Province', 'Anqing,Anhui Province');
INSERT INTO `sw_shipping_ports` VALUES ('52', 'Anshun,Guizhou Province', 'Anshun,Guizhou Province');
INSERT INTO `sw_shipping_ports` VALUES ('53', 'Antalya,Turkey', 'Antalya,Turkey');
INSERT INTO `sw_shipping_ports` VALUES ('54', 'Antigua,Guatemala', 'Antigua,Guatemala');
INSERT INTO `sw_shipping_ports` VALUES ('55', 'Antofagasta,Chile', 'Antofagasta,Chile');
INSERT INTO `sw_shipping_ports` VALUES ('56', 'Antwerp,Belgium', 'Antwerp,Belgium');
INSERT INTO `sw_shipping_ports` VALUES ('57', 'Anzherskaya,Russia', 'Anzherskaya,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('58', 'Aotou,Guangdong Province', 'Aotou,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('59', 'Apapa,Nigeria', 'Apapa,Nigeria');
INSERT INTO `sw_shipping_ports` VALUES ('60', 'Apia,Western Samoa', 'Apia,Western Samoa');
INSERT INTO `sw_shipping_ports` VALUES ('61', 'Aqaba,Jordan', 'Aqaba,Jordan');
INSERT INTO `sw_shipping_ports` VALUES ('62', 'Aqaba Zerka Free Zone,Jordan', 'Aqaba Zerka Free Zone,Jordan');
INSERT INTO `sw_shipping_ports` VALUES ('63', 'Archangelsk,Russia', 'Archangelsk,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('64', 'Arica,Chile', 'Arica,Chile');
INSERT INTO `sw_shipping_ports` VALUES ('65', 'Arieki,Malaysia', 'Arieki,Malaysia');
INSERT INTO `sw_shipping_ports` VALUES ('66', 'Aruba,Netherlands Antilles', 'Aruba,Netherlands Antilles');
INSERT INTO `sw_shipping_ports` VALUES ('67', 'Asaluyeh,Iran', 'Asaluyeh,Iran');
INSERT INTO `sw_shipping_ports` VALUES ('68', 'Ashdod,Israel', 'Ashdod,Israel');
INSERT INTO `sw_shipping_ports` VALUES ('69', 'Ashgabat,Turkmenistan', 'Ashgabat,Turkmenistan');
INSERT INTO `sw_shipping_ports` VALUES ('70', 'Ashkelon,Israel', 'Ashkelon,Israel');
INSERT INTO `sw_shipping_ports` VALUES ('71', 'Ashkhabad,Russia', 'Ashkhabad,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('72', 'Asmara,Ethiopia', 'Asmara,Ethiopia');
INSERT INTO `sw_shipping_ports` VALUES ('73', 'Assab,Ethiopia', 'Assab,Ethiopia');
INSERT INTO `sw_shipping_ports` VALUES ('74', 'Astana,Kazakhstan', 'Astana,Kazakhstan');
INSERT INTO `sw_shipping_ports` VALUES ('75', 'Astrakhan,Russia', 'Astrakhan,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('76', 'Asuncion,Paraguay', 'Asuncion,Paraguay');
INSERT INTO `sw_shipping_ports` VALUES ('77', 'Athens,Greece', 'Athens,Greece');
INSERT INTO `sw_shipping_ports` VALUES ('78', 'Atlanta,Georgia', 'Atlanta,Georgia');
INSERT INTO `sw_shipping_ports` VALUES ('79', 'Atlixco,Mexico', 'Atlixco,Mexico');
INSERT INTO `sw_shipping_ports` VALUES ('80', 'Atyrau,Kazakhstan', 'Atyrau,Kazakhstan');
INSERT INTO `sw_shipping_ports` VALUES ('81', 'Auckland,New Zealand', 'Auckland,New Zealand');
INSERT INTO `sw_shipping_ports` VALUES ('82', 'Auxerre,France', 'Auxerre,France');
INSERT INTO `sw_shipping_ports` VALUES ('83', 'Avcilar,Turkey', 'Avcilar,Turkey');
INSERT INTO `sw_shipping_ports` VALUES ('84', 'Avignon,France', 'Avignon,France');
INSERT INTO `sw_shipping_ports` VALUES ('85', 'Azov,Russia', 'Azov,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('86', 'Baghdad,Iraq', 'Baghdad,Iraq');
INSERT INTO `sw_shipping_ports` VALUES ('87', 'Baguio,Philippines', 'Baguio,Philippines');
INSERT INTO `sw_shipping_ports` VALUES ('88', 'Bahama,Caribbean', 'Bahama,Caribbean');
INSERT INTO `sw_shipping_ports` VALUES ('89', 'Bahrain,Persian Gulf', 'Bahrain,Persian Gulf');
INSERT INTO `sw_shipping_ports` VALUES ('90', 'Baku,Azerbaijan', 'Baku,Azerbaijan');
INSERT INTO `sw_shipping_ports` VALUES ('91', 'Balboa,Panama', 'Balboa,Panama');
INSERT INTO `sw_shipping_ports` VALUES ('92', 'Balclutha,New Zealand', 'Balclutha,New Zealand');
INSERT INTO `sw_shipping_ports` VALUES ('93', 'Baltimore,Maryland', 'Baltimore,Maryland');
INSERT INTO `sw_shipping_ports` VALUES ('94', 'Bamako,Mali', 'Bamako,Mali');
INSERT INTO `sw_shipping_ports` VALUES ('95', 'Bandar Abbas,Iran', 'Bandar Abbas,Iran');
INSERT INTO `sw_shipping_ports` VALUES ('96', 'Bandar Khomeini,Iran', 'Bandar Khomeini,Iran');
INSERT INTO `sw_shipping_ports` VALUES ('97', 'Bangalore,India', 'Bangalore,India');
INSERT INTO `sw_shipping_ports` VALUES ('98', 'Bangbu,Anhui Province', 'Bangbu,Anhui Province');
INSERT INTO `sw_shipping_ports` VALUES ('99', 'Bangkok,Thailand', 'Bangkok,Thailand');
INSERT INTO `sw_shipping_ports` VALUES ('100', 'Bangkok (BMT),Thailand', 'Bangkok (BMT),Thailand');
INSERT INTO `sw_shipping_ports` VALUES ('101', 'Bangkok (PAT),Thailand', 'Bangkok (PAT),Thailand');
INSERT INTO `sw_shipping_ports` VALUES ('102', 'Bangkok (SCT),Thailand', 'Bangkok (SCT),Thailand');
INSERT INTO `sw_shipping_ports` VALUES ('103', 'Bangkok (TPT),Thailand', 'Bangkok (TPT),Thailand');
INSERT INTO `sw_shipping_ports` VALUES ('104', 'Bangkok (Unithai),Thailand', 'Bangkok (Unithai),Thailand');
INSERT INTO `sw_shipping_ports` VALUES ('105', 'Bangkok (UTCT),Thailand', 'Bangkok (UTCT),Thailand');
INSERT INTO `sw_shipping_ports` VALUES ('106', 'Bangpakong,Thailand', 'Bangpakong,Thailand');
INSERT INTO `sw_shipping_ports` VALUES ('107', 'Banjul,Gambia', 'Banjul,Gambia');
INSERT INTO `sw_shipping_ports` VALUES ('108', 'Baoan,Guangdong Province', 'Baoan,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('109', 'Baoying,Jiangsu Province', 'Baoying,Jiangsu Province');
INSERT INTO `sw_shipping_ports` VALUES ('110', 'Bar,Serbia', 'Bar,Serbia');
INSERT INTO `sw_shipping_ports` VALUES ('111', 'Barcelona,Spain', 'Barcelona,Spain');
INSERT INTO `sw_shipping_ports` VALUES ('112', 'Bari,Italy', 'Bari,Italy');
INSERT INTO `sw_shipping_ports` VALUES ('113', 'Barnaul,Russia', 'Barnaul,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('114', 'Barranquilla,Colombia', 'Barranquilla,Colombia');
INSERT INTO `sw_shipping_ports` VALUES ('115', 'Bartlett,United States', 'Bartlett,United States');
INSERT INTO `sw_shipping_ports` VALUES ('116', 'Basamuk,Papua New Guinea', 'Basamuk,Papua New Guinea');
INSERT INTO `sw_shipping_ports` VALUES ('117', 'Basel,Switzerland', 'Basel,Switzerland');
INSERT INTO `sw_shipping_ports` VALUES ('118', 'Basse-Terre,ST. Kitts', 'Basse-Terre,ST. Kitts');
INSERT INTO `sw_shipping_ports` VALUES ('119', 'Basuo,Hainan Province', 'Basuo,Hainan Province');
INSERT INTO `sw_shipping_ports` VALUES ('120', 'Bata,Equatorial Guinea', 'Bata,Equatorial Guinea');
INSERT INTO `sw_shipping_ports` VALUES ('121', 'Batam,Indonesia', 'Batam,Indonesia');
INSERT INTO `sw_shipping_ports` VALUES ('122', 'Batangas,Philippines', 'Batangas,Philippines');
INSERT INTO `sw_shipping_ports` VALUES ('123', 'Baton Rouge,Louisiana', 'Baton Rouge,Louisiana');
INSERT INTO `sw_shipping_ports` VALUES ('124', 'Batu Ampar,Indonesia', 'Batu Ampar,Indonesia');
INSERT INTO `sw_shipping_ports` VALUES ('125', 'Batumi,Georgia', 'Batumi,Georgia');
INSERT INTO `sw_shipping_ports` VALUES ('126', 'Beaumont,U.K.', 'Beaumont,U.K.');
INSERT INTO `sw_shipping_ports` VALUES ('127', 'Beicun,Guangdong Province', 'Beicun,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('128', 'Beihai,Guangxi Province', 'Beihai,Guangxi Province');
INSERT INTO `sw_shipping_ports` VALUES ('129', 'Beijiao,Guangdong Province', 'Beijiao,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('130', 'Beijing,China', 'Beijing,China');
INSERT INTO `sw_shipping_ports` VALUES ('131', 'Beira,Mozambique', 'Beira,Mozambique');
INSERT INTO `sw_shipping_ports` VALUES ('132', 'Beirut,Lebanon', 'Beirut,Lebanon');
INSERT INTO `sw_shipping_ports` VALUES ('133', 'Bejaia,Algeria', 'Bejaia,Algeria');
INSERT INTO `sw_shipping_ports` VALUES ('134', 'Belawan,Indonesia', 'Belawan,Indonesia');
INSERT INTO `sw_shipping_ports` VALUES ('135', 'Belem,Brazil', 'Belem,Brazil');
INSERT INTO `sw_shipping_ports` VALUES ('136', 'Belfast,Ireland', 'Belfast,Ireland');
INSERT INTO `sw_shipping_ports` VALUES ('137', 'Belgorad,Russia', 'Belgorad,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('138', 'Belgrade,Serbia', 'Belgrade,Serbia');
INSERT INTO `sw_shipping_ports` VALUES ('139', 'Belize,Belize', 'Belize,Belize');
INSERT INTO `sw_shipping_ports` VALUES ('140', 'Bell Bay,Australia', 'Bell Bay,Australia');
INSERT INTO `sw_shipping_ports` VALUES ('141', 'Benete Bay,Indonesia', 'Benete Bay,Indonesia');
INSERT INTO `sw_shipping_ports` VALUES ('142', 'Benghazi,Libya', 'Benghazi,Libya');
INSERT INTO `sw_shipping_ports` VALUES ('143', 'Benguela,Angola', 'Benguela,Angola');
INSERT INTO `sw_shipping_ports` VALUES ('144', 'Beograd,Serbia', 'Beograd,Serbia');
INSERT INTO `sw_shipping_ports` VALUES ('145', 'Berbera,Somalia', 'Berbera,Somalia');
INSERT INTO `sw_shipping_ports` VALUES ('146', 'Berkakit,Russia', 'Berkakit,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('147', 'Berlin,Germany', 'Berlin,Germany');
INSERT INTO `sw_shipping_ports` VALUES ('148', 'Besancon,France', 'Besancon,France');
INSERT INTO `sw_shipping_ports` VALUES ('149', 'Bielefeld,Germany', 'Bielefeld,Germany');
INSERT INTO `sw_shipping_ports` VALUES ('150', 'Bilbao,Spain', 'Bilbao,Spain');
INSERT INTO `sw_shipping_ports` VALUES ('151', 'Bingazi,Libya', 'Bingazi,Libya');
INSERT INTO `sw_shipping_ports` VALUES ('152', 'Bintulu,Malaysia', 'Bintulu,Malaysia');
INSERT INTO `sw_shipping_ports` VALUES ('153', 'Birmingham,U.K.', 'Birmingham,U.K.');
INSERT INTO `sw_shipping_ports` VALUES ('154', 'Birobidzhan,Russia', 'Birobidzhan,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('155', 'Bishkek,Kyrgyzstan', 'Bishkek,Kyrgyzstan');
INSERT INTO `sw_shipping_ports` VALUES ('156', 'Bissau,Guinea', 'Bissau,Guinea');
INSERT INTO `sw_shipping_ports` VALUES ('157', 'Biysk,Russia', 'Biysk,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('158', 'Bizerte,Tunisia', 'Bizerte,Tunisia');
INSERT INTO `sw_shipping_ports` VALUES ('159', 'Blagoveschensk,Russia', 'Blagoveschensk,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('160', 'Blantyre,Malawi', 'Blantyre,Malawi');
INSERT INTO `sw_shipping_ports` VALUES ('161', 'Blois,France', 'Blois,France');
INSERT INTO `sw_shipping_ports` VALUES ('162', 'Bluff,New Zealand', 'Bluff,New Zealand');
INSERT INTO `sw_shipping_ports` VALUES ('163', 'Bobruysk,Russia', 'Bobruysk,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('164', 'Bogota,Colombia', 'Bogota,Colombia');
INSERT INTO `sw_shipping_ports` VALUES ('165', 'Bologna (Inland Point),Italy', 'Bologna (Inland Point),Italy');
INSERT INTO `sw_shipping_ports` VALUES ('166', 'Boma,Zaire', 'Boma,Zaire');
INSERT INTO `sw_shipping_ports` VALUES ('167', 'Bombay,India', 'Bombay,India');
INSERT INTO `sw_shipping_ports` VALUES ('168', 'Bonaire,Netherlands', 'Bonaire,Netherlands');
INSERT INTO `sw_shipping_ports` VALUES ('169', 'Bonneuil Sur Marne,France', 'Bonneuil Sur Marne,France');
INSERT INTO `sw_shipping_ports` VALUES ('170', 'Bordeaux,France', 'Bordeaux,France');
INSERT INTO `sw_shipping_ports` VALUES ('171', 'Bosperus,Turkey', 'Bosperus,Turkey');
INSERT INTO `sw_shipping_ports` VALUES ('172', 'Boston,Massachusetts', 'Boston,Massachusetts');
INSERT INTO `sw_shipping_ports` VALUES ('173', 'Botswana,Africa', 'Botswana,Africa');
INSERT INTO `sw_shipping_ports` VALUES ('174', 'Bourg,France', 'Bourg,France');
INSERT INTO `sw_shipping_ports` VALUES ('175', 'Bratislava,Slovakia', 'Bratislava,Slovakia');
INSERT INTO `sw_shipping_ports` VALUES ('176', 'Bregenz,Austria', 'Bregenz,Austria');
INSERT INTO `sw_shipping_ports` VALUES ('177', 'Breinigsvolle,United States', 'Breinigsvolle,United States');
INSERT INTO `sw_shipping_ports` VALUES ('178', 'Bremen,Germany', 'Bremen,Germany');
INSERT INTO `sw_shipping_ports` VALUES ('179', 'Bremerhaven,Germany', 'Bremerhaven,Germany');
INSERT INTO `sw_shipping_ports` VALUES ('180', 'Briansk,Russia', 'Briansk,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('181', 'Bridgetown,Barbados', 'Bridgetown,Barbados');
INSERT INTO `sw_shipping_ports` VALUES ('182', 'Brisbane,Australia', 'Brisbane,Australia');
INSERT INTO `sw_shipping_ports` VALUES ('183', 'Bristol,U.K.', 'Bristol,U.K.');
INSERT INTO `sw_shipping_ports` VALUES ('184', 'Brno,Czech Republic', 'Brno,Czech Republic');
INSERT INTO `sw_shipping_ports` VALUES ('185', 'Brunei,Brunei', 'Brunei,Brunei');
INSERT INTO `sw_shipping_ports` VALUES ('186', 'Brunswick,Georgia', 'Brunswick,Georgia');
INSERT INTO `sw_shipping_ports` VALUES ('187', 'Brussels,Belgium', 'Brussels,Belgium');
INSERT INTO `sw_shipping_ports` VALUES ('188', 'Brzeg Dolny,Poland', 'Brzeg Dolny,Poland');
INSERT INTO `sw_shipping_ports` VALUES ('189', 'Brzesc,Russia', 'Brzesc,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('190', 'Bucharest,Romania', 'Bucharest,Romania');
INSERT INTO `sw_shipping_ports` VALUES ('191', 'Budapest,Hungary', 'Budapest,Hungary');
INSERT INTO `sw_shipping_ports` VALUES ('192', 'Buenaventura,Colombia', 'Buenaventura,Colombia');
INSERT INTO `sw_shipping_ports` VALUES ('193', 'Buenos Aires,Argentina', 'Buenos Aires,Argentina');
INSERT INTO `sw_shipping_ports` VALUES ('194', 'Bufalo,Honduras', 'Bufalo,Honduras');
INSERT INTO `sw_shipping_ports` VALUES ('195', 'Bugo,Philippines', 'Bugo,Philippines');
INSERT INTO `sw_shipping_ports` VALUES ('196', 'Bujumbuba,East Africa', 'Bujumbuba,East Africa');
INSERT INTO `sw_shipping_ports` VALUES ('197', 'Bukavu,East Africa', 'Bukavu,East Africa');
INSERT INTO `sw_shipping_ports` VALUES ('198', 'Bukhara,Russia', 'Bukhara,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('199', 'Bulawayo,Zimbabwe', 'Bulawayo,Zimbabwe');
INSERT INTO `sw_shipping_ports` VALUES ('200', 'Burgas,Bulgaria', 'Burgas,Bulgaria');
INSERT INTO `sw_shipping_ports` VALUES ('201', 'Burlington,New Jersey', 'Burlington,New Jersey');
INSERT INTO `sw_shipping_ports` VALUES ('202', 'Burnie,Australia', 'Burnie,Australia');
INSERT INTO `sw_shipping_ports` VALUES ('203', 'Busan,South Korea', 'Busan,South Korea');
INSERT INTO `sw_shipping_ports` VALUES ('204', 'Busan/Pui,South Korea', 'Busan/Pui,South Korea');
INSERT INTO `sw_shipping_ports` VALUES ('205', 'Bushehr,Iran', 'Bushehr,Iran');
INSERT INTO `sw_shipping_ports` VALUES ('206', 'Bushire,Iran', 'Bushire,Iran');
INSERT INTO `sw_shipping_ports` VALUES ('207', 'Bydgoszcz,Poland', 'Bydgoszcz,Poland');
INSERT INTO `sw_shipping_ports` VALUES ('208', 'Caacupemi,Paraguay', 'Caacupemi,Paraguay');
INSERT INTO `sw_shipping_ports` VALUES ('209', 'Cabedello,Brazil', 'Cabedello,Brazil');
INSERT INTO `sw_shipping_ports` VALUES ('210', 'Cabinda,Angola', 'Cabinda,Angola');
INSERT INTO `sw_shipping_ports` VALUES ('211', 'Cadiz,Spain', 'Cadiz,Spain');
INSERT INTO `sw_shipping_ports` VALUES ('212', 'Cagayan de Oro,Philippines', 'Cagayan de Oro,Philippines');
INSERT INTO `sw_shipping_ports` VALUES ('213', 'Cagliari,Italy', 'Cagliari,Italy');
INSERT INTO `sw_shipping_ports` VALUES ('214', 'Cai Mep,Vietnam', 'Cai Mep,Vietnam');
INSERT INTO `sw_shipping_ports` VALUES ('215', 'Cailan,Vietnam', 'Cailan,Vietnam');
INSERT INTO `sw_shipping_ports` VALUES ('216', 'Cairns,Queensland', 'Cairns,Queensland');
INSERT INTO `sw_shipping_ports` VALUES ('217', 'Cairo,Egypt', 'Cairo,Egypt');
INSERT INTO `sw_shipping_ports` VALUES ('218', 'Calabar,Nigeria', 'Calabar,Nigeria');
INSERT INTO `sw_shipping_ports` VALUES ('219', 'Calcutta,India', 'Calcutta,India');
INSERT INTO `sw_shipping_ports` VALUES ('220', 'Caldera,Costa Rica', 'Caldera,Costa Rica');
INSERT INTO `sw_shipping_ports` VALUES ('221', 'Calgary,Alberta', 'Calgary,Alberta');
INSERT INTO `sw_shipping_ports` VALUES ('222', 'Callao,Peru', 'Callao,Peru');
INSERT INTO `sw_shipping_ports` VALUES ('223', 'Cambodia,Vietnam', 'Cambodia,Vietnam');
INSERT INTO `sw_shipping_ports` VALUES ('224', 'Cambridge,New Zealand', 'Cambridge,New Zealand');
INSERT INTO `sw_shipping_ports` VALUES ('225', 'Camden,U.K.', 'Camden,U.K.');
INSERT INTO `sw_shipping_ports` VALUES ('226', 'Can Tho,Vietnam', 'Can Tho,Vietnam');
INSERT INTO `sw_shipping_ports` VALUES ('227', 'Canakkale,Turkey', 'Canakkale,Turkey');
INSERT INTO `sw_shipping_ports` VALUES ('228', 'Canoas,Brazil', 'Canoas,Brazil');
INSERT INTO `sw_shipping_ports` VALUES ('229', 'Cantho,Vietnam', 'Cantho,Vietnam');
INSERT INTO `sw_shipping_ports` VALUES ('230', 'Cao Fei Dian,Hebei Province', 'Cao Fei Dian,Hebei Province');
INSERT INTO `sw_shipping_ports` VALUES ('231', 'Cape Town,South Africa', 'Cape Town,South Africa');
INSERT INTO `sw_shipping_ports` VALUES ('232', 'Cape Verde,Africa', 'Cape Verde,Africa');
INSERT INTO `sw_shipping_ports` VALUES ('233', 'Caracas,Venezuela', 'Caracas,Venezuela');
INSERT INTO `sw_shipping_ports` VALUES ('234', 'Caribbean Islands,Caribbean', 'Caribbean Islands,Caribbean');
INSERT INTO `sw_shipping_ports` VALUES ('235', 'Carson,United States', 'Carson,United States');
INSERT INTO `sw_shipping_ports` VALUES ('236', 'Cartagena,Colombia', 'Cartagena,Colombia');
INSERT INTO `sw_shipping_ports` VALUES ('237', 'Cartago,Colombia', 'Cartago,Colombia');
INSERT INTO `sw_shipping_ports` VALUES ('238', 'Casablanca,Morocco', 'Casablanca,Morocco');
INSERT INTO `sw_shipping_ports` VALUES ('239', 'Castellon,Spain', 'Castellon,Spain');
INSERT INTO `sw_shipping_ports` VALUES ('240', 'Castries,ST. Lucia', 'Castries,ST. Lucia');
INSERT INTO `sw_shipping_ports` VALUES ('241', 'Catania,Italy', 'Catania,Italy');
INSERT INTO `sw_shipping_ports` VALUES ('242', 'Caucedo,Dominican Republic', 'Caucedo,Dominican Republic');
INSERT INTO `sw_shipping_ports` VALUES ('243', 'Cavaglia (Inland Point),Italy', 'Cavaglia (Inland Point),Italy');
INSERT INTO `sw_shipping_ports` VALUES ('244', 'Cayenne Fr.,Guyana', 'Cayenne Fr.,Guyana');
INSERT INTO `sw_shipping_ports` VALUES ('245', 'Cebu,Philippines', 'Cebu,Philippines');
INSERT INTO `sw_shipping_ports` VALUES ('246', 'Ceuta,Morocco', 'Ceuta,Morocco');
INSERT INTO `sw_shipping_ports` VALUES ('247', 'Chabahar,Iran', 'Chabahar,Iran');
INSERT INTO `sw_shipping_ports` VALUES ('248', 'Chalon-Sur-Marne,France', 'Chalon-Sur-Marne,France');
INSERT INTO `sw_shipping_ports` VALUES ('249', 'Chalon-Sur-Saone,France', 'Chalon-Sur-Saone,France');
INSERT INTO `sw_shipping_ports` VALUES ('250', 'Chanaral,Chile', 'Chanaral,Chile');
INSERT INTO `sw_shipping_ports` VALUES ('251', 'Changchun,Jilin Province', 'Changchun,Jilin Province');
INSERT INTO `sw_shipping_ports` VALUES ('252', 'Changle,Fujian Province', 'Changle,Fujian Province');
INSERT INTO `sw_shipping_ports` VALUES ('253', 'Changsha,Hunan Province', 'Changsha,Hunan Province');
INSERT INTO `sw_shipping_ports` VALUES ('254', 'Changshu,Jiangsu Province', 'Changshu,Jiangsu Province');
INSERT INTO `sw_shipping_ports` VALUES ('255', 'Changzhou,Jiangsu Province', 'Changzhou,Jiangsu Province');
INSERT INTO `sw_shipping_ports` VALUES ('256', 'Chaohu,Anhui Province', 'Chaohu,Anhui Province');
INSERT INTO `sw_shipping_ports` VALUES ('257', 'Chaozhou,Guangdong Province', 'Chaozhou,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('258', 'Charkov,Russia', 'Charkov,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('259', 'Charleston,South Carolina', 'Charleston,South Carolina');
INSERT INTO `sw_shipping_ports` VALUES ('260', 'Charlestown,Nevis', 'Charlestown,Nevis');
INSERT INTO `sw_shipping_ports` VALUES ('261', 'Charlotte,North Carolina', 'Charlotte,North Carolina');
INSERT INTO `sw_shipping_ports` VALUES ('262', 'Charlotte Amalie,ST. Thomas', 'Charlotte Amalie,ST. Thomas');
INSERT INTO `sw_shipping_ports` VALUES ('263', 'Chattanooga,Tennessee', 'Chattanooga,Tennessee');
INSERT INTO `sw_shipping_ports` VALUES ('264', 'Cheljabinsk,Russia', 'Cheljabinsk,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('265', 'Chen Lian Ji,Hunan Province', 'Chen Lian Ji,Hunan Province');
INSERT INTO `sw_shipping_ports` VALUES ('266', 'Chengdu,Sichuan Province', 'Chengdu,Sichuan Province');
INSERT INTO `sw_shipping_ports` VALUES ('267', 'Chenghai,Guangdong Province', 'Chenghai,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('268', 'Chenglingji,Hunan Province', 'Chenglingji,Hunan Province');
INSERT INTO `sw_shipping_ports` VALUES ('269', 'Chennai,India', 'Chennai,India');
INSERT INTO `sw_shipping_ports` VALUES ('270', 'Cherkassy,Ukraine', 'Cherkassy,Ukraine');
INSERT INTO `sw_shipping_ports` VALUES ('271', 'Chiasso,Switzerland', 'Chiasso,Switzerland');
INSERT INTO `sw_shipping_ports` VALUES ('272', 'Chiba,Japan', 'Chiba,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('273', 'Chicago,Illinois', 'Chicago,Illinois');
INSERT INTO `sw_shipping_ports` VALUES ('274', 'Chimbote,Chile', 'Chimbote,Chile');
INSERT INTO `sw_shipping_ports` VALUES ('275', 'Chimkent,Kazakhstan', 'Chimkent,Kazakhstan');
INSERT INTO `sw_shipping_ports` VALUES ('276', 'Chingyuan,Henan Province', 'Chingyuan,Henan Province');
INSERT INTO `sw_shipping_ports` VALUES ('277', 'Chistiansted,ST. Croix', 'Chistiansted,ST. Croix');
INSERT INTO `sw_shipping_ports` VALUES ('278', 'Chita,Russia', 'Chita,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('279', 'Chittagong,Bangladesh', 'Chittagong,Bangladesh');
INSERT INTO `sw_shipping_ports` VALUES ('280', 'Chiwan,Guangdong Province', 'Chiwan,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('281', 'Choloma,Honduras', 'Choloma,Honduras');
INSERT INTO `sw_shipping_ports` VALUES ('282', 'Chongqing,China', 'Chongqing,China');
INSERT INTO `sw_shipping_ports` VALUES ('283', 'Christchurch,New Zealand', 'Christchurch,New Zealand');
INSERT INTO `sw_shipping_ports` VALUES ('284', 'Christiansted,ST. Croix', 'Christiansted,ST. Croix');
INSERT INTO `sw_shipping_ports` VALUES ('285', 'Chuangsha,Jiangsu Province', 'Chuangsha,Jiangsu Province');
INSERT INTO `sw_shipping_ports` VALUES ('286', 'Chuansha,Shanghai', 'Chuansha,Shanghai');
INSERT INTO `sw_shipping_ports` VALUES ('287', 'Chuuk,Micronesia Islands', 'Chuuk,Micronesia Islands');
INSERT INTO `sw_shipping_ports` VALUES ('288', 'Chymkent,Kyrgyzstan', 'Chymkent,Kyrgyzstan');
INSERT INTO `sw_shipping_ports` VALUES ('289', 'Cincinnati,Ohio', 'Cincinnati,Ohio');
INSERT INTO `sw_shipping_ports` VALUES ('290', 'Ciudad Del Este,Paraguay', 'Ciudad Del Este,Paraguay');
INSERT INTO `sw_shipping_ports` VALUES ('291', 'Civitavecchia,Italy', 'Civitavecchia,Italy');
INSERT INTO `sw_shipping_ports` VALUES ('292', 'Clermont-Ferrand,France', 'Clermont-Ferrand,France');
INSERT INTO `sw_shipping_ports` VALUES ('293', 'Cleveland,Ohio', 'Cleveland,Ohio');
INSERT INTO `sw_shipping_ports` VALUES ('294', 'Coatzacoalcos,Mexico', 'Coatzacoalcos,Mexico');
INSERT INTO `sw_shipping_ports` VALUES ('295', 'Cochabamba,Bolivia', 'Cochabamba,Bolivia');
INSERT INTO `sw_shipping_ports` VALUES ('296', 'Cochin,India', 'Cochin,India');
INSERT INTO `sw_shipping_ports` VALUES ('297', 'Cocosolo,Panama', 'Cocosolo,Panama');
INSERT INTO `sw_shipping_ports` VALUES ('298', 'Coega-Ngqura,South Africa', 'Coega-Ngqura,South Africa');
INSERT INTO `sw_shipping_ports` VALUES ('299', 'Coimbatore,India', 'Coimbatore,India');
INSERT INTO `sw_shipping_ports` VALUES ('300', 'Cologne,Germany', 'Cologne,Germany');
INSERT INTO `sw_shipping_ports` VALUES ('301', 'Cologno Monzese (Inland Point),Italy', 'Cologno Monzese (Inland Point),Italy');
INSERT INTO `sw_shipping_ports` VALUES ('302', 'Colombo,Sri Lanka', 'Colombo,Sri Lanka');
INSERT INTO `sw_shipping_ports` VALUES ('303', 'Colon,Panama', 'Colon,Panama');
INSERT INTO `sw_shipping_ports` VALUES ('304', 'Columbus,Ohio', 'Columbus,Ohio');
INSERT INTO `sw_shipping_ports` VALUES ('305', 'Comores,India', 'Comores,India');
INSERT INTO `sw_shipping_ports` VALUES ('306', 'Conakry,Guinea', 'Conakry,Guinea');
INSERT INTO `sw_shipping_ports` VALUES ('307', 'Conception Bay,Chile', 'Conception Bay,Chile');
INSERT INTO `sw_shipping_ports` VALUES ('308', 'Connellsville,United States', 'Connellsville,United States');
INSERT INTO `sw_shipping_ports` VALUES ('309', 'Constanza,Romania', 'Constanza,Romania');
INSERT INTO `sw_shipping_ports` VALUES ('310', 'Copenhagen,Denmark', 'Copenhagen,Denmark');
INSERT INTO `sw_shipping_ports` VALUES ('311', 'Coquimbo,Chile', 'Coquimbo,Chile');
INSERT INTO `sw_shipping_ports` VALUES ('312', 'Cordoba,Argentina', 'Cordoba,Argentina');
INSERT INTO `sw_shipping_ports` VALUES ('313', 'Corinto,Nicaragua', 'Corinto,Nicaragua');
INSERT INTO `sw_shipping_ports` VALUES ('314', 'Cork,Ireland', 'Cork,Ireland');
INSERT INTO `sw_shipping_ports` VALUES ('315', 'Coronel,Chile', 'Coronel,Chile');
INSERT INTO `sw_shipping_ports` VALUES ('316', 'Corpus Christi,United States', 'Corpus Christi,United States');
INSERT INTO `sw_shipping_ports` VALUES ('317', 'Corsicana,Texas', 'Corsicana,Texas');
INSERT INTO `sw_shipping_ports` VALUES ('318', 'Cotabato,Philippines', 'Cotabato,Philippines');
INSERT INTO `sw_shipping_ports` VALUES ('319', 'Cotonou,Benin', 'Cotonou,Benin');
INSERT INTO `sw_shipping_ports` VALUES ('320', 'Cremona (Inland Point),Italy', 'Cremona (Inland Point),Italy');
INSERT INTO `sw_shipping_ports` VALUES ('321', 'Cristobal,Panama', 'Cristobal,Panama');
INSERT INTO `sw_shipping_ports` VALUES ('322', 'Cuemavaca,Mexico', 'Cuemavaca,Mexico');
INSERT INTO `sw_shipping_ports` VALUES ('323', 'Cuenca,Spain', 'Cuenca,Spain');
INSERT INTO `sw_shipping_ports` VALUES ('324', 'Curacao,Curacao', 'Curacao,Curacao');
INSERT INTO `sw_shipping_ports` VALUES ('325', 'Curitiba,Brazil', 'Curitiba,Brazil');
INSERT INTO `sw_shipping_ports` VALUES ('326', 'Czestochowa,Poland', 'Czestochowa,Poland');
INSERT INTO `sw_shipping_ports` VALUES ('327', 'Da Chan Bay,Guangdong Province', 'Da Chan Bay,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('328', 'Dachen,Zhejiang Province', 'Dachen,Zhejiang Province');
INSERT INTO `sw_shipping_ports` VALUES ('329', 'Daesan,South Korea', 'Daesan,South Korea');
INSERT INTO `sw_shipping_ports` VALUES ('330', 'Dafeng,Jiangsu Province', 'Dafeng,Jiangsu Province');
INSERT INTO `sw_shipping_ports` VALUES ('331', 'Daganwei (Guangzhou),Guangdong Province', 'Daganwei (Guangzhou),Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('332', 'Dakar,Senegal', 'Dakar,Senegal');
INSERT INTO `sw_shipping_ports` VALUES ('333', 'Dalian,Liaoning Province', 'Dalian,Liaoning Province');
INSERT INTO `sw_shipping_ports` VALUES ('334', 'Dallas,Texas', 'Dallas,Texas');
INSERT INTO `sw_shipping_ports` VALUES ('335', 'Dalta Port,Egypt', 'Dalta Port,Egypt');
INSERT INTO `sw_shipping_ports` VALUES ('336', 'Damietta,Egypt', 'Damietta,Egypt');
INSERT INTO `sw_shipping_ports` VALUES ('337', 'Dammam,Saudi Arabia', 'Dammam,Saudi Arabia');
INSERT INTO `sw_shipping_ports` VALUES ('338', 'Dampier,Australia', 'Dampier,Australia');
INSERT INTO `sw_shipping_ports` VALUES ('339', 'Danang,Vietnam', 'Danang,Vietnam');
INSERT INTO `sw_shipping_ports` VALUES ('340', 'Dandong,Liaoning Province', 'Dandong,Liaoning Province');
INSERT INTO `sw_shipping_ports` VALUES ('341', 'Dapeng,Guangdong Province', 'Dapeng,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('342', 'Dar es Salaam,Tanzania', 'Dar es Salaam,Tanzania');
INSERT INTO `sw_shipping_ports` VALUES ('343', 'Darkhan,Mongolia', 'Darkhan,Mongolia');
INSERT INTO `sw_shipping_ports` VALUES ('344', 'Darwin,Australia', 'Darwin,Australia');
INSERT INTO `sw_shipping_ports` VALUES ('345', 'Datian,Fujian Province', 'Datian,Fujian Province');
INSERT INTO `sw_shipping_ports` VALUES ('346', 'Datong,Guangdong Province', 'Datong,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('347', 'Davao,Philippines', 'Davao,Philippines');
INSERT INTO `sw_shipping_ports` VALUES ('348', 'Dayabay,Guangdong Province', 'Dayabay,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('349', 'Dekheila,Egypt', 'Dekheila,Egypt');
INSERT INTO `sw_shipping_ports` VALUES ('350', 'Delhi,India', 'Delhi,India');
INSERT INTO `sw_shipping_ports` VALUES ('351', 'Denver,Colorado', 'Denver,Colorado');
INSERT INTO `sw_shipping_ports` VALUES ('352', 'Derince,Turkey', 'Derince,Turkey');
INSERT INTO `sw_shipping_ports` VALUES ('353', 'Derna,Libya', 'Derna,Libya');
INSERT INTO `sw_shipping_ports` VALUES ('354', 'Destrehan,United States', 'Destrehan,United States');
INSERT INTO `sw_shipping_ports` VALUES ('355', 'Detroit,Michigan', 'Detroit,Michigan');
INSERT INTO `sw_shipping_ports` VALUES ('356', 'Dhaka,Bangladesh', 'Dhaka,Bangladesh');
INSERT INTO `sw_shipping_ports` VALUES ('357', 'Diego Suarez,Madagascar', 'Diego Suarez,Madagascar');
INSERT INTO `sw_shipping_ports` VALUES ('358', 'Dijon,France', 'Dijon,France');
INSERT INTO `sw_shipping_ports` VALUES ('359', 'Dili,Timor', 'Dili,Timor');
INSERT INTO `sw_shipping_ports` VALUES ('360', 'Djen Djen,Algeria', 'Djen Djen,Algeria');
INSERT INTO `sw_shipping_ports` VALUES ('361', 'Djibouti,East Africa', 'Djibouti,East Africa');
INSERT INTO `sw_shipping_ports` VALUES ('362', 'Dnepropetrovsk,Russia', 'Dnepropetrovsk,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('363', 'Do Ma Tou,Guangdong Province', 'Do Ma Tou,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('364', 'Doha,Qatar', 'Doha,Qatar');
INSERT INTO `sw_shipping_ports` VALUES ('365', 'Dole,France', 'Dole,France');
INSERT INTO `sw_shipping_ports` VALUES ('366', 'Dominican,Dominican Republic', 'Dominican,Dominican Republic');
INSERT INTO `sw_shipping_ports` VALUES ('367', 'Donetsk,Ukraine', 'Donetsk,Ukraine');
INSERT INTO `sw_shipping_ports` VALUES ('368', 'Dongguan,Guangdong Province', 'Dongguan,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('369', 'Dongjiangcang,Guangdong Province', 'Dongjiangcang,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('370', 'Dongjiankou,Guangdong Province', 'Dongjiankou,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('371', 'Dongshan,Fujian Province', 'Dongshan,Fujian Province');
INSERT INTO `sw_shipping_ports` VALUES ('372', 'Dortmund,Germany', 'Dortmund,Germany');
INSERT INTO `sw_shipping_ports` VALUES ('373', 'Douala,Cameroon', 'Douala,Cameroon');
INSERT INTO `sw_shipping_ports` VALUES ('374', 'Doumen,Guangdong Province', 'Doumen,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('375', 'Dresden,Germany', 'Dresden,Germany');
INSERT INTO `sw_shipping_ports` VALUES ('376', 'Druzba,Kazakhstan', 'Druzba,Kazakhstan');
INSERT INTO `sw_shipping_ports` VALUES ('377', 'Dubai,United Arab Emirates', 'Dubai,United Arab Emirates');
INSERT INTO `sw_shipping_ports` VALUES ('378', 'Dublin,Ireland', 'Dublin,Ireland');
INSERT INTO `sw_shipping_ports` VALUES ('379', 'Duesseldorf,Germany', 'Duesseldorf,Germany');
INSERT INTO `sw_shipping_ports` VALUES ('380', 'Duisburg,Germany', 'Duisburg,Germany');
INSERT INTO `sw_shipping_ports` VALUES ('381', 'Dumyat,Egypt', 'Dumyat,Egypt');
INSERT INTO `sw_shipping_ports` VALUES ('382', 'Dunedin,New Zealand', 'Dunedin,New Zealand');
INSERT INTO `sw_shipping_ports` VALUES ('383', 'Dunkerque,France', 'Dunkerque,France');
INSERT INTO `sw_shipping_ports` VALUES ('384', 'Dunkirk,France', 'Dunkirk,France');
INSERT INTO `sw_shipping_ports` VALUES ('385', 'Durban,South Africa', 'Durban,South Africa');
INSERT INTO `sw_shipping_ports` VALUES ('386', 'Durres,Albania', 'Durres,Albania');
INSERT INTO `sw_shipping_ports` VALUES ('387', 'Dushanbe,Tajikistan', 'Dushanbe,Tajikistan');
INSERT INTO `sw_shipping_ports` VALUES ('388', 'Dusseldorf,Germany', 'Dusseldorf,Germany');
INSERT INTO `sw_shipping_ports` VALUES ('389', 'Dutch Harbor,United States', 'Dutch Harbor,United States');
INSERT INTO `sw_shipping_ports` VALUES ('390', 'Dzaoudzi,Mayotte', 'Dzaoudzi,Mayotte');
INSERT INTO `sw_shipping_ports` VALUES ('391', 'Dzhezkazgan,Kazakhstan', 'Dzhezkazgan,Kazakhstan');
INSERT INTO `sw_shipping_ports` VALUES ('392', 'East Canada,Canada', 'East Canada,Canada');
INSERT INTO `sw_shipping_ports` VALUES ('393', 'East London,South Africa', 'East London,South Africa');
INSERT INTO `sw_shipping_ports` VALUES ('394', 'Ebeye,Marina Islands', 'Ebeye,Marina Islands');
INSERT INTO `sw_shipping_ports` VALUES ('395', 'Edincik,Turkey', 'Edincik,Turkey');
INSERT INTO `sw_shipping_ports` VALUES ('396', 'Edison,New Jersey', 'Edison,New Jersey');
INSERT INTO `sw_shipping_ports` VALUES ('397', 'Edmonton,Canada', 'Edmonton,Canada');
INSERT INTO `sw_shipping_ports` VALUES ('398', 'Ehoala,Madagascar', 'Ehoala,Madagascar');
INSERT INTO `sw_shipping_ports` VALUES ('399', 'Eilat,Israel', 'Eilat,Israel');
INSERT INTO `sw_shipping_ports` VALUES ('400', 'Ekaterinburg,Russia', 'Ekaterinburg,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('401', 'El Dekhelia,Egypt', 'El Dekhelia,Egypt');
INSERT INTO `sw_shipping_ports` VALUES ('402', 'El Guamache,Venezuela', 'El Guamache,Venezuela');
INSERT INTO `sw_shipping_ports` VALUES ('403', 'El Paso,Honduras', 'El Paso,Honduras');
INSERT INTO `sw_shipping_ports` VALUES ('404', 'El Progreso,Honduras', 'El Progreso,Honduras');
INSERT INTO `sw_shipping_ports` VALUES ('405', 'El Salvador,Republic of El Salvador', 'El Salvador,Republic of El Salvador');
INSERT INTO `sw_shipping_ports` VALUES ('406', 'El-Dekheila,Egypt', 'El-Dekheila,Egypt');
INSERT INTO `sw_shipping_ports` VALUES ('407', 'Embakasi,Kenya', 'Embakasi,Kenya');
INSERT INTO `sw_shipping_ports` VALUES ('408', 'Encarnacion,Mexico', 'Encarnacion,Mexico');
INSERT INTO `sw_shipping_ports` VALUES ('409', 'Enping,Guangdong Province', 'Enping,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('410', 'Ensenada,Mexico', 'Ensenada,Mexico');
INSERT INTO `sw_shipping_ports` VALUES ('411', 'Enzeli,Iran', 'Enzeli,Iran');
INSERT INTO `sw_shipping_ports` VALUES ('412', 'Erdenet,Mongolia', 'Erdenet,Mongolia');
INSERT INTO `sw_shipping_ports` VALUES ('413', 'Eren,Inner Mongolia', 'Eren,Inner Mongolia');
INSERT INTO `sw_shipping_ports` VALUES ('414', 'Erlian,Inner Mongolia', 'Erlian,Inner Mongolia');
INSERT INTO `sw_shipping_ports` VALUES ('415', 'Esmeraldas,Ecuador', 'Esmeraldas,Ecuador');
INSERT INTO `sw_shipping_ports` VALUES ('416', 'Esperance,Australia', 'Esperance,Australia');
INSERT INTO `sw_shipping_ports` VALUES ('417', 'Essen,Germany', 'Essen,Germany');
INSERT INTO `sw_shipping_ports` VALUES ('418', 'Estonia,Russia', 'Estonia,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('419', 'Everett,Washington', 'Everett,Washington');
INSERT INTO `sw_shipping_ports` VALUES ('420', 'Evyap Port,Turkey', 'Evyap Port,Turkey');
INSERT INTO `sw_shipping_ports` VALUES ('421', 'Exuma,Bahamas', 'Exuma,Bahamas');
INSERT INTO `sw_shipping_ports` VALUES ('422', 'Famagusta,Cyprus', 'Famagusta,Cyprus');
INSERT INTO `sw_shipping_ports` VALUES ('423', 'Fangcheng,Guangxi Province', 'Fangcheng,Guangxi Province');
INSERT INTO `sw_shipping_ports` VALUES ('424', 'Fangcun,Guangdong Province', 'Fangcun,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('425', 'Felixstowe,U.K.', 'Felixstowe,U.K.');
INSERT INTO `sw_shipping_ports` VALUES ('426', 'Fenghua,Zhejiang Province', 'Fenghua,Zhejiang Province');
INSERT INTO `sw_shipping_ports` VALUES ('427', 'Fenghuojiao (Tai Shan),Guangdong Province', 'Fenghuojiao (Tai Shan),Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('428', 'Fengxian,Jiangsu Province', 'Fengxian,Jiangsu Province');
INSERT INTO `sw_shipping_ports` VALUES ('429', 'Fergana,Russia', 'Fergana,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('430', 'Fernandina Beach,Florida', 'Fernandina Beach,Florida');
INSERT INTO `sw_shipping_ports` VALUES ('431', 'Florence,Italy', 'Florence,Italy');
INSERT INTO `sw_shipping_ports` VALUES ('432', 'Floroe,Norway', 'Floroe,Norway');
INSERT INTO `sw_shipping_ports` VALUES ('433', 'Flushing,Netherlands', 'Flushing,Netherlands');
INSERT INTO `sw_shipping_ports` VALUES ('434', 'Fontana,California', 'Fontana,California');
INSERT INTO `sw_shipping_ports` VALUES ('435', 'Fort de France,Martinique', 'Fort de France,Martinique');
INSERT INTO `sw_shipping_ports` VALUES ('436', 'Fortaleza,Brazil', 'Fortaleza,Brazil');
INSERT INTO `sw_shipping_ports` VALUES ('437', 'Fos Sur Mer,France', 'Fos Sur Mer,France');
INSERT INTO `sw_shipping_ports` VALUES ('438', 'Foshan,Guangdong Province', 'Foshan,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('439', 'Frankfurt,Germany', 'Frankfurt,Germany');
INSERT INTO `sw_shipping_ports` VALUES ('440', 'Fredericia,Denmark', 'Fredericia,Denmark');
INSERT INTO `sw_shipping_ports` VALUES ('441', 'Freeport,Bahamas', 'Freeport,Bahamas');
INSERT INTO `sw_shipping_ports` VALUES ('442', 'Freetown,Sierra Leone', 'Freetown,Sierra Leone');
INSERT INTO `sw_shipping_ports` VALUES ('443', 'Fremantle,Western Australia', 'Fremantle,Western Australia');
INSERT INTO `sw_shipping_ports` VALUES ('444', 'Fremont,California', 'Fremont,California');
INSERT INTO `sw_shipping_ports` VALUES ('445', 'Frontroyal,Virginia', 'Frontroyal,Virginia');
INSERT INTO `sw_shipping_ports` VALUES ('446', 'Frunze,Russia', 'Frunze,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('447', 'Fujairah,United Arab Emirates', 'Fujairah,United Arab Emirates');
INSERT INTO `sw_shipping_ports` VALUES ('448', 'Fukuoka,Japan', 'Fukuoka,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('449', 'Fukuyama,Japan', 'Fukuyama,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('450', 'Funafuti,Tuvalu', 'Funafuti,Tuvalu');
INSERT INTO `sw_shipping_ports` VALUES ('451', 'Fuqing,Fujian Province', 'Fuqing,Fujian Province');
INSERT INTO `sw_shipping_ports` VALUES ('452', 'Fuzhou,Fujian Province', 'Fuzhou,Fujian Province');
INSERT INTO `sw_shipping_ports` VALUES ('453', 'Gaborone,Botswana', 'Gaborone,Botswana');
INSERT INTO `sw_shipping_ports` VALUES ('454', 'Galveston,Texas', 'Galveston,Texas');
INSERT INTO `sw_shipping_ports` VALUES ('455', 'Gamagori,Japan', 'Gamagori,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('456', 'Gaolan (Zhuhai),Guangdong Province', 'Gaolan (Zhuhai),Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('457', 'Gaoming,Guangdong Province', 'Gaoming,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('458', 'Gaosha,Guangdong Province', 'Gaosha,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('459', 'Gaoyao,Guangdong Province', 'Gaoyao,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('460', 'Gaoyou,Jiangsu Province', 'Gaoyou,Jiangsu Province');
INSERT INTO `sw_shipping_ports` VALUES ('461', 'Gatemala City,Guatemala', 'Gatemala City,Guatemala');
INSERT INTO `sw_shipping_ports` VALUES ('462', 'Gatun,Panama', 'Gatun,Panama');
INSERT INTO `sw_shipping_ports` VALUES ('463', 'Gdansk,Poland', 'Gdansk,Poland');
INSERT INTO `sw_shipping_ports` VALUES ('464', 'Gdynia,Poland', 'Gdynia,Poland');
INSERT INTO `sw_shipping_ports` VALUES ('465', 'Gebze,Turkey', 'Gebze,Turkey');
INSERT INTO `sw_shipping_ports` VALUES ('466', 'Geelong,Australia', 'Geelong,Australia');
INSERT INTO `sw_shipping_ports` VALUES ('467', 'Gemlik,Turkey', 'Gemlik,Turkey');
INSERT INTO `sw_shipping_ports` VALUES ('468', 'General Santos City,Philippines', 'General Santos City,Philippines');
INSERT INTO `sw_shipping_ports` VALUES ('469', 'Geneve,Switzerland', 'Geneve,Switzerland');
INSERT INTO `sw_shipping_ports` VALUES ('470', 'Gennevilliers,France', 'Gennevilliers,France');
INSERT INTO `sw_shipping_ports` VALUES ('471', 'Genoa (Genova),Italy', 'Genoa (Genova),Italy');
INSERT INTO `sw_shipping_ports` VALUES ('472', 'Geoje,South Korea', 'Geoje,South Korea');
INSERT INTO `sw_shipping_ports` VALUES ('473', 'George Town,Guyana', 'George Town,Guyana');
INSERT INTO `sw_shipping_ports` VALUES ('474', 'Geraldton,Australia', 'Geraldton,Australia');
INSERT INTO `sw_shipping_ports` VALUES ('475', 'Ghazaouete,Algeria', 'Ghazaouete,Algeria');
INSERT INTO `sw_shipping_ports` VALUES ('476', 'Ghent,Belgium', 'Ghent,Belgium');
INSERT INTO `sw_shipping_ports` VALUES ('477', 'Gibraltar,Spain', 'Gibraltar,Spain');
INSERT INTO `sw_shipping_ports` VALUES ('478', 'Gijon,Spain', 'Gijon,Spain');
INSERT INTO `sw_shipping_ports` VALUES ('479', 'Gioia Tauro,Italy', 'Gioia Tauro,Italy');
INSERT INTO `sw_shipping_ports` VALUES ('480', 'Girdwood,Alaska', 'Girdwood,Alaska');
INSERT INTO `sw_shipping_ports` VALUES ('481', 'Gladstone,Australia', 'Gladstone,Australia');
INSERT INTO `sw_shipping_ports` VALUES ('482', 'Glasgow,Scotland', 'Glasgow,Scotland');
INSERT INTO `sw_shipping_ports` VALUES ('483', 'Gliwice,Poland', 'Gliwice,Poland');
INSERT INTO `sw_shipping_ports` VALUES ('484', 'Gomel,Russia', 'Gomel,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('485', 'Gongyi,Henan Province', 'Gongyi,Henan Province');
INSERT INTO `sw_shipping_ports` VALUES ('486', 'Gothenburg,Sweden', 'Gothenburg,Sweden');
INSERT INTO `sw_shipping_ports` VALUES ('487', 'Grand Rapids,United States', 'Grand Rapids,United States');
INSERT INTO `sw_shipping_ports` VALUES ('488', 'Grand Turk,Caribbean', 'Grand Turk,Caribbean');
INSERT INTO `sw_shipping_ports` VALUES ('489', 'Grangemouth,U.K.', 'Grangemouth,U.K.');
INSERT INTO `sw_shipping_ports` VALUES ('490', 'Grays,U.K.', 'Grays,U.K.');
INSERT INTO `sw_shipping_ports` VALUES ('491', 'Graz,Austria', 'Graz,Austria');
INSERT INTO `sw_shipping_ports` VALUES ('492', 'Greensboro,North Carolina', 'Greensboro,North Carolina');
INSERT INTO `sw_shipping_ports` VALUES ('493', 'Guadalajara,Mexico', 'Guadalajara,Mexico');
INSERT INTO `sw_shipping_ports` VALUES ('494', 'Guam,Mariana Islands', 'Guam,Mariana Islands');
INSERT INTO `sw_shipping_ports` VALUES ('495', 'Guang Bao Tong,Guangdong Province', 'Guang Bao Tong,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('496', 'Guangzhou,Guangdong Province', 'Guangzhou,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('497', 'Guanta,Venezuela', 'Guanta,Venezuela');
INSERT INTO `sw_shipping_ports` VALUES ('498', 'Guarulhos,Brazil', 'Guarulhos,Brazil');
INSERT INTO `sw_shipping_ports` VALUES ('499', 'Guatemala City,Guatemala', 'Guatemala City,Guatemala');
INSERT INTO `sw_shipping_ports` VALUES ('500', 'Guayaquil,Ecuador', 'Guayaquil,Ecuador');
INSERT INTO `sw_shipping_ports` VALUES ('501', 'Guaymas,Mexico', 'Guaymas,Mexico');
INSERT INTO `sw_shipping_ports` VALUES ('502', 'Guigang,Guangxi Province', 'Guigang,Guangxi Province');
INSERT INTO `sw_shipping_ports` VALUES ('503', 'Guilin,Guangxi Province', 'Guilin,Guangxi Province');
INSERT INTO `sw_shipping_ports` VALUES ('504', 'Guinea-Bissau,Western Africa', 'Guinea-Bissau,Western Africa');
INSERT INTO `sw_shipping_ports` VALUES ('505', 'Guiyang,Guizhou Province', 'Guiyang,Guizhou Province');
INSERT INTO `sw_shipping_ports` VALUES ('506', 'Guizhou,Guangdong Province', 'Guizhou,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('507', 'Gustavia,ST. Barths', 'Gustavia,ST. Barths');
INSERT INTO `sw_shipping_ports` VALUES ('508', 'Gwangyang,South Korea', 'Gwangyang,South Korea');
INSERT INTO `sw_shipping_ports` VALUES ('509', 'Hachinohe,Japan', 'Hachinohe,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('510', 'Hagen,Germany', 'Hagen,Germany');
INSERT INTO `sw_shipping_ports` VALUES ('511', 'Haian,Hainan Province', 'Haian,Hainan Province');
INSERT INTO `sw_shipping_ports` VALUES ('512', 'Haifa,Israel', 'Haifa,Israel');
INSERT INTO `sw_shipping_ports` VALUES ('513', 'Haifeng,Guangdong Province', 'Haifeng,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('514', 'Haikou,Hainan Province', 'Haikou,Hainan Province');
INSERT INTO `sw_shipping_ports` VALUES ('515', 'Haimen,Zhejiang Province', 'Haimen,Zhejiang Province');
INSERT INTO `sw_shipping_ports` VALUES ('516', 'Hainan,Fujian Province', 'Hainan,Fujian Province');
INSERT INTO `sw_shipping_ports` VALUES ('517', 'Haining,Zhejiang Province', 'Haining,Zhejiang Province');
INSERT INTO `sw_shipping_ports` VALUES ('518', 'Haiphong,Vietnam', 'Haiphong,Vietnam');
INSERT INTO `sw_shipping_ports` VALUES ('519', 'Hairaton,Afghanistan', 'Hairaton,Afghanistan');
INSERT INTO `sw_shipping_ports` VALUES ('520', 'Hairun,Fujian Province', 'Hairun,Fujian Province');
INSERT INTO `sw_shipping_ports` VALUES ('521', 'Haiti,Caribbean', 'Haiti,Caribbean');
INSERT INTO `sw_shipping_ports` VALUES ('522', 'Haitian,Fujian Province', 'Haitian,Fujian Province');
INSERT INTO `sw_shipping_ports` VALUES ('523', 'Hakata,Japan', 'Hakata,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('524', 'Hakodate,Japan', 'Hakodate,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('525', 'Haldia,India', 'Haldia,India');
INSERT INTO `sw_shipping_ports` VALUES ('526', 'Halifax,Nova Scotia', 'Halifax,Nova Scotia');
INSERT INTO `sw_shipping_ports` VALUES ('527', 'Hamad Port,Qatar', 'Hamad Port,Qatar');
INSERT INTO `sw_shipping_ports` VALUES ('528', 'Hamada,Japan', 'Hamada,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('529', 'Hamburg,Germany', 'Hamburg,Germany');
INSERT INTO `sw_shipping_ports` VALUES ('530', 'Hamilton,New Zealand', 'Hamilton,New Zealand');
INSERT INTO `sw_shipping_ports` VALUES ('531', 'Hamina,Finland', 'Hamina,Finland');
INSERT INTO `sw_shipping_ports` VALUES ('532', 'Hangzhou,Zhejiang Province', 'Hangzhou,Zhejiang Province');
INSERT INTO `sw_shipping_ports` VALUES ('533', 'Hanjiang,Fujian Province', 'Hanjiang,Fujian Province');
INSERT INTO `sw_shipping_ports` VALUES ('534', 'Hankou,Hubei Province', 'Hankou,Hubei Province');
INSERT INTO `sw_shipping_ports` VALUES ('535', 'Hannover,Germany', 'Hannover,Germany');
INSERT INTO `sw_shipping_ports` VALUES ('536', 'Hanoi,Vietnam', 'Hanoi,Vietnam');
INSERT INTO `sw_shipping_ports` VALUES ('537', 'Harare,Zimbabwe', 'Harare,Zimbabwe');
INSERT INTO `sw_shipping_ports` VALUES ('538', 'Harbin,Heilongjiang Province', 'Harbin,Heilongjiang Province');
INSERT INTO `sw_shipping_ports` VALUES ('539', 'Hartford,Michigan', 'Hartford,Michigan');
INSERT INTO `sw_shipping_ports` VALUES ('540', 'Havana,Cuba', 'Havana,Cuba');
INSERT INTO `sw_shipping_ports` VALUES ('541', 'Haydarpasa,Turkey', 'Haydarpasa,Turkey');
INSERT INTO `sw_shipping_ports` VALUES ('542', 'Hazira,India', 'Hazira,India');
INSERT INTO `sw_shipping_ports` VALUES ('543', 'Hebron,Ohio', 'Hebron,Ohio');
INSERT INTO `sw_shipping_ports` VALUES ('544', 'Hefei,Anhui Province', 'Hefei,Anhui Province');
INSERT INTO `sw_shipping_ports` VALUES ('545', 'Hehou (Xin Hui),Guangdong Province', 'Hehou (Xin Hui),Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('546', 'Helsingborg,Sweden', 'Helsingborg,Sweden');
INSERT INTO `sw_shipping_ports` VALUES ('547', 'Helsinki,Finland', 'Helsinki,Finland');
INSERT INTO `sw_shipping_ports` VALUES ('548', 'Hengyang,Hunan Province', 'Hengyang,Hunan Province');
INSERT INTO `sw_shipping_ports` VALUES ('549', 'Herakleion,Greece', 'Herakleion,Greece');
INSERT INTO `sw_shipping_ports` VALUES ('550', 'Heshan,Guangdong Province', 'Heshan,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('551', 'Hialeah,United States', 'Hialeah,United States');
INSERT INTO `sw_shipping_ports` VALUES ('552', 'Hibiki,Japan', 'Hibiki,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('553', 'Hibikinada,Japan', 'Hibikinada,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('554', 'Higashiharima,Japan', 'Higashiharima,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('555', 'Hilo,Hawaii', 'Hilo,Hawaii');
INSERT INTO `sw_shipping_ports` VALUES ('556', 'Himeji,Japan', 'Himeji,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('557', 'Hiroshima,Japan', 'Hiroshima,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('558', 'Hitachi,Japan', 'Hitachi,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('559', 'Hitachinaka,Japan', 'Hitachinaka,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('560', 'Ho Chi Minh (Catlai),Vietnam', 'Ho Chi Minh (Catlai),Vietnam');
INSERT INTO `sw_shipping_ports` VALUES ('561', 'Ho Chi Minh (Newport),Vietnam', 'Ho Chi Minh (Newport),Vietnam');
INSERT INTO `sw_shipping_ports` VALUES ('562', 'Ho Chi Minh City,Vietnam', 'Ho Chi Minh City,Vietnam');
INSERT INTO `sw_shipping_ports` VALUES ('563', 'Hobart,Australia', 'Hobart,Australia');
INSERT INTO `sw_shipping_ports` VALUES ('564', 'Hodeidah,Yemen', 'Hodeidah,Yemen');
INSERT INTO `sw_shipping_ports` VALUES ('565', 'Hohhot,Inner Mongolia', 'Hohhot,Inner Mongolia');
INSERT INTO `sw_shipping_ports` VALUES ('566', 'Hon Gai,Vietnam', 'Hon Gai,Vietnam');
INSERT INTO `sw_shipping_ports` VALUES ('567', 'Hong Kong,Hong Kong', 'Hong Kong,Hong Kong');
INSERT INTO `sw_shipping_ports` VALUES ('568', 'Hongkou,Jiangsu Province', 'Hongkou,Jiangsu Province');
INSERT INTO `sw_shipping_ports` VALUES ('569', 'Honiara,Solomon Islands', 'Honiara,Solomon Islands');
INSERT INTO `sw_shipping_ports` VALUES ('570', 'Honolulu,Hawaii', 'Honolulu,Hawaii');
INSERT INTO `sw_shipping_ports` VALUES ('571', 'Hososhima,Japan', 'Hososhima,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('572', 'Houston,Texas', 'Houston,Texas');
INSERT INTO `sw_shipping_ports` VALUES ('573', 'Hua Sai,Vietnam', 'Hua Sai,Vietnam');
INSERT INTO `sw_shipping_ports` VALUES ('574', 'Huadu,Guangdong Province', 'Huadu,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('575', 'Huainan,Anhui Province', 'Huainan,Anhui Province');
INSERT INTO `sw_shipping_ports` VALUES ('576', 'Huang Dao,South Korea', 'Huang Dao,South Korea');
INSERT INTO `sw_shipping_ports` VALUES ('577', 'Huang Shi,Hubei Province', 'Huang Shi,Hubei Province');
INSERT INTO `sw_shipping_ports` VALUES ('578', 'Huanghua,Hebei Province', 'Huanghua,Hebei Province');
INSERT INTO `sw_shipping_ports` VALUES ('579', 'Huangpu,Guangdong Province', 'Huangpu,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('580', 'Huangqi,Fujian Province', 'Huangqi,Fujian Province');
INSERT INTO `sw_shipping_ports` VALUES ('581', 'Huangshan,Anhui Province', 'Huangshan,Anhui Province');
INSERT INTO `sw_shipping_ports` VALUES ('582', 'Huizhou,Guangdong Province', 'Huizhou,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('583', 'Hull,U.K.', 'Hull,U.K.');
INSERT INTO `sw_shipping_ports` VALUES ('584', 'Humen,Guangdong Province', 'Humen,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('585', 'Huntington,United States', 'Huntington,United States');
INSERT INTO `sw_shipping_ports` VALUES ('586', 'Huntsville,United States', 'Huntsville,United States');
INSERT INTO `sw_shipping_ports` VALUES ('587', 'Hyderabad,India', 'Hyderabad,India');
INSERT INTO `sw_shipping_ports` VALUES ('588', 'Hyogo,Japan', 'Hyogo,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('589', 'Ijmuiden,Netherlands', 'Ijmuiden,Netherlands');
INSERT INTO `sw_shipping_ports` VALUES ('590', 'Iligan,Philippines', 'Iligan,Philippines');
INSERT INTO `sw_shipping_ports` VALUES ('591', 'Illichivsk,Ukraine', 'Illichivsk,Ukraine');
INSERT INTO `sw_shipping_ports` VALUES ('592', 'Ilo,Peru', 'Ilo,Peru');
INSERT INTO `sw_shipping_ports` VALUES ('593', 'Ilyichevsk,Ukraine', 'Ilyichevsk,Ukraine');
INSERT INTO `sw_shipping_ports` VALUES ('594', 'Imabari,Japan', 'Imabari,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('595', 'Imari,Japan', 'Imari,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('596', 'Imbituba,Brazil', 'Imbituba,Brazil');
INSERT INTO `sw_shipping_ports` VALUES ('597', 'Immingham,U.K.', 'Immingham,U.K.');
INSERT INTO `sw_shipping_ports` VALUES ('598', 'Inchon,South Korea', 'Inchon,South Korea');
INSERT INTO `sw_shipping_ports` VALUES ('599', 'Indianapolis,Indiana', 'Indianapolis,Indiana');
INSERT INTO `sw_shipping_ports` VALUES ('600', 'Innsbruck,Austria', 'Innsbruck,Austria');
INSERT INTO `sw_shipping_ports` VALUES ('601', 'Innxv,India', 'Innxv,India');
INSERT INTO `sw_shipping_ports` VALUES ('602', 'Invercargill,New Zealand', 'Invercargill,New Zealand');
INSERT INTO `sw_shipping_ports` VALUES ('603', 'Invergordon,Scotland', 'Invergordon,Scotland');
INSERT INTO `sw_shipping_ports` VALUES ('604', 'Ipoh,Malaysia', 'Ipoh,Malaysia');
INSERT INTO `sw_shipping_ports` VALUES ('605', 'Ipswich,U.K.', 'Ipswich,U.K.');
INSERT INTO `sw_shipping_ports` VALUES ('606', 'Iquique,Chile', 'Iquique,Chile');
INSERT INTO `sw_shipping_ports` VALUES ('607', 'Irbid,Jordan', 'Irbid,Jordan');
INSERT INTO `sw_shipping_ports` VALUES ('608', 'Irkutsk,Russia', 'Irkutsk,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('609', 'Irun,Spain', 'Irun,Spain');
INSERT INTO `sw_shipping_ports` VALUES ('610', 'Ishigaki,Japan', 'Ishigaki,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('611', 'Ishikari,Japan', 'Ishikari,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('612', 'Ishino Maki,Japan', 'Ishino Maki,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('613', 'Iskenderun,Turkey', 'Iskenderun,Turkey');
INSERT INTO `sw_shipping_ports` VALUES ('614', 'Islam Qala,Afghanistan', 'Islam Qala,Afghanistan');
INSERT INTO `sw_shipping_ports` VALUES ('615', 'Istanbul,Turkey', 'Istanbul,Turkey');
INSERT INTO `sw_shipping_ports` VALUES ('616', 'Itaguai,Brazil', 'Itaguai,Brazil');
INSERT INTO `sw_shipping_ports` VALUES ('617', 'Itajai,Brazil', 'Itajai,Brazil');
INSERT INTO `sw_shipping_ports` VALUES ('618', 'Itapetinga,Brazil', 'Itapetinga,Brazil');
INSERT INTO `sw_shipping_ports` VALUES ('619', 'Itapoa,Brazil', 'Itapoa,Brazil');
INSERT INTO `sw_shipping_ports` VALUES ('620', 'Itaqui,Brazil', 'Itaqui,Brazil');
INSERT INTO `sw_shipping_ports` VALUES ('621', 'Iwakuni,Japan', 'Iwakuni,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('622', 'Iyomishima,Japan', 'Iyomishima,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('623', 'Izmir,Turkey', 'Izmir,Turkey');
INSERT INTO `sw_shipping_ports` VALUES ('624', 'Izmit,Turkey', 'Izmit,Turkey');
INSERT INTO `sw_shipping_ports` VALUES ('625', 'Izmit Korfezi,Turkey', 'Izmit Korfezi,Turkey');
INSERT INTO `sw_shipping_ports` VALUES ('626', 'Jacksonville,Florida', 'Jacksonville,Florida');
INSERT INTO `sw_shipping_ports` VALUES ('627', 'Jaipur,India', 'Jaipur,India');
INSERT INTO `sw_shipping_ports` VALUES ('628', 'Jakarta,Indonesia', 'Jakarta,Indonesia');
INSERT INTO `sw_shipping_ports` VALUES ('629', 'Jakarta UTC1,Indonesia', 'Jakarta UTC1,Indonesia');
INSERT INTO `sw_shipping_ports` VALUES ('630', 'Jakarta UTC3,Indonesia', 'Jakarta UTC3,Indonesia');
INSERT INTO `sw_shipping_ports` VALUES ('631', 'Jawaharlal Nehru,India', 'Jawaharlal Nehru,India');
INSERT INTO `sw_shipping_ports` VALUES ('632', 'Jebel Ali,United Arab Emirates', 'Jebel Ali,United Arab Emirates');
INSERT INTO `sw_shipping_ports` VALUES ('633', 'Jebel Ali Freezone,United Arab Emirates', 'Jebel Ali Freezone,United Arab Emirates');
INSERT INTO `sw_shipping_ports` VALUES ('634', 'Jeddah,Saudi Arabia', 'Jeddah,Saudi Arabia');
INSERT INTO `sw_shipping_ports` VALUES ('635', 'Jelenia Gora,Poland', 'Jelenia Gora,Poland');
INSERT INTO `sw_shipping_ports` VALUES ('636', 'Jiading,Shanghai', 'Jiading,Shanghai');
INSERT INTO `sw_shipping_ports` VALUES ('637', 'Jiamusi,Heilongjiang Province', 'Jiamusi,Heilongjiang Province');
INSERT INTO `sw_shipping_ports` VALUES ('638', 'Jiang Tang,China', 'Jiang Tang,China');
INSERT INTO `sw_shipping_ports` VALUES ('639', 'Jiangmen,Guangdong Province', 'Jiangmen,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('640', 'Jiangyin,Jiangsu Province', 'Jiangyin,Jiangsu Province');
INSERT INTO `sw_shipping_ports` VALUES ('641', 'Jiankou,Fujian Province', 'Jiankou,Fujian Province');
INSERT INTO `sw_shipping_ports` VALUES ('642', 'Jiaojiang,Zhejiang Province', 'Jiaojiang,Zhejiang Province');
INSERT INTO `sw_shipping_ports` VALUES ('643', 'Jiaokou,Guangdong Province', 'Jiaokou,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('644', 'Jiaoxin,Guangdong Province', 'Jiaoxin,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('645', 'Jiaxing,Zhejiang Province', 'Jiaxing,Zhejiang Province');
INSERT INTO `sw_shipping_ports` VALUES ('646', 'Jiazi (Lu Feng),Guangdong Province', 'Jiazi (Lu Feng),Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('647', 'Jieyang,Guangdong Province', 'Jieyang,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('648', 'Jinan,Shandong Province', 'Jinan,Shandong Province');
INSERT INTO `sw_shipping_ports` VALUES ('649', 'Jing Tang,Shandong Province', 'Jing Tang,Shandong Province');
INSERT INTO `sw_shipping_ports` VALUES ('650', 'Jingan,Guangdong Province', 'Jingan,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('651', 'Jinghua,Zhejiang Province', 'Jinghua,Zhejiang Province');
INSERT INTO `sw_shipping_ports` VALUES ('652', 'Jingjiang,Jiangsu Province', 'Jingjiang,Jiangsu Province');
INSERT INTO `sw_shipping_ports` VALUES ('653', 'Jinguzhou,Guangdong Province', 'Jinguzhou,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('654', 'Jinshan,Shanghai', 'Jinshan,Shanghai');
INSERT INTO `sw_shipping_ports` VALUES ('655', 'Jinzhou,Liaoning Province', 'Jinzhou,Liaoning Province');
INSERT INTO `sw_shipping_ports` VALUES ('656', 'Jisi,Guangdong Province', 'Jisi,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('657', 'Jiujiang,Jiangxi Province', 'Jiujiang,Jiangxi Province');
INSERT INTO `sw_shipping_ports` VALUES ('658', 'Jiujiang (Nanhai),Guangdong Province', 'Jiujiang (Nanhai),Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('659', 'Jiuzhou,Guangdong Province', 'Jiuzhou,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('660', 'Johannesburg,South Africa', 'Johannesburg,South Africa');
INSERT INTO `sw_shipping_ports` VALUES ('661', 'Johor,Malaysia', 'Johor,Malaysia');
INSERT INTO `sw_shipping_ports` VALUES ('662', 'Jubail,Saudi Arabia', 'Jubail,Saudi Arabia');
INSERT INTO `sw_shipping_ports` VALUES ('663', 'Kabil,Indonesia', 'Kabil,Indonesia');
INSERT INTO `sw_shipping_ports` VALUES ('664', 'Kabul,Afghanistan', 'Kabul,Afghanistan');
INSERT INTO `sw_shipping_ports` VALUES ('665', 'Kachkanar,Russia', 'Kachkanar,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('666', 'Kaduna,Nigeria', 'Kaduna,Nigeria');
INSERT INTO `sw_shipping_ports` VALUES ('667', 'Kagoshima,Japan', 'Kagoshima,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('668', 'Kahului,Hawaii', 'Kahului,Hawaii');
INSERT INTO `sw_shipping_ports` VALUES ('669', 'Kaifeng,Henan Province', 'Kaifeng,Henan Province');
INSERT INTO `sw_shipping_ports` VALUES ('670', 'Kaiping,Guangdong Province', 'Kaiping,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('671', 'Kakinada,India', 'Kakinada,India');
INSERT INTO `sw_shipping_ports` VALUES ('672', 'Kakogawa,Japan', 'Kakogawa,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('673', 'Kaliningrad,Russia', 'Kaliningrad,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('674', 'Kaluga,Russia', 'Kaluga,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('675', 'Kam Pong Som,Cambodia', 'Kam Pong Som,Cambodia');
INSERT INTO `sw_shipping_ports` VALUES ('676', 'Kamchatka,Russia', 'Kamchatka,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('677', 'Kampala,Uganda', 'Kampala,Uganda');
INSERT INTO `sw_shipping_ports` VALUES ('678', 'Kanazawa,Japan', 'Kanazawa,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('679', 'Kandahar,Afghanistan', 'Kandahar,Afghanistan');
INSERT INTO `sw_shipping_ports` VALUES ('680', 'Kandla,India', 'Kandla,India');
INSERT INTO `sw_shipping_ports` VALUES ('681', 'Kansas City,Kansas', 'Kansas City,Kansas');
INSERT INTO `sw_shipping_ports` VALUES ('682', 'Kantang,Thailand', 'Kantang,Thailand');
INSERT INTO `sw_shipping_ports` VALUES ('683', 'Kaohsiung,Taiwan', 'Kaohsiung,Taiwan');
INSERT INTO `sw_shipping_ports` VALUES ('684', 'Karachi,Pakistan', 'Karachi,Pakistan');
INSERT INTO `sw_shipping_ports` VALUES ('685', 'Karaganda,Kazakhstan', 'Karaganda,Kazakhstan');
INSERT INTO `sw_shipping_ports` VALUES ('686', 'Karatsu,Japan', 'Karatsu,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('687', 'Kashima,Japan', 'Kashima,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('688', 'Kassel,Germany', 'Kassel,Germany');
INSERT INTO `sw_shipping_ports` VALUES ('689', 'Kathmandu,Nepal', 'Kathmandu,Nepal');
INSERT INTO `sw_shipping_ports` VALUES ('690', 'Katowice,Poland', 'Katowice,Poland');
INSERT INTO `sw_shipping_ports` VALUES ('691', 'Kattupalli,India', 'Kattupalli,India');
INSERT INTO `sw_shipping_ports` VALUES ('692', 'Kavieng,Papua New Guinea', 'Kavieng,Papua New Guinea');
INSERT INTO `sw_shipping_ports` VALUES ('693', 'Kavkaz,Russia', 'Kavkaz,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('694', 'Kawaihae,Hawaii', 'Kawaihae,Hawaii');
INSERT INTO `sw_shipping_ports` VALUES ('695', 'Kawasaki,Japan', 'Kawasaki,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('696', 'Kayes,Mali', 'Kayes,Mali');
INSERT INTO `sw_shipping_ports` VALUES ('697', 'Kazan,Russia', 'Kazan,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('698', 'Kearny,New Jersey', 'Kearny,New Jersey');
INSERT INTO `sw_shipping_ports` VALUES ('699', 'Keelung,Taiwan', 'Keelung,Taiwan');
INSERT INTO `sw_shipping_ports` VALUES ('700', 'Kemaman,Malaysia', 'Kemaman,Malaysia');
INSERT INTO `sw_shipping_ports` VALUES ('701', 'Kemerovo,Russia', 'Kemerovo,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('702', 'Kenai,Alaska', 'Kenai,Alaska');
INSERT INTO `sw_shipping_ports` VALUES ('703', 'Kent,United States', 'Kent,United States');
INSERT INTO `sw_shipping_ports` VALUES ('704', 'Khabarovsk,Russia', 'Khabarovsk,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('705', 'Khalifa,United Arab Emirates', 'Khalifa,United Arab Emirates');
INSERT INTO `sw_shipping_ports` VALUES ('706', 'Kharkov,Ukraine', 'Kharkov,Ukraine');
INSERT INTO `sw_shipping_ports` VALUES ('707', 'Khartoum,Sudan', 'Khartoum,Sudan');
INSERT INTO `sw_shipping_ports` VALUES ('708', 'Khasan,Russia', 'Khasan,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('709', 'Khoms,Africa', 'Khoms,Africa');
INSERT INTO `sw_shipping_ports` VALUES ('710', 'Khor Fakkan,United Arab Emirates', 'Khor Fakkan,United Arab Emirates');
INSERT INTO `sw_shipping_ports` VALUES ('711', 'Khorol,Russia', 'Khorol,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('712', 'Khorramshahr,Iran', 'Khorramshahr,Iran');
INSERT INTO `sw_shipping_ports` VALUES ('713', 'Khudjand,Kazakhstan', 'Khudjand,Kazakhstan');
INSERT INTO `sw_shipping_ports` VALUES ('714', 'Kiel,Germany', 'Kiel,Germany');
INSERT INTO `sw_shipping_ports` VALUES ('715', 'Kielce,Poland', 'Kielce,Poland');
INSERT INTO `sw_shipping_ports` VALUES ('716', 'Kiev,Ukraine', 'Kiev,Ukraine');
INSERT INTO `sw_shipping_ports` VALUES ('717', 'Kimbe,Papua New Guinea', 'Kimbe,Papua New Guinea');
INSERT INTO `sw_shipping_ports` VALUES ('718', 'Kimitsu,Japan', 'Kimitsu,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('719', 'King Abdullah,Saudi Arabia', 'King Abdullah,Saudi Arabia');
INSERT INTO `sw_shipping_ports` VALUES ('720', 'Kingston,Jamaica', 'Kingston,Jamaica');
INSERT INTO `sw_shipping_ports` VALUES ('721', 'Kingstown,Saint Vincent', 'Kingstown,Saint Vincent');
INSERT INTO `sw_shipping_ports` VALUES ('722', 'Kinshasa,Zaire', 'Kinshasa,Zaire');
INSERT INTO `sw_shipping_ports` VALUES ('723', 'Kish Island,Iran', 'Kish Island,Iran');
INSERT INTO `sw_shipping_ports` VALUES ('724', 'Kishinev,Russia', 'Kishinev,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('725', 'Kismayu,Somalia', 'Kismayu,Somalia');
INSERT INTO `sw_shipping_ports` VALUES ('726', 'Klagenfurt,Austria', 'Klagenfurt,Austria');
INSERT INTO `sw_shipping_ports` VALUES ('727', 'Klaipeda,Lithuania', 'Klaipeda,Lithuania');
INSERT INTO `sw_shipping_ports` VALUES ('728', 'Kobe,Japan', 'Kobe,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('729', 'Kochi,Japan', 'Kochi,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('730', 'Kokura,Japan', 'Kokura,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('731', 'Kolkata,India', 'Kolkata,India');
INSERT INTO `sw_shipping_ports` VALUES ('732', 'Koln,Germany', 'Koln,Germany');
INSERT INTO `sw_shipping_ports` VALUES ('733', 'Koming,Guangdong Province', 'Koming,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('734', 'Kompong Som,Cambodia', 'Kompong Som,Cambodia');
INSERT INTO `sw_shipping_ports` VALUES ('735', 'Komsomolsk Na Amur,Russia', 'Komsomolsk Na Amur,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('736', 'Koper,Slovenia', 'Koper,Slovenia');
INSERT INTO `sw_shipping_ports` VALUES ('737', 'Koror,Palau', 'Koror,Palau');
INSERT INTO `sw_shipping_ports` VALUES ('738', 'Korsakov,Russia', 'Korsakov,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('739', 'Koshichang,Japan', 'Koshichang,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('740', 'Kosrae,Micronesia Islands', 'Kosrae,Micronesia Islands');
INSERT INTO `sw_shipping_ports` VALUES ('741', 'Kota Kinabalu,Malaysia', 'Kota Kinabalu,Malaysia');
INSERT INTO `sw_shipping_ports` VALUES ('742', 'Kotka,Finland', 'Kotka,Finland');
INSERT INTO `sw_shipping_ports` VALUES ('743', 'Krakow,Poland', 'Krakow,Poland');
INSERT INTO `sw_shipping_ports` VALUES ('744', 'Krasnodar,Russia', 'Krasnodar,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('745', 'Krasnovosk,Russia', 'Krasnovosk,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('746', 'Krasnoyarsk,Russia', 'Krasnoyarsk,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('747', 'Krishnapatnam,India', 'Krishnapatnam,India');
INSERT INTO `sw_shipping_ports` VALUES ('748', 'Kristiansand,Norway', 'Kristiansand,Norway');
INSERT INTO `sw_shipping_ports` VALUES ('749', 'Kuala Lumpur,Malaysia', 'Kuala Lumpur,Malaysia');
INSERT INTO `sw_shipping_ports` VALUES ('750', 'Kuantan,Malaysia', 'Kuantan,Malaysia');
INSERT INTO `sw_shipping_ports` VALUES ('751', 'Kuching,Malaysia', 'Kuching,Malaysia');
INSERT INTO `sw_shipping_ports` VALUES ('752', 'Kumamoto,Japan', 'Kumamoto,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('753', 'Kumport,Turkey', 'Kumport,Turkey');
INSERT INTO `sw_shipping_ports` VALUES ('754', 'Kunming,Yunnan Province', 'Kunming,Yunnan Province');
INSERT INTO `sw_shipping_ports` VALUES ('755', 'Kunsan,South Korea', 'Kunsan,South Korea');
INSERT INTO `sw_shipping_ports` VALUES ('756', 'Kunshan,Jiangsu Province', 'Kunshan,Jiangsu Province');
INSERT INTO `sw_shipping_ports` VALUES ('757', 'Kure,Japan', 'Kure,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('758', 'Kurgan,Russia', 'Kurgan,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('759', 'Kursk,Russia', 'Kursk,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('760', 'KUSAN,South Korea', 'KUSAN,South Korea');
INSERT INTO `sw_shipping_ports` VALUES ('761', 'Kushiro,Japan', 'Kushiro,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('762', 'Kustany,Kazakhstan', 'Kustany,Kazakhstan');
INSERT INTO `sw_shipping_ports` VALUES ('763', 'Kuwait,Persian Gulf', 'Kuwait,Persian Gulf');
INSERT INTO `sw_shipping_ports` VALUES ('764', 'Kuybyshev,Russia', 'Kuybyshev,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('765', 'Kwajalein,Micronesia Islands', 'Kwajalein,Micronesia Islands');
INSERT INTO `sw_shipping_ports` VALUES ('766', 'Kwangyang,South Korea', 'Kwangyang,South Korea');
INSERT INTO `sw_shipping_ports` VALUES ('767', 'La Ceiba,Honduras', 'La Ceiba,Honduras');
INSERT INTO `sw_shipping_ports` VALUES ('768', 'La Goulette,Tunisia', 'La Goulette,Tunisia');
INSERT INTO `sw_shipping_ports` VALUES ('769', 'La Guaira,Venezuela', 'La Guaira,Venezuela');
INSERT INTO `sw_shipping_ports` VALUES ('770', 'La Lima,Honduras', 'La Lima,Honduras');
INSERT INTO `sw_shipping_ports` VALUES ('771', 'La Paz,Bolivia', 'La Paz,Bolivia');
INSERT INTO `sw_shipping_ports` VALUES ('772', 'La Spezia,Italy', 'La Spezia,Italy');
INSERT INTO `sw_shipping_ports` VALUES ('773', 'La Union,Republic of El Salvador', 'La Union,Republic of El Salvador');
INSERT INTO `sw_shipping_ports` VALUES ('774', 'Labuan,Malaysia', 'Labuan,Malaysia');
INSERT INTO `sw_shipping_ports` VALUES ('775', 'Lae,Papua New Guinea', 'Lae,Papua New Guinea');
INSERT INTO `sw_shipping_ports` VALUES ('776', 'Laem Chabang,Thailand', 'Laem Chabang,Thailand');
INSERT INTO `sw_shipping_ports` VALUES ('777', 'Lagos/Apapa,Nigeria', 'Lagos/Apapa,Nigeria');
INSERT INTO `sw_shipping_ports` VALUES ('778', 'Lahat Datu,Malaysia', 'Lahat Datu,Malaysia');
INSERT INTO `sw_shipping_ports` VALUES ('779', 'Lahore,Pakistan', 'Lahore,Pakistan');
INSERT INTO `sw_shipping_ports` VALUES ('780', 'Laizhou,Guangdong Province', 'Laizhou,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('781', 'Lake Charles,United States', 'Lake Charles,United States');
INSERT INTO `sw_shipping_ports` VALUES ('782', 'Lancaster,California', 'Lancaster,California');
INSERT INTO `sw_shipping_ports` VALUES ('783', 'Lanshan,Henan Province', 'Lanshan,Henan Province');
INSERT INTO `sw_shipping_ports` VALUES ('784', 'Lanshi,Guangdong Province', 'Lanshi,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('785', 'Lanxi,Guangdong Province', 'Lanxi,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('786', 'Lanzhou,Gansu Province', 'Lanzhou,Gansu Province');
INSERT INTO `sw_shipping_ports` VALUES ('787', 'Laon,France', 'Laon,France');
INSERT INTO `sw_shipping_ports` VALUES ('788', 'Laos,Thailand', 'Laos,Thailand');
INSERT INTO `sw_shipping_ports` VALUES ('789', 'Laredo,United States', 'Laredo,United States');
INSERT INTO `sw_shipping_ports` VALUES ('790', 'Larnaca,Cyprus', 'Larnaca,Cyprus');
INSERT INTO `sw_shipping_ports` VALUES ('791', 'Larvik,Norway', 'Larvik,Norway');
INSERT INTO `sw_shipping_ports` VALUES ('792', 'Las Minas,Guatemala', 'Las Minas,Guatemala');
INSERT INTO `sw_shipping_ports` VALUES ('793', 'Las Palmas,Canary Islands', 'Las Palmas,Canary Islands');
INSERT INTO `sw_shipping_ports` VALUES ('794', 'Lat Krabang,Thailand', 'Lat Krabang,Thailand');
INSERT INTO `sw_shipping_ports` VALUES ('795', 'Lattakia,Syria', 'Lattakia,Syria');
INSERT INTO `sw_shipping_ports` VALUES ('796', 'Latvia,Russia', 'Latvia,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('797', 'Lautoka,Fiji Island', 'Lautoka,Fiji Island');
INSERT INTO `sw_shipping_ports` VALUES ('798', 'Lawrence,Kansas', 'Lawrence,Kansas');
INSERT INTO `sw_shipping_ports` VALUES ('799', 'Lazaro Cardenas,Mexico', 'Lazaro Cardenas,Mexico');
INSERT INTO `sw_shipping_ports` VALUES ('800', 'Le Havre,France', 'Le Havre,France');
INSERT INTO `sw_shipping_ports` VALUES ('801', 'Le Verdon,France', 'Le Verdon,France');
INSERT INTO `sw_shipping_ports` VALUES ('802', 'Leeds,U.K.', 'Leeds,U.K.');
INSERT INTO `sw_shipping_ports` VALUES ('803', 'Leghorn (Livorno),Italy', 'Leghorn (Livorno),Italy');
INSERT INTO `sw_shipping_ports` VALUES ('804', 'Leicester,U.K.', 'Leicester,U.K.');
INSERT INTO `sw_shipping_ports` VALUES ('805', 'Leipzig,Germany', 'Leipzig,Germany');
INSERT INTO `sw_shipping_ports` VALUES ('806', 'Leith,U.K.', 'Leith,U.K.');
INSERT INTO `sw_shipping_ports` VALUES ('807', 'Leixoes,Portugal', 'Leixoes,Portugal');
INSERT INTO `sw_shipping_ports` VALUES ('808', 'Leliu,Guangdong Province', 'Leliu,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('809', 'Leninabad,Russia', 'Leninabad,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('810', 'Leon,Mexico', 'Leon,Mexico');
INSERT INTO `sw_shipping_ports` VALUES ('811', 'Lerma,Spain', 'Lerma,Spain');
INSERT INTO `sw_shipping_ports` VALUES ('812', 'Lerma Estado de Mexico,Mexico', 'Lerma Estado de Mexico,Mexico');
INSERT INTO `sw_shipping_ports` VALUES ('813', 'Lesotho,Maseru', 'Lesotho,Maseru');
INSERT INTO `sw_shipping_ports` VALUES ('814', 'Levin,New Zealand', 'Levin,New Zealand');
INSERT INTO `sw_shipping_ports` VALUES ('815', 'Lianhuashan,Guangdong Province', 'Lianhuashan,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('816', 'Lianyungang,Jiangsu Province', 'Lianyungang,Jiangsu Province');
INSERT INTO `sw_shipping_ports` VALUES ('817', 'Liaoning,China', 'Liaoning,China');
INSERT INTO `sw_shipping_ports` VALUES ('818', 'Libreville,Gabon', 'Libreville,Gabon');
INSERT INTO `sw_shipping_ports` VALUES ('819', 'Lihir,Papua New Guinea', 'Lihir,Papua New Guinea');
INSERT INTO `sw_shipping_ports` VALUES ('820', 'Lilongwe,Malawi', 'Lilongwe,Malawi');
INSERT INTO `sw_shipping_ports` VALUES ('821', 'Lima,Peru', 'Lima,Peru');
INSERT INTO `sw_shipping_ports` VALUES ('822', 'Limassol,Cyprus', 'Limassol,Cyprus');
INSERT INTO `sw_shipping_ports` VALUES ('823', 'Limon,Costa Rica', 'Limon,Costa Rica');
INSERT INTO `sw_shipping_ports` VALUES ('824', 'Linbai,Zhejiang Province', 'Linbai,Zhejiang Province');
INSERT INTO `sw_shipping_ports` VALUES ('825', 'Linkoping,Sweden', 'Linkoping,Sweden');
INSERT INTO `sw_shipping_ports` VALUES ('826', 'Linyi,Shandong Province', 'Linyi,Shandong Province');
INSERT INTO `sw_shipping_ports` VALUES ('827', 'Linz,Austria', 'Linz,Austria');
INSERT INTO `sw_shipping_ports` VALUES ('828', 'Lipetsk,Russia', 'Lipetsk,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('829', 'Lirquen,Chile', 'Lirquen,Chile');
INSERT INTO `sw_shipping_ports` VALUES ('830', 'Lisbon,Portugal', 'Lisbon,Portugal');
INSERT INTO `sw_shipping_ports` VALUES ('831', 'Lithuania,Russia', 'Lithuania,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('832', 'Liudu,Guangdong Province', 'Liudu,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('833', 'Liuzhou,Guangxi Province', 'Liuzhou,Guangxi Province');
INSERT INTO `sw_shipping_ports` VALUES ('834', 'Liverpool,U.K.', 'Liverpool,U.K.');
INSERT INTO `sw_shipping_ports` VALUES ('835', 'Livorno,Italy', 'Livorno,Italy');
INSERT INTO `sw_shipping_ports` VALUES ('836', 'Ljubljana,Slovenia', 'Ljubljana,Slovenia');
INSERT INTO `sw_shipping_ports` VALUES ('837', 'Llyichevsk,Ukraine', 'Llyichevsk,Ukraine');
INSERT INTO `sw_shipping_ports` VALUES ('838', 'Lobito,Angola', 'Lobito,Angola');
INSERT INTO `sw_shipping_ports` VALUES ('839', 'Lodz,Poland', 'Lodz,Poland');
INSERT INTO `sw_shipping_ports` VALUES ('840', 'Lome,Togo', 'Lome,Togo');
INSERT INTO `sw_shipping_ports` VALUES ('841', 'London,U.K.', 'London,U.K.');
INSERT INTO `sw_shipping_ports` VALUES ('842', 'Long Beach,California', 'Long Beach,California');
INSERT INTO `sw_shipping_ports` VALUES ('843', 'Long Island,Bahamas', 'Long Island,Bahamas');
INSERT INTO `sw_shipping_ports` VALUES ('844', 'Longkou,Shandong Province', 'Longkou,Shandong Province');
INSERT INTO `sw_shipping_ports` VALUES ('845', 'Longoni,Africa', 'Longoni,Africa');
INSERT INTO `sw_shipping_ports` VALUES ('846', 'Longtan,Jiangsu Province', 'Longtan,Jiangsu Province');
INSERT INTO `sw_shipping_ports` VALUES ('847', 'Loni,India', 'Loni,India');
INSERT INTO `sw_shipping_ports` VALUES ('848', 'Lorengau,Papua New Guinea', 'Lorengau,Papua New Guinea');
INSERT INTO `sw_shipping_ports` VALUES ('849', 'Los Angeles,California', 'Los Angeles,California');
INSERT INTO `sw_shipping_ports` VALUES ('850', 'Louisville,United States', 'Louisville,United States');
INSERT INTO `sw_shipping_ports` VALUES ('851', 'Luanda,Angola', 'Luanda,Angola');
INSERT INTO `sw_shipping_ports` VALUES ('852', 'Lubango,Angola', 'Lubango,Angola');
INSERT INTO `sw_shipping_ports` VALUES ('853', 'Lublin,Poland', 'Lublin,Poland');
INSERT INTO `sw_shipping_ports` VALUES ('854', 'Lubljana,Slovenia', 'Lubljana,Slovenia');
INSERT INTO `sw_shipping_ports` VALUES ('855', 'Lubumbashi,Congo', 'Lubumbashi,Congo');
INSERT INTO `sw_shipping_ports` VALUES ('856', 'Ludhiana,India', 'Ludhiana,India');
INSERT INTO `sw_shipping_ports` VALUES ('857', 'Ludiana,India', 'Ludiana,India');
INSERT INTO `sw_shipping_ports` VALUES ('858', 'Lumut,Indonesia', 'Lumut,Indonesia');
INSERT INTO `sw_shipping_ports` VALUES ('859', 'Luoyang,Henan Province', 'Luoyang,Henan Province');
INSERT INTO `sw_shipping_ports` VALUES ('860', 'Lusaka,Zambia', 'Lusaka,Zambia');
INSERT INTO `sw_shipping_ports` VALUES ('861', 'Luxembourg,Luxembourg', 'Luxembourg,Luxembourg');
INSERT INTO `sw_shipping_ports` VALUES ('862', 'Luzhou,Sichuan Province', 'Luzhou,Sichuan Province');
INSERT INTO `sw_shipping_ports` VALUES ('863', 'Lvov,Russia', 'Lvov,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('864', 'Lyon,France', 'Lyon,France');
INSERT INTO `sw_shipping_ports` VALUES ('865', 'Lyttelton,New Zealand', 'Lyttelton,New Zealand');
INSERT INTO `sw_shipping_ports` VALUES ('866', 'Ma An Shan,Anhui Province', 'Ma An Shan,Anhui Province');
INSERT INTO `sw_shipping_ports` VALUES ('867', 'Maaloy,Norway', 'Maaloy,Norway');
INSERT INTO `sw_shipping_ports` VALUES ('868', 'Macau,China', 'Macau,China');
INSERT INTO `sw_shipping_ports` VALUES ('869', 'Maceio,Brazil', 'Maceio,Brazil');
INSERT INTO `sw_shipping_ports` VALUES ('870', 'Mackay,Queensland', 'Mackay,Queensland');
INSERT INTO `sw_shipping_ports` VALUES ('871', 'Macon,France', 'Macon,France');
INSERT INTO `sw_shipping_ports` VALUES ('872', 'Madagascar,Africa', 'Madagascar,Africa');
INSERT INTO `sw_shipping_ports` VALUES ('873', 'Madang,Papua New Guinea', 'Madang,Papua New Guinea');
INSERT INTO `sw_shipping_ports` VALUES ('874', 'Madison,N.Y.', 'Madison,N.Y.');
INSERT INTO `sw_shipping_ports` VALUES ('875', 'Madras,India', 'Madras,India');
INSERT INTO `sw_shipping_ports` VALUES ('876', 'Madrid,Spain', 'Madrid,Spain');
INSERT INTO `sw_shipping_ports` VALUES ('877', 'Maerak,Indonesia', 'Maerak,Indonesia');
INSERT INTO `sw_shipping_ports` VALUES ('878', 'Mafang,Guangdong Province', 'Mafang,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('879', 'Magadan,Russia', 'Magadan,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('880', 'Magnitogorsk,Russia', 'Magnitogorsk,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('881', 'Mahajunga,Africa', 'Mahajunga,Africa');
INSERT INTO `sw_shipping_ports` VALUES ('882', 'Mahe,Seychelles', 'Mahe,Seychelles');
INSERT INTO `sw_shipping_ports` VALUES ('883', 'Mailiao,Taiwan', 'Mailiao,Taiwan');
INSERT INTO `sw_shipping_ports` VALUES ('884', 'Maizuru,Japan', 'Maizuru,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('885', 'Majunga,Madagascar', 'Majunga,Madagascar');
INSERT INTO `sw_shipping_ports` VALUES ('886', 'Majuro,Marshall Islands', 'Majuro,Marshall Islands');
INSERT INTO `sw_shipping_ports` VALUES ('887', 'Makasaar,Indonesia', 'Makasaar,Indonesia');
INSERT INTO `sw_shipping_ports` VALUES ('888', 'Malabo,Equatorial Guinea', 'Malabo,Equatorial Guinea');
INSERT INTO `sw_shipping_ports` VALUES ('889', 'Malacca,Malaysia', 'Malacca,Malaysia');
INSERT INTO `sw_shipping_ports` VALUES ('890', 'Malaga,Canary Islands', 'Malaga,Canary Islands');
INSERT INTO `sw_shipping_ports` VALUES ('891', 'Malawi,Africa', 'Malawi,Africa');
INSERT INTO `sw_shipping_ports` VALUES ('892', 'Male,Maldves', 'Male,Maldves');
INSERT INTO `sw_shipping_ports` VALUES ('893', 'Malmo,Sweden', 'Malmo,Sweden');
INSERT INTO `sw_shipping_ports` VALUES ('894', 'Malongo,Angola', 'Malongo,Angola');
INSERT INTO `sw_shipping_ports` VALUES ('895', 'Malta,Malta', 'Malta,Malta');
INSERT INTO `sw_shipping_ports` VALUES ('896', 'Managua,Nicaragua', 'Managua,Nicaragua');
INSERT INTO `sw_shipping_ports` VALUES ('897', 'Manaus,Brazil', 'Manaus,Brazil');
INSERT INTO `sw_shipping_ports` VALUES ('898', 'Manchester,U.K.', 'Manchester,U.K.');
INSERT INTO `sw_shipping_ports` VALUES ('899', 'Mangalore,India', 'Mangalore,India');
INSERT INTO `sw_shipping_ports` VALUES ('900', 'Mangyshlak,Kazakhstan', 'Mangyshlak,Kazakhstan');
INSERT INTO `sw_shipping_ports` VALUES ('901', 'Manila (MICT),Philippines', 'Manila (MICT),Philippines');
INSERT INTO `sw_shipping_ports` VALUES ('902', 'Manila (North),Philippines', 'Manila (North),Philippines');
INSERT INTO `sw_shipping_ports` VALUES ('903', 'Manila (South),Philippines', 'Manila (South),Philippines');
INSERT INTO `sw_shipping_ports` VALUES ('904', 'Mannheim,Germany', 'Mannheim,Germany');
INSERT INTO `sw_shipping_ports` VALUES ('905', 'Manta,Ecuador', 'Manta,Ecuador');
INSERT INTO `sw_shipping_ports` VALUES ('906', 'Manzanillo,Mexico', 'Manzanillo,Mexico');
INSERT INTO `sw_shipping_ports` VALUES ('907', 'Manzanillo (P),Panama', 'Manzanillo (P),Panama');
INSERT INTO `sw_shipping_ports` VALUES ('908', 'Manzhouli,Inner Mongolia', 'Manzhouli,Inner Mongolia');
INSERT INTO `sw_shipping_ports` VALUES ('909', 'Maoming,Guangdong Province', 'Maoming,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('910', 'Maptaput,Thailand', 'Maptaput,Thailand');
INSERT INTO `sw_shipping_ports` VALUES ('911', 'Maputo,Mozambique', 'Maputo,Mozambique');
INSERT INTO `sw_shipping_ports` VALUES ('912', 'Mar Del Plata,Argentina', 'Mar Del Plata,Argentina');
INSERT INTO `sw_shipping_ports` VALUES ('913', 'Maracaibo,Venezuela', 'Maracaibo,Venezuela');
INSERT INTO `sw_shipping_ports` VALUES ('914', 'Mardas,Turkey', 'Mardas,Turkey');
INSERT INTO `sw_shipping_ports` VALUES ('915', 'Margarita,Venezuela', 'Margarita,Venezuela');
INSERT INTO `sw_shipping_ports` VALUES ('916', 'Mariupol,Russia', 'Mariupol,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('917', 'Marmagao,India', 'Marmagao,India');
INSERT INTO `sw_shipping_ports` VALUES ('918', 'Marport,Turkey', 'Marport,Turkey');
INSERT INTO `sw_shipping_ports` VALUES ('919', 'Marsa Ei Brega,Libya', 'Marsa Ei Brega,Libya');
INSERT INTO `sw_shipping_ports` VALUES ('920', 'Marsaxlokk,Malta', 'Marsaxlokk,Malta');
INSERT INTO `sw_shipping_ports` VALUES ('921', 'Marseilles,France', 'Marseilles,France');
INSERT INTO `sw_shipping_ports` VALUES ('922', 'Marseilles-Fos,France', 'Marseilles-Fos,France');
INSERT INTO `sw_shipping_ports` VALUES ('923', 'Marsh Harbour,Bahamas', 'Marsh Harbour,Bahamas');
INSERT INTO `sw_shipping_ports` VALUES ('924', 'Masan,South Korea', 'Masan,South Korea');
INSERT INTO `sw_shipping_ports` VALUES ('925', 'Maseru,Lesotho', 'Maseru,Lesotho');
INSERT INTO `sw_shipping_ports` VALUES ('926', 'Massawa,Ethiopia', 'Massawa,Ethiopia');
INSERT INTO `sw_shipping_ports` VALUES ('927', 'Matadi,Zaire', 'Matadi,Zaire');
INSERT INTO `sw_shipping_ports` VALUES ('928', 'Matanzas,Cuba', 'Matanzas,Cuba');
INSERT INTO `sw_shipping_ports` VALUES ('929', 'Matarani,Peru', 'Matarani,Peru');
INSERT INTO `sw_shipping_ports` VALUES ('930', 'Matsuyama,Japan', 'Matsuyama,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('931', 'Mauritius,Africa', 'Mauritius,Africa');
INSERT INTO `sw_shipping_ports` VALUES ('932', 'Mawan,Guangdong Province', 'Mawan,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('933', 'Mawei,Fujian Province', 'Mawei,Fujian Province');
INSERT INTO `sw_shipping_ports` VALUES ('934', 'Mayotte,Comores Islands', 'Mayotte,Comores Islands');
INSERT INTO `sw_shipping_ports` VALUES ('935', 'Mazar-I-Sharif,Afghanistan', 'Mazar-I-Sharif,Afghanistan');
INSERT INTO `sw_shipping_ports` VALUES ('936', 'Mcdondough,United States', 'Mcdondough,United States');
INSERT INTO `sw_shipping_ports` VALUES ('937', 'Medan,Indonesia', 'Medan,Indonesia');
INSERT INTO `sw_shipping_ports` VALUES ('938', 'Medeu,Kazakhstan', 'Medeu,Kazakhstan');
INSERT INTO `sw_shipping_ports` VALUES ('939', 'Megion,Russia', 'Megion,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('940', 'Mejillones,Chile', 'Mejillones,Chile');
INSERT INTO `sw_shipping_ports` VALUES ('941', 'Melbourne,Australia', 'Melbourne,Australia');
INSERT INTO `sw_shipping_ports` VALUES ('942', 'Melilla,Morocco', 'Melilla,Morocco');
INSERT INTO `sw_shipping_ports` VALUES ('943', 'Memphis,Tennessee', 'Memphis,Tennessee');
INSERT INTO `sw_shipping_ports` VALUES ('944', 'Mendoza,Argentina', 'Mendoza,Argentina');
INSERT INTO `sw_shipping_ports` VALUES ('945', 'Merak,Indonesia', 'Merak,Indonesia');
INSERT INTO `sw_shipping_ports` VALUES ('946', 'Meridian,United States', 'Meridian,United States');
INSERT INTO `sw_shipping_ports` VALUES ('947', 'Mersin,Turkey', 'Mersin,Turkey');
INSERT INTO `sw_shipping_ports` VALUES ('948', 'Mexicali,Mexico', 'Mexicali,Mexico');
INSERT INTO `sw_shipping_ports` VALUES ('949', 'Mexico City,Mexico', 'Mexico City,Mexico');
INSERT INTO `sw_shipping_ports` VALUES ('950', 'Miami,Florida', 'Miami,Florida');
INSERT INTO `sw_shipping_ports` VALUES ('951', 'Middlesbrough,U.K.', 'Middlesbrough,U.K.');
INSERT INTO `sw_shipping_ports` VALUES ('952', 'Miike,Japan', 'Miike,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('953', 'Milan (Inland Point),Italy', 'Milan (Inland Point),Italy');
INSERT INTO `sw_shipping_ports` VALUES ('954', 'Milwaukee,South Dakota', 'Milwaukee,South Dakota');
INSERT INTO `sw_shipping_ports` VALUES ('955', 'Mina Qaboos,Persian Gulf', 'Mina Qaboos,Persian Gulf');
INSERT INTO `sw_shipping_ports` VALUES ('956', 'Mindanao,Philippines', 'Mindanao,Philippines');
INSERT INTO `sw_shipping_ports` VALUES ('957', 'Mindelo,Cape Varde', 'Mindelo,Cape Varde');
INSERT INTO `sw_shipping_ports` VALUES ('958', 'Minneapolis,Minnesota', 'Minneapolis,Minnesota');
INSERT INTO `sw_shipping_ports` VALUES ('959', 'Minnesota,United States', 'Minnesota,United States');
INSERT INTO `sw_shipping_ports` VALUES ('960', 'Minsk,Russia', 'Minsk,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('961', 'Mira Loma,California', 'Mira Loma,California');
INSERT INTO `sw_shipping_ports` VALUES ('962', 'Miri,Malaysia', 'Miri,Malaysia');
INSERT INTO `sw_shipping_ports` VALUES ('963', 'Miskolc,Hungary', 'Miskolc,Hungary');
INSERT INTO `sw_shipping_ports` VALUES ('964', 'Mississauga,Canada', 'Mississauga,Canada');
INSERT INTO `sw_shipping_ports` VALUES ('965', 'Misurata,Libya', 'Misurata,Libya');
INSERT INTO `sw_shipping_ports` VALUES ('966', 'Mizushima,Japan', 'Mizushima,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('967', 'Moa,Cuba', 'Moa,Cuba');
INSERT INTO `sw_shipping_ports` VALUES ('968', 'Mobile,Alabama', 'Mobile,Alabama');
INSERT INTO `sw_shipping_ports` VALUES ('969', 'Mogadiscio,Somalia', 'Mogadiscio,Somalia');
INSERT INTO `sw_shipping_ports` VALUES ('970', 'Mogilev,Russia', 'Mogilev,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('971', 'Moji,Japan', 'Moji,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('972', 'Mokop,South Korea', 'Mokop,South Korea');
INSERT INTO `sw_shipping_ports` VALUES ('973', 'Mombasa,Kenya', 'Mombasa,Kenya');
INSERT INTO `sw_shipping_ports` VALUES ('974', 'Mongla,Bangladesh', 'Mongla,Bangladesh');
INSERT INTO `sw_shipping_ports` VALUES ('975', 'Monrovia,Liberia', 'Monrovia,Liberia');
INSERT INTO `sw_shipping_ports` VALUES ('976', 'Montego Bay,Jamaica', 'Montego Bay,Jamaica');
INSERT INTO `sw_shipping_ports` VALUES ('977', 'Monterrey,Mexico', 'Monterrey,Mexico');
INSERT INTO `sw_shipping_ports` VALUES ('978', 'Montevideo,Uruguay', 'Montevideo,Uruguay');
INSERT INTO `sw_shipping_ports` VALUES ('979', 'Montgomery,Maryland', 'Montgomery,Maryland');
INSERT INTO `sw_shipping_ports` VALUES ('980', 'Montoir,France', 'Montoir,France');
INSERT INTO `sw_shipping_ports` VALUES ('981', 'Montpellier,France', 'Montpellier,France');
INSERT INTO `sw_shipping_ports` VALUES ('982', 'Montreal,Quebec', 'Montreal,Quebec');
INSERT INTO `sw_shipping_ports` VALUES ('983', 'Montserrat,Caribbean', 'Montserrat,Caribbean');
INSERT INTO `sw_shipping_ports` VALUES ('984', 'Morehead City,North Carolina', 'Morehead City,North Carolina');
INSERT INTO `sw_shipping_ports` VALUES ('985', 'Mormagao,India', 'Mormagao,India');
INSERT INTO `sw_shipping_ports` VALUES ('986', 'Moroni,Comores Islands', 'Moroni,Comores Islands');
INSERT INTO `sw_shipping_ports` VALUES ('987', 'Morristown,Tennessee', 'Morristown,Tennessee');
INSERT INTO `sw_shipping_ports` VALUES ('988', 'Morrisville,Pennsylvania', 'Morrisville,Pennsylvania');
INSERT INTO `sw_shipping_ports` VALUES ('989', 'Moscow,Russia', 'Moscow,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('990', 'Mostaganem,Algeria', 'Mostaganem,Algeria');
INSERT INTO `sw_shipping_ports` VALUES ('991', 'Motukea,Papua New Guinea', 'Motukea,Papua New Guinea');
INSERT INTO `sw_shipping_ports` VALUES ('992', 'Muara,Brunei', 'Muara,Brunei');
INSERT INTO `sw_shipping_ports` VALUES ('993', 'Mucuripe,Brazil', 'Mucuripe,Brazil');
INSERT INTO `sw_shipping_ports` VALUES ('994', 'Mudanjiang,Heilongjiang Province', 'Mudanjiang,Heilongjiang Province');
INSERT INTO `sw_shipping_ports` VALUES ('995', 'Mukalla,South Yemen', 'Mukalla,South Yemen');
INSERT INTO `sw_shipping_ports` VALUES ('996', 'Mulund,India', 'Mulund,India');
INSERT INTO `sw_shipping_ports` VALUES ('997', 'Mumbai,India', 'Mumbai,India');
INSERT INTO `sw_shipping_ports` VALUES ('998', 'Mundra,India', 'Mundra,India');
INSERT INTO `sw_shipping_ports` VALUES ('999', 'Munich,Germany', 'Munich,Germany');
INSERT INTO `sw_shipping_ports` VALUES ('1000', 'Muplu,Mauritius Is.', 'Muplu,Mauritius Is.');
INSERT INTO `sw_shipping_ports` VALUES ('1001', 'Murmans,Russia', 'Murmans,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('1002', 'Murmansk,Russia', 'Murmansk,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('1003', 'Muroran,Japan', 'Muroran,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('1004', 'Muscat,Oman', 'Muscat,Oman');
INSERT INTO `sw_shipping_ports` VALUES ('1005', 'Mutare,Zimbabwe', 'Mutare,Zimbabwe');
INSERT INTO `sw_shipping_ports` VALUES ('1006', 'Mutsamudu,Comores Islands', 'Mutsamudu,Comores Islands');
INSERT INTO `sw_shipping_ports` VALUES ('1007', 'Nacala,Mozambique', 'Nacala,Mozambique');
INSERT INTO `sw_shipping_ports` VALUES ('1008', 'Nagasaki,Japan', 'Nagasaki,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('1009', 'Nagoya,Japan', 'Nagoya,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('1010', 'Naha,Japan', 'Naha,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('1011', 'Nairobi,Kenya', 'Nairobi,Kenya');
INSERT INTO `sw_shipping_ports` VALUES ('1012', 'Nakanoseki,Japan', 'Nakanoseki,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('1013', 'Nakhodka,Russia', 'Nakhodka,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('1014', 'Namangan,Uzbekistan', 'Namangan,Uzbekistan');
INSERT INTO `sw_shipping_ports` VALUES ('1015', 'Namibe,Angola', 'Namibe,Angola');
INSERT INTO `sw_shipping_ports` VALUES ('1016', 'Nampo,North Korea', 'Nampo,North Korea');
INSERT INTO `sw_shipping_ports` VALUES ('1017', 'Nanao,Guangdong Province', 'Nanao,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1018', 'Nanchang,Jiangxi Province', 'Nanchang,Jiangxi Province');
INSERT INTO `sw_shipping_ports` VALUES ('1019', 'Nangang (Nanhai),Guangdong Province', 'Nangang (Nanhai),Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1020', 'Nanguang,Sichuan Province', 'Nanguang,Sichuan Province');
INSERT INTO `sw_shipping_ports` VALUES ('1021', 'Nanhai,Guangdong Province', 'Nanhai,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1022', 'Nanhai (Sanshan),Guangdong Province', 'Nanhai (Sanshan),Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1023', 'Nanhui,Shanghai', 'Nanhui,Shanghai');
INSERT INTO `sw_shipping_ports` VALUES ('1024', 'Nanjing,Jiangsu Province', 'Nanjing,Jiangsu Province');
INSERT INTO `sw_shipping_ports` VALUES ('1025', 'Nankeng,Hunan Province', 'Nankeng,Hunan Province');
INSERT INTO `sw_shipping_ports` VALUES ('1026', 'Nanning,Guangxi Province', 'Nanning,Guangxi Province');
INSERT INTO `sw_shipping_ports` VALUES ('1027', 'Nansha (Guangzhou),Guangdong Province', 'Nansha (Guangzhou),Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1028', 'Nantong,Jiangsu Province', 'Nantong,Jiangsu Province');
INSERT INTO `sw_shipping_ports` VALUES ('1029', 'Naoetsu,Japan', 'Naoetsu,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('1030', 'Napier,New Zealand', 'Napier,New Zealand');
INSERT INTO `sw_shipping_ports` VALUES ('1031', 'Naples,Italy', 'Naples,Italy');
INSERT INTO `sw_shipping_ports` VALUES ('1032', 'Narathiwat,Thailand', 'Narathiwat,Thailand');
INSERT INTO `sw_shipping_ports` VALUES ('1033', 'Nashville,Tennessee', 'Nashville,Tennessee');
INSERT INTO `sw_shipping_ports` VALUES ('1034', 'Nassau,Bahamas', 'Nassau,Bahamas');
INSERT INTO `sw_shipping_ports` VALUES ('1035', 'Nauru,Nauru', 'Nauru,Nauru');
INSERT INTO `sw_shipping_ports` VALUES ('1036', 'Navegantes,Brazil', 'Navegantes,Brazil');
INSERT INTO `sw_shipping_ports` VALUES ('1037', 'Nawilwili,Hawaii', 'Nawilwili,Hawaii');
INSERT INTO `sw_shipping_ports` VALUES ('1038', 'Ndola,Zambia', 'Ndola,Zambia');
INSERT INTO `sw_shipping_ports` VALUES ('1039', 'Nelson,New Zealand', 'Nelson,New Zealand');
INSERT INTO `sw_shipping_ports` VALUES ('1040', 'Nemrut Bay,Turkey', 'Nemrut Bay,Turkey');
INSERT INTO `sw_shipping_ports` VALUES ('1041', 'Neryungri,Russia', 'Neryungri,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('1042', 'Nevers,France', 'Nevers,France');
INSERT INTO `sw_shipping_ports` VALUES ('1043', 'New Castle,U.K.', 'New Castle,U.K.');
INSERT INTO `sw_shipping_ports` VALUES ('1044', 'New Delhi,India', 'New Delhi,India');
INSERT INTO `sw_shipping_ports` VALUES ('1045', 'New Jersey,New Jersey', 'New Jersey,New Jersey');
INSERT INTO `sw_shipping_ports` VALUES ('1046', 'New London,United States', 'New London,United States');
INSERT INTO `sw_shipping_ports` VALUES ('1047', 'New Orleans,Louisiana', 'New Orleans,Louisiana');
INSERT INTO `sw_shipping_ports` VALUES ('1048', 'New Plymouth,New Zealand', 'New Plymouth,New Zealand');
INSERT INTO `sw_shipping_ports` VALUES ('1049', 'New York,N.Y.', 'New York,N.Y.');
INSERT INTO `sw_shipping_ports` VALUES ('1050', 'New York Harbour,N.Y.', 'New York Harbour,N.Y.');
INSERT INTO `sw_shipping_ports` VALUES ('1051', 'Newark,New Jersey', 'Newark,New Jersey');
INSERT INTO `sw_shipping_ports` VALUES ('1052', 'Newcastle,Australia', 'Newcastle,Australia');
INSERT INTO `sw_shipping_ports` VALUES ('1053', 'Newport News,Virginia', 'Newport News,Virginia');
INSERT INTO `sw_shipping_ports` VALUES ('1054', 'Ngqura,South Africa', 'Ngqura,South Africa');
INSERT INTO `sw_shipping_ports` VALUES ('1055', 'Nhatrang,Vietnam', 'Nhatrang,Vietnam');
INSERT INTO `sw_shipping_ports` VALUES ('1056', 'Nhava Sheva,India', 'Nhava Sheva,India');
INSERT INTO `sw_shipping_ports` VALUES ('1057', 'Nigqura,India', 'Nigqura,India');
INSERT INTO `sw_shipping_ports` VALUES ('1058', 'Niigata,Japan', 'Niigata,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('1059', 'Ningbo,Zhejiang Province', 'Ningbo,Zhejiang Province');
INSERT INTO `sw_shipping_ports` VALUES ('1060', 'Ningde,Fujian Province', 'Ningde,Fujian Province');
INSERT INTO `sw_shipping_ports` VALUES ('1061', 'Niue,Cook Islands', 'Niue,Cook Islands');
INSERT INTO `sw_shipping_ports` VALUES ('1062', 'Nizhnevartovsk,Russia', 'Nizhnevartovsk,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('1063', 'Nizhny Novgorod,Russia', 'Nizhny Novgorod,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('1064', 'Nizhny Tagil,Russia', 'Nizhny Tagil,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('1065', 'Nogales,Mexico', 'Nogales,Mexico');
INSERT INTO `sw_shipping_ports` VALUES ('1066', 'Norfolk,Virginia', 'Norfolk,Virginia');
INSERT INTO `sw_shipping_ports` VALUES ('1067', 'Noro,Solomon Islands', 'Noro,Solomon Islands');
INSERT INTO `sw_shipping_ports` VALUES ('1068', 'Norrkoping,Sweden', 'Norrkoping,Sweden');
INSERT INTO `sw_shipping_ports` VALUES ('1069', 'Northlake,United States', 'Northlake,United States');
INSERT INTO `sw_shipping_ports` VALUES ('1070', 'Nossi-Be,Madagascar', 'Nossi-Be,Madagascar');
INSERT INTO `sw_shipping_ports` VALUES ('1071', 'Nosy Be,Madagascar', 'Nosy Be,Madagascar');
INSERT INTO `sw_shipping_ports` VALUES ('1072', 'Nottingham,U.K.', 'Nottingham,U.K.');
INSERT INTO `sw_shipping_ports` VALUES ('1073', 'Nouadhibou,Mauritania', 'Nouadhibou,Mauritania');
INSERT INTO `sw_shipping_ports` VALUES ('1074', 'Nouakchott,Mauritania', 'Nouakchott,Mauritania');
INSERT INTO `sw_shipping_ports` VALUES ('1075', 'Noumea,New Caledonia', 'Noumea,New Caledonia');
INSERT INTO `sw_shipping_ports` VALUES ('1076', 'Novgorod,Russia', 'Novgorod,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('1077', 'Novokuznetsk,Mexico', 'Novokuznetsk,Mexico');
INSERT INTO `sw_shipping_ports` VALUES ('1078', 'Novorossiysk,Russia', 'Novorossiysk,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('1079', 'Novorosyjsk,Russia', 'Novorosyjsk,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('1080', 'Novosibirsk,Russia', 'Novosibirsk,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('1081', 'Noyabrjsk,Russia', 'Noyabrjsk,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('1082', 'Nsict,India', 'Nsict,India');
INSERT INTO `sw_shipping_ports` VALUES ('1083', 'Nuernberg,Germany', 'Nuernberg,Germany');
INSERT INTO `sw_shipping_ports` VALUES ('1084', 'Nuevo Laredo,Mexico', 'Nuevo Laredo,Mexico');
INSERT INTO `sw_shipping_ports` VALUES ('1085', 'Nukualofa,Tonga', 'Nukualofa,Tonga');
INSERT INTO `sw_shipping_ports` VALUES ('1086', 'Oakland,California', 'Oakland,California');
INSERT INTO `sw_shipping_ports` VALUES ('1087', 'Oamaru,New Zealand', 'Oamaru,New Zealand');
INSERT INTO `sw_shipping_ports` VALUES ('1088', 'Odessa,Ukraine', 'Odessa,Ukraine');
INSERT INTO `sw_shipping_ports` VALUES ('1089', 'Oita,Japan', 'Oita,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('1090', 'Okinawa,Japan', 'Okinawa,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('1091', 'Omaezaki,Japan', 'Omaezaki,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('1092', 'Omaha,Nebraska', 'Omaha,Nebraska');
INSERT INTO `sw_shipping_ports` VALUES ('1093', 'Omsk,Russia', 'Omsk,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('1094', 'Onahama,Japan', 'Onahama,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('1095', 'Onne,Nigeria', 'Onne,Nigeria');
INSERT INTO `sw_shipping_ports` VALUES ('1096', 'Onsan,South Korea', 'Onsan,South Korea');
INSERT INTO `sw_shipping_ports` VALUES ('1097', 'Oporto,Portugal', 'Oporto,Portugal');
INSERT INTO `sw_shipping_ports` VALUES ('1098', 'Oran,Algeria', 'Oran,Algeria');
INSERT INTO `sw_shipping_ports` VALUES ('1099', 'Oranjestad,Aruba', 'Oranjestad,Aruba');
INSERT INTO `sw_shipping_ports` VALUES ('1100', 'Orlando,Florida', 'Orlando,Florida');
INSERT INTO `sw_shipping_ports` VALUES ('1101', 'Orleans,France', 'Orleans,France');
INSERT INTO `sw_shipping_ports` VALUES ('1102', 'Orobay,Papua New Guinea', 'Orobay,Papua New Guinea');
INSERT INTO `sw_shipping_ports` VALUES ('1103', 'Orsa,Russia', 'Orsa,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('1104', 'Orzea,Russia', 'Orzea,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('1105', 'Osaka,Japan', 'Osaka,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('1106', 'Osh,Kyrgyzstan', 'Osh,Kyrgyzstan');
INSERT INTO `sw_shipping_ports` VALUES ('1107', 'Oslo,Norway', 'Oslo,Norway');
INSERT INTO `sw_shipping_ports` VALUES ('1108', 'Otake,Japan', 'Otake,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('1109', 'Otalu,Japan', 'Otalu,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('1110', 'Otaru,Japan', 'Otaru,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('1111', 'Oxford,U.K.', 'Oxford,U.K.');
INSERT INTO `sw_shipping_ports` VALUES ('1112', 'Padang,Indonesia', 'Padang,Indonesia');
INSERT INTO `sw_shipping_ports` VALUES ('1113', 'Pagny,France', 'Pagny,France');
INSERT INTO `sw_shipping_ports` VALUES ('1114', 'Pago Pago,American Samoa', 'Pago Pago,American Samoa');
INSERT INTO `sw_shipping_ports` VALUES ('1115', 'Paita,Peru', 'Paita,Peru');
INSERT INTO `sw_shipping_ports` VALUES ('1116', 'Palembang,Indonesia', 'Palembang,Indonesia');
INSERT INTO `sw_shipping_ports` VALUES ('1117', 'Palermo,Italy', 'Palermo,Italy');
INSERT INTO `sw_shipping_ports` VALUES ('1118', 'Palmerston North,New Zealand', 'Palmerston North,New Zealand');
INSERT INTO `sw_shipping_ports` VALUES ('1119', 'Panama,Panama', 'Panama,Panama');
INSERT INTO `sw_shipping_ports` VALUES ('1120', 'Panama Canal,Panama', 'Panama Canal,Panama');
INSERT INTO `sw_shipping_ports` VALUES ('1121', 'Panama City,Panama', 'Panama City,Panama');
INSERT INTO `sw_shipping_ports` VALUES ('1122', 'Panjang,Indonesia', 'Panjang,Indonesia');
INSERT INTO `sw_shipping_ports` VALUES ('1123', 'Panyu,China', 'Panyu,China');
INSERT INTO `sw_shipping_ports` VALUES ('1124', 'Papeete,Tahiti', 'Papeete,Tahiti');
INSERT INTO `sw_shipping_ports` VALUES ('1125', 'Papsa,Panama', 'Papsa,Panama');
INSERT INTO `sw_shipping_ports` VALUES ('1126', 'Paramaribo,Surinam', 'Paramaribo,Surinam');
INSERT INTO `sw_shipping_ports` VALUES ('1127', 'Paranagua,Brazil', 'Paranagua,Brazil');
INSERT INTO `sw_shipping_ports` VALUES ('1128', 'Paris,France', 'Paris,France');
INSERT INTO `sw_shipping_ports` VALUES ('1129', 'Parma (Inland Point),Italy', 'Parma (Inland Point),Italy');
INSERT INTO `sw_shipping_ports` VALUES ('1130', 'Pasir Gudang,Malaysia', 'Pasir Gudang,Malaysia');
INSERT INTO `sw_shipping_ports` VALUES ('1131', 'Patparganj,India', 'Patparganj,India');
INSERT INTO `sw_shipping_ports` VALUES ('1132', 'Pavlodar,Kazakhstan', 'Pavlodar,Kazakhstan');
INSERT INTO `sw_shipping_ports` VALUES ('1133', 'Pearl River Delta,China', 'Pearl River Delta,China');
INSERT INTO `sw_shipping_ports` VALUES ('1134', 'Pecem,Brazil', 'Pecem,Brazil');
INSERT INTO `sw_shipping_ports` VALUES ('1135', 'Pekanbaru,Indonesia', 'Pekanbaru,Indonesia');
INSERT INTO `sw_shipping_ports` VALUES ('1136', 'Pemba,Mozambique', 'Pemba,Mozambique');
INSERT INTO `sw_shipping_ports` VALUES ('1137', 'Penang,Malaysia', 'Penang,Malaysia');
INSERT INTO `sw_shipping_ports` VALUES ('1138', 'Penghu,Guangdong Province', 'Penghu,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1139', 'Perm,Russia', 'Perm,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('1140', 'Perth,Australia', 'Perth,Australia');
INSERT INTO `sw_shipping_ports` VALUES ('1141', 'Peshawar,Pakistan', 'Peshawar,Pakistan');
INSERT INTO `sw_shipping_ports` VALUES ('1142', 'Petropavlosk,Russia', 'Petropavlosk,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('1143', 'Philadelphia,Pennsylvania', 'Philadelphia,Pennsylvania');
INSERT INTO `sw_shipping_ports` VALUES ('1144', 'Philipsburg,ST. Maarten', 'Philipsburg,ST. Maarten');
INSERT INTO `sw_shipping_ports` VALUES ('1145', 'Phnom Penh,Cambodia', 'Phnom Penh,Cambodia');
INSERT INTO `sw_shipping_ports` VALUES ('1146', 'Phoenix,United States', 'Phoenix,United States');
INSERT INTO `sw_shipping_ports` VALUES ('1147', 'Phuoc Long,Vietnam', 'Phuoc Long,Vietnam');
INSERT INTO `sw_shipping_ports` VALUES ('1148', 'Pilar,Argentina', 'Pilar,Argentina');
INSERT INTO `sw_shipping_ports` VALUES ('1149', 'Pinghai,Guangdong Province', 'Pinghai,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1150', 'Pingzhou,Hunan Province', 'Pingzhou,Hunan Province');
INSERT INTO `sw_shipping_ports` VALUES ('1151', 'Pipavav,India', 'Pipavav,India');
INSERT INTO `sw_shipping_ports` VALUES ('1152', 'Piraeus,Greece', 'Piraeus,Greece');
INSERT INTO `sw_shipping_ports` VALUES ('1153', 'Pisa,Italy', 'Pisa,Italy');
INSERT INTO `sw_shipping_ports` VALUES ('1154', 'Pittsburgh,Pennsylvania', 'Pittsburgh,Pennsylvania');
INSERT INTO `sw_shipping_ports` VALUES ('1155', 'Ploce,Croatia', 'Ploce,Croatia');
INSERT INTO `sw_shipping_ports` VALUES ('1156', 'Plymouth,Trinidad', 'Plymouth,Trinidad');
INSERT INTO `sw_shipping_ports` VALUES ('1157', 'Podgorica,Montenegro', 'Podgorica,Montenegro');
INSERT INTO `sw_shipping_ports` VALUES ('1158', 'Pohang,South Korea', 'Pohang,South Korea');
INSERT INTO `sw_shipping_ports` VALUES ('1159', 'Pohnpei,Micronesia Islands', 'Pohnpei,Micronesia Islands');
INSERT INTO `sw_shipping_ports` VALUES ('1160', 'Point A Pitre,Guadeloupe', 'Point A Pitre,Guadeloupe');
INSERT INTO `sw_shipping_ports` VALUES ('1161', 'Point Lisas,Trinidad', 'Point Lisas,Trinidad');
INSERT INTO `sw_shipping_ports` VALUES ('1162', 'Pointe Blanche,Caribbean', 'Pointe Blanche,Caribbean');
INSERT INTO `sw_shipping_ports` VALUES ('1163', 'Pointe Des Galets,Reunion Islands', 'Pointe Des Galets,Reunion Islands');
INSERT INTO `sw_shipping_ports` VALUES ('1164', 'Pointe Noire,Congo', 'Pointe Noire,Congo');
INSERT INTO `sw_shipping_ports` VALUES ('1165', 'Pointe-A-Pitre,Leeward Island', 'Pointe-A-Pitre,Leeward Island');
INSERT INTO `sw_shipping_ports` VALUES ('1166', 'Pomezia,Italy', 'Pomezia,Italy');
INSERT INTO `sw_shipping_ports` VALUES ('1167', 'Ponce,Puerto Rico', 'Ponce,Puerto Rico');
INSERT INTO `sw_shipping_ports` VALUES ('1168', 'Pontianak,Indonesia', 'Pontianak,Indonesia');
INSERT INTO `sw_shipping_ports` VALUES ('1169', 'Pori,Finland', 'Pori,Finland');
INSERT INTO `sw_shipping_ports` VALUES ('1170', 'Port Alma,Queensland', 'Port Alma,Queensland');
INSERT INTO `sw_shipping_ports` VALUES ('1171', 'Port Cabello,Venezuela', 'Port Cabello,Venezuela');
INSERT INTO `sw_shipping_ports` VALUES ('1172', 'Port Chalmers,New Zealand', 'Port Chalmers,New Zealand');
INSERT INTO `sw_shipping_ports` VALUES ('1173', 'Port Des Galets,Africa', 'Port Des Galets,Africa');
INSERT INTO `sw_shipping_ports` VALUES ('1174', 'Port Elizabeth,South Africa', 'Port Elizabeth,South Africa');
INSERT INTO `sw_shipping_ports` VALUES ('1175', 'Port Everglades,Florida', 'Port Everglades,Florida');
INSERT INTO `sw_shipping_ports` VALUES ('1176', 'Port Gentil,Gabon', 'Port Gentil,Gabon');
INSERT INTO `sw_shipping_ports` VALUES ('1177', 'Port Harcourt,Nigeria', 'Port Harcourt,Nigeria');
INSERT INTO `sw_shipping_ports` VALUES ('1178', 'Port Hedland,Australia', 'Port Hedland,Australia');
INSERT INTO `sw_shipping_ports` VALUES ('1179', 'Port Kasim,Pakistan', 'Port Kasim,Pakistan');
INSERT INTO `sw_shipping_ports` VALUES ('1180', 'Port Kembla,Australia', 'Port Kembla,Australia');
INSERT INTO `sw_shipping_ports` VALUES ('1181', 'Port Klang,Malaysia', 'Port Klang,Malaysia');
INSERT INTO `sw_shipping_ports` VALUES ('1182', 'Port Klang (North),Malaysia', 'Port Klang (North),Malaysia');
INSERT INTO `sw_shipping_ports` VALUES ('1183', 'Port Klang (West),Malaysia', 'Port Klang (West),Malaysia');
INSERT INTO `sw_shipping_ports` VALUES ('1184', 'Port Limon,Costa Rica', 'Port Limon,Costa Rica');
INSERT INTO `sw_shipping_ports` VALUES ('1185', 'Port Lisas,Panama', 'Port Lisas,Panama');
INSERT INTO `sw_shipping_ports` VALUES ('1186', 'Port Louis,Mauritius Is.', 'Port Louis,Mauritius Is.');
INSERT INTO `sw_shipping_ports` VALUES ('1187', 'Port Moresby,Papua New Guinea', 'Port Moresby,Papua New Guinea');
INSERT INTO `sw_shipping_ports` VALUES ('1188', 'Port Muhammad Bin Qasim,India', 'Port Muhammad Bin Qasim,India');
INSERT INTO `sw_shipping_ports` VALUES ('1189', 'Port Noire,Congo', 'Port Noire,Congo');
INSERT INTO `sw_shipping_ports` VALUES ('1190', 'Port of Spain,Trinidad', 'Port of Spain,Trinidad');
INSERT INTO `sw_shipping_ports` VALUES ('1191', 'Port Pirie,South Australia', 'Port Pirie,South Australia');
INSERT INTO `sw_shipping_ports` VALUES ('1192', 'Port Qasim,Pakistan', 'Port Qasim,Pakistan');
INSERT INTO `sw_shipping_ports` VALUES ('1193', 'Port Rashid,United Arab Emirates', 'Port Rashid,United Arab Emirates');
INSERT INTO `sw_shipping_ports` VALUES ('1194', 'Port Reunion,South Africa', 'Port Reunion,South Africa');
INSERT INTO `sw_shipping_ports` VALUES ('1195', 'Port Said,Egypt', 'Port Said,Egypt');
INSERT INTO `sw_shipping_ports` VALUES ('1196', 'Port Sousse,Tunisia', 'Port Sousse,Tunisia');
INSERT INTO `sw_shipping_ports` VALUES ('1197', 'Port Sudan,Sudan', 'Port Sudan,Sudan');
INSERT INTO `sw_shipping_ports` VALUES ('1198', 'Port Suez,Egypt', 'Port Suez,Egypt');
INSERT INTO `sw_shipping_ports` VALUES ('1199', 'Port Sultan Qaboos,Oman', 'Port Sultan Qaboos,Oman');
INSERT INTO `sw_shipping_ports` VALUES ('1200', 'Port Victoria,East Africa', 'Port Victoria,East Africa');
INSERT INTO `sw_shipping_ports` VALUES ('1201', 'Port Vila,Vanuatu', 'Port Vila,Vanuatu');
INSERT INTO `sw_shipping_ports` VALUES ('1202', 'Port-Au-Prince,Haiti', 'Port-Au-Prince,Haiti');
INSERT INTO `sw_shipping_ports` VALUES ('1203', 'Portland,Oregon', 'Portland,Oregon');
INSERT INTO `sw_shipping_ports` VALUES ('1204', 'Porto,Portugal', 'Porto,Portugal');
INSERT INTO `sw_shipping_ports` VALUES ('1205', 'Porto Alegre,Brazil', 'Porto Alegre,Brazil');
INSERT INTO `sw_shipping_ports` VALUES ('1206', 'Portsmouth,Virginia', 'Portsmouth,Virginia');
INSERT INTO `sw_shipping_ports` VALUES ('1207', 'Poti,Georgia', 'Poti,Georgia');
INSERT INTO `sw_shipping_ports` VALUES ('1208', 'Potianak,Indonesia', 'Potianak,Indonesia');
INSERT INTO `sw_shipping_ports` VALUES ('1209', 'Poznan,Poland', 'Poznan,Poland');
INSERT INTO `sw_shipping_ports` VALUES ('1210', 'Prague,Czech Republic', 'Prague,Czech Republic');
INSERT INTO `sw_shipping_ports` VALUES ('1211', 'Praia,Cape Varde', 'Praia,Cape Varde');
INSERT INTO `sw_shipping_ports` VALUES ('1212', 'Praia Mole,Brazil', 'Praia Mole,Brazil');
INSERT INTO `sw_shipping_ports` VALUES ('1213', 'Prato (Inland Point),Italy', 'Prato (Inland Point),Italy');
INSERT INTO `sw_shipping_ports` VALUES ('1214', 'Pretoria,Mozambique', 'Pretoria,Mozambique');
INSERT INTO `sw_shipping_ports` VALUES ('1215', 'Prince Rupert,Canada', 'Prince Rupert,Canada');
INSERT INTO `sw_shipping_ports` VALUES ('1216', 'Prishtina,Serbia', 'Prishtina,Serbia');
INSERT INTO `sw_shipping_ports` VALUES ('1217', 'Pristina,Kosovo', 'Pristina,Kosovo');
INSERT INTO `sw_shipping_ports` VALUES ('1218', 'Progreso,Mexico', 'Progreso,Mexico');
INSERT INTO `sw_shipping_ports` VALUES ('1219', 'Providence,Kentucky', 'Providence,Kentucky');
INSERT INTO `sw_shipping_ports` VALUES ('1220', 'Provinciales,Provinciales', 'Provinciales,Provinciales');
INSERT INTO `sw_shipping_ports` VALUES ('1221', 'Pskov,Russia', 'Pskov,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('1222', 'Pudong,Jiangsu Province', 'Pudong,Jiangsu Province');
INSERT INTO `sw_shipping_ports` VALUES ('1223', 'Pudong,Shanghai', 'Pudong,Shanghai');
INSERT INTO `sw_shipping_ports` VALUES ('1224', 'Puerto Angamos,Peru', 'Puerto Angamos,Peru');
INSERT INTO `sw_shipping_ports` VALUES ('1225', 'Puerto Armuelles,Panama', 'Puerto Armuelles,Panama');
INSERT INTO `sw_shipping_ports` VALUES ('1226', 'Puerto Bolivar,Colombia', 'Puerto Bolivar,Colombia');
INSERT INTO `sw_shipping_ports` VALUES ('1227', 'Puerto Cabello,Venezuela', 'Puerto Cabello,Venezuela');
INSERT INTO `sw_shipping_ports` VALUES ('1228', 'Puerto Caldera,Costa Rica', 'Puerto Caldera,Costa Rica');
INSERT INTO `sw_shipping_ports` VALUES ('1229', 'Puerto Coronel,Chile', 'Puerto Coronel,Chile');
INSERT INTO `sw_shipping_ports` VALUES ('1230', 'Puerto Cortes,Honduras', 'Puerto Cortes,Honduras');
INSERT INTO `sw_shipping_ports` VALUES ('1231', 'Puerto Limon,Costa Rica', 'Puerto Limon,Costa Rica');
INSERT INTO `sw_shipping_ports` VALUES ('1232', 'Puerto Madryn,Argentina', 'Puerto Madryn,Argentina');
INSERT INTO `sw_shipping_ports` VALUES ('1233', 'Puerto Moin,United States', 'Puerto Moin,United States');
INSERT INTO `sw_shipping_ports` VALUES ('1234', 'Puerto Montt,Chile', 'Puerto Montt,Chile');
INSERT INTO `sw_shipping_ports` VALUES ('1235', 'Puerto Morelos,Mexico', 'Puerto Morelos,Mexico');
INSERT INTO `sw_shipping_ports` VALUES ('1236', 'Puerto Plata,Dominican Republic', 'Puerto Plata,Dominican Republic');
INSERT INTO `sw_shipping_ports` VALUES ('1237', 'Puerto Quetzal (San Jose),Guatemala', 'Puerto Quetzal (San Jose),Guatemala');
INSERT INTO `sw_shipping_ports` VALUES ('1238', 'Puerto Sucre,Venezuela', 'Puerto Sucre,Venezuela');
INSERT INTO `sw_shipping_ports` VALUES ('1239', 'Puinhon,Vietnam', 'Puinhon,Vietnam');
INSERT INTO `sw_shipping_ports` VALUES ('1240', 'Pune,India', 'Pune,India');
INSERT INTO `sw_shipping_ports` VALUES ('1241', 'Puning,Guangdong Province', 'Puning,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1242', 'Punta Arenas,Chile', 'Punta Arenas,Chile');
INSERT INTO `sw_shipping_ports` VALUES ('1243', 'Puntarenas,Costa Rica', 'Puntarenas,Costa Rica');
INSERT INTO `sw_shipping_ports` VALUES ('1244', 'Puqi,Zhejiang Province', 'Puqi,Zhejiang Province');
INSERT INTO `sw_shipping_ports` VALUES ('1245', 'Putian,Fujian Province', 'Putian,Fujian Province');
INSERT INTO `sw_shipping_ports` VALUES ('1246', 'Pyeongtaek,South Korea', 'Pyeongtaek,South Korea');
INSERT INTO `sw_shipping_ports` VALUES ('1247', 'Pyong Yang,North Korea', 'Pyong Yang,North Korea');
INSERT INTO `sw_shipping_ports` VALUES ('1248', 'Qesim Island,United Arab Emirates', 'Qesim Island,United Arab Emirates');
INSERT INTO `sw_shipping_ports` VALUES ('1249', 'Qingdao,Shandong Province', 'Qingdao,Shandong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1250', 'Qingpu,Shanghai', 'Qingpu,Shanghai');
INSERT INTO `sw_shipping_ports` VALUES ('1251', 'Qingyuan,Guangdong Province', 'Qingyuan,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1252', 'Qinhuangdao,Hebei Province', 'Qinhuangdao,Hebei Province');
INSERT INTO `sw_shipping_ports` VALUES ('1253', 'Qinzhou,Guangxi Province', 'Qinzhou,Guangxi Province');
INSERT INTO `sw_shipping_ports` VALUES ('1254', 'Quang Ninh,Vietnam', 'Quang Ninh,Vietnam');
INSERT INTO `sw_shipping_ports` VALUES ('1255', 'Quanzhou,Fujian Province', 'Quanzhou,Fujian Province');
INSERT INTO `sw_shipping_ports` VALUES ('1256', 'Quelimane,Mozambique', 'Quelimane,Mozambique');
INSERT INTO `sw_shipping_ports` VALUES ('1257', 'Queretaro,Mexico', 'Queretaro,Mexico');
INSERT INTO `sw_shipping_ports` VALUES ('1258', 'Quertaro,Mexico', 'Quertaro,Mexico');
INSERT INTO `sw_shipping_ports` VALUES ('1259', 'Quezaltenango,Guatemala', 'Quezaltenango,Guatemala');
INSERT INTO `sw_shipping_ports` VALUES ('1260', 'Quinhon,Vietnam', 'Quinhon,Vietnam');
INSERT INTO `sw_shipping_ports` VALUES ('1261', 'Quito,Ecuador', 'Quito,Ecuador');
INSERT INTO `sw_shipping_ports` VALUES ('1262', 'Quzai,Lebanon', 'Quzai,Lebanon');
INSERT INTO `sw_shipping_ports` VALUES ('1263', 'Quzhou,Zhejiang Province', 'Quzhou,Zhejiang Province');
INSERT INTO `sw_shipping_ports` VALUES ('1264', 'Rabaul,Papua New Guinea', 'Rabaul,Papua New Guinea');
INSERT INTO `sw_shipping_ports` VALUES ('1265', 'Radom,Poland', 'Radom,Poland');
INSERT INTO `sw_shipping_ports` VALUES ('1266', 'Rajin,North Korea', 'Rajin,North Korea');
INSERT INTO `sw_shipping_ports` VALUES ('1267', 'Raleigh,North Carolina', 'Raleigh,North Carolina');
INSERT INTO `sw_shipping_ports` VALUES ('1268', 'Rarotonga,Cook Islands', 'Rarotonga,Cook Islands');
INSERT INTO `sw_shipping_ports` VALUES ('1269', 'Ras Lanuf,Libya', 'Ras Lanuf,Libya');
INSERT INTO `sw_shipping_ports` VALUES ('1270', 'Rauma,Finland', 'Rauma,Finland');
INSERT INTO `sw_shipping_ports` VALUES ('1271', 'Ravenna,Italy', 'Ravenna,Italy');
INSERT INTO `sw_shipping_ports` VALUES ('1272', 'Rayong,Thailand', 'Rayong,Thailand');
INSERT INTO `sw_shipping_ports` VALUES ('1273', 'Recife,Brazil', 'Recife,Brazil');
INSERT INTO `sw_shipping_ports` VALUES ('1274', 'Regina,Italy', 'Regina,Italy');
INSERT INTO `sw_shipping_ports` VALUES ('1275', 'Reunion,Reunion Islands', 'Reunion,Reunion Islands');
INSERT INTO `sw_shipping_ports` VALUES ('1276', 'Reykjavik,Iceland', 'Reykjavik,Iceland');
INSERT INTO `sw_shipping_ports` VALUES ('1277', 'Richards Bay,South Africa', 'Richards Bay,South Africa');
INSERT INTO `sw_shipping_ports` VALUES ('1278', 'Richmond,Virginia', 'Richmond,Virginia');
INSERT INTO `sw_shipping_ports` VALUES ('1279', 'Ried,Austria', 'Ried,Austria');
INSERT INTO `sw_shipping_ports` VALUES ('1280', 'Riga,Latvia', 'Riga,Latvia');
INSERT INTO `sw_shipping_ports` VALUES ('1281', 'Rijeka,Croatia', 'Rijeka,Croatia');
INSERT INTO `sw_shipping_ports` VALUES ('1282', 'Rio de Janeiro,Brazil', 'Rio de Janeiro,Brazil');
INSERT INTO `sw_shipping_ports` VALUES ('1283', 'Rio Grande,Brazil', 'Rio Grande,Brazil');
INSERT INTO `sw_shipping_ports` VALUES ('1284', 'Rio Grande (A),Argentina', 'Rio Grande (A),Argentina');
INSERT INTO `sw_shipping_ports` VALUES ('1285', 'Rio Grande Do Sul,Brazil', 'Rio Grande Do Sul,Brazil');
INSERT INTO `sw_shipping_ports` VALUES ('1286', 'Rio Haina,Dominican Republic', 'Rio Haina,Dominican Republic');
INSERT INTO `sw_shipping_ports` VALUES ('1287', 'Riyadh,Saudi Arabia', 'Riyadh,Saudi Arabia');
INSERT INTO `sw_shipping_ports` VALUES ('1288', 'Rizhao,Shandong Province', 'Rizhao,Shandong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1289', 'Roadtown,Tortola', 'Roadtown,Tortola');
INSERT INTO `sw_shipping_ports` VALUES ('1290', 'Roanne,France', 'Roanne,France');
INSERT INTO `sw_shipping_ports` VALUES ('1291', 'Rochelle,United States', 'Rochelle,United States');
INSERT INTO `sw_shipping_ports` VALUES ('1292', 'Rodman,Panama', 'Rodman,Panama');
INSERT INTO `sw_shipping_ports` VALUES ('1293', 'Roenoe,Denmark', 'Roenoe,Denmark');
INSERT INTO `sw_shipping_ports` VALUES ('1294', 'Rome,Italy', 'Rome,Italy');
INSERT INTO `sw_shipping_ports` VALUES ('1295', 'Rongqi,Guangdong Province', 'Rongqi,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1296', 'Rosario,Argentina', 'Rosario,Argentina');
INSERT INTO `sw_shipping_ports` VALUES ('1297', 'Rosarito,Mexico', 'Rosarito,Mexico');
INSERT INTO `sw_shipping_ports` VALUES ('1298', 'Roseau,Dominica', 'Roseau,Dominica');
INSERT INTO `sw_shipping_ports` VALUES ('1299', 'Rostock,Germany', 'Rostock,Germany');
INSERT INTO `sw_shipping_ports` VALUES ('1300', 'Rostov,Georgia', 'Rostov,Georgia');
INSERT INTO `sw_shipping_ports` VALUES ('1301', 'Rotorua,New Zealand', 'Rotorua,New Zealand');
INSERT INTO `sw_shipping_ports` VALUES ('1302', 'Rotterdam,Netherlands', 'Rotterdam,Netherlands');
INSERT INTO `sw_shipping_ports` VALUES ('1303', 'Rouen,France', 'Rouen,France');
INSERT INTO `sw_shipping_ports` VALUES ('1304', 'Rovno,Russia', 'Rovno,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('1305', 'Rudong,Jiangsu Province', 'Rudong,Jiangsu Province');
INSERT INTO `sw_shipping_ports` VALUES ('1306', 'Ruian,Zhejiang Province', 'Ruian,Zhejiang Province');
INSERT INTO `sw_shipping_ports` VALUES ('1307', 'Russe,Bulgaria', 'Russe,Bulgaria');
INSERT INTO `sw_shipping_ports` VALUES ('1308', 'Russia,Russia', 'Russia,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('1309', 'Rwanda,Africa', 'Rwanda,Africa');
INSERT INTO `sw_shipping_ports` VALUES ('1310', 'Ryazanj,Russia', 'Ryazanj,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('1311', 'Rzeszow,Poland', 'Rzeszow,Poland');
INSERT INTO `sw_shipping_ports` VALUES ('1312', 'S. Vicente,Cape Varde', 'S. Vicente,Cape Varde');
INSERT INTO `sw_shipping_ports` VALUES ('1313', 'Sacramento,California', 'Sacramento,California');
INSERT INTO `sw_shipping_ports` VALUES ('1314', 'Saint-Etienne,France', 'Saint-Etienne,France');
INSERT INTO `sw_shipping_ports` VALUES ('1315', 'Saipan,Marina Islands', 'Saipan,Marina Islands');
INSERT INTO `sw_shipping_ports` VALUES ('1316', 'Sakaiminato,Japan', 'Sakaiminato,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('1317', 'Sakaisenboku,Japan', 'Sakaisenboku,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('1318', 'Sakata,Japan', 'Sakata,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('1319', 'Sakhalin,Russia', 'Sakhalin,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('1320', 'Salalah,Oman', 'Salalah,Oman');
INSERT INTO `sw_shipping_ports` VALUES ('1321', 'Salerno,Italy', 'Salerno,Italy');
INSERT INTO `sw_shipping_ports` VALUES ('1322', 'Salina Cruz,Mexico', 'Salina Cruz,Mexico');
INSERT INTO `sw_shipping_ports` VALUES ('1323', 'Salomague,Philippines', 'Salomague,Philippines');
INSERT INTO `sw_shipping_ports` VALUES ('1324', 'Salonica,Greece', 'Salonica,Greece');
INSERT INTO `sw_shipping_ports` VALUES ('1325', 'Salonika,Tanzania', 'Salonika,Tanzania');
INSERT INTO `sw_shipping_ports` VALUES ('1326', 'Salt Lake City,United States', 'Salt Lake City,United States');
INSERT INTO `sw_shipping_ports` VALUES ('1327', 'Salvador,Brazil', 'Salvador,Brazil');
INSERT INTO `sw_shipping_ports` VALUES ('1328', 'Salzburg,Austria', 'Salzburg,Austria');
INSERT INTO `sw_shipping_ports` VALUES ('1329', 'Samara,Russia', 'Samara,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('1330', 'Samarinda,Indonesia', 'Samarinda,Indonesia');
INSERT INTO `sw_shipping_ports` VALUES ('1331', 'Samarkand,Russia', 'Samarkand,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('1332', 'Sambeimen,Guangdong Province', 'Sambeimen,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1333', 'Samsun,Turkey', 'Samsun,Turkey');
INSERT INTO `sw_shipping_ports` VALUES ('1334', 'San Antonio,Chile', 'San Antonio,Chile');
INSERT INTO `sw_shipping_ports` VALUES ('1335', 'San Antonio (TX),Texas', 'San Antonio (TX),Texas');
INSERT INTO `sw_shipping_ports` VALUES ('1336', 'San Diego,California', 'San Diego,California');
INSERT INTO `sw_shipping_ports` VALUES ('1337', 'San Felix,Chile', 'San Felix,Chile');
INSERT INTO `sw_shipping_ports` VALUES ('1338', 'San Francisco,California', 'San Francisco,California');
INSERT INTO `sw_shipping_ports` VALUES ('1339', 'San Jose,Costa Rica', 'San Jose,Costa Rica');
INSERT INTO `sw_shipping_ports` VALUES ('1340', 'San Juan,Puerto Rico', 'San Juan,Puerto Rico');
INSERT INTO `sw_shipping_ports` VALUES ('1341', 'San Lorenzo,Honduras', 'San Lorenzo,Honduras');
INSERT INTO `sw_shipping_ports` VALUES ('1342', 'San Luis Colorado,Colorado', 'San Luis Colorado,Colorado');
INSERT INTO `sw_shipping_ports` VALUES ('1343', 'San Luis Potosi,Mexico', 'San Luis Potosi,Mexico');
INSERT INTO `sw_shipping_ports` VALUES ('1344', 'San Pedro,Argentina', 'San Pedro,Argentina');
INSERT INTO `sw_shipping_ports` VALUES ('1345', 'San Pedro Sula,Honduras', 'San Pedro Sula,Honduras');
INSERT INTO `sw_shipping_ports` VALUES ('1346', 'San Salvador,Republic of El Salvador', 'San Salvador,Republic of El Salvador');
INSERT INTO `sw_shipping_ports` VALUES ('1347', 'San Vicente,Chile', 'San Vicente,Chile');
INSERT INTO `sw_shipping_ports` VALUES ('1348', 'Sana,Yemen', 'Sana,Yemen');
INSERT INTO `sw_shipping_ports` VALUES ('1349', 'Sanbeimen,Guangdong Province', 'Sanbeimen,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1350', 'Sanbu,Guangdong Province', 'Sanbu,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1351', 'Sandakan, Sabah,Malaysia', 'Sandakan, Sabah,Malaysia');
INSERT INTO `sw_shipping_ports` VALUES ('1352', 'Sanrong,Guangdong Province', 'Sanrong,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1353', 'Sanshan,Guangdong Province', 'Sanshan,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1354', 'Sanshui,Guangdong Province', 'Sanshui,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1355', 'Santa Cruz de Tenerife,Canary Islands', 'Santa Cruz de Tenerife,Canary Islands');
INSERT INTO `sw_shipping_ports` VALUES ('1356', 'Santa Marta,Colombia', 'Santa Marta,Colombia');
INSERT INTO `sw_shipping_ports` VALUES ('1357', 'Santiago,Chile', 'Santiago,Chile');
INSERT INTO `sw_shipping_ports` VALUES ('1358', 'Santo,Vanuatu', 'Santo,Vanuatu');
INSERT INTO `sw_shipping_ports` VALUES ('1359', 'Santo Domingo,Dominican Republic', 'Santo Domingo,Dominican Republic');
INSERT INTO `sw_shipping_ports` VALUES ('1360', 'Santo Tomas de Castilla,Guatemala', 'Santo Tomas de Castilla,Guatemala');
INSERT INTO `sw_shipping_ports` VALUES ('1361', 'Santos,Brazil', 'Santos,Brazil');
INSERT INTO `sw_shipping_ports` VALUES ('1362', 'Sanya,Hainan Province', 'Sanya,Hainan Province');
INSERT INTO `sw_shipping_ports` VALUES ('1363', 'Sao Francisco Do Sul,Brazil', 'Sao Francisco Do Sul,Brazil');
INSERT INTO `sw_shipping_ports` VALUES ('1364', 'Sao Paulo,Brazil', 'Sao Paulo,Brazil');
INSERT INTO `sw_shipping_ports` VALUES ('1365', 'Sao Tome,Western Africa', 'Sao Tome,Western Africa');
INSERT INTO `sw_shipping_ports` VALUES ('1366', 'Sarajevo,Bosnia Hercegovina', 'Sarajevo,Bosnia Hercegovina');
INSERT INTO `sw_shipping_ports` VALUES ('1367', 'Sarikei,Malaysia', 'Sarikei,Malaysia');
INSERT INTO `sw_shipping_ports` VALUES ('1368', 'Saskatoon,Canada', 'Saskatoon,Canada');
INSERT INTO `sw_shipping_ports` VALUES ('1369', 'Savador Bahia,Brazil', 'Savador Bahia,Brazil');
INSERT INTO `sw_shipping_ports` VALUES ('1370', 'Savannah,Georgia', 'Savannah,Georgia');
INSERT INTO `sw_shipping_ports` VALUES ('1371', 'Savannakhet,laos', 'Savannakhet,laos');
INSERT INTO `sw_shipping_ports` VALUES ('1372', 'Savona,Italy', 'Savona,Italy');
INSERT INTO `sw_shipping_ports` VALUES ('1373', 'Savu Savu,Fiji Island', 'Savu Savu,Fiji Island');
INSERT INTO `sw_shipping_ports` VALUES ('1374', 'Seattle,Washington', 'Seattle,Washington');
INSERT INTO `sw_shipping_ports` VALUES ('1375', 'Segoro,Indonesia', 'Segoro,Indonesia');
INSERT INTO `sw_shipping_ports` VALUES ('1376', 'Semarang,Indonesia', 'Semarang,Indonesia');
INSERT INTO `sw_shipping_ports` VALUES ('1377', 'Senboku,Japan', 'Senboku,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('1378', 'Sendai,Japan', 'Sendai,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('1379', 'Sens,France', 'Sens,France');
INSERT INTO `sw_shipping_ports` VALUES ('1380', 'Seoul,South Korea', 'Seoul,South Korea');
INSERT INTO `sw_shipping_ports` VALUES ('1381', 'Sepetiba,Brazil', 'Sepetiba,Brazil');
INSERT INTO `sw_shipping_ports` VALUES ('1382', 'Sete,France', 'Sete,France');
INSERT INTO `sw_shipping_ports` VALUES ('1383', 'Setubal,Portugal', 'Setubal,Portugal');
INSERT INTO `sw_shipping_ports` VALUES ('1384', 'Sevastopol,Russia', 'Sevastopol,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('1385', 'Seward,Alaska', 'Seward,Alaska');
INSERT INTO `sw_shipping_ports` VALUES ('1386', 'Sfax,Tunisia', 'Sfax,Tunisia');
INSERT INTO `sw_shipping_ports` VALUES ('1387', 'Shahid Rajaee,Iran', 'Shahid Rajaee,Iran');
INSERT INTO `sw_shipping_ports` VALUES ('1388', 'Shangchuan Dao,China', 'Shangchuan Dao,China');
INSERT INTO `sw_shipping_ports` VALUES ('1389', 'Shangdong,Shandong Province', 'Shangdong,Shandong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1390', 'Shanghai,China', 'Shanghai,China');
INSERT INTO `sw_shipping_ports` VALUES ('1391', 'Shangqiu,Henan Province', 'Shangqiu,Henan Province');
INSERT INTO `sw_shipping_ports` VALUES ('1392', 'Shantou,Guangdong Province', 'Shantou,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1393', 'Shanwei,Guangdong Province', 'Shanwei,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1394', 'Shaoguan,Guangdong Province', 'Shaoguan,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1395', 'Shaoxing,Zhejiang Province', 'Shaoxing,Zhejiang Province');
INSERT INTO `sw_shipping_ports` VALUES ('1396', 'Sharjah,United Arab Emirates', 'Sharjah,United Arab Emirates');
INSERT INTO `sw_shipping_ports` VALUES ('1397', 'Shashi,Hubei Province', 'Shashi,Hubei Province');
INSERT INTO `sw_shipping_ports` VALUES ('1398', 'Shatian,Guangdong Province', 'Shatian,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1399', 'Sheerness,U.K.', 'Sheerness,U.K.');
INSERT INTO `sw_shipping_ports` VALUES ('1400', 'Shekou,Guangdong Province', 'Shekou,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1401', 'Shenwan,Guangdong Province', 'Shenwan,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1402', 'Shenyang,Liaoning Province', 'Shenyang,Liaoning Province');
INSERT INTO `sw_shipping_ports` VALUES ('1403', 'Shenzhen,Guangdong Province', 'Shenzhen,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1404', 'Shibushi,Japan', 'Shibushi,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('1405', 'Shidao,Shandong Province', 'Shidao,Shandong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1406', 'Shijiazhuang,Hebei Province', 'Shijiazhuang,Hebei Province');
INSERT INTO `sw_shipping_ports` VALUES ('1407', 'Shiliugang,Guangdong Province', 'Shiliugang,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1408', 'Shima,Japan', 'Shima,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('1409', 'Shimizu,Japan', 'Shimizu,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('1410', 'Shimonoseki,Japan', 'Shimonoseki,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('1411', 'Shiqi,Guangdong Province', 'Shiqi,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1412', 'Shiqiao (Pan Yu),Guangdong Province', 'Shiqiao (Pan Yu),Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1413', 'Shishi,Fujian Province', 'Shishi,Fujian Province');
INSERT INTO `sw_shipping_ports` VALUES ('1414', 'Shitang,Guangdong Province', 'Shitang,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1415', 'Shiwan,Guangdong Province', 'Shiwan,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1416', 'Shuaibah,Kuwait', 'Shuaibah,Kuwait');
INSERT INTO `sw_shipping_ports` VALUES ('1417', 'Shuidong,Guangdong Province', 'Shuidong,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1418', 'Shuikou,Guangdong Province', 'Shuikou,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1419', 'Shunde,Guangdong Province', 'Shunde,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1420', 'Shuwaikh,Kuwait', 'Shuwaikh,Kuwait');
INSERT INTO `sw_shipping_ports` VALUES ('1421', 'Sialkot,Pakistan', 'Sialkot,Pakistan');
INSERT INTO `sw_shipping_ports` VALUES ('1422', 'Siam,Thailand', 'Siam,Thailand');
INSERT INTO `sw_shipping_ports` VALUES ('1423', 'Sibu, Sarawak,Malaysia', 'Sibu, Sarawak,Malaysia');
INSERT INTO `sw_shipping_ports` VALUES ('1424', 'Sichuan,Sichuan Province', 'Sichuan,Sichuan Province');
INSERT INTO `sw_shipping_ports` VALUES ('1425', 'Sihanoukville,Cambodia', 'Sihanoukville,Cambodia');
INSERT INTO `sw_shipping_ports` VALUES ('1426', 'Sihui,Guangdong Province', 'Sihui,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1427', 'Sines,Portugal', 'Sines,Portugal');
INSERT INTO `sw_shipping_ports` VALUES ('1428', 'Singapore,Singapore', 'Singapore,Singapore');
INSERT INTO `sw_shipping_ports` VALUES ('1429', 'Sipitang,Malaysia', 'Sipitang,Malaysia');
INSERT INTO `sw_shipping_ports` VALUES ('1430', 'Skikda,Algeria', 'Skikda,Algeria');
INSERT INTO `sw_shipping_ports` VALUES ('1431', 'Skopje,Macedonia', 'Skopje,Macedonia');
INSERT INTO `sw_shipping_ports` VALUES ('1432', 'Smolensk,Russia', 'Smolensk,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('1433', 'Sochi,Russia', 'Sochi,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('1434', 'Socola,Romania', 'Socola,Romania');
INSERT INTO `sw_shipping_ports` VALUES ('1435', 'Sofia,Bulgaria', 'Sofia,Bulgaria');
INSERT INTO `sw_shipping_ports` VALUES ('1436', 'Sohar,Oman', 'Sohar,Oman');
INSERT INTO `sw_shipping_ports` VALUES ('1437', 'Sokhna,Egypt', 'Sokhna,Egypt');
INSERT INTO `sw_shipping_ports` VALUES ('1438', 'Somalia,Africa', 'Somalia,Africa');
INSERT INTO `sw_shipping_ports` VALUES ('1439', 'Songkhla,Thailand', 'Songkhla,Thailand');
INSERT INTO `sw_shipping_ports` VALUES ('1440', 'Sousse,Tunisia', 'Sousse,Tunisia');
INSERT INTO `sw_shipping_ports` VALUES ('1441', 'South Caicos,Turks & Caicos', 'South Caicos,Turks & Caicos');
INSERT INTO `sw_shipping_ports` VALUES ('1442', 'South Shields,U.K.', 'South Shields,U.K.');
INSERT INTO `sw_shipping_ports` VALUES ('1443', 'Southampton,U.K.', 'Southampton,U.K.');
INSERT INTO `sw_shipping_ports` VALUES ('1444', 'Sovgavanj,Russia', 'Sovgavanj,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('1445', 'Soyo,Angola', 'Soyo,Angola');
INSERT INTO `sw_shipping_ports` VALUES ('1446', 'Sparrow Point,Maryland', 'Sparrow Point,Maryland');
INSERT INTO `sw_shipping_ports` VALUES ('1447', 'Split,Croatia', 'Split,Croatia');
INSERT INTO `sw_shipping_ports` VALUES ('1448', 'Sri Racha (Bangkok),Thailand', 'Sri Racha (Bangkok),Thailand');
INSERT INTO `sw_shipping_ports` VALUES ('1449', 'St. Barthelemy,Guadeloupe', 'St. Barthelemy,Guadeloupe');
INSERT INTO `sw_shipping_ports` VALUES ('1450', 'St. Croix,Virgin Islands', 'St. Croix,Virgin Islands');
INSERT INTO `sw_shipping_ports` VALUES ('1451', 'St. Domingo,United States', 'St. Domingo,United States');
INSERT INTO `sw_shipping_ports` VALUES ('1452', 'St. George\'s,Grenada', 'St. George\'s,Grenada');
INSERT INTO `sw_shipping_ports` VALUES ('1453', 'St. Johns,Antigua', 'St. Johns,Antigua');
INSERT INTO `sw_shipping_ports` VALUES ('1454', 'St. Louis,Missouri', 'St. Louis,Missouri');
INSERT INTO `sw_shipping_ports` VALUES ('1455', 'St. Lucia,West Indies', 'St. Lucia,West Indies');
INSERT INTO `sw_shipping_ports` VALUES ('1456', 'St. Maarten,Caribbean', 'St. Maarten,Caribbean');
INSERT INTO `sw_shipping_ports` VALUES ('1457', 'St. Petersburg,Russia', 'St. Petersburg,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('1458', 'St. Polten,Austria', 'St. Polten,Austria');
INSERT INTO `sw_shipping_ports` VALUES ('1459', 'St. Thomas,Virgin Islands', 'St. Thomas,Virgin Islands');
INSERT INTO `sw_shipping_ports` VALUES ('1460', 'Stockholm,Sweden', 'Stockholm,Sweden');
INSERT INTO `sw_shipping_ports` VALUES ('1461', 'Stockton,California', 'Stockton,California');
INSERT INTO `sw_shipping_ports` VALUES ('1462', 'Stoughton,United States', 'Stoughton,United States');
INSERT INTO `sw_shipping_ports` VALUES ('1463', 'Stuttgart,Germany', 'Stuttgart,Germany');
INSERT INTO `sw_shipping_ports` VALUES ('1464', 'Su Wan Na Kaed,Vietnam', 'Su Wan Na Kaed,Vietnam');
INSERT INTO `sw_shipping_ports` VALUES ('1465', 'Suape,Brazil', 'Suape,Brazil');
INSERT INTO `sw_shipping_ports` VALUES ('1466', 'Subic Bay,Philippines', 'Subic Bay,Philippines');
INSERT INTO `sw_shipping_ports` VALUES ('1467', 'Suez Canal,Egypt', 'Suez Canal,Egypt');
INSERT INTO `sw_shipping_ports` VALUES ('1468', 'Suigang,Hunan Province', 'Suigang,Hunan Province');
INSERT INTO `sw_shipping_ports` VALUES ('1469', 'Sukhna,Egypt', 'Sukhna,Egypt');
INSERT INTO `sw_shipping_ports` VALUES ('1470', 'Surabaya,Indonesia', 'Surabaya,Indonesia');
INSERT INTO `sw_shipping_ports` VALUES ('1471', 'Surat,India', 'Surat,India');
INSERT INTO `sw_shipping_ports` VALUES ('1472', 'Surgut,Russia', 'Surgut,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('1473', 'Suva,Fiji Island', 'Suva,Fiji Island');
INSERT INTO `sw_shipping_ports` VALUES ('1474', 'Suzhou,Jiangsu Province', 'Suzhou,Jiangsu Province');
INSERT INTO `sw_shipping_ports` VALUES ('1475', 'Svobodny,Russia', 'Svobodny,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('1476', 'Swaziland,Africa', 'Swaziland,Africa');
INSERT INTO `sw_shipping_ports` VALUES ('1477', 'Sydney,Australia', 'Sydney,Australia');
INSERT INTO `sw_shipping_ports` VALUES ('1478', 'Szczecin,Poland', 'Szczecin,Poland');
INSERT INTO `sw_shipping_ports` VALUES ('1479', 'Ta Kaek,Vietnam', 'Ta Kaek,Vietnam');
INSERT INTO `sw_shipping_ports` VALUES ('1480', 'Ta Na Lang,Vietnam', 'Ta Na Lang,Vietnam');
INSERT INTO `sw_shipping_ports` VALUES ('1481', 'Tacoma,Washington', 'Tacoma,Washington');
INSERT INTO `sw_shipping_ports` VALUES ('1482', 'Taicang,Jiangsu Province', 'Taicang,Jiangsu Province');
INSERT INTO `sw_shipping_ports` VALUES ('1483', 'Taichung,Taiwan', 'Taichung,Taiwan');
INSERT INTO `sw_shipping_ports` VALUES ('1484', 'Taijiang,Fujian Province', 'Taijiang,Fujian Province');
INSERT INTO `sw_shipping_ports` VALUES ('1485', 'Taipei,Taiwan', 'Taipei,Taiwan');
INSERT INTO `sw_shipping_ports` VALUES ('1486', 'Taiping,Guangdong Province', 'Taiping,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1487', 'Taishan,Guangdong Province', 'Taishan,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1488', 'Taiwan,Taiwan', 'Taiwan,Taiwan');
INSERT INTO `sw_shipping_ports` VALUES ('1489', 'Taiyuan,Shanxi Province', 'Taiyuan,Shanxi Province');
INSERT INTO `sw_shipping_ports` VALUES ('1490', 'Taizhou,Zhejiang Province', 'Taizhou,Zhejiang Province');
INSERT INTO `sw_shipping_ports` VALUES ('1491', 'Takamatsu,Japan', 'Takamatsu,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('1492', 'Takoradi,Ghana', 'Takoradi,Ghana');
INSERT INTO `sw_shipping_ports` VALUES ('1493', 'Talcahuano,Chile', 'Talcahuano,Chile');
INSERT INTO `sw_shipping_ports` VALUES ('1494', 'Taldykorgan,Kazakhstan', 'Taldykorgan,Kazakhstan');
INSERT INTO `sw_shipping_ports` VALUES ('1495', 'Tallinn,Estonia', 'Tallinn,Estonia');
INSERT INTO `sw_shipping_ports` VALUES ('1496', 'Tamatave,Madagascar', 'Tamatave,Madagascar');
INSERT INTO `sw_shipping_ports` VALUES ('1497', 'Tampa,Florida', 'Tampa,Florida');
INSERT INTO `sw_shipping_ports` VALUES ('1498', 'Tampere,Finland', 'Tampere,Finland');
INSERT INTO `sw_shipping_ports` VALUES ('1499', 'Tampico,Mexico', 'Tampico,Mexico');
INSERT INTO `sw_shipping_ports` VALUES ('1500', 'Tancang,Vietnam', 'Tancang,Vietnam');
INSERT INTO `sw_shipping_ports` VALUES ('1501', 'Tanga,Tanzania', 'Tanga,Tanzania');
INSERT INTO `sw_shipping_ports` VALUES ('1502', 'Tanger-Med,Morocco', 'Tanger-Med,Morocco');
INSERT INTO `sw_shipping_ports` VALUES ('1503', 'Tanggu,Tianjin', 'Tanggu,Tianjin');
INSERT INTO `sw_shipping_ports` VALUES ('1504', 'Tangier,Morocco', 'Tangier,Morocco');
INSERT INTO `sw_shipping_ports` VALUES ('1505', 'Tangshan,Hebei Province', 'Tangshan,Hebei Province');
INSERT INTO `sw_shipping_ports` VALUES ('1506', 'Tanjung Emas,Indonesia', 'Tanjung Emas,Indonesia');
INSERT INTO `sw_shipping_ports` VALUES ('1507', 'Tanjung Manis,Malaysia', 'Tanjung Manis,Malaysia');
INSERT INTO `sw_shipping_ports` VALUES ('1508', 'Tanjung Pelepas,Malaysia', 'Tanjung Pelepas,Malaysia');
INSERT INTO `sw_shipping_ports` VALUES ('1509', 'Tao Yuan,Taiwan', 'Tao Yuan,Taiwan');
INSERT INTO `sw_shipping_ports` VALUES ('1510', 'Taranto,Italy', 'Taranto,Italy');
INSERT INTO `sw_shipping_ports` VALUES ('1511', 'Tarawa,Kirbati', 'Tarawa,Kirbati');
INSERT INTO `sw_shipping_ports` VALUES ('1512', 'Tarnobrzeg,Poland', 'Tarnobrzeg,Poland');
INSERT INTO `sw_shipping_ports` VALUES ('1513', 'Tarragona,Spain', 'Tarragona,Spain');
INSERT INTO `sw_shipping_ports` VALUES ('1514', 'Tartous,Syria', 'Tartous,Syria');
INSERT INTO `sw_shipping_ports` VALUES ('1515', 'Tashkent,Uzbekistan', 'Tashkent,Uzbekistan');
INSERT INTO `sw_shipping_ports` VALUES ('1516', 'Tauranga,New Zealand', 'Tauranga,New Zealand');
INSERT INTO `sw_shipping_ports` VALUES ('1517', 'Tawau,Malaysia', 'Tawau,Malaysia');
INSERT INTO `sw_shipping_ports` VALUES ('1518', 'Tbilisi,Georgia', 'Tbilisi,Georgia');
INSERT INTO `sw_shipping_ports` VALUES ('1519', 'Tcbuen,Colombia', 'Tcbuen,Colombia');
INSERT INTO `sw_shipping_ports` VALUES ('1520', 'Tecate,Mexico', 'Tecate,Mexico');
INSERT INTO `sw_shipping_ports` VALUES ('1521', 'Teesport,U.K.', 'Teesport,U.K.');
INSERT INTO `sw_shipping_ports` VALUES ('1522', 'Tegucigalpa,Honduras', 'Tegucigalpa,Honduras');
INSERT INTO `sw_shipping_ports` VALUES ('1523', 'Tehran,Iran', 'Tehran,Iran');
INSERT INTO `sw_shipping_ports` VALUES ('1524', 'Tekirdag,Turkey', 'Tekirdag,Turkey');
INSERT INTO `sw_shipping_ports` VALUES ('1525', 'Tel Aviv,Israel', 'Tel Aviv,Israel');
INSERT INTO `sw_shipping_ports` VALUES ('1526', 'Tema,Ghana', 'Tema,Ghana');
INSERT INTO `sw_shipping_ports` VALUES ('1527', 'Tenerife,Canary Islands', 'Tenerife,Canary Islands');
INSERT INTO `sw_shipping_ports` VALUES ('1528', 'Teplice,Czech Republic', 'Teplice,Czech Republic');
INSERT INTO `sw_shipping_ports` VALUES ('1529', 'Tequcigalpa,Honduras', 'Tequcigalpa,Honduras');
INSERT INTO `sw_shipping_ports` VALUES ('1530', 'Terespol,Poland', 'Terespol,Poland');
INSERT INTO `sw_shipping_ports` VALUES ('1531', 'Terport,Paraguay', 'Terport,Paraguay');
INSERT INTO `sw_shipping_ports` VALUES ('1532', 'Thamesport,U.K.', 'Thamesport,U.K.');
INSERT INTO `sw_shipping_ports` VALUES ('1533', 'The Valley,Anguilla', 'The Valley,Anguilla');
INSERT INTO `sw_shipping_ports` VALUES ('1534', 'Thessaloniki,Greece', 'Thessaloniki,Greece');
INSERT INTO `sw_shipping_ports` VALUES ('1535', 'Tijuana,Mexico', 'Tijuana,Mexico');
INSERT INTO `sw_shipping_ports` VALUES ('1536', 'Tilbury,U.K.', 'Tilbury,U.K.');
INSERT INTO `sw_shipping_ports` VALUES ('1537', 'Timaru,New Zealand', 'Timaru,New Zealand');
INSERT INTO `sw_shipping_ports` VALUES ('1538', 'Tincan,Nigeria', 'Tincan,Nigeria');
INSERT INTO `sw_shipping_ports` VALUES ('1539', 'Tinian,Micronesia Islands', 'Tinian,Micronesia Islands');
INSERT INTO `sw_shipping_ports` VALUES ('1540', 'Tirana,Albania', 'Tirana,Albania');
INSERT INTO `sw_shipping_ports` VALUES ('1541', 'Toamasina,Madagascar', 'Toamasina,Madagascar');
INSERT INTO `sw_shipping_ports` VALUES ('1542', 'Tobruk,Africa', 'Tobruk,Africa');
INSERT INTO `sw_shipping_ports` VALUES ('1543', 'Togliatti,Russia', 'Togliatti,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('1544', 'Tokmak,Kyrgyzstan', 'Tokmak,Kyrgyzstan');
INSERT INTO `sw_shipping_ports` VALUES ('1545', 'Tokushima,Japan', 'Tokushima,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('1546', 'Tokuyama,Japan', 'Tokuyama,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('1547', 'Tokyo,Japan', 'Tokyo,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('1548', 'Toljati,Russia', 'Toljati,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('1549', 'Tomakomai,Japan', 'Tomakomai,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('1550', 'Tomsk,Russia', 'Tomsk,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('1551', 'Tongan,Fujian Province', 'Tongan,Fujian Province');
INSERT INTO `sw_shipping_ports` VALUES ('1552', 'Tonglin,Anhui Province', 'Tonglin,Anhui Province');
INSERT INTO `sw_shipping_ports` VALUES ('1553', 'Tonglu,Zhejiang Province', 'Tonglu,Zhejiang Province');
INSERT INTO `sw_shipping_ports` VALUES ('1554', 'Tongshen,Hubei Province', 'Tongshen,Hubei Province');
INSERT INTO `sw_shipping_ports` VALUES ('1555', 'Torghundi,Afghanistan', 'Torghundi,Afghanistan');
INSERT INTO `sw_shipping_ports` VALUES ('1556', 'Toronto,Ontario', 'Toronto,Ontario');
INSERT INTO `sw_shipping_ports` VALUES ('1557', 'Torres Strait,Australia', 'Torres Strait,Australia');
INSERT INTO `sw_shipping_ports` VALUES ('1558', 'Torun,Poland', 'Torun,Poland');
INSERT INTO `sw_shipping_ports` VALUES ('1559', 'Tosu,Japan', 'Tosu,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('1560', 'Townsville,Australia', 'Townsville,Australia');
INSERT INTO `sw_shipping_ports` VALUES ('1561', 'Toyama,Japan', 'Toyama,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('1562', 'Toyamashiniko,Japan', 'Toyamashiniko,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('1563', 'Toyohashi,Japan', 'Toyohashi,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('1564', 'Toytepa,Uzbekistan', 'Toytepa,Uzbekistan');
INSERT INTO `sw_shipping_ports` VALUES ('1565', 'Trabzon,Turkey', 'Trabzon,Turkey');
INSERT INTO `sw_shipping_ports` VALUES ('1566', 'Trieste,Italy', 'Trieste,Italy');
INSERT INTO `sw_shipping_ports` VALUES ('1567', 'Trinidad,Caribbean', 'Trinidad,Caribbean');
INSERT INTO `sw_shipping_ports` VALUES ('1568', 'Tripoli,Libya', 'Tripoli,Libya');
INSERT INTO `sw_shipping_ports` VALUES ('1569', 'Trizt,Turkey', 'Trizt,Turkey');
INSERT INTO `sw_shipping_ports` VALUES ('1570', 'Troyes,France', 'Troyes,France');
INSERT INTO `sw_shipping_ports` VALUES ('1571', 'Truk,Marina Islands', 'Truk,Marina Islands');
INSERT INTO `sw_shipping_ports` VALUES ('1572', 'Tsuruga,Japan', 'Tsuruga,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('1573', 'Tulear,Madagascar', 'Tulear,Madagascar');
INSERT INTO `sw_shipping_ports` VALUES ('1574', 'Tumen,Jilin Province', 'Tumen,Jilin Province');
INSERT INTO `sw_shipping_ports` VALUES ('1575', 'Tunis,Tunisia', 'Tunis,Tunisia');
INSERT INTO `sw_shipping_ports` VALUES ('1576', 'Turgundi,Russia', 'Turgundi,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('1577', 'Turku,Finland', 'Turku,Finland');
INSERT INTO `sw_shipping_ports` VALUES ('1578', 'Tuticorin,India', 'Tuticorin,India');
INSERT INTO `sw_shipping_ports` VALUES ('1579', 'Tynda,Russia', 'Tynda,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('1580', 'Tyumen,Russia', 'Tyumen,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('1581', 'Ube,Japan', 'Ube,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('1582', 'Ufa,Russia', 'Ufa,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('1583', 'Ujung Pandang,Indonesia', 'Ujung Pandang,Indonesia');
INSERT INTO `sw_shipping_ports` VALUES ('1584', 'Ulaan Baatar,Mongolia', 'Ulaan Baatar,Mongolia');
INSERT INTO `sw_shipping_ports` VALUES ('1585', 'Ulan Ude,Russia', 'Ulan Ude,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('1586', 'Uljanovsk,Russia', 'Uljanovsk,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('1587', 'Ulm,Germany', 'Ulm,Germany');
INSERT INTO `sw_shipping_ports` VALUES ('1588', 'Ulsan,South Korea', 'Ulsan,South Korea');
INSERT INTO `sw_shipping_ports` VALUES ('1589', 'Um-Alqsar,Iran', 'Um-Alqsar,Iran');
INSERT INTO `sw_shipping_ports` VALUES ('1590', 'Umm Qasr,Iraq', 'Umm Qasr,Iraq');
INSERT INTO `sw_shipping_ports` VALUES ('1591', 'Uralsk,Kazakhstan', 'Uralsk,Kazakhstan');
INSERT INTO `sw_shipping_ports` VALUES ('1592', 'Urumqi,Xinjiang Province', 'Urumqi,Xinjiang Province');
INSERT INTO `sw_shipping_ports` VALUES ('1593', 'Ushuaia,Argentina', 'Ushuaia,Argentina');
INSERT INTO `sw_shipping_ports` VALUES ('1594', 'Ussuryisk,Russia', 'Ussuryisk,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('1595', 'Ust-Kamenogorsk,Kazakhstan', 'Ust-Kamenogorsk,Kazakhstan');
INSERT INTO `sw_shipping_ports` VALUES ('1596', 'Vainikkala,Finland', 'Vainikkala,Finland');
INSERT INTO `sw_shipping_ports` VALUES ('1597', 'Valence,France', 'Valence,France');
INSERT INTO `sw_shipping_ports` VALUES ('1598', 'Valencia,Spain', 'Valencia,Spain');
INSERT INTO `sw_shipping_ports` VALUES ('1599', 'Valletta,Malta', 'Valletta,Malta');
INSERT INTO `sw_shipping_ports` VALUES ('1600', 'Valparaiso,Chile', 'Valparaiso,Chile');
INSERT INTO `sw_shipping_ports` VALUES ('1601', 'Vancouver,British Columbia', 'Vancouver,British Columbia');
INSERT INTO `sw_shipping_ports` VALUES ('1602', 'Vanino,Russia', 'Vanino,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('1603', 'Varna,Bulgaria', 'Varna,Bulgaria');
INSERT INTO `sw_shipping_ports` VALUES ('1604', 'Vavau,Tonga', 'Vavau,Tonga');
INSERT INTO `sw_shipping_ports` VALUES ('1605', 'Venezia,Italy', 'Venezia,Italy');
INSERT INTO `sw_shipping_ports` VALUES ('1606', 'Venice,Italy', 'Venice,Italy');
INSERT INTO `sw_shipping_ports` VALUES ('1607', 'Vennica,Russia', 'Vennica,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('1608', 'Vera Cruz,Mexico', 'Vera Cruz,Mexico');
INSERT INTO `sw_shipping_ports` VALUES ('1609', 'Verino,Russia', 'Verino,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('1610', 'Vernon,United States', 'Vernon,United States');
INSERT INTO `sw_shipping_ports` VALUES ('1611', 'Vesoul,France', 'Vesoul,France');
INSERT INTO `sw_shipping_ports` VALUES ('1612', 'Vict,Vietnam', 'Vict,Vietnam');
INSERT INTO `sw_shipping_ports` VALUES ('1613', 'Victoria,Argentina', 'Victoria,Argentina');
INSERT INTO `sw_shipping_ports` VALUES ('1614', 'Victoria (E.Africa),Seychelles', 'Victoria (E.Africa),Seychelles');
INSERT INTO `sw_shipping_ports` VALUES ('1615', 'Vienna,Austria', 'Vienna,Austria');
INSERT INTO `sw_shipping_ports` VALUES ('1616', 'Vientiane,laos', 'Vientiane,laos');
INSERT INTO `sw_shipping_ports` VALUES ('1617', 'Vieux Fort,Guadeloupe', 'Vieux Fort,Guadeloupe');
INSERT INTO `sw_shipping_ports` VALUES ('1618', 'Vigo,Spain', 'Vigo,Spain');
INSERT INTO `sw_shipping_ports` VALUES ('1619', 'Vila,Vanuatu', 'Vila,Vanuatu');
INSERT INTO `sw_shipping_ports` VALUES ('1620', 'Vila Do Conde,Brazil', 'Vila Do Conde,Brazil');
INSERT INTO `sw_shipping_ports` VALUES ('1621', 'Villa Nueva,Honduras', 'Villa Nueva,Honduras');
INSERT INTO `sw_shipping_ports` VALUES ('1622', 'Vilnius,Lithuania', 'Vilnius,Lithuania');
INSERT INTO `sw_shipping_ports` VALUES ('1623', 'Virgin Gorda,Caribbean', 'Virgin Gorda,Caribbean');
INSERT INTO `sw_shipping_ports` VALUES ('1624', 'Visakhapatnam,India', 'Visakhapatnam,India');
INSERT INTO `sw_shipping_ports` VALUES ('1625', 'Vitebsk,Russia', 'Vitebsk,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('1626', 'Vitoria,Brazil', 'Vitoria,Brazil');
INSERT INTO `sw_shipping_ports` VALUES ('1627', 'Vizag,India', 'Vizag,India');
INSERT INTO `sw_shipping_ports` VALUES ('1628', 'Vladivostok,Russia', 'Vladivostok,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('1629', 'Vohemar,Madagascar', 'Vohemar,Madagascar');
INSERT INTO `sw_shipping_ports` VALUES ('1630', 'Volgogard,Russia', 'Volgogard,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('1631', 'Vologda,Russia', 'Vologda,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('1632', 'Volos,Greece', 'Volos,Greece');
INSERT INTO `sw_shipping_ports` VALUES ('1633', 'Voltri,Italy', 'Voltri,Italy');
INSERT INTO `sw_shipping_ports` VALUES ('1634', 'Voronez,Russia', 'Voronez,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('1635', 'Vostochny,Russia', 'Vostochny,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('1636', 'Vungtau,Vietnam', 'Vungtau,Vietnam');
INSERT INTO `sw_shipping_ports` VALUES ('1637', 'Wai Gao Qiao,Shanghai', 'Wai Gao Qiao,Shanghai');
INSERT INTO `sw_shipping_ports` VALUES ('1638', 'Wakayama,Japan', 'Wakayama,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('1639', 'Wallis/Futuna,Micronesia Islands', 'Wallis/Futuna,Micronesia Islands');
INSERT INTO `sw_shipping_ports` VALUES ('1640', 'Walvis Bay,Namiba', 'Walvis Bay,Namiba');
INSERT INTO `sw_shipping_ports` VALUES ('1641', 'Wanganui,New Zealand', 'Wanganui,New Zealand');
INSERT INTO `sw_shipping_ports` VALUES ('1642', 'Wanzai (Zhuhai),Guangdong Province', 'Wanzai (Zhuhai),Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1643', 'Warren,Ohio', 'Warren,Ohio');
INSERT INTO `sw_shipping_ports` VALUES ('1644', 'Warri,Nigeria', 'Warri,Nigeria');
INSERT INTO `sw_shipping_ports` VALUES ('1645', 'Warsaw,Poland', 'Warsaw,Poland');
INSERT INTO `sw_shipping_ports` VALUES ('1646', 'Wasilla,Alaska', 'Wasilla,Alaska');
INSERT INTO `sw_shipping_ports` VALUES ('1647', 'Weifang,Shandong Province', 'Weifang,Shandong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1648', 'Weihai,Shandong Province', 'Weihai,Shandong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1649', 'Weitou,Fujian Province', 'Weitou,Fujian Province');
INSERT INTO `sw_shipping_ports` VALUES ('1650', 'Wellington,New Zealand', 'Wellington,New Zealand');
INSERT INTO `sw_shipping_ports` VALUES ('1651', 'Wenzhou,Zhejiang Province', 'Wenzhou,Zhejiang Province');
INSERT INTO `sw_shipping_ports` VALUES ('1652', 'West Palm Beach,Florida', 'West Palm Beach,Florida');
INSERT INTO `sw_shipping_ports` VALUES ('1653', 'Wewak,Papua New Guinea', 'Wewak,Papua New Guinea');
INSERT INTO `sw_shipping_ports` VALUES ('1654', 'Whangarei,New Zealand', 'Whangarei,New Zealand');
INSERT INTO `sw_shipping_ports` VALUES ('1655', 'Whitestown,United States', 'Whitestown,United States');
INSERT INTO `sw_shipping_ports` VALUES ('1656', 'Wilhelmshaven,Germany', 'Wilhelmshaven,Germany');
INSERT INTO `sw_shipping_ports` VALUES ('1657', 'Willemstad,Netherlands Antilles', 'Willemstad,Netherlands Antilles');
INSERT INTO `sw_shipping_ports` VALUES ('1658', 'Wilmington,North Carolina', 'Wilmington,North Carolina');
INSERT INTO `sw_shipping_ports` VALUES ('1659', 'Winnipeg,Canada', 'Winnipeg,Canada');
INSERT INTO `sw_shipping_ports` VALUES ('1660', 'Wloclawek,Poland', 'Wloclawek,Poland');
INSERT INTO `sw_shipping_ports` VALUES ('1661', 'Wolow,Poland', 'Wolow,Poland');
INSERT INTO `sw_shipping_ports` VALUES ('1662', 'Wroclaw,Poland', 'Wroclaw,Poland');
INSERT INTO `sw_shipping_ports` VALUES ('1663', 'Wuchun,Guangdong Province', 'Wuchun,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1664', 'Wuhan,Hubei Province', 'Wuhan,Hubei Province');
INSERT INTO `sw_shipping_ports` VALUES ('1665', 'Wuhu,Anhui Province', 'Wuhu,Anhui Province');
INSERT INTO `sw_shipping_ports` VALUES ('1666', 'Wujiang,Jiangsu Province', 'Wujiang,Jiangsu Province');
INSERT INTO `sw_shipping_ports` VALUES ('1667', 'Wulumuqi,Xinjiang Province', 'Wulumuqi,Xinjiang Province');
INSERT INTO `sw_shipping_ports` VALUES ('1668', 'Wumen,Zhejiang Province', 'Wumen,Zhejiang Province');
INSERT INTO `sw_shipping_ports` VALUES ('1669', 'Wuxi,Jiangsu Province', 'Wuxi,Jiangsu Province');
INSERT INTO `sw_shipping_ports` VALUES ('1670', 'Wuzhou,Guangxi Province', 'Wuzhou,Guangxi Province');
INSERT INTO `sw_shipping_ports` VALUES ('1671', 'Xanshi,China', 'Xanshi,China');
INSERT INTO `sw_shipping_ports` VALUES ('1672', 'Xiamen,Fujian Province', 'Xiamen,Fujian Province');
INSERT INTO `sw_shipping_ports` VALUES ('1673', 'Xian,Shaanxi Province', 'Xian,Shaanxi Province');
INSERT INTO `sw_shipping_ports` VALUES ('1674', 'Xiandria,China', 'Xiandria,China');
INSERT INTO `sw_shipping_ports` VALUES ('1675', 'Xiangtan,Hunan Province', 'Xiangtan,Hunan Province');
INSERT INTO `sw_shipping_ports` VALUES ('1676', 'Xiangyu,Xiamen', 'Xiangyu,Xiamen');
INSERT INTO `sw_shipping_ports` VALUES ('1677', 'Xiangzhou,Guangdong Province', 'Xiangzhou,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1678', 'Xianyang,Shaanxi Province', 'Xianyang,Shaanxi Province');
INSERT INTO `sw_shipping_ports` VALUES ('1679', 'Xiao Cuo,Fujian Province', 'Xiao Cuo,Fujian Province');
INSERT INTO `sw_shipping_ports` VALUES ('1680', 'Xiaogan,Hubei Province', 'Xiaogan,Hubei Province');
INSERT INTO `sw_shipping_ports` VALUES ('1681', 'Xiaohudao,Guangdong Province', 'Xiaohudao,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1682', 'Xiaolan (Shi Qi),Guangdong Province', 'Xiaolan (Shi Qi),Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1683', 'Xiaoshan,Zhejiang Province', 'Xiaoshan,Zhejiang Province');
INSERT INTO `sw_shipping_ports` VALUES ('1684', 'Xin Sha,Guangdong Province', 'Xin Sha,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1685', 'Xinfeng,Guangdong Province', 'Xinfeng,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1686', 'Xingang,Tianjin', 'Xingang,Tianjin');
INSERT INTO `sw_shipping_ports` VALUES ('1687', 'Xinhui,Guangdong Province', 'Xinhui,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1688', 'Xining,Qinghai Province', 'Xining,Qinghai Province');
INSERT INTO `sw_shipping_ports` VALUES ('1689', 'Xintang,Guangdong Province', 'Xintang,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1690', 'Xinyou,Fujian Province', 'Xinyou,Fujian Province');
INSERT INTO `sw_shipping_ports` VALUES ('1691', 'Xiuhui,Guangdong Province', 'Xiuhui,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1692', 'Xiuyu,Liaoning Province', 'Xiuyu,Liaoning Province');
INSERT INTO `sw_shipping_ports` VALUES ('1693', 'Xuchang,Henan Province', 'Xuchang,Henan Province');
INSERT INTO `sw_shipping_ports` VALUES ('1694', 'Xuzhou,Jiangsu Province', 'Xuzhou,Jiangsu Province');
INSERT INTO `sw_shipping_ports` VALUES ('1695', 'Yakusk,Russia', 'Yakusk,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('1696', 'Yangjiang,Guangdong Province', 'Yangjiang,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1697', 'Yangon,Burma', 'Yangon,Burma');
INSERT INTO `sw_shipping_ports` VALUES ('1698', 'Yangpu,Hainan Province', 'Yangpu,Hainan Province');
INSERT INTO `sw_shipping_ports` VALUES ('1699', 'Yangshan,Shanghai', 'Yangshan,Shanghai');
INSERT INTO `sw_shipping_ports` VALUES ('1700', 'Yangzhou,Jiangsu Province', 'Yangzhou,Jiangsu Province');
INSERT INTO `sw_shipping_ports` VALUES ('1701', 'Yantai,Shandong Province', 'Yantai,Shandong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1702', 'Yantian,Guangdong Province', 'Yantian,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1703', 'Yap,Micronesia Islands', 'Yap,Micronesia Islands');
INSERT INTO `sw_shipping_ports` VALUES ('1704', 'Yarimca,Turkey', 'Yarimca,Turkey');
INSERT INTO `sw_shipping_ports` VALUES ('1705', 'Yatsushiro,Japan', 'Yatsushiro,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('1706', 'Yawata,Japan', 'Yawata,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('1707', 'Yckaterinburg,Russia', 'Yckaterinburg,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('1708', 'Yeochon,South Korea', 'Yeochon,South Korea');
INSERT INTO `sw_shipping_ports` VALUES ('1709', 'Yeosu,South Korea', 'Yeosu,South Korea');
INSERT INTO `sw_shipping_ports` VALUES ('1710', 'Yeravan,Armenia', 'Yeravan,Armenia');
INSERT INTO `sw_shipping_ports` VALUES ('1711', 'Yi Chang,Hubei Province', 'Yi Chang,Hubei Province');
INSERT INTO `sw_shipping_ports` VALUES ('1712', 'Yibin,Sichuan Province', 'Yibin,Sichuan Province');
INSERT INTO `sw_shipping_ports` VALUES ('1713', 'Yinchuan,Ningxia Province', 'Yinchuan,Ningxia Province');
INSERT INTO `sw_shipping_ports` VALUES ('1714', 'Yingkou,Liaoning Province', 'Yingkou,Liaoning Province');
INSERT INTO `sw_shipping_ports` VALUES ('1715', 'Yiwu,Zhejiang Province', 'Yiwu,Zhejiang Province');
INSERT INTO `sw_shipping_ports` VALUES ('1716', 'Yixing,Jiangsu Province', 'Yixing,Jiangsu Province');
INSERT INTO `sw_shipping_ports` VALUES ('1717', 'Yokkaichi,Japan', 'Yokkaichi,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('1718', 'Yokohama,Japan', 'Yokohama,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('1719', 'Yokosuka,Japan', 'Yokosuka,Japan');
INSERT INTO `sw_shipping_ports` VALUES ('1720', 'Yueyang,Hunan Province', 'Yueyang,Hunan Province');
INSERT INTO `sw_shipping_ports` VALUES ('1721', 'Yunfu,Guangdong Province', 'Yunfu,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1722', 'Yunnan,Sichuan Province', 'Yunnan,Sichuan Province');
INSERT INTO `sw_shipping_ports` VALUES ('1723', 'Yuyao,Zhejiang Province', 'Yuyao,Zhejiang Province');
INSERT INTO `sw_shipping_ports` VALUES ('1724', 'Zabaykalsk,Russia', 'Zabaykalsk,Russia');
INSERT INTO `sw_shipping_ports` VALUES ('1725', 'Zagreb,Croatia', 'Zagreb,Croatia');
INSERT INTO `sw_shipping_ports` VALUES ('1726', 'Zahony,Hungary', 'Zahony,Hungary');
INSERT INTO `sw_shipping_ports` VALUES ('1727', 'Zambia,Africa', 'Zambia,Africa');
INSERT INTO `sw_shipping_ports` VALUES ('1728', 'Zamboanga,Philippines', 'Zamboanga,Philippines');
INSERT INTO `sw_shipping_ports` VALUES ('1729', 'Zanzibar,Tanzania', 'Zanzibar,Tanzania');
INSERT INTO `sw_shipping_ports` VALUES ('1730', 'Zarate,Argentina', 'Zarate,Argentina');
INSERT INTO `sw_shipping_ports` VALUES ('1731', 'Zarqa Free Zone,Jordan', 'Zarqa Free Zone,Jordan');
INSERT INTO `sw_shipping_ports` VALUES ('1732', 'Zashita,Kazakhstan', 'Zashita,Kazakhstan');
INSERT INTO `sw_shipping_ports` VALUES ('1733', 'Zeebrugge,Belgium', 'Zeebrugge,Belgium');
INSERT INTO `sw_shipping_ports` VALUES ('1734', 'Zha Pu,Zhejiang Province', 'Zha Pu,Zhejiang Province');
INSERT INTO `sw_shipping_ports` VALUES ('1735', 'Zhangjiagang,Jiangsu Province', 'Zhangjiagang,Jiangsu Province');
INSERT INTO `sw_shipping_ports` VALUES ('1736', 'Zhangjiakou,Jiangsu Province', 'Zhangjiakou,Jiangsu Province');
INSERT INTO `sw_shipping_ports` VALUES ('1737', 'Zhangzhou,Fujian Province', 'Zhangzhou,Fujian Province');
INSERT INTO `sw_shipping_ports` VALUES ('1738', 'Zhanjiang,Guangdong Province', 'Zhanjiang,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1739', 'Zhaogang,China', 'Zhaogang,China');
INSERT INTO `sw_shipping_ports` VALUES ('1740', 'Zhaoqing,Guangdong Province', 'Zhaoqing,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1741', 'Zhaoqing New Port,Guangdong Province', 'Zhaoqing New Port,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1742', 'Zhengzhou,Henan Province', 'Zhengzhou,Henan Province');
INSERT INTO `sw_shipping_ports` VALUES ('1743', 'Zhenjiang,Jiangsu Province', 'Zhenjiang,Jiangsu Province');
INSERT INTO `sw_shipping_ports` VALUES ('1744', 'Zhenping,Henan Province', 'Zhenping,Henan Province');
INSERT INTO `sw_shipping_ports` VALUES ('1745', 'Zhezkazgan,Kazakhstan', 'Zhezkazgan,Kazakhstan');
INSERT INTO `sw_shipping_ports` VALUES ('1746', 'Zhizhudao,Guangdong Province', 'Zhizhudao,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1747', 'Zhongshan,Guangdong Province', 'Zhongshan,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1748', 'Zhongxinzhou,Guangdong Province', 'Zhongxinzhou,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1749', 'Zhoushan,Zhejiang Province', 'Zhoushan,Zhejiang Province');
INSERT INTO `sw_shipping_ports` VALUES ('1750', 'Zhoutouzui,Guangdong Province', 'Zhoutouzui,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1751', 'Zhuhai,Guangdong Province', 'Zhuhai,Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1752', 'Zhuhai Port (Gaolan),Guangdong Province', 'Zhuhai Port (Gaolan),Guangdong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1753', 'Zhuzhou,Hunan Province', 'Zhuzhou,Hunan Province');
INSERT INTO `sw_shipping_ports` VALUES ('1754', 'Zibo,Shandong Province', 'Zibo,Shandong Province');
INSERT INTO `sw_shipping_ports` VALUES ('1755', 'Zimbabwe,Africa', 'Zimbabwe,Africa');
INSERT INTO `sw_shipping_ports` VALUES ('1756', 'Zlin,Belgium', 'Zlin,Belgium');
INSERT INTO `sw_shipping_ports` VALUES ('1757', 'Zurich,Switzerland', 'Zurich,Switzerland');

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
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
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
INSERT INTO `sw_user` VALUES ('1', 'ahmed.hany@acmesaico.com', '$2y$10$GTE.kQQaBfHU./mtbJucw.qNTa1ZZ2xwH.XmbTufrhWpuM.RZaGgC', '1', '1', 'DODkljCen1h1JjtsQUpvYiOZMqcHKGlhNCEHIbP64VT3gP50s1QAY9f1EYrc', '2018-02-23 20:42:12', '2018-02-23 23:30:53', '0.00', null, '');
INSERT INTO `sw_user` VALUES ('5', 'Ali.makram@jet.com', '$2y$10$GTE.kQQaBfHU./mtbJucw.qNTa1ZZ2xwH.XmbTufrhWpuM.RZaGgC', '1', '3', 'ovf0cRgIS2M59y03EeKY3vMtgAmZvT08kWXZmsTSPnuzj68aMmRtR6q0rqNs', null, '2018-02-27 16:28:35', '0.00', '4', 'علي مكرم');
INSERT INTO `sw_user` VALUES ('7', 'Ahmed.mostafa@elhamed.com', '$2y$10$GTE.kQQaBfHU./mtbJucw.qNTa1ZZ2xwH.XmbTufrhWpuM.RZaGgC', '1', '3', null, null, null, '0.00', null, '');
INSERT INTO `sw_user` VALUES ('9', 'Hany.louka@stcegypt.com', '$2y$10$GTE.kQQaBfHU./mtbJucw.qNTa1ZZ2xwH.XmbTufrhWpuM.RZaGgC', '1', '3', null, null, null, '0.00', null, '');

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
