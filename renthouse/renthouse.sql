/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : renthouse

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2018-05-18 21:01:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `aid` varchar(32) DEFAULT NULL COMMENT '管理员编码',
  `aname` varchar(32) DEFAULT NULL COMMENT '管理员名称',
  `apasswd` varchar(32) DEFAULT NULL COMMENT '密码',
  `isAdmin` int(11) DEFAULT NULL COMMENT '超级管理员（0：是/1：不是）'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='InnoDB free: 11264 kB';

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1', 'admin', 'admin', '0');
INSERT INTO `t_admin` VALUES ('b72881a87381401f8d2ac80b41f3dbed', 'haungss', '123456', '1');

-- ----------------------------
-- Table structure for t_appoint
-- ----------------------------
DROP TABLE IF EXISTS `t_appoint`;
CREATE TABLE `t_appoint` (
  `aid` varchar(32) NOT NULL COMMENT '预约编码',
  `aname` varchar(32) DEFAULT NULL COMMENT '预约人',
  `atele` varchar(32) DEFAULT NULL COMMENT '联系方式',
  `antime` varchar(64) DEFAULT NULL COMMENT '预约时间',
  `atime` varchar(32) DEFAULT NULL COMMENT '看房时间',
  `state` int(1) DEFAULT NULL COMMENT '状态（0：未预约/1:已预约）',
  `hid` varchar(32) DEFAULT NULL COMMENT '房子编码',
  `uid` varchar(32) DEFAULT NULL COMMENT '用户编码',
  PRIMARY KEY (`aid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='InnoDB free: 11264 kB';

-- ----------------------------
-- Records of t_appoint
-- ----------------------------

-- ----------------------------
-- Table structure for t_appoint_result
-- ----------------------------
DROP TABLE IF EXISTS `t_appoint_result`;
CREATE TABLE `t_appoint_result` (
  `rid` varchar(32) NOT NULL COMMENT '预约结果编码',
  `state` int(1) DEFAULT NULL COMMENT '0：未联系/1：已联系',
  `result` int(1) DEFAULT NULL COMMENT '0：未签约/1：已签约',
  `reason` varchar(255) DEFAULT NULL COMMENT '未签约原因',
  `name` varchar(32) DEFAULT NULL COMMENT '预约人',
  `atele` varchar(11) DEFAULT NULL COMMENT '联系方式',
  `antime` varchar(64) DEFAULT NULL COMMENT '预约时间',
  `adid` varchar(32) DEFAULT NULL COMMENT '操作人编码',
  `ctime` varchar(64) DEFAULT NULL COMMENT '操作时间',
  `rtype` int(1) DEFAULT NULL COMMENT '0:房客预约结果/1：业主加盟预约结果',
  PRIMARY KEY (`rid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='InnoDB free: 11264 kB';

-- ----------------------------
-- Records of t_appoint_result
-- ----------------------------
INSERT INTO `t_appoint_result` VALUES ('0e326e64b86a4969bc787f7ca1e665e2', '1', '1', '', 'huangss5', '18279185735', '2018-05-01 16:38:39', '1', '2018-05-01 17:06:01', null);
INSERT INTO `t_appoint_result` VALUES ('2b3b29a0774146a8b2b6648b72e1d052', '1', '0', '房源已经出租啦', 'huangss3', '18279185732', '2018-05-01 16:37:51', '1', '2018-05-01 17:23:31', '0');
INSERT INTO `t_appoint_result` VALUES ('2c5d9d2e67264dc19c612d25c63fa45b', '1', '1', '', 'huangss1', '18279185730', '2018-05-01 16:37:15', '1', '2018-05-01 17:23:49', null);
INSERT INTO `t_appoint_result` VALUES ('31f91177905f44c2bfa3578271339623', '1', '1', '', 'vue', '18278918578', '2018-05-16 21:38:59', '1', '2018-05-16 21-41-02', '1');
INSERT INTO `t_appoint_result` VALUES ('b2d821dda46947409958734329b01715', '1', '1', '', 'huangss4', '18279185734', '2018-05-01 16:38:14', '1', '2018-05-01 17:01:46', null);
INSERT INTO `t_appoint_result` VALUES ('eb7fa7cdb3484e198a5ab7e9075741c9', '1', '1', '', '黄先生', '12345678909', '2018-05-01 16:39:16', '1', '2018-05-01 17-33-10', '1');
INSERT INTO `t_appoint_result` VALUES ('f5ee64e7f3ed45158d936c7dafac3c54', '1', '1', '', 'huangss2', '18279185731', '2018-05-01 16:37:34', '1', '2018-05-01 16:53:09', null);

-- ----------------------------
-- Table structure for t_bill
-- ----------------------------
DROP TABLE IF EXISTS `t_bill`;
CREATE TABLE `t_bill` (
  `bid` varchar(32) NOT NULL COMMENT '账单编码',
  `btime` varchar(64) DEFAULT NULL COMMENT '生成时间',
  `bprice` decimal(8,2) DEFAULT NULL COMMENT '账单金额',
  `bdue` varchar(255) DEFAULT NULL COMMENT '账单是由',
  `uid` varchar(32) NOT NULL COMMENT '用户编码',
  `bstate` int(1) DEFAULT NULL COMMENT '支付状态(0:未支付/1:已支付)',
  `bpaytime` varchar(64) DEFAULT NULL COMMENT '支付时间',
  `rid` varchar(32) DEFAULT NULL COMMENT '租客编码',
  PRIMARY KEY (`bid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='InnoDB free: 11264 kB';

-- ----------------------------
-- Records of t_bill
-- ----------------------------
INSERT INTO `t_bill` VALUES ('14b1315d149c40dfaf5d4b1a222d25f0', '2018-05-16 22:03:39', '1200.00', '本月房租账单', '3d0f09125ce44ef0a385e31570709abd', '0', '', 'faed77a0cf7d4d44a31a2df91850664e');

-- ----------------------------
-- Table structure for t_contract
-- ----------------------------
DROP TABLE IF EXISTS `t_contract`;
CREATE TABLE `t_contract` (
  `cid` varchar(32) NOT NULL COMMENT '合同编码',
  `cname` varchar(32) DEFAULT NULL COMMENT '签约人（乙方）',
  `ctele` varchar(11) DEFAULT NULL COMMENT '乙方联系电话',
  `ccompany` varchar(255) DEFAULT NULL COMMENT '公司名（甲方）',
  `ccompanytele` varchar(11) DEFAULT NULL COMMENT '甲方联系电话',
  `cstime` varchar(64) DEFAULT NULL COMMENT '签约时间',
  `cetime` varchar(64) DEFAULT NULL COMMENT '到期时间',
  `cpaytype` int(1) DEFAULT NULL COMMENT '付款方式(0：月付/1：年付)',
  `ccash` double DEFAULT NULL COMMENT '押金',
  `cmoney` decimal(6,2) DEFAULT NULL COMMENT '租金',
  `crtime` varchar(32) DEFAULT NULL COMMENT '租期',
  `hid` varchar(32) DEFAULT NULL COMMENT '房源编码',
  `cpaytime` varchar(32) DEFAULT NULL COMMENT '交租时间',
  `ccashtype` int(1) DEFAULT NULL COMMENT '押金方式(0:押一付一/押一付三)',
  `adid` varchar(32) DEFAULT NULL COMMENT '操作者',
  `uid` varchar(32) DEFAULT NULL COMMENT '乙方账户编码',
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='InnoDB free: 11264 kB';

-- ----------------------------
-- Records of t_contract
-- ----------------------------
INSERT INTO `t_contract` VALUES ('53d70d91875a4f29b5d1d30fbea3beed', 'huangss1', '18279185730', '松子直租', '18279185736', '2018-05-01 17:00', '2019-05-01 17:00', '0', '1000', '3500.00', '1年', '10', '1号', '0', '1', '3d0f09125ce44ef0a385e31570709abd');
INSERT INTO `t_contract` VALUES ('c2f6f043c5ee44989ee9057e567eadd0', 'huangss4', '18279185734', '松子直租', '18279185736', '2018-05-01 05:00', '2019-05-01 05:00', '0', '1000', '1200.00', '1年', '11', '1号', '1', '1', '3d0f09125ce44ef0a385e31570709abd');

-- ----------------------------
-- Table structure for t_contract_owner
-- ----------------------------
DROP TABLE IF EXISTS `t_contract_owner`;
CREATE TABLE `t_contract_owner` (
  `cid` varchar(32) NOT NULL COMMENT '合同编码',
  `cname` varchar(32) DEFAULT NULL COMMENT '签约人（乙方）',
  `ctele` varchar(11) DEFAULT NULL COMMENT '乙方联系电话',
  `ccompany` varchar(255) DEFAULT NULL COMMENT '公司名（甲方）',
  `ccompanytele` varchar(11) DEFAULT NULL COMMENT '甲方联系电话',
  `cstime` varchar(64) DEFAULT NULL COMMENT '签约时间',
  `cetime` varchar(64) DEFAULT NULL COMMENT '到期时间',
  `cmoney` decimal(6,2) DEFAULT NULL COMMENT '租金',
  `crtime` varchar(32) DEFAULT NULL COMMENT '租期',
  `adid` varchar(32) DEFAULT NULL COMMENT '操作者',
  `hid` varchar(32) DEFAULT NULL COMMENT '房源编码',
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='InnoDB free: 11264 kB';

-- ----------------------------
-- Records of t_contract_owner
-- ----------------------------
INSERT INTO `t_contract_owner` VALUES ('120ad729dda44e3aa8169f8cac79908c', '黄先生', '12345678909', '松子直租', '18279185736', '2018-05-01 18:00', '2019-05-01 18:00', '3000.00', '1年', '1', '72fc20a3eeae43ac98bad55aade7be17');

-- ----------------------------
-- Table structure for t_house
-- ----------------------------
DROP TABLE IF EXISTS `t_house`;
CREATE TABLE `t_house` (
  `hid` varchar(32) NOT NULL COMMENT '房源编码',
  `hname` varchar(64) DEFAULT NULL COMMENT '房源标题',
  `hmethod` char(5) DEFAULT NULL COMMENT '居住类型(0：合租/1：整租)',
  `hprice` decimal(6,2) DEFAULT NULL COMMENT '月租金额',
  `htype` char(5) DEFAULT NULL COMMENT '出租类型(0：日租房/1：月租房/2：长租房)',
  `harea` varchar(16) DEFAULT NULL COMMENT '面积',
  `hmodel` varchar(16) DEFAULT NULL COMMENT '户型',
  `hpaytype` int(1) DEFAULT NULL COMMENT '付款方式(0:月付/1：年付)',
  `htoward` varchar(16) DEFAULT NULL COMMENT '朝向',
  `hfloor` varchar(16) DEFAULT NULL COMMENT '楼层',
  `hposition` varchar(64) DEFAULT NULL COMMENT '区域',
  `hsubway` varchar(255) DEFAULT NULL COMMENT '地铁',
  `hstate` varchar(255) DEFAULT NULL COMMENT '状态（0：未出租/1：已出租）',
  `htele` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `hdesc` varchar(100) DEFAULT NULL COMMENT '房子图片',
  `himg` varchar(256) DEFAULT NULL COMMENT '描述',
  `hbelong` int(1) DEFAULT NULL COMMENT '0:自有房/1：代租房',
  PRIMARY KEY (`hid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='InnoDB free: 11264 kB';

-- ----------------------------
-- Records of t_house
-- ----------------------------
INSERT INTO `t_house` VALUES ('10', '东理工6号A室', '1', '3500.00', '2', '约34平米', '4室2卫', '0', '向东南', '3/23层', '广兰418号', '地铁1号线', '1', '18279185739', '', '/img/img_32.jpg', '0');
INSERT INTO `t_house` VALUES ('11', '东理工6号B室', '1', '1200.00', '2', '约34平米', '4室2卫', '0', '向西南', '3/23层', '广兰418号', '地铁1号线', '1', '18279185739', '', '/img/img_4.jpg', '0');
INSERT INTO `t_house` VALUES ('12', '东理工7号A', '1', '500.00', '2', '约13平米', '4室2卫', '0', '向东南', '3/23层', '广兰411号', '地铁1号线', '0', '18279185739', '', '/img/img_1.jpg', '0');
INSERT INTO `t_house` VALUES ('13', '东理工7号B', '1', '1000.00', '2', '约30平米', '4室2卫', '0', '向东南', '3/23层', '广兰411号', '地铁1号线', '1', '18279185739', '', '/img/img_3.jpg', '0');
INSERT INTO `t_house` VALUES ('14', '东理工7号C', '1', '2000.00', '2', '约20平米', '4室2卫', '0', '向东南', '3/23层', '广兰411号', '地铁1号线', '0', '18279185739', '', '/img/img_3.jpg', '0');
INSERT INTO `t_house` VALUES ('15', '东理工7号D', '1', '4000.00', '2', '约50平米', '5室2卫', '0', '向东南', '1/23层', '广兰411号', '地铁1号线', '1', '18279185739', '', '/img/img_4.jpg', '0');
INSERT INTO `t_house` VALUES ('3', '东理工1号', '1', '2000.00', '0', '约23平米', '4室2卫', '1', '向东南', '3/23层', '广兰418号', '地铁1号线', '0', '18279185739', '', '/img/img_1.jpg', '1');
INSERT INTO `t_house` VALUES ('4', '东理工6号', '1', '1500.00', '2', '约23平米', '4室2卫', '0', '向东南', '3/23层', '广兰418号', '地铁1号线', '0', '18279185739', '', '/img/img_3.jpg', '0');
INSERT INTO `t_house` VALUES ('57b4daa00b3643bd9323cfa37ddd55d4', 'vue先生的房子', '0', '1000.00', '0', '50', '一室一厅', '0', '坐北朝南', '2/32', '御北路385号', '近11号线', '0', '18278181865', '', '\\img\\2f3122e0d4d84205afdf760acc134f70_img_25.jpg', '1');
INSERT INTO `t_house` VALUES ('72fc20a3eeae43ac98bad55aade7be17', 'hahha', '0', '4500.00', '2', '约81平米', '四室一厅', '0', '朝南', '2/32', '广兰一号', '临近1号线', '0', '1811112323', '', '\\img\\8558fadffacd480588bfd37bb9645fb3_img_26.jpg', '1');

-- ----------------------------
-- Table structure for t_imgs
-- ----------------------------
DROP TABLE IF EXISTS `t_imgs`;
CREATE TABLE `t_imgs` (
  `iid` varchar(32) NOT NULL COMMENT '图片集编码',
  `iimg` varchar(256) DEFAULT NULL COMMENT '房源的其它图片',
  `hid` varchar(32) DEFAULT NULL COMMENT '房子编码',
  PRIMARY KEY (`iid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='InnoDB free: 11264 kB';

-- ----------------------------
-- Records of t_imgs
-- ----------------------------
INSERT INTO `t_imgs` VALUES ('356359e32da442fd8ddc3846b597c677', '\\img\\01eb2cad3d0f4726bb879334bf16cac5_img_21.jpg', '57b4daa00b3643bd9323cfa37ddd55d4');
INSERT INTO `t_imgs` VALUES ('a60e2fe442624631b683e2b8a34e6817', '\\img\\69cf0fc9447b411da62899e61cfb0b58_img_25.jpg', '72fc20a3eeae43ac98bad55aade7be17');

-- ----------------------------
-- Table structure for t_join
-- ----------------------------
DROP TABLE IF EXISTS `t_join`;
CREATE TABLE `t_join` (
  `jid` varchar(32) DEFAULT NULL COMMENT '委托房源编码',
  `jname` varchar(16) DEFAULT NULL COMMENT '房东',
  `jtele` varchar(11) DEFAULT NULL COMMENT '联系方式',
  `jposition` varchar(255) DEFAULT NULL COMMENT '房源位置',
  `state` int(1) DEFAULT NULL COMMENT '是否处理（0：未处理/1：处理）',
  `jtime` varchar(64) DEFAULT NULL COMMENT '预约时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='InnoDB free: 11264 kB';

-- ----------------------------
-- Records of t_join
-- ----------------------------
INSERT INTO `t_join` VALUES ('fe418575d5b94f24ba89b34ae5fa06b3', '哈哈先生', '12345678901', '江西南昌', '0', '2018-05-01 16:40:10');

-- ----------------------------
-- Table structure for t_log
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log` (
  `lid` varchar(32) DEFAULT NULL COMMENT '日志编码',
  `ltype` varchar(10) DEFAULT NULL COMMENT '日志类型',
  `ltitle` varchar(32) DEFAULT NULL COMMENT '日志标题',
  `lremoteAddr` varchar(64) DEFAULT NULL COMMENT '请求地址',
  `lrequestUri` varchar(64) DEFAULT NULL COMMENT 'uri',
  `lmethod` varchar(10) DEFAULT NULL COMMENT '请求方式',
  `lparams` varchar(500) DEFAULT NULL COMMENT '请求参数',
  `lexception` varchar(256) DEFAULT NULL COMMENT '发生的异常',
  `loperateDate` varchar(64) DEFAULT NULL COMMENT '开始时间',
  `ltimeout` varchar(64) DEFAULT NULL COMMENT '结束时间',
  `aid` varchar(32) DEFAULT NULL COMMENT '管理员编码'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='InnoDB free: 11264 kB';

-- ----------------------------
-- Records of t_log
-- ----------------------------
INSERT INTO `t_log` VALUES ('49ccddc06e8b410e96d641af85084d7b', 'info', '登陆系统', '0:0:0:0:0:0:0:1', '/adminLogin.action', 'POST', 'requri=&aname=admin&apasswd=', null, '2018-05-01 16:51:21', '0:0:0.67', '1');
INSERT INTO `t_log` VALUES ('49086c5bdf414f2c97f6a2aaf3b16c03', 'info', '生成合同', '0:0:0:0:0:0:0:1', '/admin/addContract.action', 'POST', 'aid=0bdfebe4ee55460aac8fe1a41dc7572d&hid=13&uid=3d0f09125ce44ef0a385e31570709abd&cname=huangss2&ctele=18279185731&ccompany=松子直租&ccompanytele=18279185736&cstime=2018-05-01 05:00&cetime=2019-05-01 05:00&cpaytype=0&cpaytime=1号&ccashtype=0&ccash=1000&cmoney=1000.00&crtime=1年', null, '2018-05-01 16:53:09', '0:0:0.93', '1');
INSERT INTO `t_log` VALUES ('7542e06706bc4b4e8d90ff5d08745df3', 'info', '登陆系统', '0:0:0:0:0:0:0:1', '/adminLogin.action', 'POST', 'requri=/admin/skipBillManagePage.action&aname=admin&apasswd=', null, '2018-05-01 17:00:52', '0:0:0.15', '1');
INSERT INTO `t_log` VALUES ('39eda55132b2467082030ca9a602c429', 'info', '生成合同', '0:0:0:0:0:0:0:1', '/admin/addContract.action', 'POST', 'aid=93f2eff16fe44b198ffb2677b2c46d08&hid=11&uid=3d0f09125ce44ef0a385e31570709abd&cname=huangss4&ctele=18279185734&ccompany=松子直租&ccompanytele=18279185736&cstime=2018-05-01 05:00&cetime=2019-05-01 05:00&cpaytype=0&cpaytime=1号&ccashtype=1&ccash=1000&cmoney=1200.00&crtime=1年', null, '2018-05-01 17:01:45', '0:0:0.437', '1');
INSERT INTO `t_log` VALUES ('2ce489f5bfb74d1f8065fb2e174c5d25', 'info', '生成合同', '0:0:0:0:0:0:0:1', '/admin/addContract.action', 'POST', 'aid=d9424faf73ec4775b43b07f84e32e798&hid=15&uid=3d0f09125ce44ef0a385e31570709abd&cname=huangss5&ctele=18279185735&ccompany=松子直租&ccompanytele=18279185736&cstime=2018-05-01 05:00&cetime=2019-05-01 05:00&cpaytype=0&cpaytime=1号&ccashtype=0&ccash=1000&cmoney=4000.00&crtime=1年', null, '2018-05-01 17:06:01', '0:0:0.181', '1');
INSERT INTO `t_log` VALUES ('950f4bfb1d1d46d6b5418dc67e1b02bf', 'info', '生成合同', '0:0:0:0:0:0:0:1', '/admin/addContract.action', 'POST', 'aid=dd4927432c214c2b9796ac07e1698354&hid=13&uid=3d0f09125ce44ef0a385e31570709abd&cname=huangss3&ctele=18279185732&ccompany=松子直租&ccompanytele=18279185736&cstime=2018-05-01 17:00&cetime=2018-05-01 17:00&cpaytype=0&cpaytime=1号&ccashtype=0&ccash=1000&cmoney=1000.00&crtime=1年', null, '2018-05-01 17:23:04', '0:0:0.31', '1');
INSERT INTO `t_log` VALUES ('3ea82b8289e741d788c415788aacf692', 'info', '取消看房预约', '0:0:0:0:0:0:0:1', '/admin/cancelAppoint.action', 'POST', 'aid=dd4927432c214c2b9796ac07e1698354&name=huangss3&atele=18279185732&antime=2018-05-01 16:37:51&state=1&reason=房源已经出租啦', null, '2018-05-01 17:23:31', '0:0:0.134', '1');
INSERT INTO `t_log` VALUES ('6880604cbc4f4046a785023c4eaf9e6d', 'info', '生成合同', '0:0:0:0:0:0:0:1', '/admin/addContract.action', 'POST', 'aid=f422fb6be7ac40c581f0360d5116699e&hid=10&uid=3d0f09125ce44ef0a385e31570709abd&cname=huangss1&ctele=18279185730&ccompany=松子直租&ccompanytele=18279185736&cstime=2018-05-01 17:00&cetime=2019-05-01 17:00&cpaytype=0&cpaytime=1号&ccashtype=0&ccash=1000&cmoney=3500.00&crtime=1年', null, '2018-05-01 17:23:49', '0:0:0.386', '1');
INSERT INTO `t_log` VALUES ('b01a9126a05a4c018cb6699f44de9872', 'info', '删除合同', '0:0:0:0:0:0:0:1', '/admin/delContractByCid.action', 'GET', 'cid=c2f6f043c5ee44989ee9057e567eadd0&uid=3d0f09125ce44ef0a385e31570709abd&_=1525166779252', null, '2018-05-01 17:26:40', '0:0:0.25', '1');
INSERT INTO `t_log` VALUES ('4d55d6a6cbf74df0bed21a3cebc64db9', 'info', '删除合同', '0:0:0:0:0:0:0:1', '/admin/delContractByCid.action', 'GET', 'cid=4fdb0e1a0976451e971a28e2eca1e9eb&uid=3d0f09125ce44ef0a385e31570709abd&_=1525166810800', null, '2018-05-01 17:26:53', '0:0:0.97', '1');
INSERT INTO `t_log` VALUES ('ef57c586169d42b1a4df254e51c5a802', 'info', '增加房东房源信息', '0:0:0:0:0:0:0:1', '/admin/addJoinHouse.action', 'POST', '', null, '2018-05-01 17:33:10', '0:0:0.530', '1');
INSERT INTO `t_log` VALUES ('8150f4e3cd3c44b5a35c93bcde726800', 'info', '生成房东合同', '0:0:0:0:0:0:0:1', '/admin/addOwnerContract.action', 'POST', 'oid=37d2008ac52e49849bc27e1a27c29e97&hid=72fc20a3eeae43ac98bad55aade7be17&cname=黄先生&ctele=12345678909&ccompany=松子直租&ccompanytele=18279185736&cstime=2018-05-01 18:00&cetime=2019-05-01 18:00&cmoney=5000&crtime=1年', null, '2018-05-01 17:34:58', '0:0:0.258', '1');
INSERT INTO `t_log` VALUES ('235123bf2068402584680343c678a431', 'info', '修改房东合同', '0:0:0:0:0:0:0:1', '/admin/updateOwnerContract.action', 'POST', 'cid=120ad729dda44e3aa8169f8cac79908c&cname=黄先生&ctele=12345678909&ccompany=松子直租&ccompanytele=18279185736&cstime=2018-05-01 18:00&cetime=2019-05-01 18:00&cmoney=3000&crtime=1年', null, '2018-05-01 17:35:21', '0:0:0.130', '1');
INSERT INTO `t_log` VALUES ('aefccaeffe6448758a42ae28e90afbf8', 'info', '删除合同', '0:0:0:0:0:0:0:1', '/admin/delContractByCid.action', 'GET', 'cid=c2f6f043c5ee44989ee9057e567eadd0&uid=3d0f09125ce44ef0a385e31570709abd&_=1525167660141', null, '2018-05-01 17:41:04', '0:0:0.34', '1');
INSERT INTO `t_log` VALUES ('99e1f0231ddb4736af60d62d7545a8b6', 'info', '删除合同', '0:0:0:0:0:0:0:1', '/admin/delContractByCid.action', 'GET', 'cid=3467a424b8834159aef3e925ebb4460d&uid=3d0f09125ce44ef0a385e31570709abd&_=1525167660142', null, '2018-05-01 17:41:31', '0:0:0.108', '1');
INSERT INTO `t_log` VALUES ('f600d92a42d04d1487285f2de1d3128a', 'info', '删除合同', '0:0:0:0:0:0:0:1', '/admin/delContractByCid.action', 'GET', 'cid=c2f6f043c5ee44989ee9057e567eadd0&uid=3d0f09125ce44ef0a385e31570709abd&_=1525167761165', null, '2018-05-01 17:42:44', '0:0:0.26', '1');
INSERT INTO `t_log` VALUES ('e8856057f22f42f887bb253bb15c4cd4', 'info', '删除合同', '0:0:0:0:0:0:0:1', '/admin/delContractByCid.action', 'GET', 'cid=c2f6f043c5ee44989ee9057e567eadd0&uid=3d0f09125ce44ef0a385e31570709abd&_=1525167856653', null, '2018-05-01 17:44:21', '0:0:0.11', '1');
INSERT INTO `t_log` VALUES ('1be7ad1ed1de40d187d490532cd8c807', 'info', '登陆系统', '0:0:0:0:0:0:0:1', '/adminLogin.action', 'POST', 'requri=/admin/skipRenterContractPage.action&aname=admin&apasswd=', null, '2018-05-01 17:47:14', '0:0:0.10', '1');
INSERT INTO `t_log` VALUES ('2de7e935e12b47ab81482c1b4b0b2563', 'info', '删除合同', '0:0:0:0:0:0:0:1', '/admin/delContractByCid.action', 'GET', 'cid=c2f6f043c5ee44989ee9057e567eadd0&uid=3d0f09125ce44ef0a385e31570709abd&_=1525168035589', null, '2018-05-01 17:47:19', '0:0:0.6', '1');
INSERT INTO `t_log` VALUES ('be040d2604bb4e339e651c45ca39e0df', 'info', '删除合同', '0:0:0:0:0:0:0:1', '/admin/delContractByCid.action', 'GET', 'cid=c2f6f043c5ee44989ee9057e567eadd0&uid=3d0f09125ce44ef0a385e31570709abd&_=1525168132749', null, '2018-05-01 17:49:01', '0:0:0.24', '1');
INSERT INTO `t_log` VALUES ('b5934e8abecd4a8b8ea958994c4bc5ec', 'info', '登陆系统', '0:0:0:0:0:0:0:1', '/adminLogin.action', 'POST', 'requri=&aname=admin&apasswd=', null, '2018-05-15 21:30:00', '0:0:0.106', '1');
INSERT INTO `t_log` VALUES ('6b8332ae2b0d472b9eaedc72194c89c3', 'info', '登陆系统', '0:0:0:0:0:0:0:1', '/adminLogin.action', 'POST', 'requri=&aname=admin&apasswd=', null, '2018-05-16 21:23:20', '0:0:0.236', '1');
INSERT INTO `t_log` VALUES ('f5bf63ce740444bc81c6b7224d7bdfc7', 'info', '登陆系统', '0:0:0:0:0:0:0:1', '/adminLogin.action', 'POST', 'requri=&aname=admin&apasswd=', null, '2018-05-16 21:28:12', '0:0:0.4', '1');
INSERT INTO `t_log` VALUES ('71df54180e3d457e8f6c61d6623a990e', 'info', '增加房东房源信息', '0:0:0:0:0:0:0:1', '/admin/addJoinHouse.action', 'POST', '', null, '2018-05-16 21:41:02', '0:0:0.542', '1');
INSERT INTO `t_log` VALUES ('c27e0a8ca64341ffa8a08544c9b6d741', 'info', '删除账单', '0:0:0:0:0:0:0:1', '/admin/delBillByBid.action', 'POST', 'bid=fad2fba40ea44f72a1fb308e872d98d1', null, '2018-05-16 22:03:30', '0:0:0.63', '1');
INSERT INTO `t_log` VALUES ('874e3ce701e14fb9ad29c7f341f8ae6c', 'info', '发送账单', '0:0:0:0:0:0:0:1', '/admin/sendBill.action', 'POST', 'cid=c2f6f043c5ee44989ee9057e567eadd0&uid=3d0f09125ce44ef0a385e31570709abd&mprice=1200', null, '2018-05-16 22:03:39', '0:0:0.141', '1');
INSERT INTO `t_log` VALUES ('39f46bf2a8fa4edc9805bdf92ced111a', 'info', '新增普通管理员', '0:0:0:0:0:0:0:1', '/admin/addAdmin.action', 'POST', 'isAdmin=1&aname=haungss&apasswd=', null, '2018-05-16 22:28:00', '0:0:0.244', '1');
INSERT INTO `t_log` VALUES ('fbc2c6122efe4d1595b9d7e648e05a0a', 'info', '退出系统', '0:0:0:0:0:0:0:1', '/admin/exit.action', 'GET', '', null, '2018-05-16 22:28:09', '0:0:0.1', '1');
INSERT INTO `t_log` VALUES ('ed3239c562ce4270b3265b9208957851', 'info', '登陆系统', '0:0:0:0:0:0:0:1', '/adminLogin.action', 'POST', 'requri=&aname=admin&apasswd=', null, '2018-05-16 22:28:29', '0:0:0.2', '1');
INSERT INTO `t_log` VALUES ('8315da9c0bd44c3aa01beff482c21a68', 'info', '退出系统', '0:0:0:0:0:0:0:1', '/admin/exit.action', 'GET', '', null, '2018-05-16 22:28:46', '0:0:0.2', '1');
INSERT INTO `t_log` VALUES ('894e49c292044149934cbee260668308', 'info', '登陆系统', '0:0:0:0:0:0:0:1', '/adminLogin.action', 'POST', 'requri=&aname=haungss&apasswd=', null, '2018-05-16 22:28:53', '0:0:0.2', 'b72881a87381401f8d2ac80b41f3dbed');
INSERT INTO `t_log` VALUES ('d5a6dc3e34af48ca93a534e9b9f14717', 'info', '删除管理员', '0:0:0:0:0:0:0:1', '/admin/delAdminByids.action', 'POST', 'ids=1', null, '2018-05-16 22:29:00', '0:0:0.0', 'b72881a87381401f8d2ac80b41f3dbed');
INSERT INTO `t_log` VALUES ('b10204a451bc4ef2afcebbac598c4c71', 'info', '登陆系统', '0:0:0:0:0:0:0:1', '/adminLogin.action', 'POST', 'requri=/admin/skipAdminIndexPage.action&aname=admin&apasswd=', null, '2018-05-16 22:34:38', '0:0:0.3', '1');

-- ----------------------------
-- Table structure for t_owner
-- ----------------------------
DROP TABLE IF EXISTS `t_owner`;
CREATE TABLE `t_owner` (
  `oid` varchar(32) NOT NULL COMMENT '房东编码',
  `oname` varchar(32) DEFAULT NULL COMMENT '房东名',
  `otele` varchar(11) DEFAULT NULL COMMENT '联系方式',
  `hid` varchar(32) DEFAULT NULL COMMENT '房源编码',
  `cid` varchar(32) DEFAULT NULL COMMENT '合同编码',
  PRIMARY KEY (`oid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='InnoDB free: 11264 kB';

-- ----------------------------
-- Records of t_owner
-- ----------------------------
INSERT INTO `t_owner` VALUES ('37d2008ac52e49849bc27e1a27c29e97', '黄先生', '12345678909', '72fc20a3eeae43ac98bad55aade7be17', '120ad729dda44e3aa8169f8cac79908c');
INSERT INTO `t_owner` VALUES ('6e0d0b6522de4b489525766e727c333b', 'vue', '18278918578', '57b4daa00b3643bd9323cfa37ddd55d4', '');

-- ----------------------------
-- Table structure for t_rental
-- ----------------------------
DROP TABLE IF EXISTS `t_rental`;
CREATE TABLE `t_rental` (
  `mid` varchar(32) NOT NULL COMMENT '租金编码',
  `mname` varchar(32) DEFAULT NULL COMMENT '交租人',
  `mtele` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `mptime` varchar(64) DEFAULT NULL COMMENT '上次交租时间',
  `mstime` varchar(32) DEFAULT NULL COMMENT '应交租时间',
  `mtime` varchar(64) DEFAULT NULL COMMENT '本次交租时间',
  `mntime` varchar(64) DEFAULT NULL COMMENT '下次交租时间',
  `mprice` decimal(6,2) DEFAULT NULL COMMENT '租金',
  `uid` varchar(32) DEFAULT NULL COMMENT '用户编码',
  `cid` varchar(32) DEFAULT NULL COMMENT '合同编码',
  PRIMARY KEY (`mid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='InnoDB free: 11264 kB';

-- ----------------------------
-- Records of t_rental
-- ----------------------------
INSERT INTO `t_rental` VALUES ('0f9533e9d32a47329475c9f23e5ab471', 'huangss1', '18279185730', '', '1号', '2018-05-01 17:24:44', '2018-06-01', '3500.00', '3d0f09125ce44ef0a385e31570709abd', '53d70d91875a4f29b5d1d30fbea3beed');
INSERT INTO `t_rental` VALUES ('b519c4e6237642b39da544c89583eba9', 'huangss4', '18279185734', '', '1号', '', '2018-05-01', '1200.00', '3d0f09125ce44ef0a385e31570709abd', 'c2f6f043c5ee44989ee9057e567eadd0');

-- ----------------------------
-- Table structure for t_renter
-- ----------------------------
DROP TABLE IF EXISTS `t_renter`;
CREATE TABLE `t_renter` (
  `rid` varchar(32) NOT NULL COMMENT '租客编码',
  `uid` varchar(32) DEFAULT NULL COMMENT '用户编码',
  `hid` varchar(32) DEFAULT NULL COMMENT '房源编码',
  `cid` varchar(32) DEFAULT NULL COMMENT '合同编码',
  PRIMARY KEY (`rid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='InnoDB free: 11264 kB';

-- ----------------------------
-- Records of t_renter
-- ----------------------------
INSERT INTO `t_renter` VALUES ('b949e16248ef40279e8fbf91d7076e2d', '3d0f09125ce44ef0a385e31570709abd', '10', '53d70d91875a4f29b5d1d30fbea3beed');
INSERT INTO `t_renter` VALUES ('faed77a0cf7d4d44a31a2df91850664e', '3d0f09125ce44ef0a385e31570709abd', '11', 'c2f6f043c5ee44989ee9057e567eadd0');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `uid` varchar(32) NOT NULL COMMENT '租客编码',
  `uname` varchar(32) DEFAULT NULL COMMENT '租客名称',
  `upasswd` varchar(128) DEFAULT NULL COMMENT '登陆密码',
  `utele` varchar(11) DEFAULT NULL COMMENT '联系方式',
  `uemail` varchar(32) DEFAULT NULL COMMENT '电子邮箱',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='InnoDB free: 11264 kB';

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('3d0f09125ce44ef0a385e31570709abd', '黄松松', 'ngPL2rkLCPy6n3WUZNLqCg==', '18279185739', '770363228@qq.com');
