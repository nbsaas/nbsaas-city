-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.7.26-log - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- 导出 nbsaas-admin 的数据库结构
DROP DATABASE IF EXISTS `nbsaas-admin`;
CREATE DATABASE IF NOT EXISTS `nbsaas-admin` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `nbsaas-admin`;

-- 导出  表 nbsaas-admin.article 结构
DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `add_date` datetime(6) DEFAULT NULL COMMENT '添加时间',
  `last_date` datetime(6) DEFAULT NULL COMMENT '最新修改时间',
  `comments` int(11) DEFAULT NULL,
  `ext_data` varchar(255) DEFAULT NULL,
  `images` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `introduction` varchar(255) DEFAULT NULL,
  `likes` int(11) DEFAULT NULL,
  `store_state` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `ups` int(11) DEFAULT NULL,
  `views` int(11) DEFAULT NULL,
  `catalog_id` bigint(20) DEFAULT NULL,
  `document_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2aptines4lfv2116021bh53gs` (`catalog_id`),
  KEY `FK6xrlkfco3mewsu14n2isbi9oc` (`document_id`),
  KEY `FKgfkys9w7qv3xcubq0drrayuu3` (`user_id`),
  CONSTRAINT `FK2aptines4lfv2116021bh53gs` FOREIGN KEY (`catalog_id`) REFERENCES `article_catalog` (`id`),
  CONSTRAINT `FK6xrlkfco3mewsu14n2isbi9oc` FOREIGN KEY (`document_id`) REFERENCES `article_document` (`id`),
  CONSTRAINT `FKgfkys9w7qv3xcubq0drrayuu3` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 正在导出表  nbsaas-admin.article 的数据：~0 rows (大约)
DELETE FROM `article`;

-- 导出  表 nbsaas-admin.article_catalog 结构
DROP TABLE IF EXISTS `article_catalog`;
CREATE TABLE IF NOT EXISTS `article_catalog` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `add_date` datetime(6) DEFAULT NULL COMMENT '添加时间',
  `code` varchar(50) DEFAULT NULL COMMENT '编码',
  `depth` int(11) DEFAULT NULL COMMENT '深度',
  `ids` varchar(255) DEFAULT NULL COMMENT 'ids',
  `last_date` datetime(6) DEFAULT NULL COMMENT '最新修改时间',
  `lft` int(11) DEFAULT NULL COMMENT '左节点',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `rgt` int(11) DEFAULT NULL COMMENT '右节点',
  `sort_num` int(11) DEFAULT NULL COMMENT '排序号',
  `size` bigint(20) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `amount` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKb6vm6j4ace2cw6h21vnp5mytb` (`parent_id`),
  CONSTRAINT `FKb6vm6j4ace2cw6h21vnp5mytb` FOREIGN KEY (`parent_id`) REFERENCES `article_catalog` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 正在导出表  nbsaas-admin.article_catalog 的数据：~0 rows (大约)
DELETE FROM `article_catalog`;

-- 导出  表 nbsaas-admin.article_comment 结构
DROP TABLE IF EXISTS `article_comment`;
CREATE TABLE IF NOT EXISTS `article_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `add_date` datetime(6) DEFAULT NULL COMMENT '添加时间',
  `last_date` datetime(6) DEFAULT NULL COMMENT '最新修改时间',
  `contents` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `article_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKghmocqkgqs5tkmucf5putw64t` (`article_id`),
  KEY `FKq2u0dy36tq655hnhxal16of7k` (`user_id`),
  CONSTRAINT `FKghmocqkgqs5tkmucf5putw64t` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`),
  CONSTRAINT `FKq2u0dy36tq655hnhxal16of7k` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 正在导出表  nbsaas-admin.article_comment 的数据：~0 rows (大约)
DELETE FROM `article_comment`;

-- 导出  表 nbsaas-admin.article_document 结构
DROP TABLE IF EXISTS `article_document`;
CREATE TABLE IF NOT EXISTS `article_document` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `add_date` datetime(6) DEFAULT NULL COMMENT '添加时间',
  `last_date` datetime(6) DEFAULT NULL COMMENT '最新修改时间',
  `note` varchar(6000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 正在导出表  nbsaas-admin.article_document 的数据：~0 rows (大约)
DELETE FROM `article_document`;

-- 导出  表 nbsaas-admin.article_like 结构
DROP TABLE IF EXISTS `article_like`;
CREATE TABLE IF NOT EXISTS `article_like` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `add_date` datetime(6) DEFAULT NULL COMMENT '添加时间',
  `last_date` datetime(6) DEFAULT NULL COMMENT '最新修改时间',
  `article_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKabthli6g1qjriusniw93pbesw` (`article_id`),
  KEY `FK13bn3spxe6xfy318i80669hon` (`user_id`),
  CONSTRAINT `FK13bn3spxe6xfy318i80669hon` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`),
  CONSTRAINT `FKabthli6g1qjriusniw93pbesw` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 正在导出表  nbsaas-admin.article_like 的数据：~0 rows (大约)
DELETE FROM `article_like`;

