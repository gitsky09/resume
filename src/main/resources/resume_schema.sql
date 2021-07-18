-- DROP DATABASE `resume`;

-- CREATE DATABASE `resume` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `resume`;

DROP TABLE IF EXISTS `resume`.`user`;
CREATE TABLE `resume`.`user` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '使用者編號',
  `ACCOUNT` varchar(30) NOT NULL COMMENT '使用者帳號',
  `USER_NAME` varchar(30) DEFAULT NULL COMMENT '姓名',
  `PASSWORD` varchar(200) DEFAULT NULL COMMENT '密碼',
  `EMAIL` varchar(30) NOT NULL COMMENT '信箱',
  `PHONE` varchar(20) DEFAULT NULL COMMENT '電話',
  `BIRTHDAY` timestamp NULL DEFAULT NULL COMMENT '生日',
  `SEX` char(1) DEFAULT NULL COMMENT '性別',
  `MILITARY_SERVICE` varchar(10) DEFAULT NULL COMMENT '服役情況',
  `MILITARY_DATE` varchar(10) NULL DEFAULT NULL COMMENT '退伍日期',
  `ADDRESS` varchar(255) DEFAULT NULL COMMENT '通訊地址',
  `DRIVER_LICENSE` varchar(50) DEFAULT NULL COMMENT '駕照',
  `SPECIAL_IDENTITY` varchar(50) DEFAULT NULL COMMENT '特殊身分',
  `FEATURE` varchar(500) DEFAULT NULL COMMENT '個人特色',
  `INTRODUCTION` varchar(200) DEFAULT NULL COMMENT '自我介紹',
  `BIO_ENG` varchar(4000) DEFAULT NULL COMMENT '英文自傳',
  `BIO_CHN` varchar(4000) DEFAULT NULL COMMENT '中文自傳',
  `PROFILE_IMG_PATH` varchar(1000) DEFAULT NULL COMMENT '使用者圖像路徑',
  `CR_USER` varchar(30) DEFAULT NULL COMMENT '建立者',
  `CR_DATETIME` timestamp NULL DEFAULT NULL COMMENT '建立日期',
  `UP_USER` varchar(30) DEFAULT NULL COMMENT '更新者',
  `UP_DATETIME` timestamp NULL DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  UNIQUE KEY `ACCOUNT_UNIQUE` (`ACCOUNT`),
  UNIQUE KEY `EMAIL_UNIQUE` (`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='使用者帳號' AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `resume`.`resume`;
CREATE TABLE `resume`.`resume` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '編號',
  `UID` int NOT NULL COMMENT '使用者編號',
  `TEMPLATE_ID` int DEFAULT NULL COMMENT '模板編號',
  `RESUME_NAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '履歷命名',
  `BASIC_INFO_COLUMNS` varchar(200) DEFAULT NULL COMMENT '基本資料類別',
  `FILE_PATH` varchar(50) NOT NULL COMMENT '檔案路徑',
  `CR_USER` varchar(30) DEFAULT NULL COMMENT '建立者',
  `CR_DATETIME` timestamp NULL DEFAULT NULL COMMENT '建立日期',
  `UP_USER` varchar(30) DEFAULT NULL COMMENT '更新者',
  `UP_DATETIME` timestamp NULL DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`ID`,`UID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='履歷' AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `resume`.`template`;
CREATE TABLE `resume`.`template` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '編號',
  `NAME` varchar(20) NOT NULL COMMENT '模板名稱',
  `BASIC_INFO_LIMIT` int NOT NULL DEFAULT '1' COMMENT '基本資料上限',
  `EDUCATION_LIMIT` int NOT NULL DEFAULT '1' COMMENT '學歷上限',
  `EXPERIENCE_LIMIT` int NOT NULL DEFAULT '1' COMMENT '經歷上限',
  `SKILL_LIMIT` int NOT NULL DEFAULT '1' COMMENT '技能上限',
  `LICENSE_LIMIT` int NOT NULL DEFAULT '1' COMMENT '證照上限',
  `LANGUAGE_LIMIT` int NOT NULL DEFAULT '1' COMMENT '語言技能上限',
  `FEATURE_LIMIT` int NOT NULL DEFAULT '1' COMMENT '個人特色上限',
  `LINK_LIMIT` int NOT NULL DEFAULT '1' COMMENT '連結上限',
  `CR_USER` varchar(30) DEFAULT NULL COMMENT '建立者',
  `CR_DATETIME` timestamp NULL DEFAULT NULL COMMENT '建立日期',
  `UP_USER` varchar(30) DEFAULT NULL COMMENT '更新者',
  `UP_DATETIME` timestamp NULL DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  UNIQUE KEY `NAME_UNIQUE` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='履歷模板' AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `resume`.`skill`;
CREATE TABLE `resume`.`skill` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '編號',
  `UID` int NOT NULL COMMENT '使用者編號',
  `SKILL_NAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '技能',
  `SKILL_DESC` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '技能描述',
  `CR_USER` varchar(30) DEFAULT NULL COMMENT '建立者',
  `CR_DATETIME` timestamp NULL DEFAULT NULL COMMENT '建立日期',
  `UP_USER` varchar(30) DEFAULT NULL COMMENT '更新者',
  `UP_DATETIME` timestamp NULL DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`ID`,`UID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='專業技能' AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `resume`.`education`;
CREATE TABLE `resume`.`education` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '編號',
  `UID` int NOT NULL COMMENT '使用者編號',
  `SCHOOL_NAME` varchar(50) DEFAULT NULL COMMENT '學校',
  `LEVEL` varchar(20) DEFAULT NULL COMMENT '學歷等級(國中、高中...)',
  `MAJOR` varchar(50) DEFAULT NULL COMMENT '學系',
  `SECOND_MAJOR` varchar(50) DEFAULT NULL COMMENT '輔修',
  `STATUS` varchar(20) DEFAULT NULL COMMENT '在學狀態(畢業、肄業...)',
  `START_DATE` timestamp NULL DEFAULT NULL COMMENT '入學時間',
  `END_DATE` timestamp NULL DEFAULT NULL COMMENT '畢業時間',
  `COUNTRY` varchar(50) DEFAULT NULL COMMENT '國家',
  `GPA` float DEFAULT NULL COMMENT 'GPA',
  `CR_USER` varchar(30) DEFAULT NULL COMMENT '建立者',
  `CR_DATETIME` timestamp NULL DEFAULT NULL COMMENT '建立日期',
  `UP_USER` varchar(30) DEFAULT NULL COMMENT '更新者',
  `UP_DATETIME` timestamp NULL DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`ID`,`UID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='學歷' AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `resume`.`experience`;
CREATE TABLE `resume`.`experience` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '編號',
  `UID` int NOT NULL COMMENT '使用者編號',
  `COMPANY_NAME` varchar(50) DEFAULT NULL COMMENT '公司名稱',
  `POSITION` varchar(50) DEFAULT NULL COMMENT '職稱',
  `START_DATE` timestamp NULL DEFAULT NULL COMMENT '到職日',
  `END_DATE` timestamp NULL DEFAULT NULL COMMENT '離職日',
  `EXPERIENCE_DESC` varchar(100) DEFAULT NULL COMMENT '簡介',
  `ABILITY` varchar(150) DEFAULT NULL COMMENT '工作能力(分號分隔字串)',
  `CR_USER` varchar(30) DEFAULT NULL COMMENT '建立者',
  `CR_DATETIME` timestamp NULL DEFAULT NULL COMMENT '建立日期',
  `UP_USER` varchar(30) DEFAULT NULL COMMENT '更新者',
  `UP_DATETIME` timestamp NULL DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`ID`,`UID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='工作經驗' AUTO_INCREMENT=1;

# DROP TABLE IF EXISTS `resume`.`feature`;
# CREATE TABLE `resume`.`feature` (
#   `ID` int NOT NULL AUTO_INCREMENT COMMENT '個人特色編號',
#   `UID` int NOT NULL COMMENT '使用者編號',
#   `CONTENT` varchar(20) DEFAULT NULL COMMENT '內容',
#   `CR_USER` varchar(30) DEFAULT NULL COMMENT '建立者',
#   `CR_DATETIME` timestamp NULL DEFAULT NULL COMMENT '建立日期',
#   `UP_USER` varchar(30) DEFAULT NULL COMMENT '更新者',
#   `UP_DATETIME` timestamp NULL DEFAULT NULL COMMENT '更新日期',
#   PRIMARY KEY (`ID`,`UID`),
#   UNIQUE KEY `ID_UNIQUE` (`ID`)
# ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='個人特色' AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `resume`.`language`;
CREATE TABLE `resume`.`language` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '編號',
  `UID` int NOT NULL COMMENT '使用者編號',
  `LANGUAGE` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '語言',
  `LISTENING` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '聽力',
  `SPEAKING` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '口說',
  `READING` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '閱讀',
  `WRITING` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '寫作',
  `CR_USER` varchar(30) DEFAULT NULL COMMENT '建立者',
  `CR_DATETIME` timestamp NULL DEFAULT NULL COMMENT '建立日期',
  `UP_USER` varchar(30) DEFAULT NULL COMMENT '更新者',
  `UP_DATETIME` timestamp NULL DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`ID`,`UID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='語言能力' AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `resume`.`license`;
CREATE TABLE `resume`.`license` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '編號',
  `UID` int NOT NULL COMMENT '使用者編號',
  `NAME` varchar(50) DEFAULT NULL COMMENT '證照名稱',
  `CR_USER` varchar(30) DEFAULT NULL COMMENT '建立者',
  `CR_DATETIME` timestamp NULL DEFAULT NULL COMMENT '建立日期',
  `UP_USER` varchar(30) DEFAULT NULL COMMENT '更新者',
  `UP_DATETIME` timestamp NULL DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`ID`,`UID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='證照' AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `resume`.`link`;
CREATE TABLE `resume`.`link` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '個人連結編號',
  `UID` int NOT NULL COMMENT '使用者編號',
  `PLATFORM` varchar(20) DEFAULT NULL COMMENT '平台',
  `URL` varchar(200) DEFAULT NULL COMMENT '連結網址',
  `CR_USER` varchar(30) DEFAULT NULL COMMENT '建立者',
  `CR_DATETIME` timestamp NULL DEFAULT NULL COMMENT '建立日期',
  `UP_USER` varchar(30) DEFAULT NULL COMMENT '更新者',
  `UP_DATETIME` timestamp NULL DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`ID`,`UID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='個人連結' AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `resume`.`rel_resume_edu`;
CREATE TABLE `resume`.`rel_resume_edu` (
  `RID` int NOT NULL COMMENT '履歷編號',
  `EDU_ID` int NOT NULL COMMENT '學歷編號',
  PRIMARY KEY (`RID`,`EDU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='履歷_學歷_關聯表' AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `resume`.`rel_resume_exp`;
CREATE TABLE `resume`.`rel_resume_exp` (
  `RID` int NOT NULL COMMENT '履歷編號',
  `EXP_ID` int NOT NULL COMMENT '工作經驗編號',
  PRIMARY KEY (`RID`,`EXP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='履歷_工作經驗_關聯表' AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `resume`.`rel_resume_lang`;
CREATE TABLE `resume`.`rel_resume_lang` (
  `RID` int NOT NULL COMMENT '履歷編號',
  `LANGUAGE_ID` int NOT NULL COMMENT '語言能力編號',
  PRIMARY KEY (`RID`,`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='履歷_語言能力_關聯表' AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `resume`.`rel_resume_license`;
CREATE TABLE `resume`.`rel_resume_license` (
  `RID` int NOT NULL COMMENT '履歷編號',
  `LICENSE_ID` int NOT NULL COMMENT '證照編號',
  PRIMARY KEY (`RID`,`LICENSE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='履歷_證照_關聯表' AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `resume`.`rel_resume_skill`;
CREATE TABLE `resume`.`rel_resume_skill` (
  `RID` int NOT NULL COMMENT '履歷編號',
  `SKILL_ID` int NOT NULL COMMENT '專業技能編號',
  PRIMARY KEY (`RID`,`SKILL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='履歷_專業技能_關聯表' AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `resume`.`address`;
CREATE TABLE `resume`.`address` (
 `ID` int primary key,
 `CITY` varchar(10) NOT NULL,
 `TOWN` varchar(10) NOT NULL
)