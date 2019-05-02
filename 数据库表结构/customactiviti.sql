/*
Navicat MySQL Data Transfer

Source Server         : mylocal
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : customactiviti

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2019-05-02 16:38:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `aproject_prcessdescription`
-- ----------------------------
DROP TABLE IF EXISTS `aproject_prcessdescription`;
CREATE TABLE `aproject_prcessdescription` (
  `description_Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '审批过程描述表的ID，主键',
  `description_ProcessId` int(11) DEFAULT NULL COMMENT '审批过程表中的ID',
  `description_Time` varchar(100) DEFAULT NULL COMMENT '审批描述表的描述时间',
  `description_Content` varchar(200) DEFAULT NULL COMMENT '审批描述表的描述内容，即是属于当前节点，还是进入下一个节点，还是属于终止',
  PRIMARY KEY (`description_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='审批过程描述表';

-- ----------------------------
-- Records of aproject_prcessdescription
-- ----------------------------
INSERT INTO `aproject_prcessdescription` VALUES ('1', '1', '2017-10-17 14:05:03', '当前审批流程-审批流程1-执行完毕;审批节点-审批节点1(1---4)-为最后一个节点，该审批过程结束');
INSERT INTO `aproject_prcessdescription` VALUES ('2', '1', '2017-10-17 15:29:27', '当前审批流程-测试流程-审批执行中;审批节点-审批节点1(1---4)-审批完毕，进入后续节点-审批节点2-进行审批，通过人数变为0');
INSERT INTO `aproject_prcessdescription` VALUES ('3', '2', '2017-10-17 15:29:49', '当前审批流程-测试流程-审批执行中;审批节点-审批节点2-不变，通过人数+1');
INSERT INTO `aproject_prcessdescription` VALUES ('4', '2', '2017-10-17 15:30:06', '当前审批流程-测试流程-执行完毕;审批节点-审批节点2-为最后一个节点，该审批过程结束');
INSERT INTO `aproject_prcessdescription` VALUES ('5', '3', '2017-10-17 17:06:10', '当前审批流程-审批流程1-执行完毕;审批节点-审批节点1(1---4)-为最后一个节点，该审批过程结束');
INSERT INTO `aproject_prcessdescription` VALUES ('6', null, '2017-10-17 17:06:37', '当前审批流程-审批流程1-执行完毕;审批节点-审批节点1(1---4)-为最后一个节点，该审批过程结束');
INSERT INTO `aproject_prcessdescription` VALUES ('7', null, '2017-10-17 17:12:26', '当前审批流程-审批流程1-执行完毕;审批节点-审批节点1(1---4)-为最后一个节点，该审批过程结束');
INSERT INTO `aproject_prcessdescription` VALUES ('8', null, '2017-10-17 17:15:01', '当前审批流程-审批流程1-执行完毕;审批节点-审批节点1(1---4)-为最后一个节点，该审批过程结束');
INSERT INTO `aproject_prcessdescription` VALUES ('9', null, '2017-10-17 17:19:55', '当前审批流程-审批流程1-执行完毕;审批节点-审批节点1(1---4)-为最后一个节点，该审批过程结束');
INSERT INTO `aproject_prcessdescription` VALUES ('10', null, '2017-10-17 17:22:29', '当前审批流程-审批流程1-执行完毕;审批节点-审批节点1(1---4)-为最后一个节点，该审批过程结束');
INSERT INTO `aproject_prcessdescription` VALUES ('11', null, '2017-10-17 17:27:26', '当前审批流程-审批流程1-执行完毕;审批节点-审批节点1(1---4)-为最后一个节点，该审批过程结束');
INSERT INTO `aproject_prcessdescription` VALUES ('12', null, '2017-10-18 09:18:03', '当前审批流程-审批流程1-执行完毕;审批节点-审批节点1(1---4)-为最后一个节点，该审批过程结束');
INSERT INTO `aproject_prcessdescription` VALUES ('13', null, '2017-10-18 10:23:26', '当前审批流程-审批流程1-执行完毕;审批节点-审批节点1(1---4)-为最后一个节点，该审批过程结束');
INSERT INTO `aproject_prcessdescription` VALUES ('14', null, '2017-10-18 10:27:31', '当前审批流程-审批流程1-执行完毕;审批节点-审批节点1(1---4)-为最后一个节点，该审批过程结束');
INSERT INTO `aproject_prcessdescription` VALUES ('15', null, '2017-10-18 10:33:12', '当前审批流程-审批流程1-执行完毕;审批节点-审批节点1(1---4)-为最后一个节点，该审批过程结束');
INSERT INTO `aproject_prcessdescription` VALUES ('16', null, '2017-10-18 10:49:23', '当前审批流程-审批流程1-执行完毕;审批节点-审批节点1(1---4)-为最后一个节点，该审批过程结束');
INSERT INTO `aproject_prcessdescription` VALUES ('17', null, '2017-10-18 10:58:07', '当前审批流程-审批流程1-执行完毕;审批节点-审批节点1(1---4)-为最后一个节点，该审批过程结束');
INSERT INTO `aproject_prcessdescription` VALUES ('18', null, '2017-10-18 10:59:06', '当前审批流程-审批流程1-执行完毕;审批节点-审批节点1(1---4)-为最后一个节点，该审批过程结束');
INSERT INTO `aproject_prcessdescription` VALUES ('19', null, '2017-10-18 11:02:27', '当前审批流程-审批流程1-执行完毕;审批节点-审批节点1(1---4)-为最后一个节点，该审批过程结束');
INSERT INTO `aproject_prcessdescription` VALUES ('20', null, '2017-10-18 11:05:29', '当前审批流程-审批流程1-执行完毕;审批节点-审批节点1(1---4)-为最后一个节点，该审批过程结束');
INSERT INTO `aproject_prcessdescription` VALUES ('21', null, '2017-10-18 11:17:32', '当前审批流程-审批流程1-执行完毕;审批节点-审批节点1(1---4)-为最后一个节点，该审批过程结束');
INSERT INTO `aproject_prcessdescription` VALUES ('22', null, '2017-10-18 11:20:12', '当前审批流程-审批流程1-执行完毕;审批节点-审批节点1(1---4)-为最后一个节点，该审批过程结束');
INSERT INTO `aproject_prcessdescription` VALUES ('23', null, '2017-10-18 11:21:03', '当前审批流程-审批流程1-执行完毕;审批节点-审批节点1(1---4)-为最后一个节点，该审批过程结束');
INSERT INTO `aproject_prcessdescription` VALUES ('24', null, '2017-10-18 11:22:17', '当前审批流程-审批流程1-执行完毕;审批节点-审批节点1(1---4)-为最后一个节点，该审批过程结束');
INSERT INTO `aproject_prcessdescription` VALUES ('25', null, '2017-10-18 11:23:51', '当前审批流程-审批流程1-执行完毕;审批节点-审批节点1(1---4)-为最后一个节点，该审批过程结束');
INSERT INTO `aproject_prcessdescription` VALUES ('26', null, '2017-10-18 11:25:16', '当前审批流程-审批流程1-执行完毕;审批节点-审批节点1(1---4)-为最后一个节点，该审批过程结束');
INSERT INTO `aproject_prcessdescription` VALUES ('27', null, '2019-05-02 15:18:07', '当前审批流程-审批流程1-执行完毕;审批节点-审批节点1(1---4)-为最后一个节点，该审批过程结束');
INSERT INTO `aproject_prcessdescription` VALUES ('28', '356', '2019-05-02 15:24:36', '当前审批流程-审批流程1-执行完毕;审批节点-审批节点1(1---4)-为最后一个节点，该审批过程结束');
INSERT INTO `aproject_prcessdescription` VALUES ('29', '356', '2019-05-02 15:25:24', '当前审批流程-审批流程1-由于总人数-不通过人数超过最小通过人数，并且审批节点-审批节点1(1---4)-无法被打回，则审批过程结束');
INSERT INTO `aproject_prcessdescription` VALUES ('30', '356', '2019-05-02 15:32:36', '当前审批流程-审批流程1-由于总人数-不通过人数超过最小通过人数，并且审批节点-审批节点1(1---4)-无法被打回，则审批过程结束');

-- ----------------------------
-- Table structure for `aproject_process`
-- ----------------------------
DROP TABLE IF EXISTS `aproject_process`;
CREATE TABLE `aproject_process` (
  `projectprocess_Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '项目进程序号ID',
  `project_Name` varchar(255) DEFAULT NULL COMMENT '项目名',
  `project_Id` int(11) DEFAULT NULL COMMENT '项目ID，外键，对应新增一个项目时候的ID,即是aproject_manager中的apply_id',
  `project_Stryle` varchar(10) DEFAULT '需要' COMMENT '项目是否需要进行审批，标识需要和不需要',
  `current_NodeOrder` int(11) DEFAULT '1' COMMENT '当前审批的节点，缺省值为1，表示进入第一个节点',
  `process_FinishStatus` varchar(100) DEFAULT NULL COMMENT '该项目审批流程是否完成',
  `process_ApprovalId` int(11) DEFAULT NULL COMMENT '该审批项目选择的审批流程内容，对应的一个审批流程表中的ID',
  `process_ApprovalName` varchar(100) DEFAULT NULL COMMENT '选择的审批流程的流程名',
  `current_NodeName` varchar(45) DEFAULT NULL COMMENT '当前的审批节点的名字',
  `description_Passnumber` int(11) DEFAULT '0' COMMENT '当前审批节点通过的人数，默认开始是0',
  `description_Refusenumber` int(11) DEFAULT '0' COMMENT '当前审批节点中，拒绝同意的人数，默认是0',
  `process_Type` varchar(45) DEFAULT NULL COMMENT '需要审批的类型，比如采购，维修，报废等',
  PRIMARY KEY (`projectprocess_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=357 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='项目进程表';

-- ----------------------------
-- Records of aproject_process
-- ----------------------------
INSERT INTO `aproject_process` VALUES ('276', '32103134', '472', '需要', '1', '流程结束，审批工作通过', '24', '审批流程1', '审批节点1(1---4)', '1', '0', '项目立项');
INSERT INTO `aproject_process` VALUES ('277', '小米手机', '47', '需要', '1', '未完成', '25', '审批流程2', '审批节点2', '0', '0', '耗材申请');
INSERT INTO `aproject_process` VALUES ('278', '华为手机', '35', '需要', '1', '未完成', '26', '审批流程3', '审批节点3', '0', '0', '报废申请');
INSERT INTO `aproject_process` VALUES ('279', '苹果手机', '48', '需要', '1', '未完成', '27', '审批流程4', '审批节点1(1---4)', '0', '0', '耗材申请');
INSERT INTO `aproject_process` VALUES ('280', '流程测试', '473', '需要', '2', '流程结束，审批工作通过', '31', '测试流程', '审批节点2', '2', '0', '项目立项');
INSERT INTO `aproject_process` VALUES ('282', 'asdasdas', '73', '需要', '1', '流程结束，审批工作通过', '24', '审批流程1', '审批节点1(1---4)', '1', '0', '资产调入与借出');
INSERT INTO `aproject_process` VALUES ('283', '速度大萨达', '74', '需要', '1', '流程结束，审批工作通过', '24', '审批流程1', '审批节点1(1---4)', '1', '0', '资产调入与借出');
INSERT INTO `aproject_process` VALUES ('284', '撒大声地', '75', '需要', '1', '流程结束，审批工作通过', '24', '审批流程1', '审批节点1(1---4)', '1', '0', '资产调入与借出');
INSERT INTO `aproject_process` VALUES ('285', 'sdadas撒大声', '76', '需要', '1', '流程结束，审批工作通过', '24', '审批流程1', '审批节点1(1---4)', '1', '0', '资产调入与借出');
INSERT INTO `aproject_process` VALUES ('286', 'asdsadsa', '77', '需要', '1', '流程结束，审批工作通过', '24', '审批流程1', '审批节点1(1---4)', '1', '0', '资产调入与借出');
INSERT INTO `aproject_process` VALUES ('287', '实质性大声大声', '78', '需要', '1', '流程结束，审批工作通过', '24', '审批流程1', '审批节点1(1---4)', '1', '0', '资产调入与借出');
INSERT INTO `aproject_process` VALUES ('288', '阿萨德的撒的', '79', '需要', '1', '流程结束，审批工作通过', '24', '审批流程1', '审批节点1(1---4)', '1', '0', '资产调入与借出');
INSERT INTO `aproject_process` VALUES ('289', 'dsfdsf', '80', '需要', '1', '流程结束，审批工作通过', '24', '审批流程1', '审批节点1(1---4)', '1', '0', '资产调入与借出');
INSERT INTO `aproject_process` VALUES ('290', '小米手机', '61', '需要', '1', '未完成', '24', '审批流程1', '审批节点1(1---4)', '0', '0', '耗材申请');
INSERT INTO `aproject_process` VALUES ('291', '苹果手机', '63', '需要', '1', '未完成', '25', '审批流程2', '审批节点2', '0', '0', '耗材申请');
INSERT INTO `aproject_process` VALUES ('292', '圣达菲第三方', '81', '需要', '1', '流程结束，审批工作通过', '24', '审批流程1', '审批节点1(1---4)', '1', '0', '资产调入与借出');
INSERT INTO `aproject_process` VALUES ('293', '小米手机', '64', '需要', '1', '未完成', '24', '审批流程1', '审批节点1(1---4)', '0', '0', '耗材申请');
INSERT INTO `aproject_process` VALUES ('294', 'sadasdas', '82', '需要', '1', '流程结束，审批工作通过', '24', '审批流程1', '审批节点1(1---4)', '1', '0', '资产调入与借出');
INSERT INTO `aproject_process` VALUES ('295', 'sadasdas', '83', '需要', '1', '流程结束，审批工作通过', '24', '审批流程1', '审批节点1(1---4)', '1', '0', '资产调入与借出');
INSERT INTO `aproject_process` VALUES ('296', '苹果手机', '65', '需要', '1', '未完成', '25', '审批流程2', '审批节点2', '0', '0', '耗材申请');
INSERT INTO `aproject_process` VALUES ('297', 'cxvcdvcxv', '84', '需要', '1', '流程结束，审批工作通过', '24', '审批流程1', '审批节点1(1---4)', '1', '0', '资产调入与借出');
INSERT INTO `aproject_process` VALUES ('298', 'aaaaaaaaaaa', '85', '需要', '1', '流程结束，审批工作通过', '24', '审批流程1', '审批节点1(1---4)', '1', '0', '资产调入与借出');
INSERT INTO `aproject_process` VALUES ('299', 'bbbbbbbbbbb', '86', '需要', '1', '流程结束，审批工作通过', '24', '审批流程1', '审批节点1(1---4)', '1', '0', '资产调入与借出');
INSERT INTO `aproject_process` VALUES ('300', 'cccccccccc', '87', '需要', '1', '流程结束，审批工作通过', '24', '审批流程1', '审批节点1(1---4)', '1', '0', '资产调入与借出');
INSERT INTO `aproject_process` VALUES ('301', 'ddddddddd', '88', '需要', '1', '流程结束，审批工作通过', '24', '审批流程1', '审批节点1(1---4)', '1', '0', '资产调入与借出');
INSERT INTO `aproject_process` VALUES ('302', '小米手机', '66', '需要', '1', '未完成', '24', '审批流程1', '审批节点1(1---4)', '0', '0', '耗材申请');
INSERT INTO `aproject_process` VALUES ('303', 'eeeeeeeee', '89', '需要', '1', '流程结束，审批工作通过', '24', '审批流程1', '审批节点1(1---4)', '1', '0', '资产调入与借出');
INSERT INTO `aproject_process` VALUES ('304', 'fffffffffffff', '90', '需要', '1', '流程结束，审批工作通过', '24', '审批流程1', '审批节点1(1---4)', '1', '0', '资产调入与借出');
INSERT INTO `aproject_process` VALUES ('305', 'gggggggggggg', '91', '需要', '1', '流程结束，审批工作通过', '24', '审批流程1', '审批节点1(1---4)', '1', '0', '资产调入与借出');
INSERT INTO `aproject_process` VALUES ('306', 'hhhhhhhhhhhhhh', '92', '需要', '1', '流程结束，审批工作通过', '24', '审批流程1', '审批节点1(1---4)', '1', '0', '资产调入与借出');
INSERT INTO `aproject_process` VALUES ('307', 'jjjjjjjjjjjjjj', '93', '需要', '1', '流程结束，审批工作通过', '24', '审批流程1', '审批节点1(1---4)', '1', '0', '资产调入与借出');
INSERT INTO `aproject_process` VALUES ('308', 'kkkkkkkkkk', '94', '需要', '1', '流程结束，审批工作通过', '24', '审批流程1', '审批节点1(1---4)', '1', '0', '资产调入与借出');
INSERT INTO `aproject_process` VALUES ('309', '买买买', '475', '需要', '1', '未完成', '25', '审批流程2', '审批节点2', '0', '0', '项目立项');
INSERT INTO `aproject_process` VALUES ('310', '龙绍松', '476', '需要', '1', '未完成', '26', '审批流程3', '审批节点3', '0', '0', '项目立项');
INSERT INTO `aproject_process` VALUES ('311', 'lss2', '477', '需要', '1', '未完成', '24', '审批流程1', '审批节点1(1---4)', '0', '0', '项目立项');
INSERT INTO `aproject_process` VALUES ('312', '买10台手机', '478', '需要', '1', '未完成', '24', '审批流程1', '审批节点1(1---4)', '0', '0', '项目立项');
INSERT INTO `aproject_process` VALUES ('313', 'q24321', '479', '需要', '1', '未完成', '24', '审批流程1', '审批节点1(1---4)', '0', '0', '项目立项');
INSERT INTO `aproject_process` VALUES ('314', 'lss2+1慈利', '480', '需要', '1', '未完成', '24', '审批流程1', '审批节点1(1---4)', '0', '0', '项目立项');
INSERT INTO `aproject_process` VALUES ('315', 'lss2+2慈利', '481', '需要', '1', '未完成', '24', '审批流程1', '审批节点1(1---4)', '0', '0', '项目立项');
INSERT INTO `aproject_process` VALUES ('316', '124234', '482', '需要', '1', '未完成', '24', '审批流程1', '审批节点1(1---4)', '0', '0', '项目立项');
INSERT INTO `aproject_process` VALUES ('317', 'lss1+1江垭', '483', '需要', '1', '未完成', '24', '审批流程1', '审批节点1(1---4)', '0', '0', '项目立项');
INSERT INTO `aproject_process` VALUES ('319', '小米', '67', '需要', '1', '未完成', '26', '审批流程3', '审批节点3', '0', '0', '耗材申请');
INSERT INTO `aproject_process` VALUES ('320', '小米', '68', '需要', '1', '未完成', '24', '审批流程1', '审批节点1(1---4)', '0', '0', '耗材申请');
INSERT INTO `aproject_process` VALUES ('321', '小米', '69', '需要', '1', '未完成', '25', '审批流程2', '审批节点2', '0', '0', '耗材申请');
INSERT INTO `aproject_process` VALUES ('322', 'lss2+1慈利', '484', '需要', '1', '未完成', '24', '审批流程1', '审批节点1(1---4)', '0', '0', '项目立项');
INSERT INTO `aproject_process` VALUES ('323', 'lss2为lss1', '485', '需要', '1', '未完成', '24', '审批流程1', '审批节点1(1---4)', '0', '0', '项目立项');
INSERT INTO `aproject_process` VALUES ('324', 'lss1+1江垭', '486', '需要', '1', '未完成', '24', '审批流程1', '审批节点1(1---4)', '0', '0', '项目立项');
INSERT INTO `aproject_process` VALUES ('325', 'scw2', '487', '需要', '1', '未完成', '24', '审批流程1', '审批节点1(1---4)', '0', '0', '项目立项');
INSERT INTO `aproject_process` VALUES ('329', '华为手机', '39', '需要', '1', '未完成', '24', '审批流程1', '审批节点1(1---4)', '0', '0', '报废申请');
INSERT INTO `aproject_process` VALUES ('331', '苹果手机', '41', '需要', '1', '未完成', '24', '审批流程1', '审批节点1(1---4)', '0', '0', '报废申请');
INSERT INTO `aproject_process` VALUES ('335', '华为手机', '45', '需要', '1', '未完成', '24', '审批流程1', '审批节点1(1---4)', '0', '0', '报废申请');
INSERT INTO `aproject_process` VALUES ('336', '分', '488', '需要', '1', '未完成', '25', '审批流程2', '审批节点2', '0', '0', '项目立项');
INSERT INTO `aproject_process` VALUES ('337', '耗材测试', '489', '需要', '1', '未完成', '24', '审批流程1', '审批节点1(1---4)', '0', '0', '项目立项');
INSERT INTO `aproject_process` VALUES ('338', '546', '490', '需要', '1', '未完成', '24', '审批流程1', '审批节点1(1---4)', '0', '0', '项目立项');
INSERT INTO `aproject_process` VALUES ('339', '234', '491', '需要', '1', '未完成', '24', '审批流程1', '审批节点1(1---4)', '0', '0', '项目立项');
INSERT INTO `aproject_process` VALUES ('340', '买10个老蛇', '492', '需要', '1', '未完成', '24', '审批流程1', '审批节点1(1---4)', '0', '0', '项目立项');
INSERT INTO `aproject_process` VALUES ('341', '10老蛇蛇', '493', '需要', '1', '未完成', '24', '审批流程1', '审批节点1(1---4)', '0', '0', '项目立项');
INSERT INTO `aproject_process` VALUES ('350', 'PF-CRG337', '1', '需要', '1', '未完成', '25', '审批流程2', '审批节点2', '0', '0', '耗材申请');
INSERT INTO `aproject_process` VALUES ('351', '', '46', '需要', '1', '未完成', '24', '审批流程1', '审批节点1(1---4)', '0', '0', '报废申请');
INSERT INTO `aproject_process` VALUES ('352', null, '2', '需要', '1', '未完成', '24', '审批流程1', '审批节点1(1---4)', '0', '0', '资产报废');
INSERT INTO `aproject_process` VALUES ('353', null, '3', '需要', '1', '未完成', '25', '审批流程2', '审批节点2', '0', '0', '资产报废');
INSERT INTO `aproject_process` VALUES ('354', null, '4', '需要', '1', '未完成', '25', '审批流程2', '审批节点2', '0', '0', '资产报废');
INSERT INTO `aproject_process` VALUES ('355', '123213', '5', '需要', '1', '未完成', '26', '审批流程3', '审批节点3', '0', '0', '资产报废');
INSERT INTO `aproject_process` VALUES ('356', '五一放假', '278', '需要', '1', '流程结束，审批工作不通过(不通过人数大于通过人数)', '24', '审批流程1', '审批节点1(1---4)', null, '1', '日常请假');

-- ----------------------------
-- Table structure for `aproject_processdetail`
-- ----------------------------
DROP TABLE IF EXISTS `aproject_processdetail`;
CREATE TABLE `aproject_processdetail` (
  `detail_Id` int(11) NOT NULL AUTO_INCREMENT,
  `detail_ProcessId` int(11) DEFAULT NULL COMMENT '对应审批过程表中的ID',
  `detail_ApproverContent` varchar(100) DEFAULT NULL COMMENT '审批人给予的审批意见',
  `detail_ApproverUserID` varchar(45) DEFAULT NULL COMMENT '审批人对应的UserID',
  `detail_ApprovalTime` varchar(45) DEFAULT NULL COMMENT '审批人审批的处理时间',
  `detail_OptionResult` varchar(45) DEFAULT NULL COMMENT '当前审批人员的操作结果，通过还是不通过',
  `detail_CurrentNodeId` int(11) DEFAULT NULL COMMENT '处理的当前的审批节点的ID',
  PRIMARY KEY (`detail_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='审批描述细节表';

-- ----------------------------
-- Records of aproject_processdetail
-- ----------------------------
INSERT INTO `aproject_processdetail` VALUES ('1', '276', '符合要求 审批通过', '5412a4a241994cdf9261f6ae52f24b31', '2017-10-17 14:05:03', '通过', '67');
INSERT INTO `aproject_processdetail` VALUES ('2', '280', '速度大萨达萨达萨达的3589375回家的身份和共和党和规范的第三方刚回家的化工科技和第三个的是否进口韩国的技术国际客户端是否看过的接口方式公开阶段划分及控股健康的水果健康导航卡价格合适的就肯定是个机会', '5412a4a241994cdf9261f6ae52f24b31', '2017-10-17 15:29:27', '通过', '67');
INSERT INTO `aproject_processdetail` VALUES ('3', '280', '撒大声的撒', '459596e8636a4967af885d7a64317ab7', '2017-10-17 15:29:49', '通过', '68');
INSERT INTO `aproject_processdetail` VALUES ('4', '280', '撒大声道萨达', 'fca79301110e44cfaedba86569b5aab3', '2017-10-17 15:30:05', '通过', '68');
INSERT INTO `aproject_processdetail` VALUES ('5', '283', '撒旦撒旦', '5412a4a241994cdf9261f6ae52f24b31', '2017-10-17 17:06:09', '通过', '67');
INSERT INTO `aproject_processdetail` VALUES ('6', '282', '啊实打实大', '5412a4a241994cdf9261f6ae52f24b31', '2017-10-17 17:06:36', '通过', '67');
INSERT INTO `aproject_processdetail` VALUES ('7', '284', '第三方圣达菲第三方', '5412a4a241994cdf9261f6ae52f24b31', '2017-10-17 17:12:26', '通过', '67');
INSERT INTO `aproject_processdetail` VALUES ('8', '285', 'asdasd', '5412a4a241994cdf9261f6ae52f24b31', '2017-10-17 17:15:01', '通过', '67');
INSERT INTO `aproject_processdetail` VALUES ('9', '286', '斯蒂芬斯蒂芬第三方第三方', '5412a4a241994cdf9261f6ae52f24b31', '2017-10-17 17:19:54', '通过', '67');
INSERT INTO `aproject_processdetail` VALUES ('10', '287', '撒大声', '5412a4a241994cdf9261f6ae52f24b31', '2017-10-17 17:22:29', '通过', '67');
INSERT INTO `aproject_processdetail` VALUES ('11', '288', '撒大声的撒', '5412a4a241994cdf9261f6ae52f24b31', '2017-10-17 17:27:26', '通过', '67');
INSERT INTO `aproject_processdetail` VALUES ('12', '289', '撒大声', '5412a4a241994cdf9261f6ae52f24b31', '2017-10-18 09:18:03', '通过', '67');
INSERT INTO `aproject_processdetail` VALUES ('13', '292', 'sadsadsa', '5412a4a241994cdf9261f6ae52f24b31', '2017-10-18 10:23:26', '通过', '67');
INSERT INTO `aproject_processdetail` VALUES ('14', '294', 'safdsadasdasd', '5412a4a241994cdf9261f6ae52f24b31', '2017-10-18 10:27:31', '通过', '67');
INSERT INTO `aproject_processdetail` VALUES ('15', '295', 'dsfdsfdsf', '5412a4a241994cdf9261f6ae52f24b31', '2017-10-18 10:33:11', '通过', '67');
INSERT INTO `aproject_processdetail` VALUES ('16', '297', '撒大声大声', '5412a4a241994cdf9261f6ae52f24b31', '2017-10-18 10:49:23', '通过', '67');
INSERT INTO `aproject_processdetail` VALUES ('17', '298', '撒旦撒旦撒', '5412a4a241994cdf9261f6ae52f24b31', '2017-10-18 10:58:07', '通过', '67');
INSERT INTO `aproject_processdetail` VALUES ('18', '299', 'as撒旦撒啊实打实大', '5412a4a241994cdf9261f6ae52f24b31', '2017-10-18 10:59:05', '通过', '67');
INSERT INTO `aproject_processdetail` VALUES ('19', '300', '撒大声的撒', '5412a4a241994cdf9261f6ae52f24b31', '2017-10-18 11:02:27', '通过', '67');
INSERT INTO `aproject_processdetail` VALUES ('20', '301', 'asssssssssssss', '5412a4a241994cdf9261f6ae52f24b31', '2017-10-18 11:05:29', '通过', '67');
INSERT INTO `aproject_processdetail` VALUES ('21', '303', 'asdasdasd', '5412a4a241994cdf9261f6ae52f24b31', '2017-10-18 11:17:32', '通过', '67');
INSERT INTO `aproject_processdetail` VALUES ('22', '304', 'asdasda', '5412a4a241994cdf9261f6ae52f24b31', '2017-10-18 11:20:12', '通过', '67');
INSERT INTO `aproject_processdetail` VALUES ('23', '305', 'asdasdsa', '5412a4a241994cdf9261f6ae52f24b31', '2017-10-18 11:21:02', '通过', '67');
INSERT INTO `aproject_processdetail` VALUES ('24', '306', 'hhhhhhhhhhhhhhhhhhhh', '5412a4a241994cdf9261f6ae52f24b31', '2017-10-18 11:22:16', '通过', '67');
INSERT INTO `aproject_processdetail` VALUES ('25', '307', 'jjjjjjjjjjjjjjjjjjj', '5412a4a241994cdf9261f6ae52f24b31', '2017-10-18 11:23:50', '通过', '67');
INSERT INTO `aproject_processdetail` VALUES ('26', '308', 'kkkkkkkkkkkkkkkkkkk', '5412a4a241994cdf9261f6ae52f24b31', '2017-10-18 11:25:15', '通过', '67');
INSERT INTO `aproject_processdetail` VALUES ('27', null, null, '123', '2019-05-02 15:18:07', '通过', '67');
INSERT INTO `aproject_processdetail` VALUES ('28', '356', 'asdasd', '123', '2019-05-02 15:24:36', '通过', '67');
INSERT INTO `aproject_processdetail` VALUES ('29', '356', 'asdad', '123', '2019-05-02 15:25:24', '不通过', '67');
INSERT INTO `aproject_processdetail` VALUES ('30', '356', 'asdasdas', '123', '2019-05-02 15:32:36', '不通过', '67');

-- ----------------------------
-- Table structure for `asset_abandon`
-- ----------------------------
DROP TABLE IF EXISTS `asset_abandon`;
CREATE TABLE `asset_abandon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `process_Type` varchar(255) DEFAULT NULL,
  `abandon_reason` varchar(255) DEFAULT NULL,
  `abandon_approve` varchar(255) DEFAULT NULL,
  `approve_status` varchar(255) DEFAULT NULL,
  `project_Name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=279 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of asset_abandon
-- ----------------------------
INSERT INTO `asset_abandon` VALUES ('1', '资产报废', '213213213', '审批流程1', '已提交', '测试1');
INSERT INTO `asset_abandon` VALUES ('2', '资产报废', 'asdasd', '审批流程1', '已提交', '测试1');
INSERT INTO `asset_abandon` VALUES ('3', '资产报废', 'asdasd123123', '审批流程2', '已提交', '测试122222222222');
INSERT INTO `asset_abandon` VALUES ('4', '资产报废', 'asdasd123123', '审批流程2', '已提交', '33333333333');
INSERT INTO `asset_abandon` VALUES ('5', '资产报废', '213213', '审批流程3', '已提交', '123213');
INSERT INTO `asset_abandon` VALUES ('277', '日常请假', '企鹅全文', '审批流程1', '已提交', '我在测试');
INSERT INTO `asset_abandon` VALUES ('278', '日常请假', '123123213', '审批流程1', '审批完成(不通过)', '五一放假');

-- ----------------------------
-- Table structure for `person`
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of person
-- ----------------------------
INSERT INTO `person` VALUES ('3', '123');
INSERT INTO `person` VALUES ('4', 'sb');
INSERT INTO `person` VALUES ('5', 'scw');
INSERT INTO `person` VALUES ('6', '1111111111');
INSERT INTO `person` VALUES ('7', 'ad');
INSERT INTO `person` VALUES ('8', '234');
INSERT INTO `person` VALUES ('9', 'asdasd');
INSERT INTO `person` VALUES ('10', 'kh');
INSERT INTO `person` VALUES ('11', 'zcx');
INSERT INTO `person` VALUES ('12', '主线程');
INSERT INTO `person` VALUES ('13', 'xzc');
INSERT INTO `person` VALUES ('14', 'cvx');
INSERT INTO `person` VALUES ('15', 'test');
INSERT INTO `person` VALUES ('16', 'zz');
INSERT INTO `person` VALUES ('17', 'wxx');
INSERT INTO `person` VALUES ('18', 'bv');
INSERT INTO `person` VALUES ('19', 'cv');
INSERT INTO `person` VALUES ('20', 'my name maven');
INSERT INTO `person` VALUES ('21', 'my123');
INSERT INTO `person` VALUES ('22', 'my43');
INSERT INTO `person` VALUES ('23', 'my43');
INSERT INTO `person` VALUES ('24', 'maven');
INSERT INTO `person` VALUES ('25', 'xv');
INSERT INTO `person` VALUES ('26', 'xcxc');
INSERT INTO `person` VALUES ('27', 'xcxc12');
INSERT INTO `person` VALUES ('28', 'cxzcxzc');
INSERT INTO `person` VALUES ('29', null);
INSERT INTO `person` VALUES ('30', 'aaa');
INSERT INTO `person` VALUES ('32', 'cvbcvbcv');
INSERT INTO `person` VALUES ('33', 'vbvcbcvb');
INSERT INTO `person` VALUES ('34', 'vcbv');
INSERT INTO `person` VALUES ('35', 'cvxcvxcvcxv');
INSERT INTO `person` VALUES ('36', '465465');
INSERT INTO `person` VALUES ('37', null);
INSERT INTO `person` VALUES ('38', 'ss');
INSERT INTO `person` VALUES ('40', 'nmnm');
INSERT INTO `person` VALUES ('43', 'ipo');
INSERT INTO `person` VALUES ('44', 'uu');
INSERT INTO `person` VALUES ('45', '测试1');

-- ----------------------------
-- Table structure for `sys_approver`
-- ----------------------------
DROP TABLE IF EXISTS `sys_approver`;
CREATE TABLE `sys_approver` (
  `approver_Id` int(100) NOT NULL AUTO_INCREMENT COMMENT '审批人ID',
  `user_Id` varchar(100) DEFAULT NULL COMMENT '人员表的ID，外键',
  `approver_Description` varchar(255) DEFAULT NULL COMMENT '审批人描述',
  `approver_Rights_Description` varchar(255) DEFAULT NULL COMMENT '审批权限描述',
  `user_Name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`approver_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='审批人员数据表';

-- ----------------------------
-- Records of sys_approver
-- ----------------------------
INSERT INTO `sys_approver` VALUES ('125', 'ba6b22857874485d9030f902e58a31e6', 'asdasd', 'fdgdf', '权限1');
INSERT INTO `sys_approver` VALUES ('126', '364908edb0a646478e1cb96aba9fb7c6', 'safddfv', 'dsadasd', '佘超伟8');
INSERT INTO `sys_approver` VALUES ('127', '459596e8636a4967af885d7a64317ab7', 'sdasd', 'adfvcxv', '佘超伟5');
INSERT INTO `sys_approver` VALUES ('128', '5412a4a241994cdf9261f6ae52f24b31', 'cvbcvb', 'vcbvcb', '佘超伟4');
INSERT INTO `sys_approver` VALUES ('130', 'dab6de8db27c4deb81e5d21d4db0af20', 'qqweasd', 'dgdfsad', '佘超伟10');
INSERT INTO `sys_approver` VALUES ('131', 'e1e288e90af94cc49bc1b4acbc74a00e', 'cvc', 'sdasd', '佘超伟9');
INSERT INTO `sys_approver` VALUES ('132', 'fca79301110e44cfaedba86569b5aab3', 'dfsdfa', 'vasdqwe', '佘超伟6');
INSERT INTO `sys_approver` VALUES ('133', '8bef4e54bb914bc7addff6888637e60b', 'sad', 'asdsad', '佘超伟7');
INSERT INTO `sys_approver` VALUES ('134', '213', 'wqe', 'adasd', '123');

-- ----------------------------
-- Table structure for `sys_approvnode`
-- ----------------------------
DROP TABLE IF EXISTS `sys_approvnode`;
CREATE TABLE `sys_approvnode` (
  `node_Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '审批节点，自增',
  `node_Name` varchar(200) DEFAULT NULL COMMENT '审批节点名称',
  `node_PassNumber` int(10) DEFAULT NULL COMMENT '审批最小通过人数',
  `node_Description` varchar(200) DEFAULT NULL COMMENT '审批节点描述',
  `node_TotalNumber` int(10) DEFAULT NULL COMMENT '审批该节点的总人数',
  PRIMARY KEY (`node_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统审批节点表，审批人员ID和审批节点ID为联合主键';

-- ----------------------------
-- Records of sys_approvnode
-- ----------------------------
INSERT INTO `sys_approvnode` VALUES ('67', '审批节点1(1---4)', '1', '审批账号是scw4，审批人总人数1个，通过1个', '1');
INSERT INTO `sys_approvnode` VALUES ('68', '审批节点2', '2', '审批账号是scw5和scw6，scw7，总人数3个，审批通过2个', '3');
INSERT INTO `sys_approvnode` VALUES ('69', '审批节点3', '3', '审批账号是scw7,8,9,10，总人数4个，最少通过3个', '4');
INSERT INTO `sys_approvnode` VALUES ('70', '213', '1', '123123', '1');
INSERT INTO `sys_approvnode` VALUES ('71', '11111111111111', '1', '123123', '1');
INSERT INTO `sys_approvnode` VALUES ('72', '12312', '1', '123213', '1');

-- ----------------------------
-- Table structure for `sys_approvnodepeople`
-- ----------------------------
DROP TABLE IF EXISTS `sys_approvnodepeople`;
CREATE TABLE `sys_approvnodepeople` (
  `approvnode_Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '该表序号，自增',
  `approvnode_UserId` varchar(100) DEFAULT NULL COMMENT '节点中的用户Id序号',
  `approvnode_Order` int(11) DEFAULT NULL COMMENT '对应节点中，该审批人所属的顺序，1表示第一级，以此类推',
  `approvnode_nodeId` int(11) DEFAULT NULL COMMENT '对应审批节点中的ID号，通过这个就可以找到对应的节点信息，外键',
  PRIMARY KEY (`approvnode_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='节点人员的ID管理';

-- ----------------------------
-- Records of sys_approvnodepeople
-- ----------------------------
INSERT INTO `sys_approvnodepeople` VALUES ('121', '5412a4a241994cdf9261f6ae52f24b31', null, '67');
INSERT INTO `sys_approvnodepeople` VALUES ('122', '459596e8636a4967af885d7a64317ab7', null, '68');
INSERT INTO `sys_approvnodepeople` VALUES ('123', 'fca79301110e44cfaedba86569b5aab3', null, '68');
INSERT INTO `sys_approvnodepeople` VALUES ('124', '8bef4e54bb914bc7addff6888637e60b', null, '68');
INSERT INTO `sys_approvnodepeople` VALUES ('125', '8bef4e54bb914bc7addff6888637e60b', null, '69');
INSERT INTO `sys_approvnodepeople` VALUES ('126', '364908edb0a646478e1cb96aba9fb7c6', null, '69');
INSERT INTO `sys_approvnodepeople` VALUES ('127', 'e1e288e90af94cc49bc1b4acbc74a00e', null, '69');
INSERT INTO `sys_approvnodepeople` VALUES ('128', 'dab6de8db27c4deb81e5d21d4db0af20', null, '69');
INSERT INTO `sys_approvnodepeople` VALUES ('129', '2', null, '72');

-- ----------------------------
-- Table structure for `sys_process_approval`
-- ----------------------------
DROP TABLE IF EXISTS `sys_process_approval`;
CREATE TABLE `sys_process_approval` (
  `process_Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '审批流程表ID，自增',
  `process_Name` varchar(100) DEFAULT NULL COMMENT '审批流程名字',
  `process_Content` varchar(100) DEFAULT NULL COMMENT '审批内容',
  `process_Type` varchar(45) DEFAULT NULL COMMENT '审批类型',
  PRIMARY KEY (`process_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='审批流程表';

-- ----------------------------
-- Records of sys_process_approval
-- ----------------------------
INSERT INTO `sys_process_approval` VALUES ('24', '审批流程1', '审批节点1', '审批流程');
INSERT INTO `sys_process_approval` VALUES ('25', '审批流程2', '审批节点2', '审批流程');
INSERT INTO `sys_process_approval` VALUES ('26', '审批流程3', '审批节点3', '审批流程');
INSERT INTO `sys_process_approval` VALUES ('27', '审批流程4', '审批节点1和2', '审批流程');
INSERT INTO `sys_process_approval` VALUES ('30', '审批流程7', '审批节点1（不可退回）,2（不可退回）', '审批流程');
INSERT INTO `sys_process_approval` VALUES ('31', '测试流程', '查看流程详细信息的测试流程', '审批流程');
INSERT INTO `sys_process_approval` VALUES ('32', '12312', '324123', '审批流程');
INSERT INTO `sys_process_approval` VALUES ('33', '213', '123', '审批流程');
INSERT INTO `sys_process_approval` VALUES ('34', '213', '123213', '审批流程');
INSERT INTO `sys_process_approval` VALUES ('35', '阿大声道', 'asdasdsdad', '审批流程');

-- ----------------------------
-- Table structure for `sys_process_detail`
-- ----------------------------
DROP TABLE IF EXISTS `sys_process_detail`;
CREATE TABLE `sys_process_detail` (
  `processdetail_Id` int(11) DEFAULT NULL COMMENT '节点对应审批流程ID',
  `processdetail_NodeId` int(11) DEFAULT NULL COMMENT '审批节点ID，属于外键',
  `processdetail_Nodeorder` int(11) DEFAULT NULL COMMENT '审批节点对应的审批流程中的顺序，1表示第一级',
  `processdetail_Back` varchar(10) DEFAULT NULL COMMENT '标识该审批节点是否可进行退回操作，1表示可以，0表示不可以',
  `process_Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '审批流程细节ID，自增',
  PRIMARY KEY (`process_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='审批流程细节，包含节点表';

-- ----------------------------
-- Records of sys_process_detail
-- ----------------------------
INSERT INTO `sys_process_detail` VALUES ('24', '67', '1', 'on', '35');
INSERT INTO `sys_process_detail` VALUES ('25', '68', '1', 'on', '36');
INSERT INTO `sys_process_detail` VALUES ('26', '69', '1', 'on', '37');
INSERT INTO `sys_process_detail` VALUES ('27', '67', '1', 'on', '38');
INSERT INTO `sys_process_detail` VALUES ('27', '68', '2', 'on', '39');
INSERT INTO `sys_process_detail` VALUES ('30', '67', '1', null, '45');
INSERT INTO `sys_process_detail` VALUES ('30', '68', '2', null, '46');
INSERT INTO `sys_process_detail` VALUES ('31', '67', '1', 'on', '47');
INSERT INTO `sys_process_detail` VALUES ('31', '68', '2', 'on', '48');
INSERT INTO `sys_process_detail` VALUES ('34', null, '1', 'null0', '49');
INSERT INTO `sys_process_detail` VALUES ('35', '1', '1', 'true', '50');
INSERT INTO `sys_process_detail` VALUES ('35', '2', '2', 'true', '51');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `age` int(11) NOT NULL,
  `birthday` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'scw', '18', '2018-08-27');
INSERT INTO `user` VALUES ('2', 'wxx', '18', '2018-08-11');