-- 导出  表 nbsaas-admin.article_link_tag 结构
DROP TABLE IF EXISTS `article_link_tag`;
CREATE TABLE IF NOT EXISTS `article_link_tag` (
  `article_id` bigint(20) NOT NULL,
  `tags_id` bigint(20) NOT NULL,
  PRIMARY KEY (`article_id`,`tags_id`),
  KEY `FK8cbs5lfskjdpwpae5p48um1gr` (`tags_id`),
  CONSTRAINT `FK8cbs5lfskjdpwpae5p48um1gr` FOREIGN KEY (`tags_id`) REFERENCES `article_tag` (`id`),
  CONSTRAINT `FKsyqvqf7ceog6lyp1mte4l7prc` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 正在导出表  nbsaas-admin.article_link_tag 的数据：~0 rows (大约)
DELETE FROM `article_link_tag`;

-- 导出  表 nbsaas-admin.article_sensitive_category 结构
DROP TABLE IF EXISTS `article_sensitive_category`;
CREATE TABLE IF NOT EXISTS `article_sensitive_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `add_date` datetime(6) DEFAULT NULL COMMENT '添加时间',
  `code` varchar(50) DEFAULT NULL COMMENT '编码',
  `depth` int(11) DEFAULT NULL COMMENT '深度',
  `ids` varchar(255) DEFAULT NULL COMMENT 'ids',
  `last_date` datetime(6) DEFAULT NULL COMMENT '最新修改时间',
  `lft` int(11) DEFAULT NULL COMMENT '左节点',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `rgt` int(11) DEFAULT NULL COMMENT '右节点',
  `sort_num` int(11) DEFAULT NULL COMMENT '排序号',
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6yr0lp832885ybn738e80wlp4` (`parent_id`),
  CONSTRAINT `FK6yr0lp832885ybn738e80wlp4` FOREIGN KEY (`parent_id`) REFERENCES `article_sensitive_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 正在导出表  nbsaas-admin.article_sensitive_category 的数据：~0 rows (大约)
DELETE FROM `article_sensitive_category`;

-- 导出  表 nbsaas-admin.article_sensitive_word 结构
DROP TABLE IF EXISTS `article_sensitive_word`;
CREATE TABLE IF NOT EXISTS `article_sensitive_word` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `add_date` datetime(6) DEFAULT NULL COMMENT '添加时间',
  `last_date` datetime(6) DEFAULT NULL COMMENT '最新修改时间',
  `catalog` int(11) DEFAULT NULL,
  `replace_word` varchar(255) DEFAULT NULL,
  `word_size` int(11) DEFAULT NULL,
  `word` varchar(255) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4jx243akswqmswta87kwsr4wb` (`category_id`),
  KEY `FKebq1aflt9h1l0hki7qu3292yj` (`user_id`),
  CONSTRAINT `FK4jx243akswqmswta87kwsr4wb` FOREIGN KEY (`category_id`) REFERENCES `article_sensitive_category` (`id`),
  CONSTRAINT `FKebq1aflt9h1l0hki7qu3292yj` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 正在导出表  nbsaas-admin.article_sensitive_word 的数据：~0 rows (大约)
DELETE FROM `article_sensitive_word`;

-- 导出  表 nbsaas-admin.article_tag 结构
DROP TABLE IF EXISTS `article_tag`;
CREATE TABLE IF NOT EXISTS `article_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `add_date` datetime(6) DEFAULT NULL COMMENT '添加时间',
  `last_date` datetime(6) DEFAULT NULL COMMENT '最新修改时间',
  `name` varchar(255) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 正在导出表  nbsaas-admin.article_tag 的数据：~0 rows (大约)
DELETE FROM `article_tag`;

-- 导出  表 nbsaas-admin.bs_basic_ad 结构
DROP TABLE IF EXISTS `bs_basic_ad`;
CREATE TABLE IF NOT EXISTS `bs_basic_ad` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `add_date` datetime(6) DEFAULT NULL COMMENT '添加时间',
  `last_date` datetime(6) DEFAULT NULL COMMENT '最新修改时间',
  `sort_num` int(11) DEFAULT NULL COMMENT '排序号',
  `begin_date` datetime(6) DEFAULT NULL,
  `buss_id` bigint(20) DEFAULT NULL,
  `catalog` int(11) DEFAULT NULL,
  `end_date` datetime(6) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `ad_position_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4o90micfofe3dsox57fsbf54h` (`ad_position_id`),
  CONSTRAINT `FK4o90micfofe3dsox57fsbf54h` FOREIGN KEY (`ad_position_id`) REFERENCES `bs_basic_ad_position` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 正在导出表  nbsaas-admin.bs_basic_ad 的数据：~0 rows (大约)
DELETE FROM `bs_basic_ad`;

-- 导出  表 nbsaas-admin.bs_basic_ad_position 结构
DROP TABLE IF EXISTS `bs_basic_ad_position`;
CREATE TABLE IF NOT EXISTS `bs_basic_ad_position` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `add_date` datetime(6) DEFAULT NULL COMMENT '添加时间',
  `last_date` datetime(6) DEFAULT NULL COMMENT '最新修改时间',
  `sort_num` int(11) DEFAULT NULL COMMENT '排序号',
  `height` int(11) NOT NULL,
  `data_key` varchar(30) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `template` longtext NOT NULL,
  `width` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 正在导出表  nbsaas-admin.bs_basic_ad_position 的数据：~0 rows (大约)
DELETE FROM `bs_basic_ad_position`;

-- 导出  表 nbsaas-admin.bs_customer 结构
DROP TABLE IF EXISTS `bs_customer`;
CREATE TABLE IF NOT EXISTS `bs_customer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `add_date` datetime(6) DEFAULT NULL COMMENT '添加时间',
  `last_date` datetime(6) DEFAULT NULL COMMENT '最新修改时间',
  `begin_date` datetime(6) DEFAULT NULL,
  `introducer` varchar(30) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 正在导出表  nbsaas-admin.bs_customer 的数据：~0 rows (大约)
DELETE FROM `bs_customer`;

-- 导出  表 nbsaas-admin.nbsaas_common_config 结构
DROP TABLE IF EXISTS `nbsaas_common_config`;
CREATE TABLE IF NOT EXISTS `nbsaas_common_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `add_date` datetime(6) DEFAULT NULL COMMENT '添加时间',
  `last_date` datetime(6) DEFAULT NULL COMMENT '最新修改时间',
  `class_name` varchar(255) DEFAULT NULL COMMENT '配置类标识',
  `config_data` varchar(255) DEFAULT NULL COMMENT '配置json数据',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_gcwxay4sfr5c4x9q23sd6n022` (`class_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='基础配置功能';

-- 正在导出表  nbsaas-admin.nbsaas_common_config 的数据：~0 rows (大约)
DELETE FROM `nbsaas_common_config`;

-- 导出  表 nbsaas-admin.sys_app 结构
DROP TABLE IF EXISTS `sys_app`;
CREATE TABLE IF NOT EXISTS `sys_app` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `add_date` datetime(6) DEFAULT NULL COMMENT '添加时间',
  `last_date` datetime(6) DEFAULT NULL COMMENT '最新修改时间',
  `app_key` varchar(255) DEFAULT NULL COMMENT '应用key',
  `name` varchar(255) DEFAULT NULL COMMENT '应用名称',
  `note` varchar(255) DEFAULT NULL COMMENT '应用介绍',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 正在导出表  nbsaas-admin.sys_app 的数据：~2 rows (大约)
DELETE FROM `sys_app`;
INSERT INTO `sys_app` (`id`, `add_date`, `last_date`, `app_key`, `name`, `note`) VALUES
	(1, '2023-06-23 13:38:30.789000', '2023-06-23 13:38:30.789000', NULL, NULL, NULL),
	(2, '2023-06-23 13:39:45.117000', '2023-06-23 13:41:50.133000', '123dfgd', '123fg', NULL);

-- 导出  表 nbsaas-admin.sys_app_menu 结构
DROP TABLE IF EXISTS `sys_app_menu`;
CREATE TABLE IF NOT EXISTS `sys_app_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `add_date` datetime(6) DEFAULT NULL COMMENT '添加时间',
  `code` varchar(50) DEFAULT NULL COMMENT '编码',
  `depth` int(11) DEFAULT NULL COMMENT '深度',
  `ids` varchar(255) DEFAULT NULL COMMENT 'ids',
  `last_date` datetime(6) DEFAULT NULL COMMENT '最新修改时间',
  `lft` int(11) DEFAULT NULL COMMENT '左节点',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `rgt` int(11) DEFAULT NULL COMMENT '右节点',
  `sort_num` int(11) DEFAULT NULL COMMENT '排序号',
  `catalog` int(11) DEFAULT NULL COMMENT '分类',
  `creator` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `menu_type` int(11) DEFAULT NULL COMMENT '菜单类型',
  `num` bigint(20) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL COMMENT '路径',
  `permission` varchar(255) DEFAULT NULL COMMENT '权限',
  `router` varchar(255) DEFAULT NULL COMMENT '路由',
  `app_id` bigint(20) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKa21putlh2htcv39jrkgg1bed0` (`app_id`),
  KEY `FK2enr7xrsc790sg3jb4gwlq76q` (`parent_id`),
  CONSTRAINT `FK2enr7xrsc790sg3jb4gwlq76q` FOREIGN KEY (`parent_id`) REFERENCES `sys_app_menu` (`id`),
  CONSTRAINT `FKa21putlh2htcv39jrkgg1bed0` FOREIGN KEY (`app_id`) REFERENCES `sys_app` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 正在导出表  nbsaas-admin.sys_app_menu 的数据：~0 rows (大约)
DELETE FROM `sys_app_menu`;

-- 导出  表 nbsaas-admin.sys_dict 结构
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE IF NOT EXISTS `sys_dict` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `add_date` datetime(6) DEFAULT NULL COMMENT '添加时间',
  `last_date` datetime(6) DEFAULT NULL COMMENT '最新修改时间',
  `dict_key` varchar(255) DEFAULT NULL COMMENT '字典key',
  `title` varchar(255) DEFAULT NULL COMMENT '字典名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='字典表';

-- 正在导出表  nbsaas-admin.sys_dict 的数据：~1 rows (大约)
DELETE FROM `sys_dict`;
INSERT INTO `sys_dict` (`id`, `add_date`, `last_date`, `dict_key`, `title`) VALUES
	(1, '2023-06-24 21:26:49.384000', '2023-06-24 21:26:49.384000', '11', '12');

-- 导出  表 nbsaas-admin.sys_dict_item 结构
DROP TABLE IF EXISTS `sys_dict_item`;
CREATE TABLE IF NOT EXISTS `sys_dict_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `add_date` datetime(6) DEFAULT NULL COMMENT '添加时间',
  `last_date` datetime(6) DEFAULT NULL COMMENT '最新修改时间',
  `data_code` varchar(255) DEFAULT NULL COMMENT '编码',
  `data_value` varchar(255) DEFAULT NULL COMMENT '键值',
  `sort_num` int(11) DEFAULT NULL COMMENT '排序字段',
  `store_state` int(11) DEFAULT NULL,
  `dict_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKdem7dtr28pt4kqu9rk7strqdj` (`dict_id`),
  CONSTRAINT `FKdem7dtr28pt4kqu9rk7strqdj` FOREIGN KEY (`dict_id`) REFERENCES `sys_dict` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='字典子项';

-- 正在导出表  nbsaas-admin.sys_dict_item 的数据：~2 rows (大约)
DELETE FROM `sys_dict_item`;
INSERT INTO `sys_dict_item` (`id`, `add_date`, `last_date`, `data_code`, `data_value`, `sort_num`, `store_state`, `dict_id`) VALUES
	(1, '2023-06-24 21:26:53.700000', '2023-06-24 21:26:53.700000', '123', '123', 0, NULL, 1),
	(2, '2023-06-24 21:26:57.093000', '2023-06-24 21:26:57.093000', '123', '123', 0, NULL, 1);

-- 导出  表 nbsaas-admin.sys_error_log 结构
DROP TABLE IF EXISTS `sys_error_log`;
CREATE TABLE IF NOT EXISTS `sys_error_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `add_date` datetime(6) DEFAULT NULL COMMENT '添加时间',
  `last_date` datetime(6) DEFAULT NULL COMMENT '最新修改时间',
  `app` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `param` varchar(255) DEFAULT NULL,
  `server_name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 正在导出表  nbsaas-admin.sys_error_log 的数据：~0 rows (大约)
DELETE FROM `sys_error_log`;

-- 导出  表 nbsaas-admin.sys_menu 结构
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE IF NOT EXISTS `sys_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `add_date` datetime(6) DEFAULT NULL COMMENT '添加时间',
  `code` varchar(50) DEFAULT NULL COMMENT '编码',
  `depth` int(11) DEFAULT NULL COMMENT '深度',
  `ids` varchar(255) DEFAULT NULL COMMENT 'ids',
  `last_date` datetime(6) DEFAULT NULL COMMENT '最新修改时间',
  `lft` int(11) DEFAULT NULL COMMENT '左节点',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `rgt` int(11) DEFAULT NULL COMMENT '右节点',
  `sort_num` int(11) DEFAULT NULL COMMENT '排序号',
  `catalog` int(11) DEFAULT NULL COMMENT '菜单类型',
  `icon` varchar(255) DEFAULT NULL,
  `menu_type` int(11) DEFAULT NULL COMMENT '是否租户使用',
  `nums` bigint(20) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `permission` varchar(255) DEFAULT NULL,
  `router` varchar(255) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2jrf4gb0gjqi8882gxytpxnhe` (`parent_id`),
  CONSTRAINT `FK2jrf4gb0gjqi8882gxytpxnhe` FOREIGN KEY (`parent_id`) REFERENCES `sys_menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 正在导出表  nbsaas-admin.sys_menu 的数据：~63 rows (大约)
DELETE FROM `sys_menu`;
INSERT INTO `sys_menu` (`id`, `add_date`, `code`, `depth`, `ids`, `last_date`, `lft`, `name`, `rgt`, `sort_num`, `catalog`, `icon`, `menu_type`, `nums`, `path`, `permission`, `router`, `parent_id`) VALUES
	(1, NULL, '', 1, '', NULL, NULL, '首页', NULL, 0, 1, 'el-icon-shop', NULL, NULL, '/dashboard/main', '', 'home', NULL),
	(2, NULL, '', 1, '', NULL, NULL, '系统设置', NULL, 100, 1, 'el-icon-eleme-filled', NULL, NULL, '/setting', '', '/setting', NULL),
	(3, NULL, '', NULL, '', NULL, NULL, '菜单管理', NULL, 1, NULL, 'el-icon-grid', NULL, NULL, '/setting/menu', 'menu', 'setting/menu', 2),
	(6, NULL, '', NULL, '', NULL, NULL, '角色管理', NULL, 1, NULL, 'el-icon-picture-rounded', NULL, NULL, '/role/index', 'role', 'setting/role', 2),
	(8, NULL, '', NULL, '', NULL, NULL, '数据字典', NULL, 2, NULL, 'el-icon-eleme-filled', NULL, NULL, '/setting/dic', 'dict,dictItem', 'setting/dic', 2),
	(9, NULL, '', NULL, '', NULL, NULL, '系统配置', NULL, 111, NULL, 'el-icon-eleme-filled', NULL, NULL, '/setting/system', '', 'setting/system', 2),
	(16, NULL, '', NULL, '', NULL, NULL, '部门管理', NULL, 110, NULL, 'el-icon-basketball', NULL, NULL, '/setting/dept', '', 'setting/dept', 2),
	(17, NULL, '', NULL, '', NULL, NULL, '表格列管理', NULL, 110, NULL, 'el-icon-eleme-filled', NULL, NULL, '/setting/table', '', 'setting/table', 2),
	(20, NULL, '', 1, '', NULL, NULL, '控制台', NULL, 0, NULL, 'el-icon-home-filled', NULL, NULL, '/dashboard', '', 'home', 1),
	(21, NULL, '', 1, '', NULL, NULL, '帐号信息', NULL, 0, NULL, 'el-icon-avatar', NULL, NULL, '/userCenter', '', 'userCenter', 1),
	(22, NULL, '', 1, '', NULL, NULL, '组件', NULL, 0, 1, 'el-icon-box', NULL, NULL, '/vab', '', '', NULL),
	(23, NULL, '', 1, '', NULL, NULL, '原子组件', NULL, 0, 1, 'el-icon-basketball', NULL, NULL, '/vab/mini', '', 'vab/mini', 22),
	(24, NULL, '', 1, '', NULL, NULL, '扩展图标', NULL, 0, NULL, 'el-icon-box', NULL, NULL, '/vab/iconfont', '', 'vab/iconfont', 22),
	(25, NULL, '', 1, '', NULL, NULL, 'Data 数据展示', NULL, 0, NULL, 'el-icon-baseball', NULL, NULL, '/vab/data', '', '', 22),
	(26, NULL, '', 1, '', NULL, NULL, '图表 Echarts', NULL, NULL, NULL, '', NULL, NULL, '/vab/chart', '', 'vab/chart', 25),
	(27, NULL, '', 1, '', NULL, NULL, '统计数值', NULL, NULL, NULL, '', NULL, NULL, '/vab/statistic', '', 'vab/statistic', 25),
	(28, NULL, '', 1, '', NULL, NULL, '视频播放器', NULL, NULL, NULL, '', NULL, NULL, '/vab/video', '', 'vab/video', 25),
	(29, NULL, '', 1, '', NULL, NULL, '二维码', NULL, NULL, NULL, '', NULL, NULL, '/vab/qrcode', '', 'vab/qrcode', 25),
	(30, NULL, '', 1, '', NULL, NULL, 'Form 数据录入', NULL, 0, NULL, 'el-icon-basketball', NULL, NULL, '/vab/form', '', '', 22),
	(31, NULL, '', 1, '', NULL, NULL, '表格选择器', NULL, NULL, NULL, '', NULL, NULL, '/vab/tableselect', '', 'vab/tableselect', 30),
	(32, NULL, '', 1, '', NULL, NULL, '表单表格', NULL, NULL, NULL, '', NULL, NULL, '/vab/formtable', '', 'vab/formtable', 30),
	(33, NULL, '', 1, '', NULL, NULL, '分类筛选器', NULL, NULL, NULL, '', NULL, NULL, '/vab/selectFilter', '', 'vab/selectFilter', 30),
	(34, NULL, '', 1, '', NULL, NULL, '过滤器v2', NULL, NULL, NULL, '', NULL, NULL, '/vab/filterbar', '', 'vab/filterbar', 30),
	(35, NULL, '', 1, '', NULL, NULL, '上传', NULL, NULL, NULL, '', NULL, NULL, '/vab/upload', '', 'vab/upload', 30),
	(36, NULL, '', 1, '', NULL, NULL, '异步选择器', NULL, NULL, NULL, '', NULL, NULL, '/vab/select', '', 'vab/select', 30),
	(37, NULL, '', 1, '', NULL, NULL, '图标选择器', NULL, NULL, NULL, '', NULL, NULL, '/vab/iconselect', '', 'vab/iconselect', 30),
	(38, NULL, '', 1, '', NULL, NULL, 'Cron规则生成器', NULL, NULL, NULL, '', NULL, NULL, '/vab/cron', '', 'vab/cron', 30),
	(39, NULL, '', 1, '', NULL, NULL, '富文本编辑器', NULL, NULL, NULL, '', NULL, NULL, '/vab/editor', '', 'vab/editor', 30),
	(40, NULL, '', 1, '', NULL, NULL, '代码编辑器', NULL, NULL, NULL, '', NULL, NULL, '/vab/codeeditor', '', 'vab/codeeditor', 30),
	(41, NULL, '', 1, '', NULL, NULL, 'Feedback 反馈', NULL, 0, NULL, 'el-icon-chat-dot-square', NULL, NULL, '/vab/feedback', '', '', 22),
	(42, NULL, '', 1, '', NULL, NULL, '拖拽排序', NULL, NULL, NULL, '', NULL, NULL, '/vab/drag', '', 'vab/drag', 41),
	(43, NULL, '', 1, '', NULL, NULL, '右键菜单', NULL, NULL, NULL, '', NULL, NULL, '/vab/contextmenu', '', 'vab/contextmenu', 41),
	(44, NULL, '', 1, '', NULL, NULL, '图像剪裁', NULL, NULL, NULL, '', NULL, NULL, '/vab/cropper', '', 'vab/cropper', 41),
	(45, NULL, '', 1, '', NULL, NULL, '资源库选择器', NULL, NULL, NULL, '', NULL, NULL, '/vab/fileselect', '', 'vab/fileselect', 41),
	(46, NULL, '', 1, '', NULL, NULL, '弹窗扩展', NULL, NULL, NULL, '', NULL, NULL, '/vab/dialog', '', 'vab/dialog', 41),
	(47, NULL, '', 1, '', NULL, NULL, 'Others 其他', NULL, 0, NULL, 'el-icon-coin', NULL, NULL, '/vab/others', '', '', 22),
	(48, NULL, '', 1, '', NULL, NULL, '打印', NULL, NULL, NULL, '', NULL, NULL, '/vab/print', '', 'vab/print', 47),
	(49, NULL, '', 1, '', NULL, NULL, '水印', NULL, NULL, NULL, '', NULL, NULL, '/vab/watermark', '', 'vab/watermark', 47),
	(50, NULL, '', 1, '', NULL, NULL, '文件导出导入', NULL, NULL, NULL, '', NULL, NULL, '/vab/importexport', '', 'vab/importexport', 47),
	(51, NULL, '', 1, '', NULL, NULL, 'Table 数据列表', NULL, 0, NULL, 'el-icon-coin', NULL, NULL, '/vab/list', '', '', 22),
	(52, NULL, '', 1, '', NULL, NULL, '基础数据列表', NULL, NULL, NULL, '', NULL, NULL, '/vab/table/base', '', 'vab/table/base', 51),
	(53, NULL, '', 1, '', NULL, NULL, '多级表头', NULL, NULL, NULL, '', NULL, NULL, '/vab/table/thead', '', 'vab/table/thead', 51),
	(54, NULL, '', 1, '', NULL, NULL, '动态列', NULL, NULL, NULL, '', NULL, NULL, '/vab/table/column', '', 'vab/table/column', 51),
	(55, NULL, '', 1, '', NULL, NULL, '远程排序过滤', NULL, NULL, NULL, '', NULL, NULL, '/vab/table/remote', '', 'vab/table/remote', 51),
	(56, NULL, '', 1, '', NULL, NULL, '工作流设计器', NULL, 0, NULL, 'el-icon-burger', NULL, NULL, '/vab/workflow', '', 'vab/workflow', 22),
	(57, NULL, '', 1, '', NULL, NULL, '动态表单(Beta)', NULL, 0, NULL, 'el-icon-coffee', NULL, NULL, '/vab/formrender', '', 'vab/form', 22),
	(58, NULL, '', 1, '', NULL, NULL, '计划任务', NULL, 0, NULL, 'el-icon-takeaway-box', NULL, NULL, '/setting/task', '', 'setting/task', 2),
	(59, NULL, '', 1, '', NULL, NULL, '应用管理', NULL, 0, NULL, 'el-icon-paperclip', NULL, NULL, '/setting/client', '', 'setting/client', 2),
	(60, NULL, '', 1, '', NULL, NULL, '系统日志', NULL, 0, NULL, 'el-icon-partly-cloudy', NULL, NULL, '/setting/log', '', 'setting/log', 2),
	(61, NULL, '', 1, '', NULL, NULL, '用户管理', NULL, 0, NULL, 'el-icon-avatar', NULL, NULL, '/setting/user', 'userInfo', 'setting/user', 2),
	(62, NULL, '', 1, '', NULL, NULL, '模板', NULL, NULL, NULL, 'el-icon-grid', NULL, NULL, '/template', '', '', NULL),
	(63, NULL, '', 1, '', NULL, NULL, '布局', NULL, NULL, NULL, 'el-icon-basketball', NULL, NULL, '', '', '', 62),
	(64, NULL, '', 1, '', NULL, NULL, '空白模板', NULL, NULL, NULL, '', NULL, NULL, '/template/layout/blank', '', 'template/layout/blank', 63),
	(65, NULL, '', 1, '', NULL, NULL, '上中下布局', NULL, NULL, NULL, '', NULL, NULL, '/template/layout/layoutTCB', '', 'template/layout/layoutTCB', 63),
	(66, NULL, '', 1, '', NULL, NULL, '左中右布局', NULL, NULL, NULL, '', NULL, NULL, '/template/layout/layoutLCR', '', 'template/layout/layoutLCR', 63),
	(67, NULL, '', 1, '', NULL, NULL, '列表', NULL, NULL, NULL, 'el-icon-expand', NULL, NULL, '/list1234', '', '', 62),
	(68, NULL, '', 1, '', NULL, NULL, 'CRUD7', NULL, NULL, NULL, '', NULL, NULL, '/template/list/crud', '', 'template/list/crud', 67),
	(69, NULL, '', 1, '', NULL, NULL, '左树右表', NULL, NULL, NULL, '', NULL, NULL, '/template/list/tree', '', 'template/list/tree', 67),
	(70, NULL, '', 1, '', NULL, NULL, '分类表格', NULL, NULL, NULL, '', NULL, NULL, '/template/list/tab', '', 'template/list/tab', 67),
	(71, NULL, '', 1, '', NULL, NULL, '子母表', NULL, NULL, NULL, '', NULL, NULL, '/template/list/son', '', 'template/list/son', 67),
	(72, NULL, '', 1, '', NULL, NULL, '定宽列表', NULL, 0, NULL, '', NULL, NULL, '/template/list/widthlist', '', 'template/list/width', 67),
	(73, NULL, '', 1, '', NULL, NULL, '其他', NULL, NULL, NULL, 'el-icon-basketball', NULL, NULL, '/other12', '', '', 62),
	(74, NULL, '', 1, '', NULL, NULL, '分步表单', NULL, NULL, NULL, '', NULL, NULL, '/template/other/stepform', '', 'template/other/stepform', 73);

-- 导出  表 nbsaas-admin.sys_mock 结构
DROP TABLE IF EXISTS `sys_mock`;
CREATE TABLE IF NOT EXISTS `sys_mock` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `add_date` datetime(6) DEFAULT NULL COMMENT '添加时间',
  `last_date` datetime(6) DEFAULT NULL COMMENT '最新修改时间',
  `content` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 正在导出表  nbsaas-admin.sys_mock 的数据：~0 rows (大约)
DELETE FROM `sys_mock`;

-- 导出  表 nbsaas-admin.sys_record_log 结构
DROP TABLE IF EXISTS `sys_record_log`;
CREATE TABLE IF NOT EXISTS `sys_record_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `add_date` datetime(6) DEFAULT NULL COMMENT '添加时间',
  `last_date` datetime(6) DEFAULT NULL COMMENT '最新修改时间',
  `app` varchar(255) DEFAULT NULL,
  `create_date` datetime(6) DEFAULT NULL,
  `create_name` varchar(255) DEFAULT NULL,
  `create_user` bigint(20) DEFAULT NULL,
  `data` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 正在导出表  nbsaas-admin.sys_record_log 的数据：~0 rows (大约)
DELETE FROM `sys_record_log`;

-- 导出  表 nbsaas-admin.sys_role 结构
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE IF NOT EXISTS `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `add_date` datetime(6) DEFAULT NULL COMMENT '添加时间',
  `last_date` datetime(6) DEFAULT NULL COMMENT '最新修改时间',
  `name` varchar(255) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(255) DEFAULT NULL COMMENT '角色描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色表 ';

-- 正在导出表  nbsaas-admin.sys_role 的数据：~12 rows (大约)
DELETE FROM `sys_role`;
INSERT INTO `sys_role` (`id`, `add_date`, `last_date`, `name`, `remark`) VALUES
	(1, '2023-06-23 11:43:12.000000', '2023-06-23 12:00:58.681000', '管理员', 'fdsd'),
	(2, '2023-06-23 11:56:04.101000', '2023-06-23 11:58:30.622000', 'ada11', '1'),
	(3, '2023-06-23 11:58:36.299000', '2023-06-23 11:58:36.299000', '1', ''),
	(4, '2023-06-23 11:58:39.796000', '2023-06-23 11:58:39.796000', '1', ''),
	(5, '2023-06-23 11:58:42.424000', '2023-06-23 11:58:42.424000', '1', ''),
	(6, '2023-06-23 11:58:45.059000', '2023-06-23 11:58:45.059000', '1', ''),
	(7, '2023-06-23 11:58:47.559000', '2023-06-23 11:58:47.559000', '11', ''),
	(8, '2023-06-23 11:58:50.496000', '2023-06-23 11:58:50.496000', '1', ''),
	(9, '2023-06-23 11:58:53.403000', '2023-06-23 11:58:53.403000', '1', ''),
	(10, '2023-06-23 11:58:56.116000', '2023-06-23 11:58:56.116000', '1', ''),
	(11, '2023-06-23 11:58:59.879000', '2023-06-23 11:58:59.879000', '11', ''),
	(12, '2023-06-23 11:59:03.397000', '2023-06-23 11:59:03.397000', '1', '');

-- 导出  表 nbsaas-admin.sys_role_menu 结构
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE IF NOT EXISTS `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `add_date` datetime(6) DEFAULT NULL COMMENT '添加时间',
  `last_date` datetime(6) DEFAULT NULL COMMENT '最新修改时间',
  `menu_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKf3mud4qoc7ayew8nml4plkevo` (`menu_id`),
  KEY `FKkeitxsgxwayackgqllio4ohn5` (`role_id`),
  CONSTRAINT `FKf3mud4qoc7ayew8nml4plkevo` FOREIGN KEY (`menu_id`) REFERENCES `sys_menu` (`id`),
  CONSTRAINT `FKkeitxsgxwayackgqllio4ohn5` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色功能表';

-- 正在导出表  nbsaas-admin.sys_role_menu 的数据：~63 rows (大约)
DELETE FROM `sys_role_menu`;
INSERT INTO `sys_role_menu` (`id`, `add_date`, `last_date`, `menu_id`, `role_id`) VALUES
	(261, '2023-06-24 21:54:51.716000', '2023-06-24 21:54:51.716000', 1, 1),
	(262, '2023-06-24 21:54:51.723000', '2023-06-24 21:54:51.723000', 20, 1),
	(263, '2023-06-24 21:54:51.727000', '2023-06-24 21:54:51.727000', 21, 1),
	(264, '2023-06-24 21:54:51.731000', '2023-06-24 21:54:51.731000', 22, 1),
	(265, '2023-06-24 21:54:51.735000', '2023-06-24 21:54:51.735000', 23, 1),
	(266, '2023-06-24 21:54:51.738000', '2023-06-24 21:54:51.738000', 24, 1),
	(267, '2023-06-24 21:54:51.742000', '2023-06-24 21:54:51.742000', 25, 1),
	(268, '2023-06-24 21:54:51.745000', '2023-06-24 21:54:51.745000', 26, 1),
	(269, '2023-06-24 21:54:51.749000', '2023-06-24 21:54:51.749000', 27, 1),
	(270, '2023-06-24 21:54:51.752000', '2023-06-24 21:54:51.752000', 28, 1),
	(271, '2023-06-24 21:54:51.756000', '2023-06-24 21:54:51.756000', 29, 1),
	(272, '2023-06-24 21:54:51.760000', '2023-06-24 21:54:51.760000', 30, 1),
	(273, '2023-06-24 21:54:51.763000', '2023-06-24 21:54:51.763000', 31, 1),
	(274, '2023-06-24 21:54:51.767000', '2023-06-24 21:54:51.767000', 32, 1),
	(275, '2023-06-24 21:54:51.771000', '2023-06-24 21:54:51.771000', 33, 1),
	(276, '2023-06-24 21:54:51.774000', '2023-06-24 21:54:51.774000', 34, 1),
	(277, '2023-06-24 21:54:51.778000', '2023-06-24 21:54:51.778000', 35, 1),
	(278, '2023-06-24 21:54:51.781000', '2023-06-24 21:54:51.781000', 36, 1),
	(279, '2023-06-24 21:54:51.785000', '2023-06-24 21:54:51.785000', 37, 1),
	(280, '2023-06-24 21:54:51.788000', '2023-06-24 21:54:51.788000', 38, 1),
	(281, '2023-06-24 21:54:51.791000', '2023-06-24 21:54:51.791000', 39, 1),
	(282, '2023-06-24 21:54:51.794000', '2023-06-24 21:54:51.794000', 40, 1),
	(283, '2023-06-24 21:54:51.797000', '2023-06-24 21:54:51.797000', 41, 1),
	(284, '2023-06-24 21:54:51.800000', '2023-06-24 21:54:51.800000', 42, 1),
	(285, '2023-06-24 21:54:51.803000', '2023-06-24 21:54:51.803000', 43, 1),
	(286, '2023-06-24 21:54:51.807000', '2023-06-24 21:54:51.807000', 44, 1),
	(287, '2023-06-24 21:54:51.810000', '2023-06-24 21:54:51.810000', 45, 1),
	(288, '2023-06-24 21:54:51.813000', '2023-06-24 21:54:51.813000', 46, 1),
	(289, '2023-06-24 21:54:51.817000', '2023-06-24 21:54:51.817000', 47, 1),
	(290, '2023-06-24 21:54:51.824000', '2023-06-24 21:54:51.824000', 48, 1),
	(291, '2023-06-24 21:54:51.830000', '2023-06-24 21:54:51.830000', 49, 1),
	(292, '2023-06-24 21:54:51.837000', '2023-06-24 21:54:51.837000', 50, 1),
	(293, '2023-06-24 21:54:51.844000', '2023-06-24 21:54:51.844000', 51, 1),
	(294, '2023-06-24 21:54:51.851000', '2023-06-24 21:54:51.851000', 52, 1),
	(295, '2023-06-24 21:54:51.858000', '2023-06-24 21:54:51.858000', 53, 1),
	(296, '2023-06-24 21:54:51.862000', '2023-06-24 21:54:51.862000', 54, 1),
	(297, '2023-06-24 21:54:51.865000', '2023-06-24 21:54:51.865000', 55, 1),
	(298, '2023-06-24 21:54:51.869000', '2023-06-24 21:54:51.869000', 56, 1),
	(299, '2023-06-24 21:54:51.871000', '2023-06-24 21:54:51.871000', 57, 1),
	(300, '2023-06-24 21:54:51.875000', '2023-06-24 21:54:51.875000', 62, 1),
	(301, '2023-06-24 21:54:51.879000', '2023-06-24 21:54:51.879000', 63, 1),
	(302, '2023-06-24 21:54:51.882000', '2023-06-24 21:54:51.882000', 64, 1),
	(303, '2023-06-24 21:54:51.885000', '2023-06-24 21:54:51.885000', 65, 1),
	(304, '2023-06-24 21:54:51.888000', '2023-06-24 21:54:51.888000', 66, 1),
	(305, '2023-06-24 21:54:51.893000', '2023-06-24 21:54:51.893000', 67, 1),
	(306, '2023-06-24 21:54:51.900000', '2023-06-24 21:54:51.900000', 68, 1),
	(307, '2023-06-24 21:54:51.906000', '2023-06-24 21:54:51.906000', 69, 1),
	(308, '2023-06-24 21:54:51.914000', '2023-06-24 21:54:51.914000', 70, 1),
	(309, '2023-06-24 21:54:51.921000', '2023-06-24 21:54:51.921000', 71, 1),
	(310, '2023-06-24 21:54:51.928000', '2023-06-24 21:54:51.928000', 72, 1),
	(311, '2023-06-24 21:54:51.935000', '2023-06-24 21:54:51.935000', 73, 1),
	(312, '2023-06-24 21:54:51.942000', '2023-06-24 21:54:51.942000', 74, 1),
	(313, '2023-06-24 21:54:51.949000', '2023-06-24 21:54:51.949000', 2, 1),
	(314, '2023-06-24 21:54:51.955000', '2023-06-24 21:54:51.955000', 58, 1),
	(315, '2023-06-24 21:54:51.959000', '2023-06-24 21:54:51.959000', 59, 1),
	(316, '2023-06-24 21:54:51.965000', '2023-06-24 21:54:51.965000', 60, 1),
	(317, '2023-06-24 21:54:51.968000', '2023-06-24 21:54:51.968000', 61, 1),
	(318, '2023-06-24 21:54:51.972000', '2023-06-24 21:54:51.972000', 3, 1),
	(319, '2023-06-24 21:54:51.976000', '2023-06-24 21:54:51.976000', 6, 1),
	(320, '2023-06-24 21:54:51.980000', '2023-06-24 21:54:51.980000', 8, 1),
	(321, '2023-06-24 21:54:51.983000', '2023-06-24 21:54:51.983000', 16, 1),
	(322, '2023-06-24 21:54:51.986000', '2023-06-24 21:54:51.986000', 17, 1),
	(323, '2023-06-24 21:54:51.989000', '2023-06-24 21:54:51.989000', 9, 1);

-- 导出  表 nbsaas-admin.sys_sequence 结构
DROP TABLE IF EXISTS `sys_sequence`;
CREATE TABLE IF NOT EXISTS `sys_sequence` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `add_date` datetime(6) DEFAULT NULL COMMENT '添加时间',
  `last_date` datetime(6) DEFAULT NULL COMMENT '最新修改时间',
  `create_date` datetime(6) DEFAULT NULL,
  `current_num` bigint(20) DEFAULT NULL,
  `increment` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `update_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 正在导出表  nbsaas-admin.sys_sequence 的数据：~0 rows (大约)
DELETE FROM `sys_sequence`;

-- 导出  表 nbsaas-admin.sys_structure 结构
DROP TABLE IF EXISTS `sys_structure`;
CREATE TABLE IF NOT EXISTS `sys_structure` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `add_date` datetime(6) DEFAULT NULL COMMENT '添加时间',
  `code` varchar(50) DEFAULT NULL COMMENT '编码',
  `depth` int(11) DEFAULT NULL COMMENT '深度',
  `ids` varchar(255) DEFAULT NULL COMMENT 'ids',
  `last_date` datetime(6) DEFAULT NULL COMMENT '最新修改时间',
  `lft` int(11) DEFAULT NULL COMMENT '左节点',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `rgt` int(11) DEFAULT NULL COMMENT '右节点',
  `sort_num` int(11) DEFAULT NULL COMMENT '排序号',
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKt36aqf18w4kny9gd6xnxkb9o0` (`parent_id`),
  CONSTRAINT `FKt36aqf18w4kny9gd6xnxkb9o0` FOREIGN KEY (`parent_id`) REFERENCES `sys_structure` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 正在导出表  nbsaas-admin.sys_structure 的数据：~2 rows (大约)
DELETE FROM `sys_structure`;
INSERT INTO `sys_structure` (`id`, `add_date`, `code`, `depth`, `ids`, `last_date`, `lft`, `name`, `rgt`, `sort_num`, `parent_id`) VALUES
	(1, NULL, NULL, 1, NULL, NULL, NULL, '测试1', NULL, 11, NULL),
	(3, NULL, NULL, 2, NULL, NULL, NULL, '123', NULL, 12312, 1);

-- 导出  表 nbsaas-admin.todo 结构
DROP TABLE IF EXISTS `todo`;
CREATE TABLE IF NOT EXISTS `todo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `add_date` datetime(6) DEFAULT NULL COMMENT '添加时间',
  `last_date` datetime(6) DEFAULT NULL COMMENT '最新修改时间',
  `data_id` bigint(20) DEFAULT NULL,
  `data_key` varchar(255) DEFAULT NULL,
  `handler` bigint(20) DEFAULT NULL,
  `handler_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `navigate_url` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `owner_name` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `owner_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKry89lgog184maw56mvs4a6i2g` (`owner_id`),
  CONSTRAINT `FKry89lgog184maw56mvs4a6i2g` FOREIGN KEY (`owner_id`) REFERENCES `user_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 正在导出表  nbsaas-admin.todo 的数据：~0 rows (大约)
DELETE FROM `todo`;

-- 导出  表 nbsaas-admin.todo_template 结构
DROP TABLE IF EXISTS `todo_template`;
CREATE TABLE IF NOT EXISTS `todo_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `add_date` datetime(6) DEFAULT NULL COMMENT '添加时间',
  `last_date` datetime(6) DEFAULT NULL COMMENT '最新修改时间',
  `data_key` varchar(255) DEFAULT NULL,
  `ext_data` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `navigate_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 正在导出表  nbsaas-admin.todo_template 的数据：~0 rows (大约)
DELETE FROM `todo_template`;

-- 导出  表 nbsaas-admin.user_access_log 结构
DROP TABLE IF EXISTS `user_access_log`;
CREATE TABLE IF NOT EXISTS `user_access_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `add_date` datetime(6) DEFAULT NULL COMMENT '添加时间',
  `last_date` datetime(6) DEFAULT NULL COMMENT '最新修改时间',
  `consume_time` bigint(20) DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `store_state` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKi0347jxfpv2i5b9crf8ckbg5w` (`creator_id`),
  CONSTRAINT `FKi0347jxfpv2i5b9crf8ckbg5w` FOREIGN KEY (`creator_id`) REFERENCES `user_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 正在导出表  nbsaas-admin.user_access_log 的数据：~0 rows (大约)
DELETE FROM `user_access_log`;

-- 导出  表 nbsaas-admin.user_account 结构
DROP TABLE IF EXISTS `user_account`;
CREATE TABLE IF NOT EXISTS `user_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `add_date` datetime(6) DEFAULT NULL COMMENT '添加时间',
  `last_date` datetime(6) DEFAULT NULL COMMENT '最新修改时间',
  `account_type` int(11) DEFAULT NULL,
  `login_size` int(11) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKloyhlvrn82g8811wyjaa8ehm0` (`user_id`),
  CONSTRAINT `FKloyhlvrn82g8811wyjaa8ehm0` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 正在导出表  nbsaas-admin.user_account 的数据：~2 rows (大约)
DELETE FROM `user_account`;
INSERT INTO `user_account` (`id`, `add_date`, `last_date`, `account_type`, `login_size`, `username`, `user_id`) VALUES
	(1, '2023-06-23 10:57:32.870000', '2023-06-23 10:57:32.870000', 2, 0, 'ada', 1),
	(2, '2023-06-23 10:57:41.108000', '2023-06-23 10:57:41.108000', 2, 0, '1', 2),
	(3, '2023-06-23 10:58:14.048000', '2023-06-23 10:58:14.048000', 2, 0, 'admin', 3);

-- 导出  表 nbsaas-admin.user_info 结构
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE IF NOT EXISTS `user_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `add_date` datetime(6) DEFAULT NULL COMMENT '添加时间',
  `last_date` datetime(6) DEFAULT NULL COMMENT '最新修改时间',
  `avatar` varchar(255) DEFAULT NULL,
  `catalog` int(11) DEFAULT NULL,
  `login_size` int(11) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `store_state` int(11) DEFAULT NULL,
  `sex` varchar(2) DEFAULT NULL COMMENT '性别',
  `data_scope` int(11) DEFAULT NULL,
  `note` varchar(100) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `structure_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKhrwdxo6u0y0yxjvkm6sq8aea3` (`structure_id`),
  CONSTRAINT `FKhrwdxo6u0y0yxjvkm6sq8aea3` FOREIGN KEY (`structure_id`) REFERENCES `sys_structure` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户信息表';

-- 正在导出表  nbsaas-admin.user_info 的数据：~2 rows (大约)
DELETE FROM `user_info`;
INSERT INTO `user_info` (`id`, `add_date`, `last_date`, `avatar`, `catalog`, `login_size`, `name`, `phone`, `store_state`, `sex`, `data_scope`, `note`, `state`, `structure_id`) VALUES
	(1, '2023-06-23 10:57:32.846000', '2023-06-23 10:57:32.846000', NULL, NULL, 0, 'ada', 'ada', NULL, NULL, NULL, NULL, NULL, NULL),
	(2, '2023-06-23 10:57:41.107000', '2023-06-23 10:57:41.107000', NULL, NULL, 0, '1', '1', NULL, NULL, NULL, NULL, NULL, NULL),
	(3, '2023-06-23 10:58:14.048000', '2023-06-23 10:58:14.048000', NULL, NULL, 0, 'admin', 'admin', NULL, NULL, NULL, NULL, NULL, NULL);

-- 导出  表 nbsaas-admin.user_info_attribute 结构
DROP TABLE IF EXISTS `user_info_attribute`;
CREATE TABLE IF NOT EXISTS `user_info_attribute` (
  `user_id` bigint(20) NOT NULL,
  `attr` varchar(100) DEFAULT NULL,
  `name` varchar(36) NOT NULL,
  PRIMARY KEY (`user_id`,`name`),
  CONSTRAINT `FKjf8g1vng9lpmniy8u187j7t0` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 正在导出表  nbsaas-admin.user_info_attribute 的数据：~0 rows (大约)
DELETE FROM `user_info_attribute`;

-- 导出  表 nbsaas-admin.user_login_log 结构
DROP TABLE IF EXISTS `user_login_log`;
CREATE TABLE IF NOT EXISTS `user_login_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `add_date` datetime(6) DEFAULT NULL COMMENT '添加时间',
  `last_date` datetime(6) DEFAULT NULL COMMENT '最新修改时间',
  `account` varchar(255) DEFAULT NULL,
  `client` varchar(255) DEFAULT NULL,
  `ip` varchar(30) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `store_state` int(11) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKj91w0nnfocpdp796lr3ot4lxs` (`user_id`),
  CONSTRAINT `FKj91w0nnfocpdp796lr3ot4lxs` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 正在导出表  nbsaas-admin.user_login_log 的数据：~0 rows (大约)
DELETE FROM `user_login_log`;

-- 导出  表 nbsaas-admin.user_oauth_config 结构
DROP TABLE IF EXISTS `user_oauth_config`;
CREATE TABLE IF NOT EXISTS `user_oauth_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `add_date` datetime(6) DEFAULT NULL COMMENT '添加时间',
  `last_date` datetime(6) DEFAULT NULL COMMENT '最新修改时间',
  `app_key` varchar(255) DEFAULT NULL,
  `app_secret` varchar(255) DEFAULT NULL,
  `class_name` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 正在导出表  nbsaas-admin.user_oauth_config 的数据：~0 rows (大约)
DELETE FROM `user_oauth_config`;

-- 导出  表 nbsaas-admin.user_oauth_token 结构
DROP TABLE IF EXISTS `user_oauth_token`;
CREATE TABLE IF NOT EXISTS `user_oauth_token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `add_date` datetime(6) DEFAULT NULL COMMENT '添加时间',
  `last_date` datetime(6) DEFAULT NULL COMMENT '最新修改时间',
  `access_token` varchar(255) DEFAULT NULL,
  `expires_time` bigint(20) DEFAULT NULL,
  `login_size` int(11) DEFAULT NULL,
  `open_id` varchar(255) DEFAULT NULL,
  `refresh_token` varchar(255) DEFAULT NULL,
  `token_type` varchar(255) DEFAULT NULL,
  `union_id` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `user_oauth_config_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKl7l4hbuly2wmp7tul1ldjeh85` (`user_id`),
  KEY `FKihm5qlb22d3ofuohg6f8l7w81` (`user_oauth_config_id`),
  CONSTRAINT `FKihm5qlb22d3ofuohg6f8l7w81` FOREIGN KEY (`user_oauth_config_id`) REFERENCES `user_oauth_config` (`id`),
  CONSTRAINT `FKl7l4hbuly2wmp7tul1ldjeh85` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 正在导出表  nbsaas-admin.user_oauth_token 的数据：~0 rows (大约)
DELETE FROM `user_oauth_token`;

-- 导出  表 nbsaas-admin.user_password 结构
DROP TABLE IF EXISTS `user_password`;
CREATE TABLE IF NOT EXISTS `user_password` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `add_date` datetime(6) DEFAULT NULL COMMENT '添加时间',
  `last_date` datetime(6) DEFAULT NULL COMMENT '最新修改时间',
  `check_size` int(11) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `salt` varchar(50) DEFAULT NULL,
  `security_type` int(11) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbnfetqc91yx2vu6qwk04ceci7` (`user_id`),
  CONSTRAINT `FKbnfetqc91yx2vu6qwk04ceci7` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 正在导出表  nbsaas-admin.user_password 的数据：~2 rows (大约)
DELETE FROM `user_password`;
INSERT INTO `user_password` (`id`, `add_date`, `last_date`, `check_size`, `password`, `salt`, `security_type`, `user_id`) VALUES
	(1, '2023-06-23 10:57:32.882000', '2023-06-23 10:57:32.882000', 0, 'Ai4YLYJLCVUfg/+dE41NxskgrlSNhywdRUfQWAfIkyg=', 'gyIwQhzO+SogcKf5urQiNUVzJhODZxiFON456pOqTFw=', 0, 1),
	(2, '2023-06-23 10:57:41.112000', '2023-06-23 10:57:41.112000', 0, 'kudVeSUFr8DMYSPiDvtgPFp3EQ/a1+KPtTobZZ6PAhY=', 'HrV7bdZN2O6TDmfV4RuQ9Onk6iqfLs5CvYTwHRLA+wc=', 0, 2),
	(3, '2023-06-23 10:58:14.051000', '2023-06-23 10:58:14.051000', 0, 'G6ERwOIUrwJ+cnea3Kk1iydIb/sl5ED+YBC54HhIQPc=', 'v9c9UGgplk6JP1CccyweAX6UEqg7uCT+CVM7PUF/id0=', 0, 3);

-- 导出  表 nbsaas-admin.user_role 结构
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE IF NOT EXISTS `user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `add_date` datetime(6) DEFAULT NULL COMMENT '添加时间',
  `last_date` datetime(6) DEFAULT NULL COMMENT '最新修改时间',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色id',
  `user_info_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbk0u1la56lxsmwbi40xd2wopr` (`user_info_id`),
  CONSTRAINT `FKbk0u1la56lxsmwbi40xd2wopr` FOREIGN KEY (`user_info_id`) REFERENCES `user_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户角色表';

-- 正在导出表  nbsaas-admin.user_role 的数据：~1 rows (大约)
DELETE FROM `user_role`;
INSERT INTO `user_role` (`id`, `add_date`, `last_date`, `role_id`, `user_info_id`) VALUES
	(1, NULL, NULL, 1, 3);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
