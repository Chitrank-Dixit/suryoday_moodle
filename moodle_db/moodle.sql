-- phpMyAdmin SQL Dump
-- version 4.0.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 14, 2014 at 01:22 PM
-- Server version: 5.5.35-0ubuntu0.12.04.2
-- PHP Version: 5.3.10-1ubuntu3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `moodle`
--

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign`
--

CREATE TABLE IF NOT EXISTS `mdl_assign` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `alwaysshowdescription` tinyint(2) NOT NULL DEFAULT '0',
  `nosubmissions` tinyint(2) NOT NULL DEFAULT '0',
  `submissiondrafts` tinyint(2) NOT NULL DEFAULT '0',
  `sendnotifications` tinyint(2) NOT NULL DEFAULT '0',
  `sendlatenotifications` tinyint(2) NOT NULL DEFAULT '0',
  `duedate` bigint(10) NOT NULL DEFAULT '0',
  `allowsubmissionsfromdate` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `requiresubmissionstatement` tinyint(2) NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(2) NOT NULL DEFAULT '0',
  `cutoffdate` bigint(10) NOT NULL DEFAULT '0',
  `teamsubmission` tinyint(2) NOT NULL DEFAULT '0',
  `requireallteammemberssubmit` tinyint(2) NOT NULL DEFAULT '0',
  `teamsubmissiongroupingid` bigint(10) NOT NULL DEFAULT '0',
  `blindmarking` tinyint(2) NOT NULL DEFAULT '0',
  `revealidentities` tinyint(2) NOT NULL DEFAULT '0',
  `attemptreopenmethod` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `maxattempts` mediumint(6) NOT NULL DEFAULT '-1',
  `markingworkflow` tinyint(2) NOT NULL DEFAULT '0',
  `markingallocation` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assi_cou_ix` (`course`),
  KEY `mdl_assi_tea_ix` (`teamsubmissiongroupingid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table saves information about an instance of mod_assign' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignfeedback_comments`
--

CREATE TABLE IF NOT EXISTS `mdl_assignfeedback_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `commenttext` longtext COLLATE utf8_unicode_ci,
  `commentformat` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assicomm_ass_ix` (`assignment`),
  KEY `mdl_assicomm_gra_ix` (`grade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Text feedback for submitted assignments' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignfeedback_editpdf_annot`
--

CREATE TABLE IF NOT EXISTS `mdl_assignfeedback_editpdf_annot` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `gradeid` bigint(10) NOT NULL DEFAULT '0',
  `pageno` bigint(10) NOT NULL DEFAULT '0',
  `x` bigint(10) DEFAULT '0',
  `y` bigint(10) DEFAULT '0',
  `endx` bigint(10) DEFAULT '0',
  `endy` bigint(10) DEFAULT '0',
  `path` longtext COLLATE utf8_unicode_ci,
  `type` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'line',
  `colour` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'black',
  `draft` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_assieditanno_grapag_ix` (`gradeid`,`pageno`),
  KEY `mdl_assieditanno_gra_ix` (`gradeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='stores annotations added to pdfs submitted by students' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignfeedback_editpdf_cmnt`
--

CREATE TABLE IF NOT EXISTS `mdl_assignfeedback_editpdf_cmnt` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `gradeid` bigint(10) NOT NULL DEFAULT '0',
  `x` bigint(10) DEFAULT '0',
  `y` bigint(10) DEFAULT '0',
  `width` bigint(10) DEFAULT '120',
  `rawtext` longtext COLLATE utf8_unicode_ci,
  `pageno` bigint(10) NOT NULL DEFAULT '0',
  `colour` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'black',
  `draft` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_assieditcmnt_grapag_ix` (`gradeid`,`pageno`),
  KEY `mdl_assieditcmnt_gra_ix` (`gradeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores comments added to pdfs' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignfeedback_editpdf_quick`
--

CREATE TABLE IF NOT EXISTS `mdl_assignfeedback_editpdf_quick` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `rawtext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `width` bigint(10) NOT NULL DEFAULT '120',
  `colour` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'yellow',
  PRIMARY KEY (`id`),
  KEY `mdl_assieditquic_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores teacher specified quicklist comments' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignfeedback_file`
--

CREATE TABLE IF NOT EXISTS `mdl_assignfeedback_file` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `numfiles` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assifile_ass2_ix` (`assignment`),
  KEY `mdl_assifile_gra_ix` (`grade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores info about the number of files submitted by a student' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignment`
--

CREATE TABLE IF NOT EXISTS `mdl_assignment` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `assignmenttype` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `resubmit` tinyint(2) NOT NULL DEFAULT '0',
  `preventlate` tinyint(2) NOT NULL DEFAULT '0',
  `emailteachers` tinyint(2) NOT NULL DEFAULT '0',
  `var1` bigint(10) DEFAULT '0',
  `var2` bigint(10) DEFAULT '0',
  `var3` bigint(10) DEFAULT '0',
  `var4` bigint(10) DEFAULT '0',
  `var5` bigint(10) DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '100000',
  `timedue` bigint(10) NOT NULL DEFAULT '0',
  `timeavailable` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assi_cou2_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines assignments' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignment_submissions`
--

CREATE TABLE IF NOT EXISTS `mdl_assignment_submissions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `numfiles` bigint(10) NOT NULL DEFAULT '0',
  `data1` longtext COLLATE utf8_unicode_ci,
  `data2` longtext COLLATE utf8_unicode_ci,
  `grade` bigint(11) NOT NULL DEFAULT '0',
  `submissioncomment` longtext COLLATE utf8_unicode_ci NOT NULL,
  `format` smallint(4) NOT NULL DEFAULT '0',
  `teacher` bigint(10) NOT NULL DEFAULT '0',
  `timemarked` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assisubm_use2_ix` (`userid`),
  KEY `mdl_assisubm_mai_ix` (`mailed`),
  KEY `mdl_assisubm_tim_ix` (`timemarked`),
  KEY `mdl_assisubm_ass2_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about submitted assignments' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignsubmission_file`
--

CREATE TABLE IF NOT EXISTS `mdl_assignsubmission_file` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `submission` bigint(10) NOT NULL DEFAULT '0',
  `numfiles` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assifile_ass_ix` (`assignment`),
  KEY `mdl_assifile_sub_ix` (`submission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about file submissions for assignments' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignsubmission_onlinetext`
--

CREATE TABLE IF NOT EXISTS `mdl_assignsubmission_onlinetext` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `submission` bigint(10) NOT NULL DEFAULT '0',
  `onlinetext` longtext COLLATE utf8_unicode_ci,
  `onlineformat` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assionli_ass_ix` (`assignment`),
  KEY `mdl_assionli_sub_ix` (`submission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about onlinetext submission' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign_grades`
--

CREATE TABLE IF NOT EXISTS `mdl_assign_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `grader` bigint(10) NOT NULL DEFAULT '0',
  `grade` decimal(10,5) DEFAULT '0.00000',
  `attemptnumber` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_assigrad_assuseatt_uix` (`assignment`,`userid`,`attemptnumber`),
  KEY `mdl_assigrad_use_ix` (`userid`),
  KEY `mdl_assigrad_att_ix` (`attemptnumber`),
  KEY `mdl_assigrad_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Grading information about a single assignment submission.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign_plugin_config`
--

CREATE TABLE IF NOT EXISTS `mdl_assign_plugin_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `plugin` varchar(28) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subtype` varchar(28) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(28) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_assiplugconf_plu_ix` (`plugin`),
  KEY `mdl_assiplugconf_sub_ix` (`subtype`),
  KEY `mdl_assiplugconf_nam_ix` (`name`),
  KEY `mdl_assiplugconf_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Config data for an instance of a plugin in an assignment.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign_submission`
--

CREATE TABLE IF NOT EXISTS `mdl_assign_submission` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `status` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `attemptnumber` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_assisubm_assusegroatt_uix` (`assignment`,`userid`,`groupid`,`attemptnumber`),
  KEY `mdl_assisubm_use_ix` (`userid`),
  KEY `mdl_assisubm_att_ix` (`attemptnumber`),
  KEY `mdl_assisubm_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table keeps information about student interactions with' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign_user_flags`
--

CREATE TABLE IF NOT EXISTS `mdl_assign_user_flags` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `mailed` smallint(4) NOT NULL DEFAULT '0',
  `extensionduedate` bigint(10) NOT NULL DEFAULT '0',
  `workflowstate` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `allocatedmarker` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assiuserflag_mai_ix` (`mailed`),
  KEY `mdl_assiuserflag_use_ix` (`userid`),
  KEY `mdl_assiuserflag_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='List of flags that can be set for a single user in a single ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign_user_mapping`
--

CREATE TABLE IF NOT EXISTS `mdl_assign_user_mapping` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assiusermapp_ass_ix` (`assignment`),
  KEY `mdl_assiusermapp_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Map an assignment specific id number to a user' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_backup_controllers`
--

CREATE TABLE IF NOT EXISTS `mdl_backup_controllers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `operation` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'backup',
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `format` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `interactive` smallint(4) NOT NULL,
  `purpose` smallint(4) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `status` smallint(4) NOT NULL,
  `execution` smallint(4) NOT NULL,
  `executiontime` bigint(10) NOT NULL,
  `checksum` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `controller` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backcont_bac_uix` (`backupid`),
  KEY `mdl_backcont_typite_ix` (`type`,`itemid`),
  KEY `mdl_backcont_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To store the backup_controllers as they are used' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_backup_courses`
--

CREATE TABLE IF NOT EXISTS `mdl_backup_courses` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `laststarttime` bigint(10) NOT NULL DEFAULT '0',
  `lastendtime` bigint(10) NOT NULL DEFAULT '0',
  `laststatus` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '5',
  `nextstarttime` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backcour_cou_uix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To store every course backup status' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_backup_logs`
--

CREATE TABLE IF NOT EXISTS `mdl_backup_logs` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `loglevel` smallint(4) NOT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backlogs_bacid_uix` (`backupid`,`id`),
  KEY `mdl_backlogs_bac_ix` (`backupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To store all the logs from backup and restore operations (by' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge`
--

CREATE TABLE IF NOT EXISTS `mdl_badge` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `usercreated` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `issuername` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `issuerurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `issuercontact` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiredate` bigint(10) DEFAULT NULL,
  `expireperiod` bigint(10) DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `courseid` bigint(10) DEFAULT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `messagesubject` longtext COLLATE utf8_unicode_ci NOT NULL,
  `attachment` tinyint(1) NOT NULL DEFAULT '1',
  `notification` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `nextcron` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badg_typ_ix` (`type`),
  KEY `mdl_badg_cou_ix` (`courseid`),
  KEY `mdl_badg_use_ix` (`usermodified`),
  KEY `mdl_badg_use2_ix` (`usercreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines badge' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_backpack`
--

CREATE TABLE IF NOT EXISTS `mdl_badge_backpack` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `backpackurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `backpackuid` bigint(10) NOT NULL,
  `autosync` tinyint(1) NOT NULL DEFAULT '0',
  `password` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgback_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines settings for connecting external backpack' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_criteria`
--

CREATE TABLE IF NOT EXISTS `mdl_badge_criteria` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `badgeid` bigint(10) NOT NULL DEFAULT '0',
  `criteriatype` bigint(10) DEFAULT NULL,
  `method` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_badgcrit_badcri_uix` (`badgeid`,`criteriatype`),
  KEY `mdl_badgcrit_cri_ix` (`criteriatype`),
  KEY `mdl_badgcrit_bad_ix` (`badgeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines criteria for issuing badges' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_criteria_met`
--

CREATE TABLE IF NOT EXISTS `mdl_badge_criteria_met` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `issuedid` bigint(10) DEFAULT NULL,
  `critid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `datemet` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgcritmet_cri_ix` (`critid`),
  KEY `mdl_badgcritmet_use_ix` (`userid`),
  KEY `mdl_badgcritmet_iss_ix` (`issuedid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines criteria that were met for an issued badge' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_criteria_param`
--

CREATE TABLE IF NOT EXISTS `mdl_badge_criteria_param` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `critid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgcritpara_cri_ix` (`critid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines parameters for badges criteria' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_external`
--

CREATE TABLE IF NOT EXISTS `mdl_badge_external` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `backpackid` bigint(10) NOT NULL,
  `collectionid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgexte_bac_ix` (`backpackid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Setting for external badges display' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_issued`
--

CREATE TABLE IF NOT EXISTS `mdl_badge_issued` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `badgeid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `uniquehash` longtext COLLATE utf8_unicode_ci NOT NULL,
  `dateissued` bigint(10) NOT NULL DEFAULT '0',
  `dateexpire` bigint(10) DEFAULT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '0',
  `issuernotified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_badgissu_baduse_uix` (`badgeid`,`userid`),
  KEY `mdl_badgissu_bad_ix` (`badgeid`),
  KEY `mdl_badgissu_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines issued badges' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_manual_award`
--

CREATE TABLE IF NOT EXISTS `mdl_badge_manual_award` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `badgeid` bigint(10) NOT NULL,
  `recipientid` bigint(10) NOT NULL,
  `issuerid` bigint(10) NOT NULL,
  `issuerrole` bigint(10) NOT NULL,
  `datemet` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgmanuawar_bad_ix` (`badgeid`),
  KEY `mdl_badgmanuawar_rec_ix` (`recipientid`),
  KEY `mdl_badgmanuawar_iss_ix` (`issuerid`),
  KEY `mdl_badgmanuawar_iss2_ix` (`issuerrole`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Track manual award criteria for badges' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block`
--

CREATE TABLE IF NOT EXISTS `mdl_block` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cron` bigint(10) NOT NULL DEFAULT '0',
  `lastcron` bigint(10) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_bloc_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='contains all installed blocks' AUTO_INCREMENT=40 ;

--
-- Dumping data for table `mdl_block`
--

INSERT INTO `mdl_block` (`id`, `name`, `cron`, `lastcron`, `visible`) VALUES
(1, 'activity_modules', 0, 0, 1),
(2, 'admin_bookmarks', 0, 0, 1),
(3, 'badges', 0, 0, 1),
(4, 'blog_menu', 0, 0, 1),
(5, 'blog_recent', 0, 0, 1),
(6, 'blog_tags', 0, 0, 1),
(7, 'calendar_month', 0, 0, 1),
(8, 'calendar_upcoming', 0, 0, 1),
(9, 'comments', 0, 0, 1),
(10, 'community', 0, 0, 1),
(11, 'completionstatus', 0, 0, 1),
(12, 'course_list', 0, 0, 1),
(13, 'course_overview', 0, 0, 1),
(14, 'course_summary', 0, 0, 1),
(15, 'feedback', 0, 0, 0),
(16, 'glossary_random', 0, 0, 1),
(17, 'html', 0, 0, 1),
(18, 'login', 0, 0, 1),
(19, 'mentees', 0, 0, 1),
(20, 'messages', 0, 0, 1),
(21, 'mnet_hosts', 0, 0, 1),
(22, 'myprofile', 0, 0, 1),
(23, 'navigation', 0, 0, 1),
(24, 'news_items', 0, 0, 1),
(25, 'online_users', 0, 0, 1),
(26, 'participants', 0, 0, 1),
(27, 'private_files', 0, 0, 1),
(28, 'quiz_results', 0, 0, 1),
(29, 'recent_activity', 0, 0, 1),
(30, 'rss_client', 300, 0, 1),
(31, 'search_forums', 0, 0, 1),
(32, 'section_links', 0, 0, 1),
(33, 'selfcompletion', 0, 0, 1),
(34, 'settings', 0, 0, 1),
(35, 'site_main_menu', 0, 0, 1),
(36, 'social_activities', 0, 0, 1),
(37, 'tag_flickr', 0, 0, 1),
(38, 'tag_youtube', 0, 0, 1),
(39, 'tags', 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block_community`
--

CREATE TABLE IF NOT EXISTS `mdl_block_community` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `coursename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `coursedescription` longtext COLLATE utf8_unicode_ci,
  `courseurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `imageurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Community block' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block_instances`
--

CREATE TABLE IF NOT EXISTS `mdl_block_instances` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `blockname` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parentcontextid` bigint(10) NOT NULL,
  `showinsubcontexts` smallint(4) NOT NULL,
  `pagetypepattern` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subpagepattern` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `defaultregion` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `defaultweight` bigint(10) NOT NULL,
  `configdata` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_blocinst_parshopagsub_ix` (`parentcontextid`,`showinsubcontexts`,`pagetypepattern`,`subpagepattern`),
  KEY `mdl_blocinst_par_ix` (`parentcontextid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table stores block instances. The type of block this is' AUTO_INCREMENT=21 ;

--
-- Dumping data for table `mdl_block_instances`
--

INSERT INTO `mdl_block_instances` (`id`, `blockname`, `parentcontextid`, `showinsubcontexts`, `pagetypepattern`, `subpagepattern`, `defaultregion`, `defaultweight`, `configdata`) VALUES
(1, 'site_main_menu', 2, 0, 'site-index', NULL, 'side-pre', 0, ''),
(2, 'course_summary', 2, 0, 'site-index', NULL, 'side-post', 0, ''),
(3, 'calendar_month', 2, 0, 'site-index', NULL, 'side-post', 1, ''),
(4, 'navigation', 1, 1, '*', NULL, 'side-pre', 0, ''),
(5, 'settings', 1, 1, '*', NULL, 'side-pre', 1, ''),
(6, 'admin_bookmarks', 1, 0, 'admin-*', NULL, 'side-pre', 0, ''),
(7, 'private_files', 1, 0, 'my-index', '2', 'side-post', 0, ''),
(8, 'online_users', 1, 0, 'my-index', '2', 'side-post', 1, ''),
(9, 'course_overview', 1, 0, 'my-index', '2', 'content', 0, ''),
(14, 'private_files', 5, 0, 'my-index', '3', 'side-post', 0, ''),
(15, 'online_users', 5, 0, 'my-index', '3', 'side-post', 1, ''),
(16, 'course_overview', 5, 0, 'my-index', '3', 'content', 0, ''),
(17, 'search_forums', 37, 0, 'course-view-*', NULL, 'side-post', 0, ''),
(18, 'news_items', 37, 0, 'course-view-*', NULL, 'side-post', 1, ''),
(19, 'calendar_upcoming', 37, 0, 'course-view-*', NULL, 'side-post', 2, ''),
(20, 'recent_activity', 37, 0, 'course-view-*', NULL, 'side-post', 3, '');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block_positions`
--

CREATE TABLE IF NOT EXISTS `mdl_block_positions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `blockinstanceid` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `pagetype` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subpage` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `visible` smallint(4) NOT NULL,
  `region` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `weight` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_blocposi_bloconpagsub_uix` (`blockinstanceid`,`contextid`,`pagetype`,`subpage`),
  KEY `mdl_blocposi_blo_ix` (`blockinstanceid`),
  KEY `mdl_blocposi_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the position of a sticky block_instance on a another ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block_rss_client`
--

CREATE TABLE IF NOT EXISTS `mdl_block_rss_client` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `title` longtext COLLATE utf8_unicode_ci NOT NULL,
  `preferredtitle` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `shared` tinyint(2) NOT NULL DEFAULT '0',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Remote news feed information. Contains the news feed id, the' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_blog_association`
--

CREATE TABLE IF NOT EXISTS `mdl_blog_association` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `blogid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_blogasso_con_ix` (`contextid`),
  KEY `mdl_blogasso_blo_ix` (`blogid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Associations of blog entries with courses and module instanc' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_blog_external`
--

CREATE TABLE IF NOT EXISTS `mdl_blog_external` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `url` longtext COLLATE utf8_unicode_ci NOT NULL,
  `filtertags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `failedlastsync` tinyint(1) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) DEFAULT NULL,
  `timefetched` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_blogexte_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='External blog links used for RSS copying of blog entries to ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_book`
--

CREATE TABLE IF NOT EXISTS `mdl_book` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `numbering` smallint(4) NOT NULL DEFAULT '0',
  `customtitles` tinyint(2) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines book' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_book_chapters`
--

CREATE TABLE IF NOT EXISTS `mdl_book_chapters` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `bookid` bigint(10) NOT NULL DEFAULT '0',
  `pagenum` bigint(10) NOT NULL DEFAULT '0',
  `subchapter` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `contentformat` smallint(4) NOT NULL DEFAULT '0',
  `hidden` tinyint(2) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `importsrc` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines book_chapters' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_cache_filters`
--

CREATE TABLE IF NOT EXISTS `mdl_cache_filters` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` bigint(10) NOT NULL DEFAULT '0',
  `md5key` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rawtext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_cachfilt_filmd5_ix` (`filter`,`md5key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='For keeping information about cached data' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_cache_flags`
--

CREATE TABLE IF NOT EXISTS `mdl_cache_flags` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `flagtype` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expiry` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_cachflag_fla_ix` (`flagtype`),
  KEY `mdl_cachflag_nam_ix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Cache of time-sensitive flags' AUTO_INCREMENT=21 ;

--
-- Dumping data for table `mdl_cache_flags`
--

INSERT INTO `mdl_cache_flags` (`id`, `flagtype`, `name`, `timemodified`, `value`, `expiry`) VALUES
(1, 'userpreferenceschanged', '2', 1392315467, '1', 1392322667),
(2, 'accesslib/dirtycontexts', '/1/3/15', 1392184490, '1', 1392191690),
(3, 'userpreferenceschanged', '3', 1392183636, '1', 1392190836),
(4, 'accesslib/dirtycontexts', '/1/3/26', 1392184514, '1', 1392191714),
(5, 'userpreferenceschanged', '4', 1392215743, '1', 1392222943),
(6, 'accesslib/dirtycontexts', '/1/3/34', 1392057555, '1', 1392064755),
(7, 'accesslib/dirtycontexts', '/1/3/15/16', 1392184484, '1', 1392191684),
(8, 'accesslib/dirtycontexts', '/1/3/15/17', 1392184484, '1', 1392191684),
(9, 'accesslib/dirtycontexts', '/1/3/15/18', 1392184484, '1', 1392191684),
(10, 'accesslib/dirtycontexts', '/1/3/15/19', 1392184484, '1', 1392191684),
(11, 'accesslib/dirtycontexts', '/1/3/15/20', 1392184485, '1', 1392191685),
(12, 'accesslib/dirtycontexts', '/1/3/15/25', 1392184486, '1', 1392191686),
(13, 'accesslib/dirtycontexts', '/1/3/26/27', 1392184511, '1', 1392191711),
(14, 'accesslib/dirtycontexts', '/1/3/26/28', 1392184511, '1', 1392191711),
(15, 'accesslib/dirtycontexts', '/1/3/26/29', 1392184511, '1', 1392191711),
(16, 'accesslib/dirtycontexts', '/1/3/26/30', 1392184511, '1', 1392191711),
(17, 'accesslib/dirtycontexts', '/1/3/26/31', 1392184512, '1', 1392191712),
(18, 'accesslib/dirtycontexts', '/1/3/26/32', 1392184512, '1', 1392191712),
(19, 'accesslib/dirtycontexts', '/1/3/37', 1392216728, '1', 1392223928),
(20, 'userpreferenceschanged', '6', 1392288319, '1', 1392295519);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_cache_text`
--

CREATE TABLE IF NOT EXISTS `mdl_cache_text` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `md5key` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `formattedtext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_cachtext_md5_ix` (`md5key`),
  KEY `mdl_cachtext_tim_ix` (`timemodified`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='For storing temporary copies of processed texts' AUTO_INCREMENT=192 ;

--
-- Dumping data for table `mdl_cache_text`
--

INSERT INTO `mdl_cache_text` (`id`, `md5key`, `formattedtext`, `timemodified`) VALUES
(1, '4351d00a1a0428201e17b7a595a0c95a', '<p>When players are enabled in these settings, files can be embedded using the media filter (if enabled) or using a File or URL resources with the Embed option. When not enabled, these formats are not embedded and users can manually download or follow links to these resources.</p>\n\n<p>Where two players support the same format, enabling both increases compatibility across different devices such as mobile phones. It is possible to increase compatibility further by providing multiple files in different formats for a single audio or video clip.</p>\n', 1391627120),
(2, '7088784e04c075cc90016a72cf938cb2', '<p>When players are enabled in these settings, files can be embedded using the media filter (if enabled) or using a File or URL resources with the Embed option. When not enabled, these formats are not embedded and users can manually download or follow links to these resources.</p>\n\n<p>Where two players support the same format, enabling both increases compatibility across different devices such as mobile phones. It is possible to increase compatibility further by providing multiple files in different formats for a single audio or video clip.</p>\n', 1392216455),
(3, '31647cccf36b078e3b37c8f4b29e113e', '<div class="no-overflow">General news and announcements</div>', 1391665910),
(4, '0e2c4376b715ecbc2be16f7961310ef7', '<p>this is RA</p>', 1391675548),
(5, '6ffe241cb903bd23c86c95402ef51743', '<div class="no-overflow"><div class="text_to_html">The default category for questions shared in context ''Front page''.</div></div>', 1392183348),
(6, '00f81290b35c6537161291ac3690b00d', '<div class="text_to_html">The default category for questions shared in context ''databases''.</div>', 1391763339),
(7, '393b5c339fed04c3f7bc7b4c2990b491', '<p>ask for Indian Nationality</p>', 1391762281),
(8, '54a30a72d2e7626e5a16f99263463275', '<p>The assignment activity module enables a teacher to communicate tasks, collect work and provide grades and feedback.</p>\n\n<p>Students can submit any digital content (files), such as word-processed documents, spreadsheets, images, or audio and video clips. Alternatively, or in addition, the assignment may require students to type text directly into the text editor. An assignment can also be used to remind students of ''real-world'' assignments they need to complete offline, such as art work, and thus not require any digital content. Students can submit work individually or as a member of a group.</p>\n\n<p>When reviewing assignments, teachers can leave feedback comments and upload files, such as marked-up student submissions, documents with comments or spoken audio feedback. Assignments can be graded using a numerical or custom scale or an advanced grading method such as a rubric. Final grades are recorded in the gradebook.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/assignment/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391763323),
(9, '5f9118faa4efe75c9d44d6f82bcc1ae6', '<p>The chat activity module enables participants to have text-based, real-time synchronous discussions.</p>\n\n<p>The chat may be a one-time activity or it may be repeated at the same time each day or each week. Chat sessions are saved and can be made available for everyone to view or restricted to users with the capability to view chat session logs.</p>\n\n<p>Chats are especially useful when the group chatting is not able to meet face-to-face, such as</p>\n\n<ul><li>Regular meetings of students participating in online courses to enable them to share experiences with others in the same course but in a different location</li>\n<li>A student temporarily unable to attend in person chatting with their teacher to catch up with work</li>\n<li>Students out on work experience getting together to discuss their experiences with each other and their teacher</li>\n<li>Younger children using chat at home in the evenings as a controlled (monitored) introduction to the world of social networking</li>\n<li>A question and answer session with an invited speaker in a different location</li>\n<li>Sessions to help students prepare for tests where the teacher, or other students, would pose sample questions</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/chat/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391763323),
(10, 'cc3b587b91c66d03e33d871ea87159ea', '<p>The choice activity module enables a teacher to ask a single question and offer a selection of possible responses.</p>\n\n<p>Choice results may be published after students have answered, after a certain date, or not at all. Results may be published with student names or anonymously.</p>\n\n<p>A choice activity may be used</p>\n\n<ul><li>As a quick poll to stimulate thinking about a topic</li>\n<li>To quickly test students'' understanding</li>\n<li>To facilitate student decision-making, for example allowing students to vote on a direction for the course</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/choice/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391763323),
(11, '809d14d946269743e6f7a522918bbb99', '<p>The database activity module enables participants to create, maintain and search a collection of entries (i.e. records).  The structure of the entries is defined by the teacher as a number of fields. Field types include checkbox, radio buttons, dropdown menu, text area, URL, picture and uploaded file.</p>\n\n<p>The visual layout of information when listing, viewing or editing database entries may be controlled by database templates. Database activities may be shared between courses as presets and a teacher may also import and export database entries.</p>\n\n<p>If the database auto-linking filter is enabled, any entries in a database will be automatically linked where the words or phrases appear within the course.</p>\n\n<p>A teacher can allow comments on entries. Entries can also be rated by teachers or students (peer evaluation). Ratings can be aggregated to form a final grade which is recorded in the gradebook.</p>\n\n<p>Database activities have many uses, such as</p>\n\n<ul><li>A collaborative collection of web links, books, book reviews, journal references etc</li>\n<li>For displaying student-created photos, posters, websites or poems for peer comment and review</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/data/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391763323),
(12, 'caccffc3c3d02be96d17d77ae39b848f', '<p>The external tool activity module enables students to interact with learning resources and activities on other web sites. For example, an external tool could provide access to a new activity type or learning materials from a publisher.</p>\n\n<p>To create an external tool activity, a tool provider which supports LTI (Learning Tools Interoperability) is required. A teacher can create an external tool activity or make use of a tool configured by the site administrator.</p>\n\n<p>External tool activities differ from URL resources in a few ways:</p>\n\n<ul><li>External tools are context aware i.e. they have access to information about the user who launched the tool, such as institution, course and name</li>\n<li>External tools support reading, updating, and deleting grades associated with the activity instance</li>\n<li>External tool configurations create a trust relationship between your site and the tool provider, allowing secure communication between them</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/lti/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391763323),
(13, '0b9c71e89c9433c6c335c5a287562b1b', '<p>The forum activity module enables participants to have asynchronous discussions i.e. discussions that take place over an extended period of time.</p>\n\n<p>There are several forum types to choose from, such as a standard forum where anyone can start a new discussion at any time; a forum where each student can post exactly one discussion; or a question and answer forum where students must first post before being able to view other students'' posts. A teacher can allow files to be attached to forum posts. Attached images are displayed in the forum post.</p>\n\n<p>Participants can subscribe to a forum to receive notifications of new forum posts. A teacher can set the subscription mode to optional, forced or auto, or prevent subscription completely. If required, students can be blocked from posting more than a given number of posts in a given time period; this can prevent individuals from dominating discussions.</p>\n\n<p>Forum posts can be rated by teachers or students (peer evaluation). Ratings can be aggregated to form a final grade which is recorded in the gradebook.</p>\n\n<p>Forums have many uses, such as</p>\n\n<ul><li>A social space for students to get to know each other</li>\n<li>For course announcements (using a news forum with forced subscription)</li>\n<li>For discussing course content or reading materials</li>\n<li>For continuing online an issue raised previously in a face-to-face session</li>\n<li>For teacher-only discussions (using a hidden forum)</li>\n<li>A help centre where tutors and students can give advice</li>\n<li>A one-on-one support area for private student-teacher communications (using a forum with separate groups and with one student per group)</li>\n<li>For extension activities, for example ‘brain teasers’ for students to ponder and suggest solutions to</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/forum/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391763323),
(14, '4255a629c4bd2cb5fbf5094b971d4f89', '<p>The glossary activity module enables participants to create and maintain a list of definitions, like a dictionary, or to collect and organise resources or information.</p>\n\n<p>A teacher can allow files to be attached to glossary entries. Attached images are displayed in the entry. Entries can be searched or browsed alphabetically or by category, date or author. Entries can be approved by default or require approval by a teacher before they are viewable by everyone.</p>\n\n<p>If the glossary auto-linking filter is enabled, entries will be automatically linked where the concept words and/or phrases appear within the course.</p>\n\n<p>A teacher can allow comments on entries. Entries can also be rated by teachers or students (peer evaluation). Ratings can be aggregated to form a final grade which is recorded in the gradebook.</p>\n\n<p>Glossaries have many uses, such as</p>\n\n<ul><li>A collaborative bank of key terms</li>\n<li>A ‘getting to know you’ space where new students add their name and personal details</li>\n<li>A ‘handy tips’ resource of best practice in a practical subject</li>\n<li>A sharing area of useful videos, images or sound files</li>\n<li>A revision resource of facts to remember</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/glossary/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391763323),
(15, '8c2053afbc4038fc19d1c0a1587224cb', '<p>The lesson activity module enables a teacher to deliver content and/or practice activities in  interesting and flexible ways. A teacher can use the lesson to create a linear set of content pages or instructional activities that offer a variety of paths or options for the learner. In either case, teachers can choose to increase engagement and ensure understanding by including a variety of questions, such as multiple choice, matching and short answer. Depending on the student''s choice of answer and how the teacher develops the lesson, students may progress to the next page, be taken back to a previous page or redirected down a different path entirely.</p>\n\n<p>A lesson may be graded, with the grade recorded in the gradebook.</p>\n\n<p>Lessons may be used</p>\n\n<ul><li>For self-directed learning of a new topic</li>\n<li>For  scenarios or simulations/decision-making exercises</li>\n<li>For differentiated revision, with different sets of revision questions depending upon answers given to initial questions</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/lesson/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391763323),
(16, 'c7f55c386fb7f31356b748383745207e', '<p>The quiz activity enables a teacher to create quizzes comprising questions of various types, including multiple choice, matching, short-answer and numerical.</p>\n\n<p>The teacher can allow the quiz to be attempted multiple times, with the questions shuffled or randomly selected from the question bank. A time limit may be set.</p>\n\n<p>Each attempt is marked automatically, with the exception of essay questions, and the grade is recorded in the gradebook.</p>\n\n<p>The teacher can choose when and if hints, feedback and correct answers are shown to students.</p>\n\n<p>Quizzes may be used</p>\n\n<ul><li>As course exams</li>\n<li>As mini tests for reading assignments or at the end of a topic</li>\n<li>As exam practice using questions from past exams</li>\n<li>To deliver immediate feedback about performance</li>\n<li>For self-assessment</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/quiz/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391763323),
(17, '79d3c60bab7e1fc1811cb919d9a353e3', '<p>A SCORM package is a collection of files which are packaged according to an agreed standard for learning objects. The SCORM activity module enables SCORM or AICC packages to be uploaded as a zip file and added to a course.</p>\n\n<p>Content is usually displayed over several pages, with navigation between the pages. There are various options for displaying content in a pop-up window, with a table of contents, with navigation buttons etc. SCORM activities generally include questions, with grades being recorded in the gradebook.</p>\n\n<p>SCORM activities may be used</p>\n\n<ul><li>For presenting multimedia content and animations</li>\n<li>As an assessment tool</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/scorm/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391763323),
(18, 'c44859b39d389dc6e5745dca253caade', '<p>The survey activity module provides a number of verified survey instruments that have been found useful in assessing and stimulating learning in online environments. A teacher can use these to gather data from their students that will help them learn about their class and reflect on their own teaching.</p>\n\n<p>Note that these survey tools are pre-populated with questions. Teachers who wish to create their own survey should use the feedback activity module.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/survey/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391763323),
(19, 'dcba5b390e67c36f1c7dc43491a5f904', '<p>The wiki activity module enables participants to add and edit a collection of web pages. A wiki can be collaborative, with everyone being able to edit it, or individual, where everyone has their own wiki which only they can edit.</p>\n\n<p>A history of previous versions of each page in the wiki is kept, listing the edits made by each participant.</p>\n\n<p>Wikis have many uses, such as</p>\n\n<ul><li>For group lecture notes or study guides</li>\n<li>For members of a faculty to plan a scheme of work or meeting agenda together</li>\n<li>For students to collaboratively author an online book, creating content on a topic set by their tutor</li>\n<li>For collaborative storytelling or poetry creation, where each participant writes a line or verse</li>\n<li>As a personal journal for examination notes or revision (using an individual wiki)</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/wiki/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391763323),
(20, 'b124db707e39d9c4aa8f03c57651dc42', '<p>The workshop activity module enables the collection, review and peer assessment of students'' work.</p>\n\n<p>Students can submit any digital content (files), such as word-processed documents or spreadsheets and can also type text directly into a field using the text editor.</p>\n\n<p>Submissions are assessed using a multi-criteria assessment form defined by the teacher. The process of peer assessment and understanding the assessment form can be practised in advance with example submissions provided by the teacher, together with a reference assessment. Students are given the opportunity to assess one or more of their peers'' submissions. Submissions and reviewers may be anonymous if required.</p>\n\n<p>Students obtain two grades in a workshop activity - a grade for their submission and a grade for their assessment of their peers'' submissions. Both grades are recorded in the gradebook.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/workshop/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391763323),
(21, '8cc1219891749047b1bbc481ff6a3c85', '<p>The book module enables a teacher to create a multi-page resource in a book-like format, with chapters and subchapters. Books can contain media files as well as text and are useful for displaying lengthy passages of information which can be broken down into sections.</p>\n\n<p>A book may be used</p>\n\n<ul><li>To display reading material for individual modules of study</li>\n<li>As a staff departmental handbook</li>\n<li>As a showcase portfolio of student work</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/book/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391763323),
(22, '0861b9530b64e9ebf894aa6fc4c83cca', '<p>The file module enables a teacher to provide a file as a course resource. Where possible, the file will be displayed within the course interface; otherwise students will be prompted to download it. The file may include supporting files, for example an HTML page may have embedded images or Flash objects.</p>\n\n<p>Note that students need to have the appropriate software on their computers in order to open the file.</p>\n\n<p>A file may be used</p>\n\n<ul><li>To share presentations given in class</li>\n<li>To include a mini website as a course resource</li>\n<li>To provide draft files of certain software programs (eg Photoshop .psd) so students can edit and submit them for assessment</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/resource/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391763323),
(23, '513fdb439af464ed3e2638d35e40b788', '<p>The folder module enables a teacher to display a number of related files inside a single folder, reducing scrolling on the course page. A zipped folder may be uploaded and unzipped for display, or an empty folder created and files uploaded into it.</p>\n\n<p>A folder may be used</p>\n\n<ul><li>For a series of files on one topic, for example a set of past examination papers in pdf format or a collection of image files for use in student projects</li>\n<li>To provide a shared uploading space for teachers on the course page (keeping the folder hidden so that only teachers can see it)</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/folder/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391763323),
(24, 'bc38692887436154225ececd3e962385', '<p>An IMS content package is a collection of files which are packaged according to an agreed standard so they can be reused in different systems. The IMS content package module enables such content packages to be uploaded as a zip file and added to a course as a resource.</p>\n\n<p>Content is usually displayed over several pages, with navigation between the pages. There are various options for displaying content in a pop-up window, with a navigation menu or buttons etc.</p>\n\n<p>An IMS content package may be used for presenting multimedia content and animations.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/imscp/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391763323),
(25, '3171c6f3e60efac6c4ed127fd18280c7', '<p>The label module enables text and multimedia to be inserted into the course page in between links to other resources and activities. Labels are very versatile and can help to improve the appearance of a course if used thoughtfully.</p>\n\n<p>Labels may be used</p>\n\n<ul><li>To split up a long list of activities with a subheading or an image</li>\n<li>To display an embedded sound file or video directly on the course page</li>\n<li>To add a short description to a course section</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/label/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391763323),
(26, 'a60d4d840633fbed55a2139d0eb83421', '<p>The page module enables a teacher to create a web page resource using the text editor. A page can display text, images, sound, video, web links and embedded code, such as Google maps.</p>\n\n<p>Advantages of using the page module rather than the file module include the resource being more accessible (for example to users of mobile devices) and easier to update.</p>\n\n<p>For large amounts of content, it''s recommended that a book is used rather than a page.</p>\n\n<p>A page may be used</p>\n\n<ul><li>To present the terms and conditions of a course or a summary of the course syllabus</li>\n<li>To embed several videos or sound files together with some explanatory text</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/page/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391763323),
(27, 'c4b6b0cb22a3e5a8b7d031dd57f75778', '<p>The URL module enables a teacher to provide a web link as a course resource. Anything that is freely available online, such as documents or images, can be linked to; the URL doesn’t have to be the home page of a website. The URL of a particular web page may be copied and pasted or a teacher can use the file picker and choose a link from a repository such as Flickr, YouTube or Wikimedia (depending upon which repositories are enabled for the site).</p>\n\n<p>There are a number of display options for the URL, such as embedded or opening in a new window and advanced options for passing information, such as a student''s name, to the URL if required.</p>\n\n<p>Note that URLs can also be added to any other resource or activity type through the text editor.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/url/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391763324),
(28, 'e0147bcd74771c84d615147eb6b5bf91', '<div class="text_to_html">The default category for questions shared in context ''Miscellaneous''.</div>', 1391774773),
(29, 'a55f62814793a73b5a03bc6bc7f86fb3', '<div class="text_to_html">The default category for questions shared in context ''System''.</div>', 1392183360),
(30, 'd2724011ead0f11ecc99490edd341e85', '<div class="no-overflow"><p>These are the questions of the First Assignment Set</p></div>', 1391762869),
(31, '45ce366b2226cbf914cadc4af951f5be', '<p>What is the full form of SQL </p>', 1391762933),
(32, '18361da395953616f377a4d3e907c82e', '<p>What is the name of the First Dog Travel to Space ?</p>', 1391762933),
(33, '11f0f7a98fdcdaa8a9851ceb49be2ca4', '<p>These are the questions of the First Assignment Set. Good Luck and Have fun</p>', 1391763359),
(34, 'ca71510e27d67036ddd334cb32ad2ea1', '<div class="no-overflow"><p>Have Fun</p></div>', 1392183826),
(35, '579e5462c49437e77ed2170f059cc4aa', '<p>What is the name of the First Dog Travel to Space ?</p>', 1392183834),
(36, '2b474d0fa1ef76ee0f98dad0cf4bee68', '<p>What is the full form of SQL </p>', 1391774148),
(37, 'b9840e8efc6b26b07114ec8d66cf146a', '<p>ask for Indian Nationality</p>', 1391763339),
(38, '81091625caedcc673580180e38d8b4a5', '<p>What is the name of the First Dog Travel to Space ?</p>', 1391774131),
(39, 'bd271d18160307faba3a15ddb599e0c4', '<p>Bruno</p>', 1391774131),
(40, '026ab5a89f6e6b762ed74640595cddbf', '<p>Tommy</p>', 1391774131),
(41, '989c8e9d25d63ea1d46ed25a59cedd1a', '<p>Laika</p>', 1391774131),
(42, '887ee5544b1fb45e312f7c3352e433aa', '<p>Lucy</p>', 1391774131),
(43, 'a7372abfd06fbe09db8cc99e2ef5f71e', '<p>What is the full form of SQL </p>', 1391774131),
(44, 'f24bd749beb9ed11bb1e8d20d5361530', '<p>Sun Query Language</p>', 1391774131),
(45, '9df2d8a229f0d52ab007dcc00193753b', '<p>Sequential Query Language</p>', 1391774131),
(46, '7c42b834c353f79cbc13ab3bb8cb578d', '<p>Simple Query Language</p>', 1391774131),
(47, 'fcce5993dcc6f4840bf37776095e1af3', '<p>Sub Query Language</p>', 1391774131),
(48, '1e6d2fbb02e70714a0e7294a13dd4a58', '<p>Bruno</p>', 1392183834),
(49, '8d07ec29e22d3a3ce573cd37a427875c', '<p>Tommy</p>', 1392183834),
(50, '2b287322d739e8e1184e2fff77204fe4', '<p>Laika</p>', 1392183834),
(51, '2548646d4a3373cb7facc7c4b4e7b113', '<p>Lucy</p>', 1392183834),
(52, 'cc991663c1582502e8b10fa88520d98d', '<p>Network connection lost. (Autosave failed).</p>\n\n<p>Make a note of any responses entered on this page in the last few minutes, then try to re-connect.</p>\n\n<p>Once connection has been re-established, your responses should be saved and this message will disappear.</p>\n', 1391774132),
(53, '2ebbf979599ee3b3f17ef1e20ee4e686', '<p>Network connection restored. You may continue safely.</p>\n', 1391774132),
(54, '49e8cdba4a3ffa13b40028736698d356', '<p>Sun Query Language</p>', 1391774148),
(55, 'af572321cbf619364564eb4742eaea86', '<p>Sequential Query Language</p>', 1391774148),
(56, '6affec3441f4fe882254e746932be605', '<p>Simple Query Language</p>', 1391774148),
(57, 'a297abdbd9b4b5a38a2c2ec924284124', '<p>Sub Query Language</p>', 1391774148),
(58, '512ea03178c710451a00691fd98b9f12', '<p>Your answer is correct.</p>', 1392183834),
(59, '2b379fa18bf67eea182035ea2f91dbc7', '<p>The assignment activity module enables a teacher to communicate tasks, collect work and provide grades and feedback.</p>\n\n<p>Students can submit any digital content (files), such as word-processed documents, spreadsheets, images, or audio and video clips. Alternatively, or in addition, the assignment may require students to type text directly into the text editor. An assignment can also be used to remind students of ''real-world'' assignments they need to complete offline, such as art work, and thus not require any digital content. Students can submit work individually or as a member of a group.</p>\n\n<p>When reviewing assignments, teachers can leave feedback comments and upload files, such as marked-up student submissions, documents with comments or spoken audio feedback. Assignments can be graded using a numerical or custom scale or an advanced grading method such as a rubric. Final grades are recorded in the gradebook.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/assignment/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391774406),
(60, '4d2455731b8ad5d5d91908c675e0a182', '<p>The chat activity module enables participants to have text-based, real-time synchronous discussions.</p>\n\n<p>The chat may be a one-time activity or it may be repeated at the same time each day or each week. Chat sessions are saved and can be made available for everyone to view or restricted to users with the capability to view chat session logs.</p>\n\n<p>Chats are especially useful when the group chatting is not able to meet face-to-face, such as</p>\n\n<ul><li>Regular meetings of students participating in online courses to enable them to share experiences with others in the same course but in a different location</li>\n<li>A student temporarily unable to attend in person chatting with their teacher to catch up with work</li>\n<li>Students out on work experience getting together to discuss their experiences with each other and their teacher</li>\n<li>Younger children using chat at home in the evenings as a controlled (monitored) introduction to the world of social networking</li>\n<li>A question and answer session with an invited speaker in a different location</li>\n<li>Sessions to help students prepare for tests where the teacher, or other students, would pose sample questions</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/chat/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391774406),
(61, '9f5e30bec9b40fdde1ddff369a5a1c65', '<p>The choice activity module enables a teacher to ask a single question and offer a selection of possible responses.</p>\n\n<p>Choice results may be published after students have answered, after a certain date, or not at all. Results may be published with student names or anonymously.</p>\n\n<p>A choice activity may be used</p>\n\n<ul><li>As a quick poll to stimulate thinking about a topic</li>\n<li>To quickly test students'' understanding</li>\n<li>To facilitate student decision-making, for example allowing students to vote on a direction for the course</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/choice/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391774407),
(62, '4fc93747fed62e09c42e4496f03bccb0', '<p>The database activity module enables participants to create, maintain and search a collection of entries (i.e. records).  The structure of the entries is defined by the teacher as a number of fields. Field types include checkbox, radio buttons, dropdown menu, text area, URL, picture and uploaded file.</p>\n\n<p>The visual layout of information when listing, viewing or editing database entries may be controlled by database templates. Database activities may be shared between courses as presets and a teacher may also import and export database entries.</p>\n\n<p>If the database auto-linking filter is enabled, any entries in a database will be automatically linked where the words or phrases appear within the course.</p>\n\n<p>A teacher can allow comments on entries. Entries can also be rated by teachers or students (peer evaluation). Ratings can be aggregated to form a final grade which is recorded in the gradebook.</p>\n\n<p>Database activities have many uses, such as</p>\n\n<ul><li>A collaborative collection of web links, books, book reviews, journal references etc</li>\n<li>For displaying student-created photos, posters, websites or poems for peer comment and review</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/data/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391774407),
(63, '617898ce7e6470fadf4b17bcb26542cb', '<p>The external tool activity module enables students to interact with learning resources and activities on other web sites. For example, an external tool could provide access to a new activity type or learning materials from a publisher.</p>\n\n<p>To create an external tool activity, a tool provider which supports LTI (Learning Tools Interoperability) is required. A teacher can create an external tool activity or make use of a tool configured by the site administrator.</p>\n\n<p>External tool activities differ from URL resources in a few ways:</p>\n\n<ul><li>External tools are context aware i.e. they have access to information about the user who launched the tool, such as institution, course and name</li>\n<li>External tools support reading, updating, and deleting grades associated with the activity instance</li>\n<li>External tool configurations create a trust relationship between your site and the tool provider, allowing secure communication between them</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/lti/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391774407),
(64, '650bc9c4cb420332ab977e0f8516fd00', '<p>The forum activity module enables participants to have asynchronous discussions i.e. discussions that take place over an extended period of time.</p>\n\n<p>There are several forum types to choose from, such as a standard forum where anyone can start a new discussion at any time; a forum where each student can post exactly one discussion; or a question and answer forum where students must first post before being able to view other students'' posts. A teacher can allow files to be attached to forum posts. Attached images are displayed in the forum post.</p>\n\n<p>Participants can subscribe to a forum to receive notifications of new forum posts. A teacher can set the subscription mode to optional, forced or auto, or prevent subscription completely. If required, students can be blocked from posting more than a given number of posts in a given time period; this can prevent individuals from dominating discussions.</p>\n\n<p>Forum posts can be rated by teachers or students (peer evaluation). Ratings can be aggregated to form a final grade which is recorded in the gradebook.</p>\n\n<p>Forums have many uses, such as</p>\n\n<ul><li>A social space for students to get to know each other</li>\n<li>For course announcements (using a news forum with forced subscription)</li>\n<li>For discussing course content or reading materials</li>\n<li>For continuing online an issue raised previously in a face-to-face session</li>\n<li>For teacher-only discussions (using a hidden forum)</li>\n<li>A help centre where tutors and students can give advice</li>\n<li>A one-on-one support area for private student-teacher communications (using a forum with separate groups and with one student per group)</li>\n<li>For extension activities, for example ‘brain teasers’ for students to ponder and suggest solutions to</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/forum/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391774407),
(65, 'fc4a4960cbafddcff778cd09bf5fc456', '<p>The glossary activity module enables participants to create and maintain a list of definitions, like a dictionary, or to collect and organise resources or information.</p>\n\n<p>A teacher can allow files to be attached to glossary entries. Attached images are displayed in the entry. Entries can be searched or browsed alphabetically or by category, date or author. Entries can be approved by default or require approval by a teacher before they are viewable by everyone.</p>\n\n<p>If the glossary auto-linking filter is enabled, entries will be automatically linked where the concept words and/or phrases appear within the course.</p>\n\n<p>A teacher can allow comments on entries. Entries can also be rated by teachers or students (peer evaluation). Ratings can be aggregated to form a final grade which is recorded in the gradebook.</p>\n\n<p>Glossaries have many uses, such as</p>\n\n<ul><li>A collaborative bank of key terms</li>\n<li>A ‘getting to know you’ space where new students add their name and personal details</li>\n<li>A ‘handy tips’ resource of best practice in a practical subject</li>\n<li>A sharing area of useful videos, images or sound files</li>\n<li>A revision resource of facts to remember</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/glossary/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391774407),
(66, '86865ad074c65a8067f08220b5c4bcd1', '<p>The lesson activity module enables a teacher to deliver content and/or practice activities in  interesting and flexible ways. A teacher can use the lesson to create a linear set of content pages or instructional activities that offer a variety of paths or options for the learner. In either case, teachers can choose to increase engagement and ensure understanding by including a variety of questions, such as multiple choice, matching and short answer. Depending on the student''s choice of answer and how the teacher develops the lesson, students may progress to the next page, be taken back to a previous page or redirected down a different path entirely.</p>\n\n<p>A lesson may be graded, with the grade recorded in the gradebook.</p>\n\n<p>Lessons may be used</p>\n\n<ul><li>For self-directed learning of a new topic</li>\n<li>For  scenarios or simulations/decision-making exercises</li>\n<li>For differentiated revision, with different sets of revision questions depending upon answers given to initial questions</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/lesson/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391774407),
(67, '3fbdc80d2fdf62df691a9315e9994f92', '<p>The quiz activity enables a teacher to create quizzes comprising questions of various types, including multiple choice, matching, short-answer and numerical.</p>\n\n<p>The teacher can allow the quiz to be attempted multiple times, with the questions shuffled or randomly selected from the question bank. A time limit may be set.</p>\n\n<p>Each attempt is marked automatically, with the exception of essay questions, and the grade is recorded in the gradebook.</p>\n\n<p>The teacher can choose when and if hints, feedback and correct answers are shown to students.</p>\n\n<p>Quizzes may be used</p>\n\n<ul><li>As course exams</li>\n<li>As mini tests for reading assignments or at the end of a topic</li>\n<li>As exam practice using questions from past exams</li>\n<li>To deliver immediate feedback about performance</li>\n<li>For self-assessment</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/quiz/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391774407),
(68, '9edad618cc50d46c14a6076c3a3a4dfb', '<p>A SCORM package is a collection of files which are packaged according to an agreed standard for learning objects. The SCORM activity module enables SCORM or AICC packages to be uploaded as a zip file and added to a course.</p>\n\n<p>Content is usually displayed over several pages, with navigation between the pages. There are various options for displaying content in a pop-up window, with a table of contents, with navigation buttons etc. SCORM activities generally include questions, with grades being recorded in the gradebook.</p>\n\n<p>SCORM activities may be used</p>\n\n<ul><li>For presenting multimedia content and animations</li>\n<li>As an assessment tool</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/scorm/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391774407),
(69, '564323d095f715c6d39bd312935bcd8f', '<p>The survey activity module provides a number of verified survey instruments that have been found useful in assessing and stimulating learning in online environments. A teacher can use these to gather data from their students that will help them learn about their class and reflect on their own teaching.</p>\n\n<p>Note that these survey tools are pre-populated with questions. Teachers who wish to create their own survey should use the feedback activity module.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/survey/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391774407),
(70, 'c8381bc529467f982e14758b73b98eca', '<p>The wiki activity module enables participants to add and edit a collection of web pages. A wiki can be collaborative, with everyone being able to edit it, or individual, where everyone has their own wiki which only they can edit.</p>\n\n<p>A history of previous versions of each page in the wiki is kept, listing the edits made by each participant.</p>\n\n<p>Wikis have many uses, such as</p>\n\n<ul><li>For group lecture notes or study guides</li>\n<li>For members of a faculty to plan a scheme of work or meeting agenda together</li>\n<li>For students to collaboratively author an online book, creating content on a topic set by their tutor</li>\n<li>For collaborative storytelling or poetry creation, where each participant writes a line or verse</li>\n<li>As a personal journal for examination notes or revision (using an individual wiki)</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/wiki/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391774407),
(71, '71454471eebe25411d58972598c83f57', '<p>The workshop activity module enables the collection, review and peer assessment of students'' work.</p>\n\n<p>Students can submit any digital content (files), such as word-processed documents or spreadsheets and can also type text directly into a field using the text editor.</p>\n\n<p>Submissions are assessed using a multi-criteria assessment form defined by the teacher. The process of peer assessment and understanding the assessment form can be practised in advance with example submissions provided by the teacher, together with a reference assessment. Students are given the opportunity to assess one or more of their peers'' submissions. Submissions and reviewers may be anonymous if required.</p>\n\n<p>Students obtain two grades in a workshop activity - a grade for their submission and a grade for their assessment of their peers'' submissions. Both grades are recorded in the gradebook.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/workshop/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391774407),
(72, '8b6f3c76fe411bfe9d8e41992e06204d', '<p>The book module enables a teacher to create a multi-page resource in a book-like format, with chapters and subchapters. Books can contain media files as well as text and are useful for displaying lengthy passages of information which can be broken down into sections.</p>\n\n<p>A book may be used</p>\n\n<ul><li>To display reading material for individual modules of study</li>\n<li>As a staff departmental handbook</li>\n<li>As a showcase portfolio of student work</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/book/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391774407),
(73, '7d51e41f7b022c402acb56c2e3d23788', '<p>The file module enables a teacher to provide a file as a course resource. Where possible, the file will be displayed within the course interface; otherwise students will be prompted to download it. The file may include supporting files, for example an HTML page may have embedded images or Flash objects.</p>\n\n<p>Note that students need to have the appropriate software on their computers in order to open the file.</p>\n\n<p>A file may be used</p>\n\n<ul><li>To share presentations given in class</li>\n<li>To include a mini website as a course resource</li>\n<li>To provide draft files of certain software programs (eg Photoshop .psd) so students can edit and submit them for assessment</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/resource/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391774407),
(74, '314f37d0f27924ec3a238543455dcfef', '<p>The folder module enables a teacher to display a number of related files inside a single folder, reducing scrolling on the course page. A zipped folder may be uploaded and unzipped for display, or an empty folder created and files uploaded into it.</p>\n\n<p>A folder may be used</p>\n\n<ul><li>For a series of files on one topic, for example a set of past examination papers in pdf format or a collection of image files for use in student projects</li>\n<li>To provide a shared uploading space for teachers on the course page (keeping the folder hidden so that only teachers can see it)</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/folder/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391774407),
(75, '9e889455e42f82c51a1ada7ea06fec4d', '<p>An IMS content package is a collection of files which are packaged according to an agreed standard so they can be reused in different systems. The IMS content package module enables such content packages to be uploaded as a zip file and added to a course as a resource.</p>\n\n<p>Content is usually displayed over several pages, with navigation between the pages. There are various options for displaying content in a pop-up window, with a navigation menu or buttons etc.</p>\n\n<p>An IMS content package may be used for presenting multimedia content and animations.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/imscp/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391774407);
INSERT INTO `mdl_cache_text` (`id`, `md5key`, `formattedtext`, `timemodified`) VALUES
(76, 'b6882425027239f3109115ef8078482c', '<p>The label module enables text and multimedia to be inserted into the course page in between links to other resources and activities. Labels are very versatile and can help to improve the appearance of a course if used thoughtfully.</p>\n\n<p>Labels may be used</p>\n\n<ul><li>To split up a long list of activities with a subheading or an image</li>\n<li>To display an embedded sound file or video directly on the course page</li>\n<li>To add a short description to a course section</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/label/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391774407),
(77, '3577ba8412bb0b6b3bca4f35f30f51e5', '<p>The page module enables a teacher to create a web page resource using the text editor. A page can display text, images, sound, video, web links and embedded code, such as Google maps.</p>\n\n<p>Advantages of using the page module rather than the file module include the resource being more accessible (for example to users of mobile devices) and easier to update.</p>\n\n<p>For large amounts of content, it''s recommended that a book is used rather than a page.</p>\n\n<p>A page may be used</p>\n\n<ul><li>To present the terms and conditions of a course or a summary of the course syllabus</li>\n<li>To embed several videos or sound files together with some explanatory text</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/page/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391774407),
(78, '6a21746e136177fa77de388ed0f6d4c8', '<p>The URL module enables a teacher to provide a web link as a course resource. Anything that is freely available online, such as documents or images, can be linked to; the URL doesn’t have to be the home page of a website. The URL of a particular web page may be copied and pasted or a teacher can use the file picker and choose a link from a repository such as Flickr, YouTube or Wikimedia (depending upon which repositories are enabled for the site).</p>\n\n<p>There are a number of display options for the URL, such as embedded or opening in a new window and advanced options for passing information, such as a student''s name, to the URL if required.</p>\n\n<p>Note that URLs can also be added to any other resource or activity type through the text editor.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/url/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391774407),
(79, 'aa6732268c760b0f50246e0d186ca1a3', '<p>The assignment activity module enables a teacher to communicate tasks, collect work and provide grades and feedback.</p>\n\n<p>Students can submit any digital content (files), such as word-processed documents, spreadsheets, images, or audio and video clips. Alternatively, or in addition, the assignment may require students to type text directly into the text editor. An assignment can also be used to remind students of ''real-world'' assignments they need to complete offline, such as art work, and thus not require any digital content. Students can submit work individually or as a member of a group.</p>\n\n<p>When reviewing assignments, teachers can leave feedback comments and upload files, such as marked-up student submissions, documents with comments or spoken audio feedback. Assignments can be graded using a numerical or custom scale or an advanced grading method such as a rubric. Final grades are recorded in the gradebook.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/assignment/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391775688),
(80, '29df87cb52a8da871468d9109fa7fbdf', '<p>The chat activity module enables participants to have text-based, real-time synchronous discussions.</p>\n\n<p>The chat may be a one-time activity or it may be repeated at the same time each day or each week. Chat sessions are saved and can be made available for everyone to view or restricted to users with the capability to view chat session logs.</p>\n\n<p>Chats are especially useful when the group chatting is not able to meet face-to-face, such as</p>\n\n<ul><li>Regular meetings of students participating in online courses to enable them to share experiences with others in the same course but in a different location</li>\n<li>A student temporarily unable to attend in person chatting with their teacher to catch up with work</li>\n<li>Students out on work experience getting together to discuss their experiences with each other and their teacher</li>\n<li>Younger children using chat at home in the evenings as a controlled (monitored) introduction to the world of social networking</li>\n<li>A question and answer session with an invited speaker in a different location</li>\n<li>Sessions to help students prepare for tests where the teacher, or other students, would pose sample questions</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/chat/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391775688),
(81, '7458dee801ec594d7cb74dc9465939be', '<p>The choice activity module enables a teacher to ask a single question and offer a selection of possible responses.</p>\n\n<p>Choice results may be published after students have answered, after a certain date, or not at all. Results may be published with student names or anonymously.</p>\n\n<p>A choice activity may be used</p>\n\n<ul><li>As a quick poll to stimulate thinking about a topic</li>\n<li>To quickly test students'' understanding</li>\n<li>To facilitate student decision-making, for example allowing students to vote on a direction for the course</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/choice/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391775688),
(82, 'e5aa00866d208cb79a5994f89da95c44', '<p>The database activity module enables participants to create, maintain and search a collection of entries (i.e. records).  The structure of the entries is defined by the teacher as a number of fields. Field types include checkbox, radio buttons, dropdown menu, text area, URL, picture and uploaded file.</p>\n\n<p>The visual layout of information when listing, viewing or editing database entries may be controlled by database templates. Database activities may be shared between courses as presets and a teacher may also import and export database entries.</p>\n\n<p>If the database auto-linking filter is enabled, any entries in a database will be automatically linked where the words or phrases appear within the course.</p>\n\n<p>A teacher can allow comments on entries. Entries can also be rated by teachers or students (peer evaluation). Ratings can be aggregated to form a final grade which is recorded in the gradebook.</p>\n\n<p>Database activities have many uses, such as</p>\n\n<ul><li>A collaborative collection of web links, books, book reviews, journal references etc</li>\n<li>For displaying student-created photos, posters, websites or poems for peer comment and review</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/data/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391775688),
(83, '1c5ce9b774486b02c423d3aea82acc1b', '<p>The external tool activity module enables students to interact with learning resources and activities on other web sites. For example, an external tool could provide access to a new activity type or learning materials from a publisher.</p>\n\n<p>To create an external tool activity, a tool provider which supports LTI (Learning Tools Interoperability) is required. A teacher can create an external tool activity or make use of a tool configured by the site administrator.</p>\n\n<p>External tool activities differ from URL resources in a few ways:</p>\n\n<ul><li>External tools are context aware i.e. they have access to information about the user who launched the tool, such as institution, course and name</li>\n<li>External tools support reading, updating, and deleting grades associated with the activity instance</li>\n<li>External tool configurations create a trust relationship between your site and the tool provider, allowing secure communication between them</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/lti/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391775688),
(84, '85f1ea9e048c88038ef4e629637397d6', '<p>The forum activity module enables participants to have asynchronous discussions i.e. discussions that take place over an extended period of time.</p>\n\n<p>There are several forum types to choose from, such as a standard forum where anyone can start a new discussion at any time; a forum where each student can post exactly one discussion; or a question and answer forum where students must first post before being able to view other students'' posts. A teacher can allow files to be attached to forum posts. Attached images are displayed in the forum post.</p>\n\n<p>Participants can subscribe to a forum to receive notifications of new forum posts. A teacher can set the subscription mode to optional, forced or auto, or prevent subscription completely. If required, students can be blocked from posting more than a given number of posts in a given time period; this can prevent individuals from dominating discussions.</p>\n\n<p>Forum posts can be rated by teachers or students (peer evaluation). Ratings can be aggregated to form a final grade which is recorded in the gradebook.</p>\n\n<p>Forums have many uses, such as</p>\n\n<ul><li>A social space for students to get to know each other</li>\n<li>For course announcements (using a news forum with forced subscription)</li>\n<li>For discussing course content or reading materials</li>\n<li>For continuing online an issue raised previously in a face-to-face session</li>\n<li>For teacher-only discussions (using a hidden forum)</li>\n<li>A help centre where tutors and students can give advice</li>\n<li>A one-on-one support area for private student-teacher communications (using a forum with separate groups and with one student per group)</li>\n<li>For extension activities, for example ‘brain teasers’ for students to ponder and suggest solutions to</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/forum/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391775688),
(85, '29f222fd4760ab1d02eb0b7c81517329', '<p>The glossary activity module enables participants to create and maintain a list of definitions, like a dictionary, or to collect and organise resources or information.</p>\n\n<p>A teacher can allow files to be attached to glossary entries. Attached images are displayed in the entry. Entries can be searched or browsed alphabetically or by category, date or author. Entries can be approved by default or require approval by a teacher before they are viewable by everyone.</p>\n\n<p>If the glossary auto-linking filter is enabled, entries will be automatically linked where the concept words and/or phrases appear within the course.</p>\n\n<p>A teacher can allow comments on entries. Entries can also be rated by teachers or students (peer evaluation). Ratings can be aggregated to form a final grade which is recorded in the gradebook.</p>\n\n<p>Glossaries have many uses, such as</p>\n\n<ul><li>A collaborative bank of key terms</li>\n<li>A ‘getting to know you’ space where new students add their name and personal details</li>\n<li>A ‘handy tips’ resource of best practice in a practical subject</li>\n<li>A sharing area of useful videos, images or sound files</li>\n<li>A revision resource of facts to remember</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/glossary/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391775688),
(86, 'dee1042ed990b1db2babb49b260e06fb', '<p>The lesson activity module enables a teacher to deliver content and/or practice activities in  interesting and flexible ways. A teacher can use the lesson to create a linear set of content pages or instructional activities that offer a variety of paths or options for the learner. In either case, teachers can choose to increase engagement and ensure understanding by including a variety of questions, such as multiple choice, matching and short answer. Depending on the student''s choice of answer and how the teacher develops the lesson, students may progress to the next page, be taken back to a previous page or redirected down a different path entirely.</p>\n\n<p>A lesson may be graded, with the grade recorded in the gradebook.</p>\n\n<p>Lessons may be used</p>\n\n<ul><li>For self-directed learning of a new topic</li>\n<li>For  scenarios or simulations/decision-making exercises</li>\n<li>For differentiated revision, with different sets of revision questions depending upon answers given to initial questions</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/lesson/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391775688),
(87, '25e8ca3f40c4cb63afba1f8d785fd6d9', '<p>The quiz activity enables a teacher to create quizzes comprising questions of various types, including multiple choice, matching, short-answer and numerical.</p>\n\n<p>The teacher can allow the quiz to be attempted multiple times, with the questions shuffled or randomly selected from the question bank. A time limit may be set.</p>\n\n<p>Each attempt is marked automatically, with the exception of essay questions, and the grade is recorded in the gradebook.</p>\n\n<p>The teacher can choose when and if hints, feedback and correct answers are shown to students.</p>\n\n<p>Quizzes may be used</p>\n\n<ul><li>As course exams</li>\n<li>As mini tests for reading assignments or at the end of a topic</li>\n<li>As exam practice using questions from past exams</li>\n<li>To deliver immediate feedback about performance</li>\n<li>For self-assessment</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/quiz/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391775688),
(88, 'e3634dafdd00821a4d531d1ebfe2bdb6', '<p>A SCORM package is a collection of files which are packaged according to an agreed standard for learning objects. The SCORM activity module enables SCORM or AICC packages to be uploaded as a zip file and added to a course.</p>\n\n<p>Content is usually displayed over several pages, with navigation between the pages. There are various options for displaying content in a pop-up window, with a table of contents, with navigation buttons etc. SCORM activities generally include questions, with grades being recorded in the gradebook.</p>\n\n<p>SCORM activities may be used</p>\n\n<ul><li>For presenting multimedia content and animations</li>\n<li>As an assessment tool</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/scorm/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391775688),
(89, 'b1f450d36b7453afcceb2477260c0f6e', '<p>The survey activity module provides a number of verified survey instruments that have been found useful in assessing and stimulating learning in online environments. A teacher can use these to gather data from their students that will help them learn about their class and reflect on their own teaching.</p>\n\n<p>Note that these survey tools are pre-populated with questions. Teachers who wish to create their own survey should use the feedback activity module.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/survey/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391775689),
(90, '02f60ec8187b640651c581a29452003b', '<p>The wiki activity module enables participants to add and edit a collection of web pages. A wiki can be collaborative, with everyone being able to edit it, or individual, where everyone has their own wiki which only they can edit.</p>\n\n<p>A history of previous versions of each page in the wiki is kept, listing the edits made by each participant.</p>\n\n<p>Wikis have many uses, such as</p>\n\n<ul><li>For group lecture notes or study guides</li>\n<li>For members of a faculty to plan a scheme of work or meeting agenda together</li>\n<li>For students to collaboratively author an online book, creating content on a topic set by their tutor</li>\n<li>For collaborative storytelling or poetry creation, where each participant writes a line or verse</li>\n<li>As a personal journal for examination notes or revision (using an individual wiki)</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/wiki/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391775689),
(91, '5f08047085b1ed5cdb6ce4945c8bc35d', '<p>The workshop activity module enables the collection, review and peer assessment of students'' work.</p>\n\n<p>Students can submit any digital content (files), such as word-processed documents or spreadsheets and can also type text directly into a field using the text editor.</p>\n\n<p>Submissions are assessed using a multi-criteria assessment form defined by the teacher. The process of peer assessment and understanding the assessment form can be practised in advance with example submissions provided by the teacher, together with a reference assessment. Students are given the opportunity to assess one or more of their peers'' submissions. Submissions and reviewers may be anonymous if required.</p>\n\n<p>Students obtain two grades in a workshop activity - a grade for their submission and a grade for their assessment of their peers'' submissions. Both grades are recorded in the gradebook.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/workshop/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391775689),
(92, '1bebc47d3d4b60896b5f0f7f6a2d6d32', '<p>The book module enables a teacher to create a multi-page resource in a book-like format, with chapters and subchapters. Books can contain media files as well as text and are useful for displaying lengthy passages of information which can be broken down into sections.</p>\n\n<p>A book may be used</p>\n\n<ul><li>To display reading material for individual modules of study</li>\n<li>As a staff departmental handbook</li>\n<li>As a showcase portfolio of student work</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/book/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391775689),
(93, 'e370bf7594405299e60c5e0cb4890b29', '<p>The file module enables a teacher to provide a file as a course resource. Where possible, the file will be displayed within the course interface; otherwise students will be prompted to download it. The file may include supporting files, for example an HTML page may have embedded images or Flash objects.</p>\n\n<p>Note that students need to have the appropriate software on their computers in order to open the file.</p>\n\n<p>A file may be used</p>\n\n<ul><li>To share presentations given in class</li>\n<li>To include a mini website as a course resource</li>\n<li>To provide draft files of certain software programs (eg Photoshop .psd) so students can edit and submit them for assessment</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/resource/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391775689),
(94, 'cb182430e83228a0621b58d86d3626c7', '<p>The folder module enables a teacher to display a number of related files inside a single folder, reducing scrolling on the course page. A zipped folder may be uploaded and unzipped for display, or an empty folder created and files uploaded into it.</p>\n\n<p>A folder may be used</p>\n\n<ul><li>For a series of files on one topic, for example a set of past examination papers in pdf format or a collection of image files for use in student projects</li>\n<li>To provide a shared uploading space for teachers on the course page (keeping the folder hidden so that only teachers can see it)</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/folder/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391775689),
(95, 'd846cdbd6cdfc6ce5237ed43dc1d9265', '<p>An IMS content package is a collection of files which are packaged according to an agreed standard so they can be reused in different systems. The IMS content package module enables such content packages to be uploaded as a zip file and added to a course as a resource.</p>\n\n<p>Content is usually displayed over several pages, with navigation between the pages. There are various options for displaying content in a pop-up window, with a navigation menu or buttons etc.</p>\n\n<p>An IMS content package may be used for presenting multimedia content and animations.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/imscp/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391775689),
(96, '5109b7e83a48054cb034257d96206f94', '<p>The label module enables text and multimedia to be inserted into the course page in between links to other resources and activities. Labels are very versatile and can help to improve the appearance of a course if used thoughtfully.</p>\n\n<p>Labels may be used</p>\n\n<ul><li>To split up a long list of activities with a subheading or an image</li>\n<li>To display an embedded sound file or video directly on the course page</li>\n<li>To add a short description to a course section</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/label/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391775689),
(97, 'db5731a41df12a0ca37fc0c1cf2dde91', '<p>The page module enables a teacher to create a web page resource using the text editor. A page can display text, images, sound, video, web links and embedded code, such as Google maps.</p>\n\n<p>Advantages of using the page module rather than the file module include the resource being more accessible (for example to users of mobile devices) and easier to update.</p>\n\n<p>For large amounts of content, it''s recommended that a book is used rather than a page.</p>\n\n<p>A page may be used</p>\n\n<ul><li>To present the terms and conditions of a course or a summary of the course syllabus</li>\n<li>To embed several videos or sound files together with some explanatory text</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/page/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391775689),
(98, 'e4d67ba5cafa8f03aad0b64b8c38fe2d', '<p>The URL module enables a teacher to provide a web link as a course resource. Anything that is freely available online, such as documents or images, can be linked to; the URL doesn’t have to be the home page of a website. The URL of a particular web page may be copied and pasted or a teacher can use the file picker and choose a link from a repository such as Flickr, YouTube or Wikimedia (depending upon which repositories are enabled for the site).</p>\n\n<p>There are a number of display options for the URL, such as embedded or opening in a new window and advanced options for passing information, such as a student''s name, to the URL if required.</p>\n\n<p>Note that URLs can also be added to any other resource or activity type through the text editor.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/url/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/standard/core/1391627044/docs" />More help</a></div>\n', 1391775689),
(99, 'cef1dbfedafe00ae30171428820318f7', '<div class="text_to_html">The default category for questions shared in context ''mkd''.</div>', 1391775713),
(100, 'b54bac59ec07a54e562bc24f8242e52c', '<p>Enjoy the Quizzes</p>', 1391775718),
(101, '73d19452014b01839e915258a8654751', '<p>Fill the Blank Space in Hamka _____ hai </p>', 1391775267),
(102, 'ef2379c02bd3462e4dc4f3b56426fac9', '<p>Fill in the blank space ''Na koi ________ na _______ ab ilzam lage ____ par''</p>', 1391775267),
(103, 'e7bf2e5fee6fd9713f0b1184090c8e67', '<div class="no-overflow"><p>This is the Week 1 Exercise, It is adviced to all the students to first watch the videos and understand the concept for good knowledge.</p></div>', 1392019824),
(104, '8c0167a1218e994f256dc2c09eefc71a', '<p>Fill the Blank Space in Hamka _____ hai </p>', 1392019828),
(105, 'ef476ed275796c992a749ad3eba21943', '<p>Fill in the blank space ''Na koi ________ na _______ ab ilzam lage ____ par''</p>', 1392019838),
(106, '6527bc0a15533896c65b2dc442597609', '<div class="no-overflow"><p>Sal Nahi pata Sal</p></div>', 1392184420),
(107, '400130737b5e876e344fb4241f3f5f63', '<p>Fill the Blank Space in Hamka _____ hai </p>', 1392019754),
(108, 'dcea11dcf770ea46ac4f171044bbf425', '<p>Cheeni</p>', 1392019754),
(109, '1fe01e9612d98ab3b683b5549577001b', '<p>Peeni</p>', 1392019754),
(110, '2bf6080d441d76826d9bb07582e4e878', '<p>Jeeni</p>', 1392019754),
(111, '9dfcfdd8d1cef812f19d00ef34c9649e', '<p>Fill in the blank space ''Na koi ________ na _______ ab ilzam lage ____ par''</p>', 1392019754),
(112, '01522c26f5678d6594ad815f95d43c06', '<p>Rehbar ,Rehzar, Kiss</p>', 1392019754),
(113, '8e82d2346f9f0a57abe7b3f322df1616', '<p>Rehzar,Kiss, Rehbar</p>', 1392019754),
(114, '034a95fadbc4ad7e735b0b533b4ccc64', '<p>Rehzar, Rehbar , Kiss</p>', 1392019754),
(115, '5954b4e452d5d6f5cd2e38f4649b6047', '<p>Cheeni</p>', 1392019827),
(116, '147f89a9fa69b30929f958b0b58d702a', '<p>Peeni</p>', 1392019828),
(117, 'b866a5aff9504ae00413c27e113c7edd', '<p>Jeeni</p>', 1392019828),
(118, '1b896ae0a7dcbcf44a45dffb5c67316b', '<p>Network connection lost. (Autosave failed).</p>\n\n<p>Make a note of any responses entered on this page in the last few minutes, then try to re-connect.</p>\n\n<p>Once connection has been re-established, your responses should be saved and this message will disappear.</p>\n', 1392019755),
(119, '8a7e46a2d90a12caf8fc1453711dc3c0', '<p>Network connection restored. You may continue safely.</p>\n', 1392019755),
(120, 'c498a3672be5a2ffc3f42749959be35e', '<p>Rehbar ,Rehzar, Kiss</p>', 1392019838),
(121, '23b021fd574a59878c73771e4e8f297d', '<p>Rehzar,Kiss, Rehbar</p>', 1392019838),
(122, '4469b8e8145bc05cf434623a2e56226b', '<p>Rehzar, Rehbar , Kiss</p>', 1392019838),
(123, '3b217dfa2f9e1648fca2615da71be7f0', '<p>Your answer is correct.</p>', 1392019795),
(124, 'fbb3619d128b753285f0467756cab40a', '<p>Your answer is incorrect.</p>', 1392019799),
(125, '75d6b4d9bf5a508c9b6142a1044b5895', '<p>Hello Students,</p>\r\n<p>Hope you have enjoyed the First Quiz.</p>\r\n<p></p>\r\n<p>Next Quiz coming up on Saturday</p>', 1392022642),
(126, 'b7866d2cef9518480fde0cb5860e01b9', '<div class="text_to_html">The default category for questions shared in context ''samvidhan''.</div>', 1392183223),
(127, 'd7b1f5a5408e2a0a0ec3101d66085215', '<div class="no-overflow"><p>This is the Samvidhan Jagran Quiz for Suryoday Trust.</p></div>', 1392304635),
(128, '10572e8429197279bbc45b48366db1df', '<div class="text_to_html"> <div class="clearfix"><div class="well"><h2>Clean</h2><p><img class="img-polaroid" src="clean/pix/screenshot.jpg" alt="screenshot.jpg" /></p></div><div class="well"><h3>About</h3><p>Clean is a modified Moodle bootstrap theme which inherits styles and renderers from its parent theme.</p><h3>Parents</h3><p>This theme is based upon the Bootstrap theme, which was created for Moodle 2.5, with the help of:<br /> Stuart Lamour, Mark Aberdour, Paul Hibbitts, Mary Evans.</p><h3>Theme Credits</h3><p>Authors: Bas Brands, David Scotson, Mary Evans<br /> Contact: bas@sonsbeekmedia.nl<br /> Website: <a href="http://www.basbrands.nl">www.basbrands.nl</a></p><h3>Report a bug:</h3><p><a href="http://tracker.moodle.org">http://tracker.moodle.org</a></p><h3>More information</h3><p><a href="clean/README.txt">How to copy and customise this theme.</a></p></div></div></div>', 1392153647),
(129, '67651465598e572468aa0ba54dad1d7c', '<p>P</p>', 1392183031),
(130, '2c5399842855b9005430bc3f0e6f7247', '<p>India is a Democratic Country ?</p>', 1392183031),
(131, '970cb2bacaa38eb8a34be26e35de1bf6', '<div class="no-overflow"><div class="text_to_html">The default category for questions shared in context ''Miscellaneous''.</div></div>', 1392183026),
(132, '1c86704dbab294d3662c691241c95ec9', '<div class="no-overflow"><div class="text_to_html">The default category for questions shared in context ''System''.</div></div>', 1392183029),
(133, '8d23b6c822a1b5992bfe434223bee5f6', '<div class="no-overflow"><p>The following Quiz is the Part 1 of the Main Quiz</p></div>', 1392303774),
(134, '4c3000a8dae00ac345abb6f87f3896ca', '<p>P</p>', 1392288788),
(135, 'b538c7f9798316cd60569041b08a72ca', '<p>India is a Democratic Country ?</p>', 1392288776),
(136, '1fdddb0a9da2cd4ca126c184ff38e61a', '<p>P</p>', 1392288787),
(137, '283b60da068e81484b3d7c00aa6cc77f', '<p>Dr. Manmohan Singh</p>', 1392288787),
(138, 'b2bbf793f6c31817f306cb3608b3dd3e', '<p>Pranab Mukherjee</p>', 1392288787),
(139, '594ad7c88a92f1d2c4cd414254c62867', '<p>Meira Kumar</p>', 1392288787),
(140, 'ce3890317680a843c20b93353ad18e7a', '<p>Dr. A P J Abdul Kalam</p>', 1392288787),
(141, '2adc22f2070c77ae188e289e5438a632', '<p>India is a Democratic Country ?</p>', 1392288787),
(142, 'c69e19538fdc968007ecef3717207a67', '<p>Network connection lost. (Autosave failed).</p>\n\n<p>Make a note of any responses entered on this page in the last few minutes, then try to re-connect.</p>\n\n<p>Once connection has been re-established, your responses should be saved and this message will disappear.</p>\n', 1392288788),
(143, '17beeb8e1bceb33758e8a94dbdc02f95', '<p>Network connection restored. You may continue safely.</p>\n', 1392288788),
(144, '7673c13234a4cf86410789b83c24fea1', '<p>Dr. Manmohan Singh</p>', 1392288788),
(145, '602ec5592bd153180e0318db492983e8', '<p>Pranab Mukherjee</p>', 1392288788),
(146, '0ad7816c968deae4aee522e0833fd044', '<p>Meira Kumar</p>', 1392288788),
(147, 'ca528b8419bd5529ddcae1c69740f55f', '<p>Dr. A P J Abdul Kalam</p>', 1392288788),
(148, 'af5c2f0e8b171b8f675120a88f159e6c', '<p>You have done a great work</p>', 1392288765),
(149, '299f6b0062b624a9d96f8ee0cf160a01', '<p>Correct </p>', 1392288776),
(150, '8c6c1c956ff9ea395d70b081a74873a0', '<p>Your answer is correct.</p>', 1392288827),
(151, '472c6c87c08b7b02777429cc626ec067', '<p>Hello Students,</p>\r\n<p>Hope you have enjoyed the First Quiz.</p>\r\n<p></p>\r\n<p>Next Quiz coming up on Saturday</p>', 1392183672),
(152, '095c8653214c00bf83ca89c7eb23e6eb', '<p>When players are enabled in these settings, files can be embedded using the media filter (if enabled) or using a File or URL resources with the Embed option. When not enabled, these formats are not embedded and users can manually download or follow links to these resources.</p>\n\n<p>Where two players support the same format, enabling both increases compatibility across different devices such as mobile phones. It is possible to increase compatibility further by providing multiple files in different formats for a single audio or video clip.</p>\n', 1392216359),
(153, '7b15a2f2dff4abf99ca422a1e5cf3fcb', '<div class="no-overflow"><p>Samvidhan Jagran Course</p></div>', 1392304635),
(154, 'e333f6e4bb681f035d363852df140fbb', '<div class="text_to_html">The default category for questions shared in context ''samvidhanj''.</div>', 1392303737),
(155, '9824773f20e544a31c0bd824a00881bc', '<div class="no-overflow"><div class="text_to_html">The default category for questions shared in context ''Miscellaneous''.</div></div>', 1392216483),
(156, '78dca5b91f75c833b1ac7b72a2cdb1f1', '<p>Who is the Chief Minister of Delhi ?</p>', 1392216595),
(157, 'd45313f17735172a667d92c967842cfd', '<p>The assignment activity module enables a teacher to communicate tasks, collect work and provide grades and feedback.</p>\n\n<p>Students can submit any digital content (files), such as word-processed documents, spreadsheets, images, or audio and video clips. Alternatively, or in addition, the assignment may require students to type text directly into the text editor. An assignment can also be used to remind students of ''real-world'' assignments they need to complete offline, such as art work, and thus not require any digital content. Students can submit work individually or as a member of a group.</p>\n\n<p>When reviewing assignments, teachers can leave feedback comments and upload files, such as marked-up student submissions, documents with comments or spoken audio feedback. Assignments can be graded using a numerical or custom scale or an advanced grading method such as a rubric. Final grades are recorded in the gradebook.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/assignment/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/clean/core/1391627044/docs" />More help</a></div>\n', 1392303806),
(158, '2ad9615c62b3ae4e1e9b67cde3ba8a3a', '<p>The chat activity module enables participants to have text-based, real-time synchronous discussions.</p>\n\n<p>The chat may be a one-time activity or it may be repeated at the same time each day or each week. Chat sessions are saved and can be made available for everyone to view or restricted to users with the capability to view chat session logs.</p>\n\n<p>Chats are especially useful when the group chatting is not able to meet face-to-face, such as</p>\n\n<ul><li>Regular meetings of students participating in online courses to enable them to share experiences with others in the same course but in a different location</li>\n<li>A student temporarily unable to attend in person chatting with their teacher to catch up with work</li>\n<li>Students out on work experience getting together to discuss their experiences with each other and their teacher</li>\n<li>Younger children using chat at home in the evenings as a controlled (monitored) introduction to the world of social networking</li>\n<li>A question and answer session with an invited speaker in a different location</li>\n<li>Sessions to help students prepare for tests where the teacher, or other students, would pose sample questions</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/chat/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/clean/core/1391627044/docs" />More help</a></div>\n', 1392303806),
(159, '33c0678c695a95da39111c8aad9f8845', '<p>The choice activity module enables a teacher to ask a single question and offer a selection of possible responses.</p>\n\n<p>Choice results may be published after students have answered, after a certain date, or not at all. Results may be published with student names or anonymously.</p>\n\n<p>A choice activity may be used</p>\n\n<ul><li>As a quick poll to stimulate thinking about a topic</li>\n<li>To quickly test students'' understanding</li>\n<li>To facilitate student decision-making, for example allowing students to vote on a direction for the course</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/choice/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/clean/core/1391627044/docs" />More help</a></div>\n', 1392303807),
(160, 'f8db7c81fa08a3f160b99f9f3dd601cd', '<p>The database activity module enables participants to create, maintain and search a collection of entries (i.e. records).  The structure of the entries is defined by the teacher as a number of fields. Field types include checkbox, radio buttons, dropdown menu, text area, URL, picture and uploaded file.</p>\n\n<p>The visual layout of information when listing, viewing or editing database entries may be controlled by database templates. Database activities may be shared between courses as presets and a teacher may also import and export database entries.</p>\n\n<p>If the database auto-linking filter is enabled, any entries in a database will be automatically linked where the words or phrases appear within the course.</p>\n\n<p>A teacher can allow comments on entries. Entries can also be rated by teachers or students (peer evaluation). Ratings can be aggregated to form a final grade which is recorded in the gradebook.</p>\n\n<p>Database activities have many uses, such as</p>\n\n<ul><li>A collaborative collection of web links, books, book reviews, journal references etc</li>\n<li>For displaying student-created photos, posters, websites or poems for peer comment and review</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/data/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/clean/core/1391627044/docs" />More help</a></div>\n', 1392303807),
(161, '0a733c7ce6e274bf3420fa6ec625b703', '<p>The external tool activity module enables students to interact with learning resources and activities on other web sites. For example, an external tool could provide access to a new activity type or learning materials from a publisher.</p>\n\n<p>To create an external tool activity, a tool provider which supports LTI (Learning Tools Interoperability) is required. A teacher can create an external tool activity or make use of a tool configured by the site administrator.</p>\n\n<p>External tool activities differ from URL resources in a few ways:</p>\n\n<ul><li>External tools are context aware i.e. they have access to information about the user who launched the tool, such as institution, course and name</li>\n<li>External tools support reading, updating, and deleting grades associated with the activity instance</li>\n<li>External tool configurations create a trust relationship between your site and the tool provider, allowing secure communication between them</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/lti/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/clean/core/1391627044/docs" />More help</a></div>\n', 1392303807),
(162, 'b421bb00a96ea8abc9d1364d7c834130', '<p>The forum activity module enables participants to have asynchronous discussions i.e. discussions that take place over an extended period of time.</p>\n\n<p>There are several forum types to choose from, such as a standard forum where anyone can start a new discussion at any time; a forum where each student can post exactly one discussion; or a question and answer forum where students must first post before being able to view other students'' posts. A teacher can allow files to be attached to forum posts. Attached images are displayed in the forum post.</p>\n\n<p>Participants can subscribe to a forum to receive notifications of new forum posts. A teacher can set the subscription mode to optional, forced or auto, or prevent subscription completely. If required, students can be blocked from posting more than a given number of posts in a given time period; this can prevent individuals from dominating discussions.</p>\n\n<p>Forum posts can be rated by teachers or students (peer evaluation). Ratings can be aggregated to form a final grade which is recorded in the gradebook.</p>\n\n<p>Forums have many uses, such as</p>\n\n<ul><li>A social space for students to get to know each other</li>\n<li>For course announcements (using a news forum with forced subscription)</li>\n<li>For discussing course content or reading materials</li>\n<li>For continuing online an issue raised previously in a face-to-face session</li>\n<li>For teacher-only discussions (using a hidden forum)</li>\n<li>A help centre where tutors and students can give advice</li>\n<li>A one-on-one support area for private student-teacher communications (using a forum with separate groups and with one student per group)</li>\n<li>For extension activities, for example ‘brain teasers’ for students to ponder and suggest solutions to</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/forum/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/clean/core/1391627044/docs" />More help</a></div>\n', 1392303807),
(163, '7203b5eb65af60d75774fbe159618d75', '<p>The glossary activity module enables participants to create and maintain a list of definitions, like a dictionary, or to collect and organise resources or information.</p>\n\n<p>A teacher can allow files to be attached to glossary entries. Attached images are displayed in the entry. Entries can be searched or browsed alphabetically or by category, date or author. Entries can be approved by default or require approval by a teacher before they are viewable by everyone.</p>\n\n<p>If the glossary auto-linking filter is enabled, entries will be automatically linked where the concept words and/or phrases appear within the course.</p>\n\n<p>A teacher can allow comments on entries. Entries can also be rated by teachers or students (peer evaluation). Ratings can be aggregated to form a final grade which is recorded in the gradebook.</p>\n\n<p>Glossaries have many uses, such as</p>\n\n<ul><li>A collaborative bank of key terms</li>\n<li>A ‘getting to know you’ space where new students add their name and personal details</li>\n<li>A ‘handy tips’ resource of best practice in a practical subject</li>\n<li>A sharing area of useful videos, images or sound files</li>\n<li>A revision resource of facts to remember</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/glossary/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/clean/core/1391627044/docs" />More help</a></div>\n', 1392303807),
(164, '14d6745f9188adbcc66fca813801f0e8', '<p>The lesson activity module enables a teacher to deliver content and/or practice activities in  interesting and flexible ways. A teacher can use the lesson to create a linear set of content pages or instructional activities that offer a variety of paths or options for the learner. In either case, teachers can choose to increase engagement and ensure understanding by including a variety of questions, such as multiple choice, matching and short answer. Depending on the student''s choice of answer and how the teacher develops the lesson, students may progress to the next page, be taken back to a previous page or redirected down a different path entirely.</p>\n\n<p>A lesson may be graded, with the grade recorded in the gradebook.</p>\n\n<p>Lessons may be used</p>\n\n<ul><li>For self-directed learning of a new topic</li>\n<li>For  scenarios or simulations/decision-making exercises</li>\n<li>For differentiated revision, with different sets of revision questions depending upon answers given to initial questions</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/lesson/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/clean/core/1391627044/docs" />More help</a></div>\n', 1392303807),
(165, '0fe27774487087d169a43309bf3f1b69', '<p>The quiz activity enables a teacher to create quizzes comprising questions of various types, including multiple choice, matching, short-answer and numerical.</p>\n\n<p>The teacher can allow the quiz to be attempted multiple times, with the questions shuffled or randomly selected from the question bank. A time limit may be set.</p>\n\n<p>Each attempt is marked automatically, with the exception of essay questions, and the grade is recorded in the gradebook.</p>\n\n<p>The teacher can choose when and if hints, feedback and correct answers are shown to students.</p>\n\n<p>Quizzes may be used</p>\n\n<ul><li>As course exams</li>\n<li>As mini tests for reading assignments or at the end of a topic</li>\n<li>As exam practice using questions from past exams</li>\n<li>To deliver immediate feedback about performance</li>\n<li>For self-assessment</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/quiz/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/clean/core/1391627044/docs" />More help</a></div>\n', 1392303807),
(166, '573f9c4585ae923880f058220a5738fc', '<p>A SCORM package is a collection of files which are packaged according to an agreed standard for learning objects. The SCORM activity module enables SCORM or AICC packages to be uploaded as a zip file and added to a course.</p>\n\n<p>Content is usually displayed over several pages, with navigation between the pages. There are various options for displaying content in a pop-up window, with a table of contents, with navigation buttons etc. SCORM activities generally include questions, with grades being recorded in the gradebook.</p>\n\n<p>SCORM activities may be used</p>\n\n<ul><li>For presenting multimedia content and animations</li>\n<li>As an assessment tool</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/scorm/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/clean/core/1391627044/docs" />More help</a></div>\n', 1392303807),
(167, 'ad0e40b4407ff5469e6c1dcf2ba09554', '<p>The survey activity module provides a number of verified survey instruments that have been found useful in assessing and stimulating learning in online environments. A teacher can use these to gather data from their students that will help them learn about their class and reflect on their own teaching.</p>\n\n<p>Note that these survey tools are pre-populated with questions. Teachers who wish to create their own survey should use the feedback activity module.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/survey/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/clean/core/1391627044/docs" />More help</a></div>\n', 1392303807);
INSERT INTO `mdl_cache_text` (`id`, `md5key`, `formattedtext`, `timemodified`) VALUES
(168, 'fc42411df6b2cfefc7c0a20cf0945aa1', '<p>The wiki activity module enables participants to add and edit a collection of web pages. A wiki can be collaborative, with everyone being able to edit it, or individual, where everyone has their own wiki which only they can edit.</p>\n\n<p>A history of previous versions of each page in the wiki is kept, listing the edits made by each participant.</p>\n\n<p>Wikis have many uses, such as</p>\n\n<ul><li>For group lecture notes or study guides</li>\n<li>For members of a faculty to plan a scheme of work or meeting agenda together</li>\n<li>For students to collaboratively author an online book, creating content on a topic set by their tutor</li>\n<li>For collaborative storytelling or poetry creation, where each participant writes a line or verse</li>\n<li>As a personal journal for examination notes or revision (using an individual wiki)</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/wiki/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/clean/core/1391627044/docs" />More help</a></div>\n', 1392303807),
(169, 'a2c4449fc4bd9ee5640e9b88b4a9e9a6', '<p>The workshop activity module enables the collection, review and peer assessment of students'' work.</p>\n\n<p>Students can submit any digital content (files), such as word-processed documents or spreadsheets and can also type text directly into a field using the text editor.</p>\n\n<p>Submissions are assessed using a multi-criteria assessment form defined by the teacher. The process of peer assessment and understanding the assessment form can be practised in advance with example submissions provided by the teacher, together with a reference assessment. Students are given the opportunity to assess one or more of their peers'' submissions. Submissions and reviewers may be anonymous if required.</p>\n\n<p>Students obtain two grades in a workshop activity - a grade for their submission and a grade for their assessment of their peers'' submissions. Both grades are recorded in the gradebook.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/workshop/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/clean/core/1391627044/docs" />More help</a></div>\n', 1392303807),
(170, 'c612af3b676d9a9381e65adf2d27ea95', '<p>The book module enables a teacher to create a multi-page resource in a book-like format, with chapters and subchapters. Books can contain media files as well as text and are useful for displaying lengthy passages of information which can be broken down into sections.</p>\n\n<p>A book may be used</p>\n\n<ul><li>To display reading material for individual modules of study</li>\n<li>As a staff departmental handbook</li>\n<li>As a showcase portfolio of student work</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/book/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/clean/core/1391627044/docs" />More help</a></div>\n', 1392303807),
(171, 'f052db50455920fa3f850b5b9fea3942', '<p>The file module enables a teacher to provide a file as a course resource. Where possible, the file will be displayed within the course interface; otherwise students will be prompted to download it. The file may include supporting files, for example an HTML page may have embedded images or Flash objects.</p>\n\n<p>Note that students need to have the appropriate software on their computers in order to open the file.</p>\n\n<p>A file may be used</p>\n\n<ul><li>To share presentations given in class</li>\n<li>To include a mini website as a course resource</li>\n<li>To provide draft files of certain software programs (eg Photoshop .psd) so students can edit and submit them for assessment</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/resource/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/clean/core/1391627044/docs" />More help</a></div>\n', 1392303807),
(172, '9823845ea34307a358684168c9d2b7df', '<p>The folder module enables a teacher to display a number of related files inside a single folder, reducing scrolling on the course page. A zipped folder may be uploaded and unzipped for display, or an empty folder created and files uploaded into it.</p>\n\n<p>A folder may be used</p>\n\n<ul><li>For a series of files on one topic, for example a set of past examination papers in pdf format or a collection of image files for use in student projects</li>\n<li>To provide a shared uploading space for teachers on the course page (keeping the folder hidden so that only teachers can see it)</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/folder/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/clean/core/1391627044/docs" />More help</a></div>\n', 1392303807),
(173, '8c6a601dcdb9a7ff9aa7a5670e1f673d', '<p>An IMS content package is a collection of files which are packaged according to an agreed standard so they can be reused in different systems. The IMS content package module enables such content packages to be uploaded as a zip file and added to a course as a resource.</p>\n\n<p>Content is usually displayed over several pages, with navigation between the pages. There are various options for displaying content in a pop-up window, with a navigation menu or buttons etc.</p>\n\n<p>An IMS content package may be used for presenting multimedia content and animations.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/imscp/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/clean/core/1391627044/docs" />More help</a></div>\n', 1392303807),
(174, '32b0a3858ed17c52771d47cbe11812af', '<p>The label module enables text and multimedia to be inserted into the course page in between links to other resources and activities. Labels are very versatile and can help to improve the appearance of a course if used thoughtfully.</p>\n\n<p>Labels may be used</p>\n\n<ul><li>To split up a long list of activities with a subheading or an image</li>\n<li>To display an embedded sound file or video directly on the course page</li>\n<li>To add a short description to a course section</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/label/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/clean/core/1391627044/docs" />More help</a></div>\n', 1392303807),
(175, '3bb618a2649b5fcc10374993ef4706f8', '<p>The page module enables a teacher to create a web page resource using the text editor. A page can display text, images, sound, video, web links and embedded code, such as Google maps.</p>\n\n<p>Advantages of using the page module rather than the file module include the resource being more accessible (for example to users of mobile devices) and easier to update.</p>\n\n<p>For large amounts of content, it''s recommended that a book is used rather than a page.</p>\n\n<p>A page may be used</p>\n\n<ul><li>To present the terms and conditions of a course or a summary of the course syllabus</li>\n<li>To embed several videos or sound files together with some explanatory text</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/page/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/clean/core/1391627044/docs" />More help</a></div>\n', 1392303807),
(176, '2c6e2f43d78b8d80d90fb46d9543f763', '<p>The URL module enables a teacher to provide a web link as a course resource. Anything that is freely available online, such as documents or images, can be linked to; the URL doesn’t have to be the home page of a website. The URL of a particular web page may be copied and pasted or a teacher can use the file picker and choose a link from a repository such as Flickr, YouTube or Wikimedia (depending upon which repositories are enabled for the site).</p>\n\n<p>There are a number of display options for the URL, such as embedded or opening in a new window and advanced options for passing information, such as a student''s name, to the URL if required.</p>\n\n<p>Note that URLs can also be added to any other resource or activity type through the text editor.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/26/en/mod/url/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle/theme/image.php/clean/core/1391627044/docs" />More help</a></div>\n', 1392303807),
(177, '922cd915593b420630d490f54a518ed1', '<p>Who is the Chief Minister of Delhi ?</p>', 1392315702),
(178, 'b36e87459d8266316fe4bb17c73073c4', '<p>Who is the Chief Minister of Delhi ?</p>', 1392315637),
(179, 'b7ade32eef6a89fa71c5bfa36ec91678', '<p>Sheela Dikshit</p>', 1392315637),
(180, '360ff4a11d058857f9974f2d6e03eb43', '<p>Narendra Modi</p>', 1392315637),
(181, '2f1d1fb9b8af75175045b7424888a40a', '<p>Arvind Kejriwal</p>', 1392315637),
(182, '8508e7f2e244e9808a192364081aafd5', '<p>Somnath Bharti</p>', 1392315637),
(183, '96e203075eb6b1c0cc3ec437d40d843a', '<p>Sheela Dikshit</p>', 1392315702),
(184, '269682291f57c95f8d44bb955051b134', '<p>Narendra Modi</p>', 1392315702),
(185, '1aaed223c5fd622181d9414cb05390e4', '<p>Arvind Kejriwal</p>', 1392315702),
(186, '487fcf155487a9e3eff36d1d25ec0857', '<p>Somnath Bharti</p>', 1392315702),
(187, '11d51ee2e40db420fd1c865e8554f0b6', '<p>Network connection lost. (Autosave failed).</p>\n\n<p>Make a note of any responses entered on this page in the last few minutes, then try to re-connect.</p>\n\n<p>Once connection has been re-established, your responses should be saved and this message will disappear.</p>\n', 1392315638),
(188, '5aa086d447f179d8f8f626a7cad65e56', '<p>Network connection restored. You may continue safely.</p>\n', 1392315638),
(189, 'c49819bef61c17fb833d0210240fddf5', '<p>Your answer is correct.</p>', 1392315697),
(190, 'c8493e91d57e6a60fba95f5dc931fdec', '<p>You have done an Excellent work</p>', 1392303774),
(191, 'ac21645fc9650ffa9ddbf41b4df0cc75', '<p>Your answer is incorrect.</p>', 1392303948);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_capabilities`
--

CREATE TABLE IF NOT EXISTS `mdl_capabilities` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `captype` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextlevel` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `riskbitmask` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_capa_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='this defines all capabilities' AUTO_INCREMENT=500 ;

--
-- Dumping data for table `mdl_capabilities`
--

INSERT INTO `mdl_capabilities` (`id`, `name`, `captype`, `contextlevel`, `component`, `riskbitmask`) VALUES
(1, 'moodle/site:config', 'write', 10, 'moodle', 62),
(2, 'moodle/site:readallmessages', 'read', 10, 'moodle', 8),
(3, 'moodle/site:sendmessage', 'write', 10, 'moodle', 16),
(4, 'moodle/site:approvecourse', 'write', 10, 'moodle', 4),
(5, 'moodle/backup:backupcourse', 'write', 50, 'moodle', 28),
(6, 'moodle/backup:backupsection', 'write', 50, 'moodle', 28),
(7, 'moodle/backup:backupactivity', 'write', 70, 'moodle', 28),
(8, 'moodle/backup:backuptargethub', 'write', 50, 'moodle', 28),
(9, 'moodle/backup:backuptargetimport', 'write', 50, 'moodle', 28),
(10, 'moodle/backup:downloadfile', 'write', 50, 'moodle', 28),
(11, 'moodle/backup:configure', 'write', 50, 'moodle', 28),
(12, 'moodle/backup:userinfo', 'read', 50, 'moodle', 8),
(13, 'moodle/backup:anonymise', 'read', 50, 'moodle', 8),
(14, 'moodle/restore:restorecourse', 'write', 50, 'moodle', 28),
(15, 'moodle/restore:restoresection', 'write', 50, 'moodle', 28),
(16, 'moodle/restore:restoreactivity', 'write', 50, 'moodle', 28),
(17, 'moodle/restore:viewautomatedfilearea', 'write', 50, 'moodle', 28),
(18, 'moodle/restore:restoretargethub', 'write', 50, 'moodle', 28),
(19, 'moodle/restore:restoretargetimport', 'write', 50, 'moodle', 28),
(20, 'moodle/restore:uploadfile', 'write', 50, 'moodle', 28),
(21, 'moodle/restore:configure', 'write', 50, 'moodle', 28),
(22, 'moodle/restore:rolldates', 'write', 50, 'moodle', 0),
(23, 'moodle/restore:userinfo', 'write', 50, 'moodle', 30),
(24, 'moodle/restore:createuser', 'write', 10, 'moodle', 24),
(25, 'moodle/site:manageblocks', 'write', 80, 'moodle', 20),
(26, 'moodle/site:accessallgroups', 'read', 50, 'moodle', 0),
(27, 'moodle/site:viewfullnames', 'read', 50, 'moodle', 0),
(28, 'moodle/site:viewuseridentity', 'read', 50, 'moodle', 0),
(29, 'moodle/site:viewreports', 'read', 50, 'moodle', 8),
(30, 'moodle/site:trustcontent', 'write', 50, 'moodle', 4),
(31, 'moodle/site:uploadusers', 'write', 10, 'moodle', 24),
(32, 'moodle/filter:manage', 'write', 50, 'moodle', 0),
(33, 'moodle/user:create', 'write', 10, 'moodle', 24),
(34, 'moodle/user:delete', 'write', 10, 'moodle', 8),
(35, 'moodle/user:update', 'write', 10, 'moodle', 24),
(36, 'moodle/user:viewdetails', 'read', 50, 'moodle', 0),
(37, 'moodle/user:viewalldetails', 'read', 30, 'moodle', 8),
(38, 'moodle/user:viewhiddendetails', 'read', 50, 'moodle', 8),
(39, 'moodle/user:loginas', 'write', 50, 'moodle', 30),
(40, 'moodle/user:managesyspages', 'write', 10, 'moodle', 0),
(41, 'moodle/user:manageblocks', 'write', 30, 'moodle', 0),
(42, 'moodle/user:manageownblocks', 'write', 10, 'moodle', 0),
(43, 'moodle/user:manageownfiles', 'write', 10, 'moodle', 0),
(44, 'moodle/user:ignoreuserquota', 'write', 10, 'moodle', 0),
(45, 'moodle/my:configsyspages', 'write', 10, 'moodle', 0),
(46, 'moodle/role:assign', 'write', 50, 'moodle', 28),
(47, 'moodle/role:review', 'read', 50, 'moodle', 8),
(48, 'moodle/role:override', 'write', 50, 'moodle', 28),
(49, 'moodle/role:safeoverride', 'write', 50, 'moodle', 16),
(50, 'moodle/role:manage', 'write', 10, 'moodle', 28),
(51, 'moodle/role:switchroles', 'read', 50, 'moodle', 12),
(52, 'moodle/category:manage', 'write', 40, 'moodle', 4),
(53, 'moodle/category:viewhiddencategories', 'read', 40, 'moodle', 0),
(54, 'moodle/cohort:manage', 'write', 40, 'moodle', 0),
(55, 'moodle/cohort:assign', 'write', 40, 'moodle', 0),
(56, 'moodle/cohort:view', 'read', 50, 'moodle', 0),
(57, 'moodle/course:create', 'write', 40, 'moodle', 4),
(58, 'moodle/course:request', 'write', 10, 'moodle', 0),
(59, 'moodle/course:delete', 'write', 50, 'moodle', 32),
(60, 'moodle/course:update', 'write', 50, 'moodle', 4),
(61, 'moodle/course:view', 'read', 50, 'moodle', 0),
(62, 'moodle/course:enrolreview', 'read', 50, 'moodle', 8),
(63, 'moodle/course:enrolconfig', 'write', 50, 'moodle', 8),
(64, 'moodle/course:bulkmessaging', 'write', 50, 'moodle', 16),
(65, 'moodle/course:viewhiddenuserfields', 'read', 50, 'moodle', 8),
(66, 'moodle/course:viewhiddencourses', 'read', 50, 'moodle', 0),
(67, 'moodle/course:visibility', 'write', 50, 'moodle', 0),
(68, 'moodle/course:managefiles', 'write', 50, 'moodle', 4),
(69, 'moodle/course:ignorefilesizelimits', 'write', 50, 'moodle', 0),
(70, 'moodle/course:manageactivities', 'write', 70, 'moodle', 4),
(71, 'moodle/course:activityvisibility', 'write', 70, 'moodle', 0),
(72, 'moodle/course:viewhiddenactivities', 'write', 70, 'moodle', 0),
(73, 'moodle/course:viewparticipants', 'read', 50, 'moodle', 0),
(74, 'moodle/course:changefullname', 'write', 50, 'moodle', 4),
(75, 'moodle/course:changeshortname', 'write', 50, 'moodle', 4),
(76, 'moodle/course:changeidnumber', 'write', 50, 'moodle', 4),
(77, 'moodle/course:changecategory', 'write', 50, 'moodle', 4),
(78, 'moodle/course:changesummary', 'write', 50, 'moodle', 4),
(79, 'moodle/site:viewparticipants', 'read', 10, 'moodle', 0),
(80, 'moodle/course:isincompletionreports', 'read', 50, 'moodle', 0),
(81, 'moodle/course:viewscales', 'read', 50, 'moodle', 0),
(82, 'moodle/course:managescales', 'write', 50, 'moodle', 0),
(83, 'moodle/course:managegroups', 'write', 50, 'moodle', 0),
(84, 'moodle/course:reset', 'write', 50, 'moodle', 32),
(85, 'moodle/course:viewsuspendedusers', 'read', 10, 'moodle', 0),
(86, 'moodle/blog:view', 'read', 10, 'moodle', 0),
(87, 'moodle/blog:search', 'read', 10, 'moodle', 0),
(88, 'moodle/blog:viewdrafts', 'read', 10, 'moodle', 8),
(89, 'moodle/blog:create', 'write', 10, 'moodle', 16),
(90, 'moodle/blog:manageentries', 'write', 10, 'moodle', 16),
(91, 'moodle/blog:manageexternal', 'write', 10, 'moodle', 16),
(92, 'moodle/blog:associatecourse', 'write', 50, 'moodle', 0),
(93, 'moodle/blog:associatemodule', 'write', 70, 'moodle', 0),
(94, 'moodle/calendar:manageownentries', 'write', 50, 'moodle', 16),
(95, 'moodle/calendar:managegroupentries', 'write', 50, 'moodle', 16),
(96, 'moodle/calendar:manageentries', 'write', 50, 'moodle', 16),
(97, 'moodle/user:editprofile', 'write', 30, 'moodle', 24),
(98, 'moodle/user:editownprofile', 'write', 10, 'moodle', 16),
(99, 'moodle/user:changeownpassword', 'write', 10, 'moodle', 0),
(100, 'moodle/user:readuserposts', 'read', 30, 'moodle', 0),
(101, 'moodle/user:readuserblogs', 'read', 30, 'moodle', 0),
(102, 'moodle/user:viewuseractivitiesreport', 'read', 30, 'moodle', 8),
(103, 'moodle/user:editmessageprofile', 'write', 30, 'moodle', 16),
(104, 'moodle/user:editownmessageprofile', 'write', 10, 'moodle', 0),
(105, 'moodle/question:managecategory', 'write', 50, 'moodle', 20),
(106, 'moodle/question:add', 'write', 50, 'moodle', 20),
(107, 'moodle/question:editmine', 'write', 50, 'moodle', 20),
(108, 'moodle/question:editall', 'write', 50, 'moodle', 20),
(109, 'moodle/question:viewmine', 'read', 50, 'moodle', 0),
(110, 'moodle/question:viewall', 'read', 50, 'moodle', 0),
(111, 'moodle/question:usemine', 'read', 50, 'moodle', 0),
(112, 'moodle/question:useall', 'read', 50, 'moodle', 0),
(113, 'moodle/question:movemine', 'write', 50, 'moodle', 0),
(114, 'moodle/question:moveall', 'write', 50, 'moodle', 0),
(115, 'moodle/question:config', 'write', 10, 'moodle', 2),
(116, 'moodle/question:flag', 'write', 50, 'moodle', 0),
(117, 'moodle/site:doclinks', 'read', 10, 'moodle', 0),
(118, 'moodle/course:sectionvisibility', 'write', 50, 'moodle', 0),
(119, 'moodle/course:useremail', 'write', 50, 'moodle', 0),
(120, 'moodle/course:viewhiddensections', 'write', 50, 'moodle', 0),
(121, 'moodle/course:setcurrentsection', 'write', 50, 'moodle', 0),
(122, 'moodle/course:movesections', 'write', 50, 'moodle', 0),
(123, 'moodle/site:mnetlogintoremote', 'read', 10, 'moodle', 0),
(124, 'moodle/grade:viewall', 'read', 50, 'moodle', 8),
(125, 'moodle/grade:view', 'read', 50, 'moodle', 0),
(126, 'moodle/grade:viewhidden', 'read', 50, 'moodle', 8),
(127, 'moodle/grade:import', 'write', 50, 'moodle', 12),
(128, 'moodle/grade:export', 'read', 50, 'moodle', 8),
(129, 'moodle/grade:manage', 'write', 50, 'moodle', 12),
(130, 'moodle/grade:edit', 'write', 50, 'moodle', 12),
(131, 'moodle/grade:managegradingforms', 'write', 50, 'moodle', 12),
(132, 'moodle/grade:sharegradingforms', 'write', 10, 'moodle', 4),
(133, 'moodle/grade:managesharedforms', 'write', 10, 'moodle', 4),
(134, 'moodle/grade:manageoutcomes', 'write', 50, 'moodle', 0),
(135, 'moodle/grade:manageletters', 'write', 50, 'moodle', 0),
(136, 'moodle/grade:hide', 'write', 50, 'moodle', 0),
(137, 'moodle/grade:lock', 'write', 50, 'moodle', 0),
(138, 'moodle/grade:unlock', 'write', 50, 'moodle', 0),
(139, 'moodle/my:manageblocks', 'write', 10, 'moodle', 0),
(140, 'moodle/notes:view', 'read', 50, 'moodle', 0),
(141, 'moodle/notes:manage', 'write', 50, 'moodle', 16),
(142, 'moodle/tag:manage', 'write', 10, 'moodle', 16),
(143, 'moodle/tag:create', 'write', 10, 'moodle', 16),
(144, 'moodle/tag:edit', 'write', 10, 'moodle', 16),
(145, 'moodle/tag:flag', 'write', 10, 'moodle', 16),
(146, 'moodle/tag:editblocks', 'write', 10, 'moodle', 0),
(147, 'moodle/block:view', 'read', 80, 'moodle', 0),
(148, 'moodle/block:edit', 'write', 80, 'moodle', 20),
(149, 'moodle/portfolio:export', 'read', 10, 'moodle', 0),
(150, 'moodle/comment:view', 'read', 50, 'moodle', 0),
(151, 'moodle/comment:post', 'write', 50, 'moodle', 24),
(152, 'moodle/comment:delete', 'write', 50, 'moodle', 32),
(153, 'moodle/webservice:createtoken', 'write', 10, 'moodle', 62),
(154, 'moodle/webservice:createmobiletoken', 'write', 10, 'moodle', 24),
(155, 'moodle/rating:view', 'read', 50, 'moodle', 0),
(156, 'moodle/rating:viewany', 'read', 50, 'moodle', 8),
(157, 'moodle/rating:viewall', 'read', 50, 'moodle', 8),
(158, 'moodle/rating:rate', 'write', 50, 'moodle', 0),
(159, 'moodle/course:publish', 'write', 10, 'moodle', 24),
(160, 'moodle/course:markcomplete', 'write', 50, 'moodle', 0),
(161, 'moodle/community:add', 'write', 10, 'moodle', 0),
(162, 'moodle/community:download', 'write', 10, 'moodle', 0),
(163, 'moodle/badges:manageglobalsettings', 'write', 10, 'moodle', 34),
(164, 'moodle/badges:viewbadges', 'read', 50, 'moodle', 0),
(165, 'moodle/badges:manageownbadges', 'write', 30, 'moodle', 0),
(166, 'moodle/badges:viewotherbadges', 'read', 30, 'moodle', 0),
(167, 'moodle/badges:earnbadge', 'write', 50, 'moodle', 0),
(168, 'moodle/badges:createbadge', 'write', 50, 'moodle', 16),
(169, 'moodle/badges:deletebadge', 'write', 50, 'moodle', 32),
(170, 'moodle/badges:configuredetails', 'write', 50, 'moodle', 16),
(171, 'moodle/badges:configurecriteria', 'write', 50, 'moodle', 0),
(172, 'moodle/badges:configuremessages', 'write', 50, 'moodle', 16),
(173, 'moodle/badges:awardbadge', 'write', 50, 'moodle', 16),
(174, 'moodle/badges:viewawarded', 'read', 50, 'moodle', 8),
(175, 'mod/assign:view', 'read', 70, 'mod_assign', 0),
(176, 'mod/assign:submit', 'write', 70, 'mod_assign', 0),
(177, 'mod/assign:grade', 'write', 70, 'mod_assign', 4),
(178, 'mod/assign:exportownsubmission', 'read', 70, 'mod_assign', 0),
(179, 'mod/assign:addinstance', 'write', 50, 'mod_assign', 4),
(180, 'mod/assign:grantextension', 'write', 70, 'mod_assign', 0),
(181, 'mod/assign:revealidentities', 'write', 70, 'mod_assign', 0),
(182, 'mod/assign:reviewgrades', 'write', 70, 'mod_assign', 0),
(183, 'mod/assign:releasegrades', 'write', 70, 'mod_assign', 0),
(184, 'mod/assign:managegrades', 'write', 70, 'mod_assign', 0),
(185, 'mod/assign:manageallocations', 'write', 70, 'mod_assign', 0),
(186, 'mod/assignment:view', 'read', 70, 'mod_assignment', 0),
(187, 'mod/assignment:addinstance', 'write', 50, 'mod_assignment', 4),
(188, 'mod/assignment:submit', 'write', 70, 'mod_assignment', 0),
(189, 'mod/assignment:grade', 'write', 70, 'mod_assignment', 4),
(190, 'mod/assignment:exportownsubmission', 'read', 70, 'mod_assignment', 0),
(191, 'mod/book:addinstance', 'write', 50, 'mod_book', 4),
(192, 'mod/book:read', 'read', 70, 'mod_book', 0),
(193, 'mod/book:viewhiddenchapters', 'read', 70, 'mod_book', 0),
(194, 'mod/book:edit', 'write', 70, 'mod_book', 4),
(195, 'mod/chat:addinstance', 'write', 50, 'mod_chat', 4),
(196, 'mod/chat:chat', 'write', 70, 'mod_chat', 16),
(197, 'mod/chat:readlog', 'read', 70, 'mod_chat', 0),
(198, 'mod/chat:deletelog', 'write', 70, 'mod_chat', 0),
(199, 'mod/chat:exportparticipatedsession', 'read', 70, 'mod_chat', 8),
(200, 'mod/chat:exportsession', 'read', 70, 'mod_chat', 8),
(201, 'mod/choice:addinstance', 'write', 50, 'mod_choice', 4),
(202, 'mod/choice:choose', 'write', 70, 'mod_choice', 0),
(203, 'mod/choice:readresponses', 'read', 70, 'mod_choice', 0),
(204, 'mod/choice:deleteresponses', 'write', 70, 'mod_choice', 0),
(205, 'mod/choice:downloadresponses', 'read', 70, 'mod_choice', 0),
(206, 'mod/data:addinstance', 'write', 50, 'mod_data', 4),
(207, 'mod/data:viewentry', 'read', 70, 'mod_data', 0),
(208, 'mod/data:writeentry', 'write', 70, 'mod_data', 16),
(209, 'mod/data:comment', 'write', 70, 'mod_data', 16),
(210, 'mod/data:rate', 'write', 70, 'mod_data', 0),
(211, 'mod/data:viewrating', 'read', 70, 'mod_data', 0),
(212, 'mod/data:viewanyrating', 'read', 70, 'mod_data', 8),
(213, 'mod/data:viewallratings', 'read', 70, 'mod_data', 8),
(214, 'mod/data:approve', 'write', 70, 'mod_data', 16),
(215, 'mod/data:manageentries', 'write', 70, 'mod_data', 16),
(216, 'mod/data:managecomments', 'write', 70, 'mod_data', 16),
(217, 'mod/data:managetemplates', 'write', 70, 'mod_data', 20),
(218, 'mod/data:viewalluserpresets', 'read', 70, 'mod_data', 0),
(219, 'mod/data:manageuserpresets', 'write', 70, 'mod_data', 20),
(220, 'mod/data:exportentry', 'read', 70, 'mod_data', 8),
(221, 'mod/data:exportownentry', 'read', 70, 'mod_data', 0),
(222, 'mod/data:exportallentries', 'read', 70, 'mod_data', 8),
(223, 'mod/data:exportuserinfo', 'read', 70, 'mod_data', 8),
(224, 'mod/feedback:addinstance', 'write', 50, 'mod_feedback', 4),
(225, 'mod/feedback:view', 'read', 70, 'mod_feedback', 0),
(226, 'mod/feedback:complete', 'write', 70, 'mod_feedback', 16),
(227, 'mod/feedback:viewanalysepage', 'read', 70, 'mod_feedback', 8),
(228, 'mod/feedback:deletesubmissions', 'write', 70, 'mod_feedback', 0),
(229, 'mod/feedback:mapcourse', 'write', 70, 'mod_feedback', 0),
(230, 'mod/feedback:edititems', 'write', 70, 'mod_feedback', 20),
(231, 'mod/feedback:createprivatetemplate', 'write', 70, 'mod_feedback', 16),
(232, 'mod/feedback:createpublictemplate', 'write', 70, 'mod_feedback', 16),
(233, 'mod/feedback:deletetemplate', 'write', 70, 'mod_feedback', 0),
(234, 'mod/feedback:viewreports', 'read', 70, 'mod_feedback', 8),
(235, 'mod/feedback:receivemail', 'read', 70, 'mod_feedback', 8),
(236, 'mod/folder:addinstance', 'write', 50, 'mod_folder', 4),
(237, 'mod/folder:view', 'read', 70, 'mod_folder', 0),
(238, 'mod/folder:managefiles', 'write', 70, 'mod_folder', 16),
(239, 'mod/forum:addinstance', 'write', 50, 'mod_forum', 4),
(240, 'mod/forum:viewdiscussion', 'read', 70, 'mod_forum', 0),
(241, 'mod/forum:viewhiddentimedposts', 'read', 70, 'mod_forum', 0),
(242, 'mod/forum:startdiscussion', 'write', 70, 'mod_forum', 16),
(243, 'mod/forum:replypost', 'write', 70, 'mod_forum', 16),
(244, 'mod/forum:addnews', 'write', 70, 'mod_forum', 16),
(245, 'mod/forum:replynews', 'write', 70, 'mod_forum', 16),
(246, 'mod/forum:viewrating', 'read', 70, 'mod_forum', 0),
(247, 'mod/forum:viewanyrating', 'read', 70, 'mod_forum', 8),
(248, 'mod/forum:viewallratings', 'read', 70, 'mod_forum', 8),
(249, 'mod/forum:rate', 'write', 70, 'mod_forum', 0),
(250, 'mod/forum:createattachment', 'write', 70, 'mod_forum', 16),
(251, 'mod/forum:deleteownpost', 'read', 70, 'mod_forum', 0),
(252, 'mod/forum:deleteanypost', 'read', 70, 'mod_forum', 0),
(253, 'mod/forum:splitdiscussions', 'read', 70, 'mod_forum', 0),
(254, 'mod/forum:movediscussions', 'read', 70, 'mod_forum', 0),
(255, 'mod/forum:editanypost', 'write', 70, 'mod_forum', 16),
(256, 'mod/forum:viewqandawithoutposting', 'read', 70, 'mod_forum', 0),
(257, 'mod/forum:viewsubscribers', 'read', 70, 'mod_forum', 0),
(258, 'mod/forum:managesubscriptions', 'read', 70, 'mod_forum', 16),
(259, 'mod/forum:postwithoutthrottling', 'write', 70, 'mod_forum', 16),
(260, 'mod/forum:exportdiscussion', 'read', 70, 'mod_forum', 8),
(261, 'mod/forum:exportpost', 'read', 70, 'mod_forum', 8),
(262, 'mod/forum:exportownpost', 'read', 70, 'mod_forum', 8),
(263, 'mod/forum:addquestion', 'write', 70, 'mod_forum', 16),
(264, 'mod/forum:allowforcesubscribe', 'read', 70, 'mod_forum', 0),
(265, 'mod/glossary:addinstance', 'write', 50, 'mod_glossary', 4),
(266, 'mod/glossary:view', 'read', 70, 'mod_glossary', 0),
(267, 'mod/glossary:write', 'write', 70, 'mod_glossary', 16),
(268, 'mod/glossary:manageentries', 'write', 70, 'mod_glossary', 16),
(269, 'mod/glossary:managecategories', 'write', 70, 'mod_glossary', 16),
(270, 'mod/glossary:comment', 'write', 70, 'mod_glossary', 16),
(271, 'mod/glossary:managecomments', 'write', 70, 'mod_glossary', 16),
(272, 'mod/glossary:import', 'write', 70, 'mod_glossary', 16),
(273, 'mod/glossary:export', 'read', 70, 'mod_glossary', 0),
(274, 'mod/glossary:approve', 'write', 70, 'mod_glossary', 16),
(275, 'mod/glossary:rate', 'write', 70, 'mod_glossary', 0),
(276, 'mod/glossary:viewrating', 'read', 70, 'mod_glossary', 0),
(277, 'mod/glossary:viewanyrating', 'read', 70, 'mod_glossary', 8),
(278, 'mod/glossary:viewallratings', 'read', 70, 'mod_glossary', 8),
(279, 'mod/glossary:exportentry', 'read', 70, 'mod_glossary', 8),
(280, 'mod/glossary:exportownentry', 'read', 70, 'mod_glossary', 0),
(281, 'mod/imscp:view', 'read', 70, 'mod_imscp', 0),
(282, 'mod/imscp:addinstance', 'write', 50, 'mod_imscp', 4),
(283, 'mod/label:addinstance', 'write', 50, 'mod_label', 4),
(284, 'mod/lesson:addinstance', 'write', 50, 'mod_lesson', 4),
(285, 'mod/lesson:edit', 'write', 70, 'mod_lesson', 4),
(286, 'mod/lesson:manage', 'write', 70, 'mod_lesson', 0),
(287, 'mod/lti:view', 'read', 70, 'mod_lti', 0),
(288, 'mod/lti:addinstance', 'write', 50, 'mod_lti', 4),
(289, 'mod/lti:grade', 'write', 70, 'mod_lti', 8),
(290, 'mod/lti:manage', 'write', 70, 'mod_lti', 8),
(291, 'mod/lti:addcoursetool', 'write', 50, 'mod_lti', 0),
(292, 'mod/lti:requesttooladd', 'write', 50, 'mod_lti', 0),
(293, 'mod/page:view', 'read', 70, 'mod_page', 0),
(294, 'mod/page:addinstance', 'write', 50, 'mod_page', 4),
(295, 'mod/quiz:view', 'read', 70, 'mod_quiz', 0),
(296, 'mod/quiz:addinstance', 'write', 50, 'mod_quiz', 4),
(297, 'mod/quiz:attempt', 'write', 70, 'mod_quiz', 16),
(298, 'mod/quiz:reviewmyattempts', 'read', 70, 'mod_quiz', 0),
(299, 'mod/quiz:manage', 'write', 70, 'mod_quiz', 16),
(300, 'mod/quiz:manageoverrides', 'write', 70, 'mod_quiz', 0),
(301, 'mod/quiz:preview', 'write', 70, 'mod_quiz', 0),
(302, 'mod/quiz:grade', 'write', 70, 'mod_quiz', 16),
(303, 'mod/quiz:regrade', 'write', 70, 'mod_quiz', 16),
(304, 'mod/quiz:viewreports', 'read', 70, 'mod_quiz', 8),
(305, 'mod/quiz:deleteattempts', 'write', 70, 'mod_quiz', 32),
(306, 'mod/quiz:ignoretimelimits', 'read', 70, 'mod_quiz', 0),
(307, 'mod/quiz:emailconfirmsubmission', 'read', 70, 'mod_quiz', 0),
(308, 'mod/quiz:emailnotifysubmission', 'read', 70, 'mod_quiz', 0),
(309, 'mod/quiz:emailwarnoverdue', 'read', 70, 'mod_quiz', 0),
(310, 'mod/resource:view', 'read', 70, 'mod_resource', 0),
(311, 'mod/resource:addinstance', 'write', 50, 'mod_resource', 4),
(312, 'mod/scorm:addinstance', 'write', 50, 'mod_scorm', 4),
(313, 'mod/scorm:viewreport', 'read', 70, 'mod_scorm', 0),
(314, 'mod/scorm:skipview', 'write', 70, 'mod_scorm', 0),
(315, 'mod/scorm:savetrack', 'write', 70, 'mod_scorm', 0),
(316, 'mod/scorm:viewscores', 'read', 70, 'mod_scorm', 0),
(317, 'mod/scorm:deleteresponses', 'read', 70, 'mod_scorm', 0),
(318, 'mod/scorm:deleteownresponses', 'write', 70, 'mod_scorm', 0),
(319, 'mod/survey:addinstance', 'write', 50, 'mod_survey', 4),
(320, 'mod/survey:participate', 'read', 70, 'mod_survey', 0),
(321, 'mod/survey:readresponses', 'read', 70, 'mod_survey', 0),
(322, 'mod/survey:download', 'read', 70, 'mod_survey', 0),
(323, 'mod/url:view', 'read', 70, 'mod_url', 0),
(324, 'mod/url:addinstance', 'write', 50, 'mod_url', 4),
(325, 'mod/wiki:addinstance', 'write', 50, 'mod_wiki', 4),
(326, 'mod/wiki:viewpage', 'read', 70, 'mod_wiki', 0),
(327, 'mod/wiki:editpage', 'write', 70, 'mod_wiki', 16),
(328, 'mod/wiki:createpage', 'write', 70, 'mod_wiki', 16),
(329, 'mod/wiki:viewcomment', 'read', 70, 'mod_wiki', 0),
(330, 'mod/wiki:editcomment', 'write', 70, 'mod_wiki', 16),
(331, 'mod/wiki:managecomment', 'write', 70, 'mod_wiki', 0),
(332, 'mod/wiki:managefiles', 'write', 70, 'mod_wiki', 0),
(333, 'mod/wiki:overridelock', 'write', 70, 'mod_wiki', 0),
(334, 'mod/wiki:managewiki', 'write', 70, 'mod_wiki', 0),
(335, 'mod/workshop:view', 'read', 70, 'mod_workshop', 0),
(336, 'mod/workshop:addinstance', 'write', 50, 'mod_workshop', 4),
(337, 'mod/workshop:switchphase', 'write', 70, 'mod_workshop', 0),
(338, 'mod/workshop:editdimensions', 'write', 70, 'mod_workshop', 4),
(339, 'mod/workshop:submit', 'write', 70, 'mod_workshop', 0),
(340, 'mod/workshop:peerassess', 'write', 70, 'mod_workshop', 0),
(341, 'mod/workshop:manageexamples', 'write', 70, 'mod_workshop', 0),
(342, 'mod/workshop:allocate', 'write', 70, 'mod_workshop', 0),
(343, 'mod/workshop:publishsubmissions', 'write', 70, 'mod_workshop', 0),
(344, 'mod/workshop:viewauthornames', 'read', 70, 'mod_workshop', 0),
(345, 'mod/workshop:viewreviewernames', 'read', 70, 'mod_workshop', 0),
(346, 'mod/workshop:viewallsubmissions', 'read', 70, 'mod_workshop', 0),
(347, 'mod/workshop:viewpublishedsubmissions', 'read', 70, 'mod_workshop', 0),
(348, 'mod/workshop:viewauthorpublished', 'read', 70, 'mod_workshop', 0),
(349, 'mod/workshop:viewallassessments', 'read', 70, 'mod_workshop', 0),
(350, 'mod/workshop:overridegrades', 'write', 70, 'mod_workshop', 0),
(351, 'mod/workshop:ignoredeadlines', 'write', 70, 'mod_workshop', 0),
(352, 'enrol/category:synchronised', 'write', 10, 'enrol_category', 0),
(353, 'enrol/cohort:config', 'write', 50, 'enrol_cohort', 0),
(354, 'enrol/cohort:unenrol', 'write', 50, 'enrol_cohort', 0),
(355, 'enrol/database:unenrol', 'write', 50, 'enrol_database', 0),
(356, 'enrol/flatfile:manage', 'write', 50, 'enrol_flatfile', 0),
(357, 'enrol/flatfile:unenrol', 'write', 50, 'enrol_flatfile', 0),
(358, 'enrol/guest:config', 'write', 50, 'enrol_guest', 0),
(359, 'enrol/ldap:manage', 'write', 50, 'enrol_ldap', 0),
(360, 'enrol/manual:config', 'write', 50, 'enrol_manual', 0),
(361, 'enrol/manual:enrol', 'write', 50, 'enrol_manual', 0),
(362, 'enrol/manual:manage', 'write', 50, 'enrol_manual', 0),
(363, 'enrol/manual:unenrol', 'write', 50, 'enrol_manual', 0),
(364, 'enrol/manual:unenrolself', 'write', 50, 'enrol_manual', 0),
(365, 'enrol/meta:config', 'write', 50, 'enrol_meta', 0),
(366, 'enrol/meta:selectaslinked', 'read', 50, 'enrol_meta', 0),
(367, 'enrol/meta:unenrol', 'write', 50, 'enrol_meta', 0),
(368, 'enrol/paypal:config', 'write', 50, 'enrol_paypal', 0),
(369, 'enrol/paypal:manage', 'write', 50, 'enrol_paypal', 0),
(370, 'enrol/paypal:unenrol', 'write', 50, 'enrol_paypal', 0),
(371, 'enrol/paypal:unenrolself', 'write', 50, 'enrol_paypal', 0),
(372, 'enrol/self:config', 'write', 50, 'enrol_self', 0),
(373, 'enrol/self:manage', 'write', 50, 'enrol_self', 0),
(374, 'enrol/self:unenrolself', 'write', 50, 'enrol_self', 0),
(375, 'enrol/self:unenrol', 'write', 50, 'enrol_self', 0),
(376, 'block/activity_modules:addinstance', 'write', 80, 'block_activity_modules', 20),
(377, 'block/admin_bookmarks:myaddinstance', 'write', 10, 'block_admin_bookmarks', 0),
(378, 'block/admin_bookmarks:addinstance', 'write', 80, 'block_admin_bookmarks', 20),
(379, 'block/badges:addinstance', 'read', 80, 'block_badges', 0),
(380, 'block/badges:myaddinstance', 'read', 10, 'block_badges', 8),
(381, 'block/blog_menu:addinstance', 'write', 80, 'block_blog_menu', 20),
(382, 'block/blog_recent:addinstance', 'write', 80, 'block_blog_recent', 20),
(383, 'block/blog_tags:addinstance', 'write', 80, 'block_blog_tags', 20),
(384, 'block/calendar_month:myaddinstance', 'write', 10, 'block_calendar_month', 0),
(385, 'block/calendar_month:addinstance', 'write', 80, 'block_calendar_month', 20),
(386, 'block/calendar_upcoming:myaddinstance', 'write', 10, 'block_calendar_upcoming', 0),
(387, 'block/calendar_upcoming:addinstance', 'write', 80, 'block_calendar_upcoming', 20),
(388, 'block/comments:myaddinstance', 'write', 10, 'block_comments', 0),
(389, 'block/comments:addinstance', 'write', 80, 'block_comments', 20),
(390, 'block/community:myaddinstance', 'write', 10, 'block_community', 0),
(391, 'block/community:addinstance', 'write', 80, 'block_community', 20),
(392, 'block/completionstatus:addinstance', 'write', 80, 'block_completionstatus', 20),
(393, 'block/course_list:myaddinstance', 'write', 10, 'block_course_list', 0),
(394, 'block/course_list:addinstance', 'write', 80, 'block_course_list', 20),
(395, 'block/course_overview:myaddinstance', 'write', 10, 'block_course_overview', 0),
(396, 'block/course_overview:addinstance', 'write', 80, 'block_course_overview', 20),
(397, 'block/course_summary:addinstance', 'write', 80, 'block_course_summary', 20),
(398, 'block/feedback:addinstance', 'write', 80, 'block_feedback', 20),
(399, 'block/glossary_random:myaddinstance', 'write', 10, 'block_glossary_random', 0),
(400, 'block/glossary_random:addinstance', 'write', 80, 'block_glossary_random', 20),
(401, 'block/html:myaddinstance', 'write', 10, 'block_html', 0),
(402, 'block/html:addinstance', 'write', 80, 'block_html', 20),
(403, 'block/login:addinstance', 'write', 80, 'block_login', 20),
(404, 'block/mentees:myaddinstance', 'write', 10, 'block_mentees', 0),
(405, 'block/mentees:addinstance', 'write', 80, 'block_mentees', 20),
(406, 'block/messages:myaddinstance', 'write', 10, 'block_messages', 0),
(407, 'block/messages:addinstance', 'write', 80, 'block_messages', 20),
(408, 'block/mnet_hosts:myaddinstance', 'write', 10, 'block_mnet_hosts', 0),
(409, 'block/mnet_hosts:addinstance', 'write', 80, 'block_mnet_hosts', 20),
(410, 'block/myprofile:myaddinstance', 'write', 10, 'block_myprofile', 0),
(411, 'block/myprofile:addinstance', 'write', 80, 'block_myprofile', 20),
(412, 'block/navigation:myaddinstance', 'write', 10, 'block_navigation', 0),
(413, 'block/navigation:addinstance', 'write', 80, 'block_navigation', 20),
(414, 'block/news_items:myaddinstance', 'write', 10, 'block_news_items', 0),
(415, 'block/news_items:addinstance', 'write', 80, 'block_news_items', 20),
(416, 'block/online_users:myaddinstance', 'write', 10, 'block_online_users', 0),
(417, 'block/online_users:addinstance', 'write', 80, 'block_online_users', 20),
(418, 'block/online_users:viewlist', 'read', 80, 'block_online_users', 0),
(419, 'block/participants:addinstance', 'write', 80, 'block_participants', 20),
(420, 'block/private_files:myaddinstance', 'write', 10, 'block_private_files', 0),
(421, 'block/private_files:addinstance', 'write', 80, 'block_private_files', 20),
(422, 'block/quiz_results:addinstance', 'write', 80, 'block_quiz_results', 20),
(423, 'block/recent_activity:addinstance', 'write', 80, 'block_recent_activity', 20),
(424, 'block/rss_client:myaddinstance', 'write', 10, 'block_rss_client', 0),
(425, 'block/rss_client:addinstance', 'write', 80, 'block_rss_client', 20),
(426, 'block/rss_client:manageownfeeds', 'write', 80, 'block_rss_client', 0),
(427, 'block/rss_client:manageanyfeeds', 'write', 80, 'block_rss_client', 16),
(428, 'block/search_forums:addinstance', 'write', 80, 'block_search_forums', 20),
(429, 'block/section_links:addinstance', 'write', 80, 'block_section_links', 20),
(430, 'block/selfcompletion:addinstance', 'write', 80, 'block_selfcompletion', 20),
(431, 'block/settings:myaddinstance', 'write', 10, 'block_settings', 0),
(432, 'block/settings:addinstance', 'write', 80, 'block_settings', 20),
(433, 'block/site_main_menu:addinstance', 'write', 80, 'block_site_main_menu', 20),
(434, 'block/social_activities:addinstance', 'write', 80, 'block_social_activities', 20),
(435, 'block/tag_flickr:addinstance', 'write', 80, 'block_tag_flickr', 20),
(436, 'block/tag_youtube:addinstance', 'write', 80, 'block_tag_youtube', 20),
(437, 'block/tags:myaddinstance', 'write', 10, 'block_tags', 0),
(438, 'block/tags:addinstance', 'write', 80, 'block_tags', 20),
(439, 'report/completion:view', 'read', 50, 'report_completion', 8),
(440, 'report/courseoverview:view', 'read', 10, 'report_courseoverview', 8),
(441, 'report/log:view', 'read', 50, 'report_log', 8),
(442, 'report/log:viewtoday', 'read', 50, 'report_log', 8),
(443, 'report/loglive:view', 'read', 50, 'report_loglive', 8),
(444, 'report/outline:view', 'read', 50, 'report_outline', 8),
(445, 'report/participation:view', 'read', 50, 'report_participation', 8),
(446, 'report/performance:view', 'read', 10, 'report_performance', 2),
(447, 'report/progress:view', 'read', 50, 'report_progress', 8),
(448, 'report/questioninstances:view', 'read', 10, 'report_questioninstances', 0),
(449, 'report/security:view', 'read', 10, 'report_security', 2),
(450, 'report/stats:view', 'read', 50, 'report_stats', 8),
(451, 'gradeexport/ods:view', 'read', 50, 'gradeexport_ods', 8),
(452, 'gradeexport/ods:publish', 'read', 50, 'gradeexport_ods', 8),
(453, 'gradeexport/txt:view', 'read', 50, 'gradeexport_txt', 8),
(454, 'gradeexport/txt:publish', 'read', 50, 'gradeexport_txt', 8),
(455, 'gradeexport/xls:view', 'read', 50, 'gradeexport_xls', 8),
(456, 'gradeexport/xls:publish', 'read', 50, 'gradeexport_xls', 8),
(457, 'gradeexport/xml:view', 'read', 50, 'gradeexport_xml', 8),
(458, 'gradeexport/xml:publish', 'read', 50, 'gradeexport_xml', 8),
(459, 'gradeimport/csv:view', 'write', 50, 'gradeimport_csv', 0),
(460, 'gradeimport/xml:view', 'write', 50, 'gradeimport_xml', 0),
(461, 'gradeimport/xml:publish', 'write', 50, 'gradeimport_xml', 0),
(462, 'gradereport/grader:view', 'read', 50, 'gradereport_grader', 8),
(463, 'gradereport/outcomes:view', 'read', 50, 'gradereport_outcomes', 8),
(464, 'gradereport/overview:view', 'read', 50, 'gradereport_overview', 8),
(465, 'gradereport/user:view', 'read', 50, 'gradereport_user', 8),
(466, 'webservice/amf:use', 'read', 50, 'webservice_amf', 62),
(467, 'webservice/rest:use', 'read', 50, 'webservice_rest', 62),
(468, 'webservice/soap:use', 'read', 50, 'webservice_soap', 62),
(469, 'webservice/xmlrpc:use', 'read', 50, 'webservice_xmlrpc', 62),
(470, 'repository/alfresco:view', 'read', 70, 'repository_alfresco', 0),
(471, 'repository/boxnet:view', 'read', 70, 'repository_boxnet', 0),
(472, 'repository/coursefiles:view', 'read', 70, 'repository_coursefiles', 0),
(473, 'repository/dropbox:view', 'read', 70, 'repository_dropbox', 0),
(474, 'repository/equella:view', 'read', 70, 'repository_equella', 0),
(475, 'repository/filesystem:view', 'read', 70, 'repository_filesystem', 0),
(476, 'repository/flickr:view', 'read', 70, 'repository_flickr', 0),
(477, 'repository/flickr_public:view', 'read', 70, 'repository_flickr_public', 0),
(478, 'repository/googledocs:view', 'read', 70, 'repository_googledocs', 0),
(479, 'repository/local:view', 'read', 70, 'repository_local', 0),
(480, 'repository/merlot:view', 'read', 70, 'repository_merlot', 0),
(481, 'repository/picasa:view', 'read', 70, 'repository_picasa', 0),
(482, 'repository/recent:view', 'read', 70, 'repository_recent', 0),
(483, 'repository/s3:view', 'read', 70, 'repository_s3', 0),
(484, 'repository/skydrive:view', 'read', 70, 'repository_skydrive', 0),
(485, 'repository/upload:view', 'read', 70, 'repository_upload', 0),
(486, 'repository/url:view', 'read', 70, 'repository_url', 0),
(487, 'repository/user:view', 'read', 70, 'repository_user', 0),
(488, 'repository/webdav:view', 'read', 70, 'repository_webdav', 0),
(489, 'repository/wikimedia:view', 'read', 70, 'repository_wikimedia', 0),
(490, 'repository/youtube:view', 'read', 70, 'repository_youtube', 0),
(491, 'tool/customlang:view', 'read', 10, 'tool_customlang', 2),
(492, 'tool/customlang:edit', 'write', 10, 'tool_customlang', 6),
(493, 'tool/uploaduser:uploaduserpictures', 'write', 10, 'tool_uploaduser', 16),
(494, 'booktool/exportimscp:export', 'read', 70, 'booktool_exportimscp', 0),
(495, 'booktool/importhtml:import', 'write', 70, 'booktool_importhtml', 4),
(496, 'booktool/print:print', 'read', 70, 'booktool_print', 0),
(497, 'quiz/grading:viewstudentnames', 'read', 70, 'quiz_grading', 0),
(498, 'quiz/grading:viewidnumber', 'read', 70, 'quiz_grading', 0),
(499, 'quiz/statistics:view', 'read', 70, 'quiz_statistics', 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_chat`
--

CREATE TABLE IF NOT EXISTS `mdl_chat` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `keepdays` bigint(11) NOT NULL DEFAULT '0',
  `studentlogs` smallint(4) NOT NULL DEFAULT '0',
  `chattime` bigint(10) NOT NULL DEFAULT '0',
  `schedule` smallint(4) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_chat_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each of these is a chat room' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_chat_messages`
--

CREATE TABLE IF NOT EXISTS `mdl_chat_messages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `chatid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `system` tinyint(1) NOT NULL DEFAULT '0',
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_chatmess_use_ix` (`userid`),
  KEY `mdl_chatmess_gro_ix` (`groupid`),
  KEY `mdl_chatmess_timcha_ix` (`timestamp`,`chatid`),
  KEY `mdl_chatmess_cha_ix` (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores all the actual chat messages' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_chat_messages_current`
--

CREATE TABLE IF NOT EXISTS `mdl_chat_messages_current` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `chatid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `system` tinyint(1) NOT NULL DEFAULT '0',
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_chatmesscurr_use_ix` (`userid`),
  KEY `mdl_chatmesscurr_gro_ix` (`groupid`),
  KEY `mdl_chatmesscurr_timcha_ix` (`timestamp`,`chatid`),
  KEY `mdl_chatmesscurr_cha_ix` (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores current session' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_chat_users`
--

CREATE TABLE IF NOT EXISTS `mdl_chat_users` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `chatid` bigint(11) NOT NULL DEFAULT '0',
  `userid` bigint(11) NOT NULL DEFAULT '0',
  `groupid` bigint(11) NOT NULL DEFAULT '0',
  `version` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ip` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `firstping` bigint(10) NOT NULL DEFAULT '0',
  `lastping` bigint(10) NOT NULL DEFAULT '0',
  `lastmessageping` bigint(10) NOT NULL DEFAULT '0',
  `sid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `lang` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_chatuser_use_ix` (`userid`),
  KEY `mdl_chatuser_las_ix` (`lastping`),
  KEY `mdl_chatuser_gro_ix` (`groupid`),
  KEY `mdl_chatuser_cha_ix` (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Keeps track of which users are in which chat rooms' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_choice`
--

CREATE TABLE IF NOT EXISTS `mdl_choice` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `publish` tinyint(2) NOT NULL DEFAULT '0',
  `showresults` tinyint(2) NOT NULL DEFAULT '0',
  `display` smallint(4) NOT NULL DEFAULT '0',
  `allowupdate` tinyint(2) NOT NULL DEFAULT '0',
  `showunanswered` tinyint(2) NOT NULL DEFAULT '0',
  `limitanswers` tinyint(2) NOT NULL DEFAULT '0',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_choi_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Available choices are stored here' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_choice_answers`
--

CREATE TABLE IF NOT EXISTS `mdl_choice_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `choiceid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `optionid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_choiansw_use_ix` (`userid`),
  KEY `mdl_choiansw_cho_ix` (`choiceid`),
  KEY `mdl_choiansw_opt_ix` (`optionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='choices performed by users' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_choice_options`
--

CREATE TABLE IF NOT EXISTS `mdl_choice_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `choiceid` bigint(10) NOT NULL DEFAULT '0',
  `text` longtext COLLATE utf8_unicode_ci,
  `maxanswers` bigint(10) DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_choiopti_cho_ix` (`choiceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='available options to choice' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_cohort`
--

CREATE TABLE IF NOT EXISTS `mdl_cohort` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `name` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_coho_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each record represents one cohort (aka site-wide group).' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_cohort_members`
--

CREATE TABLE IF NOT EXISTS `mdl_cohort_members` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `cohortid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timeadded` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_cohomemb_cohuse_uix` (`cohortid`,`userid`),
  KEY `mdl_cohomemb_coh_ix` (`cohortid`),
  KEY `mdl_cohomemb_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Link a user to a cohort.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_comments`
--

CREATE TABLE IF NOT EXISTS `mdl_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `commentarea` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `format` tinyint(2) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='moodle comments module' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_config`
--

CREATE TABLE IF NOT EXISTS `mdl_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_conf_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Moodle configuration variables' AUTO_INCREMENT=438 ;

--
-- Dumping data for table `mdl_config`
--

INSERT INTO `mdl_config` (`id`, `name`, `value`) VALUES
(2, 'rolesactive', '1'),
(3, 'auth', 'email'),
(4, 'auth_pop3mailbox', 'INBOX'),
(5, 'enrol_plugins_enabled', 'manual,guest,self,cohort'),
(6, 'theme', 'clean'),
(7, 'filter_multilang_converted', '1'),
(8, 'siteidentifier', 'BcUesFpH41WCC0FLITIkaMnrnb1K5eb8localhost'),
(9, 'backup_version', '2008111700'),
(10, 'backup_release', '2.0 dev'),
(11, 'mnet_dispatcher_mode', 'off'),
(12, 'sessiontimeout', '7200'),
(13, 'stringfilters', ''),
(14, 'filterall', '0'),
(15, 'texteditors', 'tinymce,textarea'),
(16, 'mnet_localhost_id', '1'),
(17, 'mnet_all_hosts_id', '2'),
(18, 'siteguest', '1'),
(19, 'siteadmins', '2'),
(20, 'themerev', '1391627044'),
(21, 'jsrev', '1391627044'),
(22, 'gdversion', '2'),
(23, 'licenses', 'unknown,allrightsreserved,public,cc,cc-nd,cc-nc-nd,cc-nc,cc-nc-sa,cc-sa'),
(24, 'version', '2013111801.05'),
(25, 'enableoutcomes', '0'),
(26, 'usecomments', '1'),
(27, 'usetags', '1'),
(28, 'enablenotes', '1'),
(29, 'enableportfolios', '0'),
(30, 'enablewebservices', '0'),
(31, 'messaging', '1'),
(32, 'messaginghidereadnotifications', '0'),
(33, 'messagingdeletereadnotificationsdelay', '604800'),
(34, 'messagingallowemailoverride', '0'),
(35, 'enablestats', '0'),
(36, 'enablerssfeeds', '0'),
(37, 'enableblogs', '1'),
(38, 'enablecompletion', '0'),
(39, 'completiondefault', '1'),
(40, 'enableavailability', '0'),
(41, 'enableplagiarism', '0'),
(42, 'enablebadges', '1'),
(43, 'autologinguests', '0'),
(44, 'hiddenuserfields', ''),
(45, 'showuseridentity', 'email'),
(46, 'fullnamedisplay', 'language'),
(47, 'maxusersperpage', '100'),
(48, 'enablegravatar', '0'),
(49, 'gravatardefaulturl', 'mm'),
(50, 'enablecourserequests', '0'),
(51, 'defaultrequestcategory', '1'),
(52, 'requestcategoryselection', '0'),
(53, 'courserequestnotify', ''),
(54, 'grade_profilereport', 'user'),
(55, 'grade_aggregationposition', '1'),
(56, 'grade_includescalesinaggregation', '1'),
(57, 'grade_hiddenasdate', '0'),
(58, 'gradepublishing', '0'),
(59, 'grade_export_displaytype', '1'),
(60, 'grade_export_decimalpoints', '2'),
(61, 'grade_navmethod', '0'),
(62, 'grade_export_userprofilefields', 'firstname,lastname,idnumber,institution,department,email'),
(63, 'grade_export_customprofilefields', ''),
(64, 'recovergradesdefault', '0'),
(65, 'gradeexport', ''),
(66, 'unlimitedgrades', '0'),
(67, 'grade_hideforcedsettings', '1'),
(68, 'grade_aggregation', '11'),
(69, 'grade_aggregation_flag', '0'),
(70, 'grade_aggregations_visible', '0,10,11,12,2,4,6,8,13'),
(71, 'grade_aggregateonlygraded', '1'),
(72, 'grade_aggregateonlygraded_flag', '2'),
(73, 'grade_aggregateoutcomes', '0'),
(74, 'grade_aggregateoutcomes_flag', '2'),
(75, 'grade_aggregatesubcats', '0'),
(76, 'grade_aggregatesubcats_flag', '2'),
(77, 'grade_keephigh', '0'),
(78, 'grade_keephigh_flag', '3'),
(79, 'grade_droplow', '0'),
(80, 'grade_droplow_flag', '2'),
(81, 'grade_displaytype', '1'),
(82, 'grade_decimalpoints', '2'),
(83, 'grade_item_advanced', 'iteminfo,idnumber,gradepass,plusfactor,multfactor,display,decimals,hiddenuntil,locktime'),
(84, 'grade_report_studentsperpage', '100'),
(85, 'grade_report_showonlyactiveenrol', '1'),
(86, 'grade_report_quickgrading', '1'),
(87, 'grade_report_showquickfeedback', '0'),
(88, 'grade_report_fixedstudents', '0'),
(89, 'grade_report_meanselection', '1'),
(90, 'grade_report_enableajax', '0'),
(91, 'grade_report_showcalculations', '0'),
(92, 'grade_report_showeyecons', '0'),
(93, 'grade_report_showaverages', '1'),
(94, 'grade_report_showlocks', '0'),
(95, 'grade_report_showranges', '0'),
(96, 'grade_report_showanalysisicon', '1'),
(97, 'grade_report_showuserimage', '1'),
(98, 'grade_report_showactivityicons', '1'),
(99, 'grade_report_shownumberofgrades', '0'),
(100, 'grade_report_averagesdisplaytype', 'inherit'),
(101, 'grade_report_rangesdisplaytype', 'inherit'),
(102, 'grade_report_averagesdecimalpoints', 'inherit'),
(103, 'grade_report_rangesdecimalpoints', 'inherit'),
(104, 'grade_report_overview_showrank', '0'),
(105, 'grade_report_overview_showtotalsifcontainhidden', '0'),
(106, 'grade_report_user_showrank', '0'),
(107, 'grade_report_user_showpercentage', '1'),
(108, 'grade_report_user_showgrade', '1'),
(109, 'grade_report_user_showfeedback', '1'),
(110, 'grade_report_user_showrange', '1'),
(111, 'grade_report_user_showweight', '0'),
(112, 'grade_report_user_showaverage', '0'),
(113, 'grade_report_user_showlettergrade', '0'),
(114, 'grade_report_user_rangedecimals', '0'),
(115, 'grade_report_user_showhiddenitems', '1'),
(116, 'grade_report_user_showtotalsifcontainhidden', '0'),
(117, 'badges_defaultissuername', ''),
(118, 'badges_defaultissuercontact', ''),
(119, 'badges_badgesalt', 'badges1391626052'),
(120, 'badges_allowexternalbackpack', '1'),
(121, 'badges_allowcoursebadges', '1'),
(122, 'timezone', '99'),
(123, 'forcetimezone', '99'),
(124, 'country', '0'),
(125, 'defaultcity', ''),
(126, 'geoipfile', '/var/moodledata/geoip/GeoLiteCity.dat'),
(127, 'googlemapkey3', ''),
(128, 'allcountrycodes', ''),
(129, 'autolang', '1'),
(130, 'lang', 'en'),
(131, 'langmenu', '1'),
(132, 'langlist', ''),
(133, 'langrev', '1391627044'),
(134, 'langcache', '1'),
(135, 'langstringcache', '1'),
(136, 'locale', ''),
(137, 'latinexcelexport', '0'),
(139, 'authpreventaccountcreation', '0'),
(140, 'loginpageautofocus', '0'),
(141, 'guestloginbutton', '1'),
(142, 'alternateloginurl', ''),
(143, 'forgottenpasswordurl', ''),
(144, 'auth_instructions', ''),
(145, 'allowemailaddresses', ''),
(146, 'denyemailaddresses', ''),
(147, 'verifychangedemail', '1'),
(148, 'recaptchapublickey', ''),
(149, 'recaptchaprivatekey', ''),
(150, 'sitedefaultlicense', 'allrightsreserved'),
(151, 'cachetext', '60'),
(152, 'filteruploadedfiles', '0'),
(153, 'filtermatchoneperpage', '0'),
(154, 'filtermatchonepertext', '0'),
(155, 'portfolio_moderate_filesize_threshold', '1048576'),
(156, 'portfolio_high_filesize_threshold', '5242880'),
(157, 'portfolio_moderate_db_threshold', '20'),
(158, 'portfolio_high_db_threshold', '50'),
(159, 'repositorycacheexpire', '120'),
(160, 'repositoryallowexternallinks', '1'),
(161, 'legacyfilesinnewcourses', '0'),
(162, 'legacyfilesaddallowed', '1'),
(163, 'mobilecssurl', ''),
(164, 'enablewsdocumentation', '0'),
(165, 'allowbeforeblock', '0'),
(166, 'allowedip', ''),
(167, 'blockedip', ''),
(168, 'protectusernames', '1'),
(169, 'forcelogin', '0'),
(170, 'forceloginforprofiles', '1'),
(171, 'forceloginforprofileimage', '0'),
(172, 'opentogoogle', '0'),
(173, 'maxbytes', '0'),
(174, 'userquota', '104857600'),
(175, 'allowobjectembed', '0'),
(176, 'enabletrusttext', '0'),
(177, 'maxeditingtime', '1800'),
(178, 'extendedusernamechars', '0'),
(179, 'sitepolicy', ''),
(180, 'sitepolicyguest', ''),
(181, 'keeptagnamecase', '1'),
(182, 'profilesforenrolledusersonly', '1'),
(183, 'cronclionly', '0'),
(184, 'cronremotepassword', ''),
(185, 'lockoutthreshold', '0'),
(186, 'lockoutwindow', '1800'),
(187, 'lockoutduration', '1800'),
(188, 'passwordpolicy', '1'),
(189, 'minpasswordlength', '8'),
(190, 'minpassworddigits', '1'),
(191, 'minpasswordlower', '1'),
(192, 'minpasswordupper', '1'),
(193, 'minpasswordnonalphanum', '1'),
(194, 'maxconsecutiveidentchars', '0'),
(195, 'pwresettime', '1800'),
(196, 'groupenrolmentkeypolicy', '1'),
(197, 'disableuserimages', '0'),
(198, 'emailchangeconfirmation', '1'),
(199, 'rememberusername', '2'),
(200, 'strictformsrequired', '0'),
(201, 'loginhttps', '0'),
(202, 'cookiesecure', '0'),
(203, 'cookiehttponly', '0'),
(204, 'allowframembedding', '0'),
(205, 'loginpasswordautocomplete', '0'),
(206, 'displayloginfailures', ''),
(207, 'notifyloginfailures', ''),
(208, 'notifyloginthreshold', '10'),
(209, 'runclamonupload', '0'),
(210, 'pathtoclam', ''),
(211, 'quarantinedir', ''),
(212, 'clamfailureonupload', 'donothing'),
(213, 'themelist', ''),
(214, 'themedesignermode', '0'),
(215, 'allowuserthemes', '0'),
(216, 'allowcoursethemes', '0'),
(217, 'allowcategorythemes', '0'),
(218, 'allowthemechangeonurl', '0'),
(219, 'allowuserblockhiding', '1'),
(220, 'allowblockstodock', '1'),
(221, 'custommenuitems', ''),
(222, 'enabledevicedetection', '1'),
(223, 'devicedetectregex', '[]'),
(224, 'calendar_adminseesall', '0'),
(225, 'calendar_site_timeformat', '0'),
(226, 'calendar_startwday', '0'),
(227, 'calendar_weekend', '65'),
(228, 'calendar_lookahead', '21'),
(229, 'calendar_maxevents', '10'),
(230, 'enablecalendarexport', '1'),
(231, 'calendar_customexport', '1'),
(232, 'calendar_exportlookahead', '365'),
(233, 'calendar_exportlookback', '5'),
(234, 'calendar_exportsalt', 'KNnPKYkZlFKAa4DkJyxulfCkuqfrIa1dYUu4vVFJKmxkK3yhKbifXjPrxn4t'),
(235, 'calendar_showicalsource', '1'),
(236, 'useblogassociations', '1'),
(237, 'bloglevel', '4'),
(238, 'useexternalblogs', '1'),
(239, 'externalblogcrontime', '86400'),
(240, 'maxexternalblogsperuser', '1'),
(241, 'blogusecomments', '1'),
(242, 'blogshowcommentscount', '1'),
(243, 'defaulthomepage', '0'),
(244, 'allowguestmymoodle', '1'),
(245, 'navshowfullcoursenames', '0'),
(246, 'navshowcategories', '1'),
(247, 'navshowmycoursecategories', '0'),
(248, 'navshowallcourses', '0'),
(249, 'navsortmycoursessort', 'sortorder'),
(250, 'navcourselimit', '20'),
(251, 'usesitenameforsitepages', '0'),
(252, 'linkadmincategories', '0'),
(253, 'navshowfrontpagemods', '1'),
(254, 'navadduserpostslinks', '1'),
(255, 'formatstringstriptags', '1'),
(256, 'emoticons', '[{"text":":-)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":-D","imagename":"s\\/biggrin","imagecomponent":"core","altidentifier":"biggrin","altcomponent":"core_pix"},{"text":";-)","imagename":"s\\/wink","imagecomponent":"core","altidentifier":"wink","altcomponent":"core_pix"},{"text":":-\\/","imagename":"s\\/mixed","imagecomponent":"core","altidentifier":"mixed","altcomponent":"core_pix"},{"text":"V-.","imagename":"s\\/thoughtful","imagecomponent":"core","altidentifier":"thoughtful","altcomponent":"core_pix"},{"text":":-P","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":":-p","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":"B-)","imagename":"s\\/cool","imagecomponent":"core","altidentifier":"cool","altcomponent":"core_pix"},{"text":"^-)","imagename":"s\\/approve","imagecomponent":"core","altidentifier":"approve","altcomponent":"core_pix"},{"text":"8-)","imagename":"s\\/wideeyes","imagecomponent":"core","altidentifier":"wideeyes","altcomponent":"core_pix"},{"text":":o)","imagename":"s\\/clown","imagecomponent":"core","altidentifier":"clown","altcomponent":"core_pix"},{"text":":-(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":":(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":"8-.","imagename":"s\\/shy","imagecomponent":"core","altidentifier":"shy","altcomponent":"core_pix"},{"text":":-I","imagename":"s\\/blush","imagecomponent":"core","altidentifier":"blush","altcomponent":"core_pix"},{"text":":-X","imagename":"s\\/kiss","imagecomponent":"core","altidentifier":"kiss","altcomponent":"core_pix"},{"text":"8-o","imagename":"s\\/surprise","imagecomponent":"core","altidentifier":"surprise","altcomponent":"core_pix"},{"text":"P-|","imagename":"s\\/blackeye","imagecomponent":"core","altidentifier":"blackeye","altcomponent":"core_pix"},{"text":"8-[","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"(grr)","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"xx-P","imagename":"s\\/dead","imagecomponent":"core","altidentifier":"dead","altcomponent":"core_pix"},{"text":"|-.","imagename":"s\\/sleepy","imagecomponent":"core","altidentifier":"sleepy","altcomponent":"core_pix"},{"text":"}-]","imagename":"s\\/evil","imagecomponent":"core","altidentifier":"evil","altcomponent":"core_pix"},{"text":"(h)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(heart)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(y)","imagename":"s\\/yes","imagecomponent":"core","altidentifier":"yes","altcomponent":"core"},{"text":"(n)","imagename":"s\\/no","imagecomponent":"core","altidentifier":"no","altcomponent":"core"},{"text":"(martin)","imagename":"s\\/martin","imagecomponent":"core","altidentifier":"martin","altcomponent":"core_pix"},{"text":"( )","imagename":"s\\/egg","imagecomponent":"core","altidentifier":"egg","altcomponent":"core_pix"}]'),
(257, 'core_media_enable_youtube', '1'),
(258, 'core_media_enable_vimeo', '0'),
(259, 'core_media_enable_mp3', '1'),
(260, 'core_media_enable_flv', '1'),
(261, 'core_media_enable_swf', '1'),
(262, 'core_media_enable_html5audio', '1'),
(263, 'core_media_enable_html5video', '1'),
(264, 'core_media_enable_qt', '1'),
(265, 'core_media_enable_wmp', '1'),
(266, 'core_media_enable_rm', '1'),
(267, 'docroot', 'http://docs.moodle.org'),
(268, 'doctonewwindow', '0'),
(269, 'courselistshortnames', '0'),
(270, 'coursesperpage', '20'),
(271, 'courseswithsummarieslimit', '10'),
(272, 'courseoverviewfileslimit', '1'),
(273, 'courseoverviewfilesext', '.jpg,.gif,.png'),
(274, 'enableajax', '1'),
(275, 'useexternalyui', '0'),
(276, 'yuicomboloading', '1'),
(277, 'cachejs', '1'),
(278, 'modchooserdefault', '1'),
(279, 'modeditingmenu', '1'),
(280, 'blockeditingmenu', '1'),
(281, 'additionalhtmlhead', ''),
(282, 'additionalhtmltopofbody', ''),
(283, 'additionalhtmlfooter', ''),
(284, 'pathtodu', ''),
(285, 'aspellpath', ''),
(286, 'pathtodot', ''),
(287, 'supportpage', ''),
(288, 'dbsessions', '0'),
(289, 'sessioncookie', ''),
(290, 'sessioncookiepath', ''),
(291, 'sessioncookiedomain', ''),
(292, 'statsfirstrun', 'none'),
(293, 'statsmaxruntime', '0'),
(294, 'statsruntimedays', '31'),
(295, 'statsruntimestarthour', '0'),
(296, 'statsruntimestartminute', '0'),
(297, 'statsuserthreshold', '0'),
(298, 'slasharguments', '1'),
(299, 'getremoteaddrconf', '0'),
(300, 'proxyhost', ''),
(301, 'proxyport', '0'),
(302, 'proxytype', 'HTTP'),
(303, 'proxyuser', ''),
(304, 'proxypassword', ''),
(305, 'proxybypass', 'localhost, 127.0.0.1'),
(306, 'maintenance_enabled', '0'),
(307, 'maintenance_message', ''),
(308, 'deleteunconfirmed', '168'),
(309, 'deleteincompleteusers', '0'),
(310, 'logguests', '1'),
(311, 'loglifetime', '0'),
(312, 'disablegradehistory', '0'),
(313, 'gradehistorylifetime', '0'),
(314, 'extramemorylimit', '512M'),
(315, 'curlcache', '120'),
(316, 'curltimeoutkbitrate', '56'),
(317, 'updateautocheck', '1'),
(318, 'updateautodeploy', '0'),
(319, 'updateminmaturity', '200'),
(320, 'updatenotifybuilds', '0'),
(321, 'enablesafebrowserintegration', '0'),
(322, 'enablegroupmembersonly', '0'),
(323, 'dndallowtextandlinks', '0'),
(324, 'enablecssoptimiser', '0'),
(325, 'enabletgzbackups', '0'),
(326, 'debug', '0'),
(327, 'debugdisplay', '0'),
(328, 'debugsmtp', '0'),
(329, 'perfdebug', '7'),
(330, 'debugstringids', '0'),
(331, 'debugvalidators', '0'),
(332, 'debugpageinfo', '0'),
(333, 'release', '2.6.1+ (Build: 20140131)'),
(334, 'branch', '26'),
(335, 'localcachedirpurged', '1391627044'),
(337, 'allversionshash', 'c09e1c2cab910c54aad2b4e3c2012291f1e41189'),
(339, 'notloggedinroleid', '6'),
(340, 'guestroleid', '6'),
(341, 'defaultuserroleid', '7'),
(342, 'creatornewroleid', '3'),
(343, 'restorernewroleid', '3'),
(344, 'gradebookroles', '5'),
(345, 'assignment_maxbytes', '1048576'),
(346, 'assignment_itemstocount', '1'),
(347, 'assignment_showrecentsubmissions', '1'),
(348, 'chat_method', 'ajax'),
(349, 'chat_refresh_userlist', '10'),
(350, 'chat_old_ping', '35'),
(351, 'chat_refresh_room', '5'),
(352, 'chat_normal_updatemode', 'jsupdate'),
(353, 'chat_serverhost', 'localhost'),
(354, 'chat_serverip', '127.0.0.1'),
(355, 'chat_serverport', '9111'),
(356, 'chat_servermax', '100'),
(357, 'data_enablerssfeeds', '0'),
(358, 'feedback_allowfullanonymous', '0'),
(359, 'forum_displaymode', '3'),
(360, 'forum_replytouser', '1'),
(361, 'forum_shortpost', '300'),
(362, 'forum_longpost', '600'),
(363, 'forum_manydiscussions', '100'),
(364, 'forum_maxbytes', '512000'),
(365, 'forum_maxattachments', '9'),
(366, 'forum_trackingtype', '1'),
(367, 'forum_trackreadposts', '1'),
(368, 'forum_allowforcedreadtracking', '0'),
(369, 'forum_oldpostdays', '14'),
(370, 'forum_usermarksread', '0'),
(371, 'forum_cleanreadtime', '2'),
(372, 'digestmailtime', '17'),
(373, 'forum_enablerssfeeds', '0'),
(374, 'forum_enabletimedposts', '0'),
(375, 'glossary_entbypage', '10'),
(376, 'glossary_dupentries', '0'),
(377, 'glossary_allowcomments', '0'),
(378, 'glossary_linkbydefault', '1'),
(379, 'glossary_defaultapproval', '1'),
(380, 'glossary_enablerssfeeds', '0'),
(381, 'glossary_linkentries', '0'),
(382, 'glossary_casesensitive', '0'),
(383, 'glossary_fullmatch', '0'),
(384, 'lesson_slideshowwidth', '640'),
(385, 'lesson_slideshowheight', '480'),
(386, 'lesson_slideshowbgcolor', '#FFFFFF'),
(387, 'lesson_mediawidth', '640'),
(388, 'lesson_mediaheight', '480'),
(389, 'lesson_mediaclose', '0'),
(390, 'lesson_maxhighscores', '10'),
(391, 'lesson_maxanswers', '4'),
(392, 'lesson_defaultnextpage', '0'),
(393, 'block_course_list_adminview', 'all'),
(394, 'block_course_list_hideallcourseslink', '0'),
(395, 'block_html_allowcssclasses', '0'),
(396, 'block_online_users_timetosee', '5'),
(397, 'block_rss_client_num_entries', '5'),
(398, 'block_rss_client_timeout', '30'),
(399, 'block_tags_showcoursetags', '0'),
(400, 'smtphosts', ''),
(401, 'smtpsecure', ''),
(402, 'smtpuser', ''),
(403, 'smtppass', ''),
(404, 'smtpmaxbulk', '1'),
(405, 'noreplyaddress', 'noreply@localhost'),
(406, 'sitemailcharset', '0'),
(407, 'allowusermailcharset', '0'),
(408, 'allowattachments', '1'),
(409, 'mailnewline', 'LF'),
(410, 'jabberhost', ''),
(411, 'jabberserver', ''),
(412, 'jabberusername', ''),
(413, 'jabberpassword', ''),
(414, 'jabberport', '5222'),
(415, 'filter_censor_badwords', ''),
(416, 'filter_multilang_force_old', '0'),
(417, 'filter_tex_latexpreamble', '\\usepackage[latin1]{inputenc}\n\\usepackage{amsmath}\n\\usepackage{amsfonts}\n\\RequirePackage{amsmath,amssymb,latexsym}\n'),
(418, 'filter_tex_latexbackground', '#FFFFFF'),
(419, 'filter_tex_density', '120'),
(420, 'filter_tex_pathlatex', '/usr/bin/latex'),
(421, 'filter_tex_pathdvips', '/usr/bin/dvips'),
(422, 'filter_tex_pathconvert', '/usr/bin/convert'),
(423, 'filter_tex_convertformat', 'gif'),
(424, 'profileroles', '5,4,3'),
(425, 'coursecontact', '3'),
(426, 'frontpage', '6'),
(427, 'frontpageloggedin', '6'),
(428, 'maxcategorydepth', '2'),
(429, 'frontpagecourselimit', '200'),
(430, 'commentsperpage', '15'),
(431, 'defaultfrontpageroleid', '8'),
(432, 'supportname', 'Chitrank Dixit'),
(433, 'supportemail', 'chitrankdixit@gmail.com'),
(434, 'registerauth', 'email'),
(435, 'themelegacy', 'clean'),
(436, 'thememobile', 'clean'),
(437, 'themetablet', 'clean');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_config_log`
--

CREATE TABLE IF NOT EXISTS `mdl_config_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `plugin` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  `oldvalue` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_conflog_tim_ix` (`timemodified`),
  KEY `mdl_conflog_use_ix` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Changes done in server configuration through admin UI' AUTO_INCREMENT=877 ;

--
-- Dumping data for table `mdl_config_log`
--

INSERT INTO `mdl_config_log` (`id`, `userid`, `timemodified`, `plugin`, `name`, `value`, `oldvalue`) VALUES
(1, 0, 1391626099, NULL, 'enableoutcomes', '0', NULL),
(2, 0, 1391626099, NULL, 'usecomments', '1', NULL),
(3, 0, 1391626099, NULL, 'usetags', '1', NULL),
(4, 0, 1391626099, NULL, 'enablenotes', '1', NULL),
(5, 0, 1391626099, NULL, 'enableportfolios', '0', NULL),
(6, 0, 1391626099, NULL, 'enablewebservices', '0', NULL),
(7, 0, 1391626100, NULL, 'messaging', '1', NULL),
(8, 0, 1391626100, NULL, 'messaginghidereadnotifications', '0', NULL),
(9, 0, 1391626100, NULL, 'messagingdeletereadnotificationsdelay', '604800', NULL),
(10, 0, 1391626100, NULL, 'messagingallowemailoverride', '0', NULL),
(11, 0, 1391626100, NULL, 'enablestats', '0', NULL),
(12, 0, 1391626100, NULL, 'enablerssfeeds', '0', NULL),
(13, 0, 1391626100, NULL, 'enableblogs', '1', NULL),
(14, 0, 1391626100, NULL, 'enablecompletion', '0', NULL),
(15, 0, 1391626100, NULL, 'completiondefault', '1', NULL),
(16, 0, 1391626100, NULL, 'enableavailability', '0', NULL),
(17, 0, 1391626100, NULL, 'enableplagiarism', '0', NULL),
(18, 0, 1391626101, NULL, 'enablebadges', '1', NULL),
(19, 0, 1391626101, NULL, 'autologinguests', '0', NULL),
(20, 0, 1391626101, NULL, 'hiddenuserfields', '', NULL),
(21, 0, 1391626101, NULL, 'showuseridentity', 'email', NULL),
(22, 0, 1391626101, NULL, 'fullnamedisplay', 'language', NULL),
(23, 0, 1391626101, NULL, 'maxusersperpage', '100', NULL),
(24, 0, 1391626102, NULL, 'enablegravatar', '0', NULL),
(25, 0, 1391626102, NULL, 'gravatardefaulturl', 'mm', NULL),
(26, 0, 1391626102, 'moodlecourse', 'visible', '1', NULL),
(27, 0, 1391626102, 'moodlecourse', 'format', 'weeks', NULL),
(28, 0, 1391626102, 'moodlecourse', 'maxsections', '52', NULL),
(29, 0, 1391626102, 'moodlecourse', 'numsections', '10', NULL),
(30, 0, 1391626103, 'moodlecourse', 'hiddensections', '0', NULL),
(31, 0, 1391626103, 'moodlecourse', 'coursedisplay', '0', NULL),
(32, 0, 1391626103, 'moodlecourse', 'lang', '', NULL),
(33, 0, 1391626103, 'moodlecourse', 'newsitems', '5', NULL),
(34, 0, 1391626103, 'moodlecourse', 'showgrades', '1', NULL),
(35, 0, 1391626103, 'moodlecourse', 'showreports', '0', NULL),
(36, 0, 1391626103, 'moodlecourse', 'maxbytes', '0', NULL),
(37, 0, 1391626104, 'moodlecourse', 'enablecompletion', '0', NULL),
(38, 0, 1391626104, 'moodlecourse', 'groupmode', '0', NULL),
(39, 0, 1391626104, 'moodlecourse', 'groupmodeforce', '0', NULL),
(40, 0, 1391626104, NULL, 'enablecourserequests', '0', NULL),
(41, 0, 1391626104, NULL, 'defaultrequestcategory', '1', NULL),
(42, 0, 1391626104, NULL, 'requestcategoryselection', '0', NULL),
(43, 0, 1391626105, NULL, 'courserequestnotify', '', NULL),
(44, 0, 1391626105, 'backup', 'loglifetime', '30', NULL),
(45, 0, 1391626105, 'backup', 'backup_general_users', '1', NULL),
(46, 0, 1391626105, 'backup', 'backup_general_users_locked', '', NULL),
(47, 0, 1391626105, 'backup', 'backup_general_anonymize', '0', NULL),
(48, 0, 1391626105, 'backup', 'backup_general_anonymize_locked', '', NULL),
(49, 0, 1391626106, 'backup', 'backup_general_role_assignments', '1', NULL),
(50, 0, 1391626106, 'backup', 'backup_general_role_assignments_locked', '', NULL),
(51, 0, 1391626106, 'backup', 'backup_general_activities', '1', NULL),
(52, 0, 1391626106, 'backup', 'backup_general_activities_locked', '', NULL),
(53, 0, 1391626106, 'backup', 'backup_general_blocks', '1', NULL),
(54, 0, 1391626106, 'backup', 'backup_general_blocks_locked', '', NULL),
(55, 0, 1391626106, 'backup', 'backup_general_filters', '1', NULL),
(56, 0, 1391626106, 'backup', 'backup_general_filters_locked', '', NULL),
(57, 0, 1391626106, 'backup', 'backup_general_comments', '1', NULL),
(58, 0, 1391626107, 'backup', 'backup_general_comments_locked', '', NULL),
(59, 0, 1391626107, 'backup', 'backup_general_badges', '1', NULL),
(60, 0, 1391626108, 'backup', 'backup_general_badges_locked', '', NULL),
(61, 0, 1391626108, 'backup', 'backup_general_userscompletion', '1', NULL),
(62, 0, 1391626108, 'backup', 'backup_general_userscompletion_locked', '', NULL),
(63, 0, 1391626108, 'backup', 'backup_general_logs', '0', NULL),
(64, 0, 1391626108, 'backup', 'backup_general_logs_locked', '', NULL),
(65, 0, 1391626109, 'backup', 'backup_general_histories', '0', NULL),
(66, 0, 1391626109, 'backup', 'backup_general_histories_locked', '', NULL),
(67, 0, 1391626109, 'backup', 'backup_general_questionbank', '1', NULL),
(68, 0, 1391626109, 'backup', 'backup_general_questionbank_locked', '', NULL),
(69, 0, 1391626109, 'backup', 'import_general_maxresults', '10', NULL),
(70, 0, 1391626109, 'backup', 'backup_auto_active', '0', NULL),
(71, 0, 1391626109, 'backup', 'backup_auto_weekdays', '0000000', NULL),
(72, 0, 1391626110, 'backup', 'backup_auto_hour', '0', NULL),
(73, 0, 1391626110, 'backup', 'backup_auto_minute', '0', NULL),
(74, 0, 1391626110, 'backup', 'backup_auto_storage', '0', NULL),
(75, 0, 1391626110, 'backup', 'backup_auto_destination', '', NULL),
(76, 0, 1391626110, 'backup', 'backup_auto_keep', '1', NULL),
(77, 0, 1391626110, 'backup', 'backup_shortname', '0', NULL),
(78, 0, 1391626111, 'backup', 'backup_auto_skip_hidden', '1', NULL),
(79, 0, 1391626111, 'backup', 'backup_auto_skip_modif_days', '30', NULL),
(80, 0, 1391626111, 'backup', 'backup_auto_skip_modif_prev', '0', NULL),
(81, 0, 1391626111, 'backup', 'backup_auto_users', '1', NULL),
(82, 0, 1391626112, 'backup', 'backup_auto_role_assignments', '1', NULL),
(83, 0, 1391626112, 'backup', 'backup_auto_activities', '1', NULL),
(84, 0, 1391626112, 'backup', 'backup_auto_blocks', '1', NULL),
(85, 0, 1391626112, 'backup', 'backup_auto_filters', '1', NULL),
(86, 0, 1391626112, 'backup', 'backup_auto_comments', '1', NULL),
(87, 0, 1391626112, 'backup', 'backup_auto_badges', '1', NULL),
(88, 0, 1391626112, 'backup', 'backup_auto_userscompletion', '1', NULL),
(89, 0, 1391626112, 'backup', 'backup_auto_logs', '0', NULL),
(90, 0, 1391626112, 'backup', 'backup_auto_histories', '0', NULL),
(91, 0, 1391626112, 'backup', 'backup_auto_questionbank', '1', NULL),
(92, 0, 1391626113, NULL, 'grade_profilereport', 'user', NULL),
(93, 0, 1391626113, NULL, 'grade_aggregationposition', '1', NULL),
(94, 0, 1391626113, NULL, 'grade_includescalesinaggregation', '1', NULL),
(95, 0, 1391626113, NULL, 'grade_hiddenasdate', '0', NULL),
(96, 0, 1391626113, NULL, 'gradepublishing', '0', NULL),
(97, 0, 1391626113, NULL, 'grade_export_displaytype', '1', NULL),
(98, 0, 1391626113, NULL, 'grade_export_decimalpoints', '2', NULL),
(99, 0, 1391626114, NULL, 'grade_navmethod', '0', NULL),
(100, 0, 1391626114, NULL, 'grade_export_userprofilefields', 'firstname,lastname,idnumber,institution,department,email', NULL),
(101, 0, 1391626114, NULL, 'grade_export_customprofilefields', '', NULL),
(102, 0, 1391626114, NULL, 'recovergradesdefault', '0', NULL),
(103, 0, 1391626114, NULL, 'gradeexport', '', NULL),
(104, 0, 1391626114, NULL, 'unlimitedgrades', '0', NULL),
(105, 0, 1391626114, NULL, 'grade_hideforcedsettings', '1', NULL),
(106, 0, 1391626115, NULL, 'grade_aggregation', '11', NULL),
(107, 0, 1391626115, NULL, 'grade_aggregation_flag', '0', NULL),
(108, 0, 1391626115, NULL, 'grade_aggregations_visible', '0,10,11,12,2,4,6,8,13', NULL),
(109, 0, 1391626115, NULL, 'grade_aggregateonlygraded', '1', NULL),
(110, 0, 1391626115, NULL, 'grade_aggregateonlygraded_flag', '2', NULL),
(111, 0, 1391626115, NULL, 'grade_aggregateoutcomes', '0', NULL),
(112, 0, 1391626115, NULL, 'grade_aggregateoutcomes_flag', '2', NULL),
(113, 0, 1391626115, NULL, 'grade_aggregatesubcats', '0', NULL),
(114, 0, 1391626116, NULL, 'grade_aggregatesubcats_flag', '2', NULL),
(115, 0, 1391626116, NULL, 'grade_keephigh', '0', NULL),
(116, 0, 1391626116, NULL, 'grade_keephigh_flag', '3', NULL),
(117, 0, 1391626116, NULL, 'grade_droplow', '0', NULL),
(118, 0, 1391626116, NULL, 'grade_droplow_flag', '2', NULL),
(119, 0, 1391626116, NULL, 'grade_displaytype', '1', NULL),
(120, 0, 1391626116, NULL, 'grade_decimalpoints', '2', NULL),
(121, 0, 1391626116, NULL, 'grade_item_advanced', 'iteminfo,idnumber,gradepass,plusfactor,multfactor,display,decimals,hiddenuntil,locktime', NULL),
(122, 0, 1391626117, NULL, 'grade_report_studentsperpage', '100', NULL),
(123, 0, 1391626117, NULL, 'grade_report_showonlyactiveenrol', '1', NULL),
(124, 0, 1391626117, NULL, 'grade_report_quickgrading', '1', NULL),
(125, 0, 1391626117, NULL, 'grade_report_showquickfeedback', '0', NULL),
(126, 0, 1391626117, NULL, 'grade_report_fixedstudents', '0', NULL),
(127, 0, 1391626117, NULL, 'grade_report_meanselection', '1', NULL),
(128, 0, 1391626117, NULL, 'grade_report_enableajax', '0', NULL),
(129, 0, 1391626117, NULL, 'grade_report_showcalculations', '0', NULL),
(130, 0, 1391626117, NULL, 'grade_report_showeyecons', '0', NULL),
(131, 0, 1391626118, NULL, 'grade_report_showaverages', '1', NULL),
(132, 0, 1391626118, NULL, 'grade_report_showlocks', '0', NULL),
(133, 0, 1391626118, NULL, 'grade_report_showranges', '0', NULL),
(134, 0, 1391626119, NULL, 'grade_report_showanalysisicon', '1', NULL),
(135, 0, 1391626119, NULL, 'grade_report_showuserimage', '1', NULL),
(136, 0, 1391626119, NULL, 'grade_report_showactivityicons', '1', NULL),
(137, 0, 1391626119, NULL, 'grade_report_shownumberofgrades', '0', NULL),
(138, 0, 1391626119, NULL, 'grade_report_averagesdisplaytype', 'inherit', NULL),
(139, 0, 1391626119, NULL, 'grade_report_rangesdisplaytype', 'inherit', NULL),
(140, 0, 1391626119, NULL, 'grade_report_averagesdecimalpoints', 'inherit', NULL),
(141, 0, 1391626119, NULL, 'grade_report_rangesdecimalpoints', 'inherit', NULL),
(142, 0, 1391626119, NULL, 'grade_report_overview_showrank', '0', NULL),
(143, 0, 1391626120, NULL, 'grade_report_overview_showtotalsifcontainhidden', '0', NULL),
(144, 0, 1391626120, NULL, 'grade_report_user_showrank', '0', NULL),
(145, 0, 1391626120, NULL, 'grade_report_user_showpercentage', '1', NULL),
(146, 0, 1391626120, NULL, 'grade_report_user_showgrade', '1', NULL),
(147, 0, 1391626120, NULL, 'grade_report_user_showfeedback', '1', NULL),
(148, 0, 1391626120, NULL, 'grade_report_user_showrange', '1', NULL),
(149, 0, 1391626120, NULL, 'grade_report_user_showweight', '0', NULL),
(150, 0, 1391626121, NULL, 'grade_report_user_showaverage', '0', NULL),
(151, 0, 1391626121, NULL, 'grade_report_user_showlettergrade', '0', NULL),
(152, 0, 1391626121, NULL, 'grade_report_user_rangedecimals', '0', NULL),
(153, 0, 1391626121, NULL, 'grade_report_user_showhiddenitems', '1', NULL),
(154, 0, 1391626121, NULL, 'grade_report_user_showtotalsifcontainhidden', '0', NULL),
(155, 0, 1391626121, NULL, 'badges_defaultissuername', '', NULL),
(156, 0, 1391626121, NULL, 'badges_defaultissuercontact', '', NULL),
(157, 0, 1391626121, NULL, 'badges_badgesalt', 'badges1391626052', NULL),
(158, 0, 1391626121, NULL, 'badges_allowexternalbackpack', '1', NULL),
(159, 0, 1391626121, NULL, 'badges_allowcoursebadges', '1', NULL),
(160, 0, 1391626122, NULL, 'timezone', '99', NULL),
(161, 0, 1391626122, NULL, 'forcetimezone', '99', NULL),
(162, 0, 1391626122, NULL, 'country', '0', NULL),
(163, 0, 1391626122, NULL, 'defaultcity', '', NULL),
(164, 0, 1391626122, NULL, 'geoipfile', '/var/moodledata/geoip/GeoLiteCity.dat', NULL),
(165, 0, 1391626122, NULL, 'googlemapkey3', '', NULL),
(166, 0, 1391626122, NULL, 'allcountrycodes', '', NULL),
(167, 0, 1391626122, NULL, 'autolang', '1', NULL),
(168, 0, 1391626122, NULL, 'lang', 'en', NULL),
(169, 0, 1391626123, NULL, 'langmenu', '1', NULL),
(170, 0, 1391626123, NULL, 'langlist', '', NULL),
(171, 0, 1391626123, NULL, 'langcache', '1', NULL),
(172, 0, 1391626123, NULL, 'langstringcache', '1', NULL),
(173, 0, 1391626123, NULL, 'locale', '', NULL),
(174, 0, 1391626123, NULL, 'latinexcelexport', '0', NULL),
(175, 0, 1391626123, NULL, 'registerauth', '', NULL),
(176, 0, 1391626123, NULL, 'authpreventaccountcreation', '0', NULL),
(177, 0, 1391626123, NULL, 'loginpageautofocus', '0', NULL),
(178, 0, 1391626124, NULL, 'guestloginbutton', '1', NULL),
(179, 0, 1391626124, NULL, 'alternateloginurl', '', NULL),
(180, 0, 1391626124, NULL, 'forgottenpasswordurl', '', NULL),
(181, 0, 1391626124, NULL, 'auth_instructions', '', NULL),
(182, 0, 1391626124, NULL, 'allowemailaddresses', '', NULL),
(183, 0, 1391626124, NULL, 'denyemailaddresses', '', NULL),
(184, 0, 1391626124, NULL, 'verifychangedemail', '1', NULL),
(185, 0, 1391626124, NULL, 'recaptchapublickey', '', NULL),
(186, 0, 1391626124, NULL, 'recaptchaprivatekey', '', NULL),
(187, 0, 1391626125, NULL, 'sitedefaultlicense', 'allrightsreserved', NULL),
(188, 0, 1391626125, NULL, 'cachetext', '60', NULL),
(189, 0, 1391626125, NULL, 'filteruploadedfiles', '0', NULL),
(190, 0, 1391626125, NULL, 'filtermatchoneperpage', '0', NULL),
(191, 0, 1391626125, NULL, 'filtermatchonepertext', '0', NULL),
(192, 0, 1391626125, NULL, 'portfolio_moderate_filesize_threshold', '1048576', NULL),
(193, 0, 1391626125, NULL, 'portfolio_high_filesize_threshold', '5242880', NULL),
(194, 0, 1391626125, NULL, 'portfolio_moderate_db_threshold', '20', NULL),
(195, 0, 1391626125, NULL, 'portfolio_high_db_threshold', '50', NULL),
(196, 0, 1391626126, NULL, 'repositorycacheexpire', '120', NULL),
(197, 0, 1391626126, NULL, 'repositoryallowexternallinks', '1', NULL),
(198, 0, 1391626126, NULL, 'legacyfilesinnewcourses', '0', NULL),
(199, 0, 1391626126, NULL, 'legacyfilesaddallowed', '1', NULL),
(200, 0, 1391626126, NULL, 'mobilecssurl', '', NULL),
(201, 0, 1391626126, NULL, 'enablewsdocumentation', '0', NULL),
(202, 0, 1391626126, 'question_preview', 'behaviour', 'deferredfeedback', NULL),
(203, 0, 1391626126, 'question_preview', 'correctness', '1', NULL),
(204, 0, 1391626127, 'question_preview', 'marks', '1', NULL),
(205, 0, 1391626127, 'question_preview', 'markdp', '2', NULL),
(206, 0, 1391626127, 'question_preview', 'feedback', '1', NULL),
(207, 0, 1391626127, 'question_preview', 'generalfeedback', '1', NULL),
(208, 0, 1391626127, 'question_preview', 'rightanswer', '1', NULL),
(209, 0, 1391626127, 'question_preview', 'history', '0', NULL),
(210, 0, 1391626127, 'cachestore_memcache', 'testservers', '', NULL),
(211, 0, 1391626128, 'cachestore_memcached', 'testservers', '', NULL),
(212, 0, 1391626128, 'cachestore_mongodb', 'testserver', '', NULL),
(213, 0, 1391626128, NULL, 'allowbeforeblock', '0', NULL),
(214, 0, 1391626128, NULL, 'allowedip', '', NULL),
(215, 0, 1391626128, NULL, 'blockedip', '', NULL),
(216, 0, 1391626128, NULL, 'protectusernames', '1', NULL),
(217, 0, 1391626129, NULL, 'forcelogin', '0', NULL),
(218, 0, 1391626130, NULL, 'forceloginforprofiles', '1', NULL),
(219, 0, 1391626131, NULL, 'forceloginforprofileimage', '0', NULL),
(220, 0, 1391626131, NULL, 'opentogoogle', '0', NULL),
(221, 0, 1391626131, NULL, 'maxbytes', '0', NULL),
(222, 0, 1391626131, NULL, 'userquota', '104857600', NULL),
(223, 0, 1391626132, NULL, 'allowobjectembed', '0', NULL),
(224, 0, 1391626132, NULL, 'enabletrusttext', '0', NULL),
(225, 0, 1391626132, NULL, 'maxeditingtime', '1800', NULL),
(226, 0, 1391626132, NULL, 'extendedusernamechars', '0', NULL),
(227, 0, 1391626133, NULL, 'sitepolicy', '', NULL),
(228, 0, 1391626133, NULL, 'sitepolicyguest', '', NULL),
(229, 0, 1391626133, NULL, 'keeptagnamecase', '1', NULL),
(230, 0, 1391626134, NULL, 'profilesforenrolledusersonly', '1', NULL),
(231, 0, 1391626134, NULL, 'cronclionly', '0', NULL),
(232, 0, 1391626134, NULL, 'cronremotepassword', '', NULL),
(233, 0, 1391626134, NULL, 'lockoutthreshold', '0', NULL),
(234, 0, 1391626135, NULL, 'lockoutwindow', '1800', NULL),
(235, 0, 1391626135, NULL, 'lockoutduration', '1800', NULL),
(236, 0, 1391626135, NULL, 'passwordpolicy', '1', NULL),
(237, 0, 1391626136, NULL, 'minpasswordlength', '8', NULL),
(238, 0, 1391626137, NULL, 'minpassworddigits', '1', NULL),
(239, 0, 1391626137, NULL, 'minpasswordlower', '1', NULL),
(240, 0, 1391626138, NULL, 'minpasswordupper', '1', NULL),
(241, 0, 1391626138, NULL, 'minpasswordnonalphanum', '1', NULL),
(242, 0, 1391626138, NULL, 'maxconsecutiveidentchars', '0', NULL),
(243, 0, 1391626138, NULL, 'pwresettime', '1800', NULL),
(244, 0, 1391626139, NULL, 'groupenrolmentkeypolicy', '1', NULL),
(245, 0, 1391626140, NULL, 'disableuserimages', '0', NULL),
(246, 0, 1391626140, NULL, 'emailchangeconfirmation', '1', NULL),
(247, 0, 1391626140, NULL, 'rememberusername', '2', NULL),
(248, 0, 1391626140, NULL, 'strictformsrequired', '0', NULL),
(249, 0, 1391626141, NULL, 'loginhttps', '0', NULL),
(250, 0, 1391626142, NULL, 'cookiesecure', '0', NULL),
(251, 0, 1391626142, NULL, 'cookiehttponly', '0', NULL),
(252, 0, 1391626142, NULL, 'allowframembedding', '0', NULL),
(253, 0, 1391626142, NULL, 'loginpasswordautocomplete', '0', NULL),
(254, 0, 1391626143, NULL, 'displayloginfailures', '', NULL),
(255, 0, 1391626143, NULL, 'notifyloginfailures', '', NULL),
(256, 0, 1391626143, NULL, 'notifyloginthreshold', '10', NULL),
(257, 0, 1391626143, NULL, 'runclamonupload', '0', NULL),
(258, 0, 1391626144, NULL, 'pathtoclam', '', NULL),
(259, 0, 1391626144, NULL, 'quarantinedir', '', NULL),
(260, 0, 1391626144, NULL, 'clamfailureonupload', 'donothing', NULL),
(261, 0, 1391626145, NULL, 'themelist', '', NULL),
(262, 0, 1391626145, NULL, 'themedesignermode', '0', NULL),
(263, 0, 1391626146, NULL, 'allowuserthemes', '0', NULL),
(264, 0, 1391626146, NULL, 'allowcoursethemes', '0', NULL),
(265, 0, 1391626146, NULL, 'allowcategorythemes', '0', NULL),
(266, 0, 1391626146, NULL, 'allowthemechangeonurl', '0', NULL),
(267, 0, 1391626146, NULL, 'allowuserblockhiding', '1', NULL),
(268, 0, 1391626147, NULL, 'allowblockstodock', '1', NULL),
(269, 0, 1391626147, NULL, 'custommenuitems', '', NULL),
(270, 0, 1391626147, NULL, 'enabledevicedetection', '1', NULL),
(271, 0, 1391626148, NULL, 'devicedetectregex', '[]', NULL),
(272, 0, 1391626148, 'theme_afterburner', 'logo', '', NULL),
(273, 0, 1391626148, 'theme_afterburner', 'footnote', '', NULL),
(274, 0, 1391626148, 'theme_afterburner', 'customcss', '', NULL),
(275, 0, 1391626148, 'theme_anomaly', 'tagline', '', NULL),
(276, 0, 1391626149, 'theme_anomaly', 'customcss', '', NULL),
(277, 0, 1391626149, 'theme_arialist', 'logo', '', NULL),
(278, 0, 1391626150, 'theme_arialist', 'tagline', '', NULL),
(279, 0, 1391626150, 'theme_arialist', 'linkcolor', '#f25f0f', NULL),
(280, 0, 1391626150, 'theme_arialist', 'regionwidth', '250', NULL),
(281, 0, 1391626151, 'theme_arialist', 'customcss', '', NULL),
(282, 0, 1391626151, 'theme_brick', 'logo', '', NULL),
(283, 0, 1391626152, 'theme_brick', 'linkcolor', '#06365b', NULL),
(284, 0, 1391626153, 'theme_brick', 'linkhover', '#5487ad', NULL),
(285, 0, 1391626153, 'theme_brick', 'maincolor', '#8e2800', NULL),
(286, 0, 1391626153, 'theme_brick', 'maincolorlink', '#fff0a5', NULL),
(287, 0, 1391626154, 'theme_brick', 'headingcolor', '#5c3500', NULL),
(288, 0, 1391626154, 'theme_clean', 'invert', '0', NULL),
(289, 0, 1391626154, 'theme_clean', 'logo', '', NULL),
(290, 0, 1391626154, 'theme_clean', 'customcss', '', NULL),
(291, 0, 1391626155, 'theme_clean', 'footnote', '', NULL),
(292, 0, 1391626155, 'theme_formal_white', 'fontsizereference', '13', NULL),
(293, 0, 1391626155, 'theme_formal_white', 'noframe', '0', NULL),
(294, 0, 1391626156, 'theme_formal_white', 'framemargin', '15', NULL),
(295, 0, 1391626156, 'theme_formal_white', 'headercontent', '1', NULL),
(296, 0, 1391626156, 'theme_formal_white', 'trendcolor', 'mink', NULL),
(297, 0, 1391626156, 'theme_formal_white', 'customlogourl', '', NULL),
(298, 0, 1391626157, 'theme_formal_white', 'frontpagelogourl', '', NULL),
(299, 0, 1391626157, 'theme_formal_white', 'headerbgc', '#E3DFD4', NULL),
(300, 0, 1391626158, 'theme_formal_white', 'creditstomoodleorg', '2', NULL),
(301, 0, 1391626158, 'theme_formal_white', 'blockcolumnwidth', '200', NULL),
(302, 0, 1391626158, 'theme_formal_white', 'blockpadding', '8', NULL),
(303, 0, 1391626159, 'theme_formal_white', 'blockcontentbgc', '#F6F6F6', NULL),
(304, 0, 1391626159, 'theme_formal_white', 'lblockcolumnbgc', '#E3DFD4', NULL),
(305, 0, 1391626160, 'theme_formal_white', 'rblockcolumnbgc', '', NULL),
(306, 0, 1391626160, 'theme_formal_white', 'footnote', '', NULL),
(307, 0, 1391626160, 'theme_formal_white', 'customcss', '', NULL),
(308, 0, 1391626161, 'theme_fusion', 'linkcolor', '#2d83d5', NULL),
(309, 0, 1391626161, 'theme_fusion', 'tagline', '', NULL),
(310, 0, 1391626161, 'theme_fusion', 'footertext', '', NULL),
(311, 0, 1391626161, 'theme_fusion', 'customcss', '', NULL),
(312, 0, 1391626162, 'theme_magazine', 'background', '', NULL),
(313, 0, 1391626162, 'theme_magazine', 'logo', '', NULL),
(314, 0, 1391626162, 'theme_magazine', 'linkcolor', '#32529a', NULL),
(315, 0, 1391626162, 'theme_magazine', 'linkhover', '#4e2300', NULL),
(316, 0, 1391626162, 'theme_magazine', 'maincolor', '#002f2f', NULL),
(317, 0, 1391626162, 'theme_magazine', 'maincoloraccent', '#092323', NULL),
(318, 0, 1391626163, 'theme_magazine', 'headingcolor', '#4e0000', NULL),
(319, 0, 1391626164, 'theme_magazine', 'blockcolor', '#002f2f', NULL),
(320, 0, 1391626165, 'theme_magazine', 'forumback', '#e6e2af', NULL),
(321, 0, 1391626165, 'theme_nimble', 'tagline', '', NULL),
(322, 0, 1391626165, 'theme_nimble', 'footerline', '', NULL),
(323, 0, 1391626166, 'theme_nimble', 'backgroundcolor', '#454545', NULL),
(324, 0, 1391626166, 'theme_nimble', 'linkcolor', '#2a65b1', NULL),
(325, 0, 1391626166, 'theme_nimble', 'linkhover', '#222222', NULL),
(326, 0, 1391626167, 'theme_nonzero', 'regionprewidth', '200', NULL),
(327, 0, 1391626168, 'theme_nonzero', 'regionpostwidth', '200', NULL),
(328, 0, 1391626168, 'theme_nonzero', 'customcss', '', NULL),
(329, 0, 1391626168, 'theme_overlay', 'linkcolor', '#428ab5', NULL),
(330, 0, 1391626168, 'theme_overlay', 'headercolor', '#2a4c7b', NULL),
(331, 0, 1391626169, 'theme_overlay', 'footertext', '', NULL),
(332, 0, 1391626169, 'theme_overlay', 'customcss', '', NULL),
(333, 0, 1391626169, 'theme_sky_high', 'logo', '', NULL),
(334, 0, 1391626170, 'theme_sky_high', 'regionwidth', '240', NULL),
(335, 0, 1391626170, 'theme_sky_high', 'footnote', '', NULL),
(336, 0, 1391626170, 'theme_sky_high', 'customcss', '', NULL),
(337, 0, 1391626170, 'theme_splash', 'logo', '', NULL),
(338, 0, 1391626170, 'theme_splash', 'tagline', 'Virtual learning center', NULL),
(339, 0, 1391626170, 'theme_splash', 'hide_tagline', '0', NULL),
(340, 0, 1391626170, 'theme_splash', 'footnote', '', NULL),
(341, 0, 1391626171, 'theme_splash', 'customcss', '', NULL),
(342, 0, 1391626171, NULL, 'calendar_adminseesall', '0', NULL),
(343, 0, 1391626171, NULL, 'calendar_site_timeformat', '0', NULL),
(344, 0, 1391626171, NULL, 'calendar_startwday', '0', NULL),
(345, 0, 1391626171, NULL, 'calendar_weekend', '65', NULL),
(346, 0, 1391626171, NULL, 'calendar_lookahead', '21', NULL),
(347, 0, 1391626171, NULL, 'calendar_maxevents', '10', NULL),
(348, 0, 1391626172, NULL, 'enablecalendarexport', '1', NULL),
(349, 0, 1391626172, NULL, 'calendar_customexport', '1', NULL),
(350, 0, 1391626172, NULL, 'calendar_exportlookahead', '365', NULL),
(351, 0, 1391626172, NULL, 'calendar_exportlookback', '5', NULL),
(352, 0, 1391626172, NULL, 'calendar_exportsalt', 'KNnPKYkZlFKAa4DkJyxulfCkuqfrIa1dYUu4vVFJKmxkK3yhKbifXjPrxn4t', NULL),
(353, 0, 1391626172, NULL, 'calendar_showicalsource', '1', NULL),
(354, 0, 1391626172, NULL, 'useblogassociations', '1', NULL),
(355, 0, 1391626173, NULL, 'bloglevel', '4', NULL),
(356, 0, 1391626173, NULL, 'useexternalblogs', '1', NULL),
(357, 0, 1391626173, NULL, 'externalblogcrontime', '86400', NULL),
(358, 0, 1391626173, NULL, 'maxexternalblogsperuser', '1', NULL),
(359, 0, 1391626174, NULL, 'blogusecomments', '1', NULL),
(360, 0, 1391626174, NULL, 'blogshowcommentscount', '1', NULL),
(361, 0, 1391626174, NULL, 'defaulthomepage', '0', NULL),
(362, 0, 1391626175, NULL, 'allowguestmymoodle', '1', NULL),
(363, 0, 1391626175, NULL, 'navshowfullcoursenames', '0', NULL),
(364, 0, 1391626176, NULL, 'navshowcategories', '1', NULL),
(365, 0, 1391626177, NULL, 'navshowmycoursecategories', '0', NULL),
(366, 0, 1391626177, NULL, 'navshowallcourses', '0', NULL),
(367, 0, 1391626178, NULL, 'navsortmycoursessort', 'sortorder', NULL),
(368, 0, 1391626183, NULL, 'navcourselimit', '20', NULL),
(369, 0, 1391626184, NULL, 'usesitenameforsitepages', '0', NULL),
(370, 0, 1391626184, NULL, 'linkadmincategories', '0', NULL),
(371, 0, 1391626185, NULL, 'navshowfrontpagemods', '1', NULL),
(372, 0, 1391626185, NULL, 'navadduserpostslinks', '1', NULL),
(373, 0, 1391626185, NULL, 'formatstringstriptags', '1', NULL),
(374, 0, 1391626186, NULL, 'emoticons', '[{"text":":-)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":-D","imagename":"s\\/biggrin","imagecomponent":"core","altidentifier":"biggrin","altcomponent":"core_pix"},{"text":";-)","imagename":"s\\/wink","imagecomponent":"core","altidentifier":"wink","altcomponent":"core_pix"},{"text":":-\\/","imagename":"s\\/mixed","imagecomponent":"core","altidentifier":"mixed","altcomponent":"core_pix"},{"text":"V-.","imagename":"s\\/thoughtful","imagecomponent":"core","altidentifier":"thoughtful","altcomponent":"core_pix"},{"text":":-P","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":":-p","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":"B-)","imagename":"s\\/cool","imagecomponent":"core","altidentifier":"cool","altcomponent":"core_pix"},{"text":"^-)","imagename":"s\\/approve","imagecomponent":"core","altidentifier":"approve","altcomponent":"core_pix"},{"text":"8-)","imagename":"s\\/wideeyes","imagecomponent":"core","altidentifier":"wideeyes","altcomponent":"core_pix"},{"text":":o)","imagename":"s\\/clown","imagecomponent":"core","altidentifier":"clown","altcomponent":"core_pix"},{"text":":-(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":":(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":"8-.","imagename":"s\\/shy","imagecomponent":"core","altidentifier":"shy","altcomponent":"core_pix"},{"text":":-I","imagename":"s\\/blush","imagecomponent":"core","altidentifier":"blush","altcomponent":"core_pix"},{"text":":-X","imagename":"s\\/kiss","imagecomponent":"core","altidentifier":"kiss","altcomponent":"core_pix"},{"text":"8-o","imagename":"s\\/surprise","imagecomponent":"core","altidentifier":"surprise","altcomponent":"core_pix"},{"text":"P-|","imagename":"s\\/blackeye","imagecomponent":"core","altidentifier":"blackeye","altcomponent":"core_pix"},{"text":"8-[","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"(grr)","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"xx-P","imagename":"s\\/dead","imagecomponent":"core","altidentifier":"dead","altcomponent":"core_pix"},{"text":"|-.","imagename":"s\\/sleepy","imagecomponent":"core","altidentifier":"sleepy","altcomponent":"core_pix"},{"text":"}-]","imagename":"s\\/evil","imagecomponent":"core","altidentifier":"evil","altcomponent":"core_pix"},{"text":"(h)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(heart)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(y)","imagename":"s\\/yes","imagecomponent":"core","altidentifier":"yes","altcomponent":"core"},{"text":"(n)","imagename":"s\\/no","imagecomponent":"core","altidentifier":"no","altcomponent":"core"},{"text":"(martin)","imagename":"s\\/martin","imagecomponent":"core","altidentifier":"martin","altcomponent":"core_pix"},{"text":"( )","imagename":"s\\/egg","imagecomponent":"core","altidentifier":"egg","altcomponent":"core_pix"}]', NULL),
(375, 0, 1391626186, NULL, 'core_media_enable_youtube', '1', NULL),
(376, 0, 1391626187, NULL, 'core_media_enable_vimeo', '0', NULL),
(377, 0, 1391626188, NULL, 'core_media_enable_mp3', '1', NULL),
(378, 0, 1391626188, NULL, 'core_media_enable_flv', '1', NULL),
(379, 0, 1391626188, NULL, 'core_media_enable_swf', '1', NULL),
(380, 0, 1391626188, NULL, 'core_media_enable_html5audio', '1', NULL),
(381, 0, 1391626188, NULL, 'core_media_enable_html5video', '1', NULL),
(382, 0, 1391626188, NULL, 'core_media_enable_qt', '1', NULL),
(383, 0, 1391626189, NULL, 'core_media_enable_wmp', '1', NULL),
(384, 0, 1391626189, NULL, 'core_media_enable_rm', '1', NULL),
(385, 0, 1391626189, NULL, 'docroot', 'http://docs.moodle.org', NULL),
(386, 0, 1391626189, NULL, 'doctonewwindow', '0', NULL),
(387, 0, 1391626189, NULL, 'courselistshortnames', '0', NULL),
(388, 0, 1391626189, NULL, 'coursesperpage', '20', NULL),
(389, 0, 1391626190, NULL, 'courseswithsummarieslimit', '10', NULL),
(390, 0, 1391626190, NULL, 'courseoverviewfileslimit', '1', NULL),
(391, 0, 1391626190, NULL, 'courseoverviewfilesext', '.jpg,.gif,.png', NULL),
(392, 0, 1391626191, NULL, 'enableajax', '1', NULL),
(393, 0, 1391626191, NULL, 'useexternalyui', '0', NULL),
(394, 0, 1391626192, NULL, 'yuicomboloading', '1', NULL),
(395, 0, 1391626192, NULL, 'cachejs', '1', NULL),
(396, 0, 1391626193, NULL, 'modchooserdefault', '1', NULL),
(397, 0, 1391626193, NULL, 'modeditingmenu', '1', NULL),
(398, 0, 1391626193, NULL, 'blockeditingmenu', '1', NULL),
(399, 0, 1391626193, NULL, 'additionalhtmlhead', '', NULL),
(400, 0, 1391626193, NULL, 'additionalhtmltopofbody', '', NULL),
(401, 0, 1391626193, NULL, 'additionalhtmlfooter', '', NULL),
(402, 0, 1391626194, NULL, 'pathtodu', '', NULL),
(403, 0, 1391626194, NULL, 'aspellpath', '', NULL),
(404, 0, 1391626194, NULL, 'pathtodot', '', NULL),
(405, 0, 1391626194, NULL, 'supportpage', '', NULL),
(406, 0, 1391626194, NULL, 'dbsessions', '0', NULL),
(407, 0, 1391626194, NULL, 'sessioncookie', '', NULL),
(408, 0, 1391626194, NULL, 'sessioncookiepath', '', NULL),
(409, 0, 1391626194, NULL, 'sessioncookiedomain', '', NULL),
(410, 0, 1391626194, NULL, 'statsfirstrun', 'none', NULL),
(411, 0, 1391626195, NULL, 'statsmaxruntime', '0', NULL),
(412, 0, 1391626195, NULL, 'statsruntimedays', '31', NULL),
(413, 0, 1391626195, NULL, 'statsruntimestarthour', '0', NULL),
(414, 0, 1391626195, NULL, 'statsruntimestartminute', '0', NULL),
(415, 0, 1391626195, NULL, 'statsuserthreshold', '0', NULL),
(416, 0, 1391626195, NULL, 'slasharguments', '1', NULL),
(417, 0, 1391626195, NULL, 'getremoteaddrconf', '0', NULL),
(418, 0, 1391626195, NULL, 'proxyhost', '', NULL),
(419, 0, 1391626195, NULL, 'proxyport', '0', NULL),
(420, 0, 1391626196, NULL, 'proxytype', 'HTTP', NULL),
(421, 0, 1391626196, NULL, 'proxyuser', '', NULL),
(422, 0, 1391626196, NULL, 'proxypassword', '', NULL),
(423, 0, 1391626196, NULL, 'proxybypass', 'localhost, 127.0.0.1', NULL),
(424, 0, 1391626196, NULL, 'maintenance_enabled', '0', NULL),
(425, 0, 1391626196, NULL, 'maintenance_message', '', NULL),
(426, 0, 1391626196, NULL, 'deleteunconfirmed', '168', NULL),
(427, 0, 1391626196, NULL, 'deleteincompleteusers', '0', NULL),
(428, 0, 1391626196, NULL, 'logguests', '1', NULL),
(429, 0, 1391626196, NULL, 'loglifetime', '0', NULL),
(430, 0, 1391626197, NULL, 'disablegradehistory', '0', NULL),
(431, 0, 1391626197, NULL, 'gradehistorylifetime', '0', NULL),
(432, 0, 1391626197, NULL, 'extramemorylimit', '512M', NULL),
(433, 0, 1391626197, NULL, 'curlcache', '120', NULL),
(434, 0, 1391626197, NULL, 'curltimeoutkbitrate', '56', NULL),
(435, 0, 1391626197, NULL, 'updateautocheck', '1', NULL),
(436, 0, 1391626197, NULL, 'updateautodeploy', '0', NULL),
(437, 0, 1391626197, NULL, 'updateminmaturity', '200', NULL),
(438, 0, 1391626197, NULL, 'updatenotifybuilds', '0', NULL),
(439, 0, 1391626197, NULL, 'enablesafebrowserintegration', '0', NULL),
(440, 0, 1391626198, NULL, 'enablegroupmembersonly', '0', NULL),
(441, 0, 1391626198, NULL, 'dndallowtextandlinks', '0', NULL),
(442, 0, 1391626198, NULL, 'enablecssoptimiser', '0', NULL),
(443, 0, 1391626198, NULL, 'enabletgzbackups', '0', NULL),
(444, 0, 1391626199, NULL, 'debug', '0', NULL),
(445, 0, 1391626199, NULL, 'debugdisplay', '0', NULL),
(446, 0, 1391626199, NULL, 'debugsmtp', '0', NULL),
(447, 0, 1391626199, NULL, 'perfdebug', '7', NULL),
(448, 0, 1391626199, NULL, 'debugstringids', '0', NULL),
(449, 0, 1391626199, NULL, 'debugvalidators', '0', NULL),
(450, 0, 1391626199, NULL, 'debugpageinfo', '0', NULL),
(451, 0, 1391626383, 'activitynames', 'filter_active', '1', ''),
(452, 0, 1391626385, 'mediaplugin', 'filter_active', '1', ''),
(453, 2, 1391627122, NULL, 'notloggedinroleid', '6', NULL),
(454, 2, 1391627122, NULL, 'guestroleid', '6', NULL),
(455, 2, 1391627122, NULL, 'defaultuserroleid', '7', NULL),
(456, 2, 1391627122, NULL, 'creatornewroleid', '3', NULL),
(457, 2, 1391627123, NULL, 'restorernewroleid', '3', NULL),
(458, 2, 1391627123, NULL, 'gradebookroles', '5', NULL),
(459, 2, 1391627123, 'assign', 'feedback_plugin_for_gradebook', 'assignfeedback_comments', NULL),
(460, 2, 1391627123, 'assign', 'showrecentsubmissions', '0', NULL),
(461, 2, 1391627123, 'assign', 'submissionreceipts', '1', NULL),
(462, 2, 1391627123, 'assign', 'submissionstatement', 'This assignment is my own work, except where I have acknowledged the use of the works of other people.', NULL),
(463, 2, 1391627123, 'assign', 'alwaysshowdescription', '1', NULL),
(464, 2, 1391627123, 'assign', 'alwaysshowdescription_adv', '', NULL),
(465, 2, 1391627123, 'assign', 'alwaysshowdescription_locked', '', NULL),
(466, 2, 1391627124, 'assign', 'allowsubmissionsfromdate', '0', NULL),
(467, 2, 1391627124, 'assign', 'allowsubmissionsfromdate_enabled', '1', NULL),
(468, 2, 1391627124, 'assign', 'allowsubmissionsfromdate_adv', '', NULL),
(469, 2, 1391627124, 'assign', 'duedate', '604800', NULL),
(470, 2, 1391627124, 'assign', 'duedate_enabled', '1', NULL),
(471, 2, 1391627124, 'assign', 'duedate_adv', '', NULL),
(472, 2, 1391627124, 'assign', 'cutoffdate', '1209600', NULL),
(473, 2, 1391627124, 'assign', 'cutoffdate_enabled', '', NULL),
(474, 2, 1391627124, 'assign', 'cutoffdate_adv', '', NULL),
(475, 2, 1391627125, 'assign', 'submissiondrafts', '0', NULL),
(476, 2, 1391627125, 'assign', 'submissiondrafts_adv', '', NULL),
(477, 2, 1391627125, 'assign', 'submissiondrafts_locked', '', NULL),
(478, 2, 1391627125, 'assign', 'requiresubmissionstatement', '0', NULL),
(479, 2, 1391627125, 'assign', 'requiresubmissionstatement_adv', '', NULL),
(480, 2, 1391627125, 'assign', 'requiresubmissionstatement_locked', '', NULL),
(481, 2, 1391627125, 'assign', 'attemptreopenmethod', 'none', NULL),
(482, 2, 1391627125, 'assign', 'attemptreopenmethod_adv', '', NULL),
(483, 2, 1391627125, 'assign', 'attemptreopenmethod_locked', '', NULL),
(484, 2, 1391627125, 'assign', 'maxattempts', '-1', NULL),
(485, 2, 1391627126, 'assign', 'maxattempts_adv', '', NULL),
(486, 2, 1391627126, 'assign', 'maxattempts_locked', '', NULL),
(487, 2, 1391627126, 'assign', 'teamsubmission', '0', NULL),
(488, 2, 1391627126, 'assign', 'teamsubmission_adv', '', NULL),
(489, 2, 1391627126, 'assign', 'teamsubmission_locked', '', NULL),
(490, 2, 1391627126, 'assign', 'requireallteammemberssubmit', '0', NULL),
(491, 2, 1391627126, 'assign', 'requireallteammemberssubmit_adv', '', NULL),
(492, 2, 1391627126, 'assign', 'requireallteammemberssubmit_locked', '', NULL),
(493, 2, 1391627127, 'assign', 'teamsubmissiongroupingid', '', NULL),
(494, 2, 1391627127, 'assign', 'teamsubmissiongroupingid_adv', '', NULL),
(495, 2, 1391627127, 'assign', 'sendnotifications', '0', NULL),
(496, 2, 1391627127, 'assign', 'sendnotifications_adv', '', NULL),
(497, 2, 1391627127, 'assign', 'sendnotifications_locked', '', NULL),
(498, 2, 1391627127, 'assign', 'sendlatenotifications', '0', NULL),
(499, 2, 1391627127, 'assign', 'sendlatenotifications_adv', '', NULL),
(500, 2, 1391627127, 'assign', 'sendlatenotifications_locked', '', NULL),
(501, 2, 1391627127, 'assign', 'blindmarking', '0', NULL),
(502, 2, 1391627127, 'assign', 'blindmarking_adv', '', NULL),
(503, 2, 1391627128, 'assign', 'blindmarking_locked', '', NULL),
(504, 2, 1391627128, 'assign', 'markingworkflow', '0', NULL),
(505, 2, 1391627128, 'assign', 'markingworkflow_adv', '', NULL),
(506, 2, 1391627128, 'assign', 'markingworkflow_locked', '', NULL),
(507, 2, 1391627128, 'assign', 'markingallocation', '0', NULL),
(508, 2, 1391627128, 'assign', 'markingallocation_adv', '', NULL),
(509, 2, 1391627128, 'assign', 'markingallocation_locked', '', NULL),
(510, 2, 1391627128, 'assignsubmission_file', 'default', '1', NULL),
(511, 2, 1391627128, 'assignsubmission_file', 'maxbytes', '1048576', NULL),
(512, 2, 1391627128, 'assignsubmission_onlinetext', 'default', '0', NULL),
(513, 2, 1391627129, 'assignfeedback_comments', 'default', '1', NULL),
(514, 2, 1391627130, 'assignfeedback_editpdf', 'stamps', '', NULL),
(515, 2, 1391627130, 'assignfeedback_editpdf', 'gspath', '/usr/bin/gs', NULL),
(516, 2, 1391627130, 'assignfeedback_file', 'default', '0', NULL),
(517, 2, 1391627131, 'assignfeedback_offline', 'default', '0', NULL),
(518, 2, 1391627131, NULL, 'assignment_maxbytes', '1048576', NULL),
(519, 2, 1391627131, NULL, 'assignment_itemstocount', '1', NULL),
(520, 2, 1391627131, NULL, 'assignment_showrecentsubmissions', '1', NULL),
(521, 2, 1391627132, 'book', 'requiremodintro', '1', NULL),
(522, 2, 1391627132, 'book', 'numberingoptions', '0,1,2,3', NULL),
(523, 2, 1391627132, 'book', 'numbering', '1', NULL),
(524, 2, 1391627132, NULL, 'chat_method', 'ajax', NULL),
(525, 2, 1391627132, NULL, 'chat_refresh_userlist', '10', NULL),
(526, 2, 1391627132, NULL, 'chat_old_ping', '35', NULL),
(527, 2, 1391627133, NULL, 'chat_refresh_room', '5', NULL),
(528, 2, 1391627133, NULL, 'chat_normal_updatemode', 'jsupdate', NULL),
(529, 2, 1391627133, NULL, 'chat_serverhost', 'localhost', NULL),
(530, 2, 1391627133, NULL, 'chat_serverip', '127.0.0.1', NULL),
(531, 2, 1391627133, NULL, 'chat_serverport', '9111', NULL),
(532, 2, 1391627134, NULL, 'chat_servermax', '100', NULL),
(533, 2, 1391627134, NULL, 'data_enablerssfeeds', '0', NULL),
(534, 2, 1391627134, NULL, 'feedback_allowfullanonymous', '0', NULL),
(535, 2, 1391627134, 'folder', 'requiremodintro', '1', NULL),
(536, 2, 1391627134, 'folder', 'showexpanded', '1', NULL),
(537, 2, 1391627135, NULL, 'forum_displaymode', '3', NULL),
(538, 2, 1391627135, NULL, 'forum_replytouser', '1', NULL),
(539, 2, 1391627135, NULL, 'forum_shortpost', '300', NULL),
(540, 2, 1391627135, NULL, 'forum_longpost', '600', NULL),
(541, 2, 1391627135, NULL, 'forum_manydiscussions', '100', NULL),
(542, 2, 1391627135, NULL, 'forum_maxbytes', '512000', NULL),
(543, 2, 1391627135, NULL, 'forum_maxattachments', '9', NULL),
(544, 2, 1391627136, NULL, 'forum_trackingtype', '1', NULL),
(545, 2, 1391627136, NULL, 'forum_trackreadposts', '1', NULL),
(546, 2, 1391627136, NULL, 'forum_allowforcedreadtracking', '0', NULL),
(547, 2, 1391627136, NULL, 'forum_oldpostdays', '14', NULL),
(548, 2, 1391627137, NULL, 'forum_usermarksread', '0', NULL),
(549, 2, 1391627137, NULL, 'forum_cleanreadtime', '2', NULL),
(550, 2, 1391627137, NULL, 'digestmailtime', '17', NULL),
(551, 2, 1391627137, NULL, 'forum_enablerssfeeds', '0', NULL),
(552, 2, 1391627137, NULL, 'forum_enabletimedposts', '0', NULL),
(553, 2, 1391627138, NULL, 'glossary_entbypage', '10', NULL),
(554, 2, 1391627138, NULL, 'glossary_dupentries', '0', NULL),
(555, 2, 1391627138, NULL, 'glossary_allowcomments', '0', NULL),
(556, 2, 1391627138, NULL, 'glossary_linkbydefault', '1', NULL),
(557, 2, 1391627138, NULL, 'glossary_defaultapproval', '1', NULL),
(558, 2, 1391627138, NULL, 'glossary_enablerssfeeds', '0', NULL),
(559, 2, 1391627138, NULL, 'glossary_linkentries', '0', NULL),
(560, 2, 1391627139, NULL, 'glossary_casesensitive', '0', NULL),
(561, 2, 1391627139, NULL, 'glossary_fullmatch', '0', NULL),
(562, 2, 1391627139, 'imscp', 'requiremodintro', '1', NULL),
(563, 2, 1391627139, 'imscp', 'keepold', '1', NULL),
(564, 2, 1391627140, 'imscp', 'keepold_adv', '', NULL),
(565, 2, 1391627140, 'label', 'dndmedia', '1', NULL),
(566, 2, 1391627140, 'label', 'dndresizewidth', '400', NULL),
(567, 2, 1391627140, 'label', 'dndresizeheight', '400', NULL),
(568, 2, 1391627140, NULL, 'lesson_slideshowwidth', '640', NULL),
(569, 2, 1391627141, NULL, 'lesson_slideshowheight', '480', NULL),
(570, 2, 1391627142, NULL, 'lesson_slideshowbgcolor', '#FFFFFF', NULL),
(571, 2, 1391627142, NULL, 'lesson_mediawidth', '640', NULL),
(572, 2, 1391627142, NULL, 'lesson_mediaheight', '480', NULL),
(573, 2, 1391627142, NULL, 'lesson_mediaclose', '0', NULL),
(574, 2, 1391627142, NULL, 'lesson_maxhighscores', '10', NULL),
(575, 2, 1391627142, NULL, 'lesson_maxanswers', '4', NULL),
(576, 2, 1391627142, NULL, 'lesson_defaultnextpage', '0', NULL),
(577, 2, 1391627143, 'page', 'requiremodintro', '1', NULL),
(578, 2, 1391627143, 'page', 'displayoptions', '5', NULL),
(579, 2, 1391627143, 'page', 'printintro', '0', NULL),
(580, 2, 1391627143, 'page', 'display', '5', NULL),
(581, 2, 1391627143, 'page', 'popupwidth', '620', NULL),
(582, 2, 1391627143, 'page', 'popupheight', '450', NULL),
(583, 2, 1391627143, 'quiz', 'timelimit', '0', NULL),
(584, 2, 1391627143, 'quiz', 'timelimit_adv', '', NULL),
(585, 2, 1391627143, 'quiz', 'overduehandling', 'autoabandon', NULL),
(586, 2, 1391627143, 'quiz', 'overduehandling_adv', '', NULL),
(587, 2, 1391627143, 'quiz', 'graceperiod', '86400', NULL),
(588, 2, 1391627144, 'quiz', 'graceperiod_adv', '', NULL),
(589, 2, 1391627144, 'quiz', 'graceperiodmin', '60', NULL),
(590, 2, 1391627144, 'quiz', 'attempts', '0', NULL),
(591, 2, 1391627144, 'quiz', 'attempts_adv', '', NULL),
(592, 2, 1391627144, 'quiz', 'grademethod', '1', NULL),
(593, 2, 1391627144, 'quiz', 'grademethod_adv', '', NULL),
(594, 2, 1391627144, 'quiz', 'maximumgrade', '10', NULL),
(595, 2, 1391627144, 'quiz', 'shufflequestions', '0', NULL),
(596, 2, 1391627144, 'quiz', 'shufflequestions_adv', '', NULL),
(597, 2, 1391627145, 'quiz', 'questionsperpage', '1', NULL),
(598, 2, 1391627145, 'quiz', 'questionsperpage_adv', '', NULL),
(599, 2, 1391627145, 'quiz', 'navmethod', 'free', NULL),
(600, 2, 1391627145, 'quiz', 'navmethod_adv', '1', NULL),
(601, 2, 1391627145, 'quiz', 'shuffleanswers', '1', NULL),
(602, 2, 1391627145, 'quiz', 'shuffleanswers_adv', '', NULL),
(603, 2, 1391627145, 'quiz', 'preferredbehaviour', 'deferredfeedback', NULL),
(604, 2, 1391627145, 'quiz', 'attemptonlast', '0', NULL),
(605, 2, 1391627145, 'quiz', 'attemptonlast_adv', '1', NULL),
(606, 2, 1391627145, 'quiz', 'reviewattempt', '69904', NULL),
(607, 2, 1391627145, 'quiz', 'reviewcorrectness', '69904', NULL),
(608, 2, 1391627146, 'quiz', 'reviewmarks', '69904', NULL),
(609, 2, 1391627146, 'quiz', 'reviewspecificfeedback', '69904', NULL),
(610, 2, 1391627146, 'quiz', 'reviewgeneralfeedback', '69904', NULL),
(611, 2, 1391627146, 'quiz', 'reviewrightanswer', '69904', NULL),
(612, 2, 1391627146, 'quiz', 'reviewoverallfeedback', '4368', NULL),
(613, 2, 1391627146, 'quiz', 'showuserpicture', '0', NULL),
(614, 2, 1391627146, 'quiz', 'showuserpicture_adv', '', NULL),
(615, 2, 1391627146, 'quiz', 'decimalpoints', '2', NULL),
(616, 2, 1391627146, 'quiz', 'decimalpoints_adv', '', NULL),
(617, 2, 1391627146, 'quiz', 'questiondecimalpoints', '-1', NULL),
(618, 2, 1391627146, 'quiz', 'questiondecimalpoints_adv', '1', NULL),
(619, 2, 1391627146, 'quiz', 'showblocks', '0', NULL),
(620, 2, 1391627147, 'quiz', 'showblocks_adv', '1', NULL),
(621, 2, 1391627147, 'quiz', 'password', '', NULL),
(622, 2, 1391627147, 'quiz', 'password_adv', '1', NULL),
(623, 2, 1391627147, 'quiz', 'subnet', '', NULL),
(624, 2, 1391627147, 'quiz', 'subnet_adv', '1', NULL),
(625, 2, 1391627147, 'quiz', 'delay1', '0', NULL),
(626, 2, 1391627147, 'quiz', 'delay1_adv', '1', NULL),
(627, 2, 1391627147, 'quiz', 'delay2', '0', NULL),
(628, 2, 1391627147, 'quiz', 'delay2_adv', '1', NULL),
(629, 2, 1391627147, 'quiz', 'browsersecurity', '-', NULL),
(630, 2, 1391627147, 'quiz', 'browsersecurity_adv', '1', NULL),
(631, 2, 1391627148, 'quiz', 'autosaveperiod', '0', NULL),
(632, 2, 1391627148, 'resource', 'framesize', '130', NULL),
(633, 2, 1391627148, 'resource', 'requiremodintro', '1', NULL),
(634, 2, 1391627148, 'resource', 'displayoptions', '0,1,4,5,6', NULL),
(635, 2, 1391627148, 'resource', 'printintro', '1', NULL),
(636, 2, 1391627148, 'resource', 'display', '0', NULL),
(637, 2, 1391627148, 'resource', 'showsize', '0', NULL),
(638, 2, 1391627148, 'resource', 'showtype', '0', NULL),
(639, 2, 1391627148, 'resource', 'popupwidth', '620', NULL),
(640, 2, 1391627148, 'resource', 'popupheight', '450', NULL),
(641, 2, 1391627148, 'resource', 'filterfiles', '0', NULL),
(642, 2, 1391627149, 'scorm', 'displaycoursestructure', '0', NULL),
(643, 2, 1391627149, 'scorm', 'displaycoursestructure_adv', '', NULL),
(644, 2, 1391627149, 'scorm', 'popup', '0', NULL),
(645, 2, 1391627149, 'scorm', 'popup_adv', '', NULL),
(646, 2, 1391627149, 'scorm', 'framewidth', '100', NULL),
(647, 2, 1391627149, 'scorm', 'framewidth_adv', '1', NULL),
(648, 2, 1391627149, 'scorm', 'frameheight', '500', NULL),
(649, 2, 1391627149, 'scorm', 'frameheight_adv', '1', NULL),
(650, 2, 1391627149, 'scorm', 'winoptgrp_adv', '1', NULL),
(651, 2, 1391627149, 'scorm', 'scrollbars', '0', NULL),
(652, 2, 1391627149, 'scorm', 'directories', '0', NULL),
(653, 2, 1391627150, 'scorm', 'location', '0', NULL),
(654, 2, 1391627150, 'scorm', 'menubar', '0', NULL),
(655, 2, 1391627150, 'scorm', 'toolbar', '0', NULL),
(656, 2, 1391627150, 'scorm', 'status', '0', NULL),
(657, 2, 1391627150, 'scorm', 'skipview', '0', NULL),
(658, 2, 1391627150, 'scorm', 'skipview_adv', '1', NULL),
(659, 2, 1391627150, 'scorm', 'hidebrowse', '0', NULL),
(660, 2, 1391627150, 'scorm', 'hidebrowse_adv', '1', NULL),
(661, 2, 1391627150, 'scorm', 'hidetoc', '0', NULL),
(662, 2, 1391627150, 'scorm', 'hidetoc_adv', '1', NULL),
(663, 2, 1391627150, 'scorm', 'nav', '1', NULL),
(664, 2, 1391627150, 'scorm', 'nav_adv', '1', NULL),
(665, 2, 1391627151, 'scorm', 'navpositionleft', '-100', NULL),
(666, 2, 1391627151, 'scorm', 'navpositionleft_adv', '1', NULL),
(667, 2, 1391627151, 'scorm', 'navpositiontop', '-100', NULL),
(668, 2, 1391627151, 'scorm', 'navpositiontop_adv', '1', NULL),
(669, 2, 1391627151, 'scorm', 'collapsetocwinsize', '767', NULL),
(670, 2, 1391627151, 'scorm', 'collapsetocwinsize_adv', '1', NULL),
(671, 2, 1391627151, 'scorm', 'displayattemptstatus', '1', NULL),
(672, 2, 1391627151, 'scorm', 'displayattemptstatus_adv', '', NULL),
(673, 2, 1391627151, 'scorm', 'grademethod', '1', NULL),
(674, 2, 1391627151, 'scorm', 'maxgrade', '100', NULL),
(675, 2, 1391627151, 'scorm', 'maxattempt', '0', NULL),
(676, 2, 1391627151, 'scorm', 'whatgrade', '0', NULL),
(677, 2, 1391627152, 'scorm', 'forcecompleted', '0', NULL),
(678, 2, 1391627152, 'scorm', 'forcenewattempt', '0', NULL),
(679, 2, 1391627152, 'scorm', 'lastattemptlock', '0', NULL),
(680, 2, 1391627152, 'scorm', 'auto', '0', NULL),
(681, 2, 1391627152, 'scorm', 'updatefreq', '0', NULL),
(682, 2, 1391627153, 'scorm', 'allowtypeexternal', '0', NULL),
(683, 2, 1391627153, 'scorm', 'allowtypelocalsync', '0', NULL),
(684, 2, 1391627153, 'scorm', 'allowtypeexternalaicc', '0', NULL),
(685, 2, 1391627153, 'scorm', 'allowaicchacp', '0', NULL),
(686, 2, 1391627153, 'scorm', 'aicchacptimeout', '30', NULL),
(687, 2, 1391627153, 'scorm', 'aicchacpkeepsessiondata', '1', NULL),
(688, 2, 1391627153, 'scorm', 'forcejavascript', '1', NULL),
(689, 2, 1391627153, 'scorm', 'allowapidebug', '0', NULL),
(690, 2, 1391627153, 'scorm', 'apidebugmask', '.*', NULL),
(691, 2, 1391627153, 'url', 'framesize', '130', NULL),
(692, 2, 1391627154, 'url', 'requiremodintro', '1', NULL),
(693, 2, 1391627154, 'url', 'secretphrase', '', NULL),
(694, 2, 1391627154, 'url', 'rolesinparams', '0', NULL),
(695, 2, 1391627154, 'url', 'displayoptions', '0,1,5,6', NULL),
(696, 2, 1391627154, 'url', 'printintro', '1', NULL),
(697, 2, 1391627154, 'url', 'display', '0', NULL),
(698, 2, 1391627154, 'url', 'popupwidth', '620', NULL),
(699, 2, 1391627154, 'url', 'popupheight', '450', NULL),
(700, 2, 1391627154, 'workshop', 'grade', '80', NULL),
(701, 2, 1391627154, 'workshop', 'gradinggrade', '20', NULL),
(702, 2, 1391627154, 'workshop', 'gradedecimals', '0', NULL),
(703, 2, 1391627154, 'workshop', 'maxbytes', '0', NULL),
(704, 2, 1391627155, 'workshop', 'strategy', 'accumulative', NULL),
(705, 2, 1391627155, 'workshop', 'examplesmode', '0', NULL),
(706, 2, 1391627155, 'workshopallocation_random', 'numofreviews', '5', NULL),
(707, 2, 1391627155, 'workshopform_numerrors', 'grade0', 'No', NULL),
(708, 2, 1391627155, 'workshopform_numerrors', 'grade1', 'Yes', NULL),
(709, 2, 1391627155, 'workshopeval_best', 'comparison', '5', NULL),
(710, 2, 1391627155, 'format_singleactivity', 'activitytype', 'forum', NULL),
(711, 2, 1391627155, NULL, 'block_course_list_adminview', 'all', NULL),
(712, 2, 1391627156, NULL, 'block_course_list_hideallcourseslink', '0', NULL),
(713, 2, 1391627156, 'block_course_overview', 'defaultmaxcourses', '10', NULL),
(714, 2, 1391627156, 'block_course_overview', 'forcedefaultmaxcourses', '0', NULL),
(715, 2, 1391627156, 'block_course_overview', 'showchildren', '0', NULL),
(716, 2, 1391627156, 'block_course_overview', 'showwelcomearea', '0', NULL),
(717, 2, 1391627156, NULL, 'block_html_allowcssclasses', '0', NULL),
(718, 2, 1391627156, NULL, 'block_online_users_timetosee', '5', NULL),
(719, 2, 1391627156, NULL, 'block_rss_client_num_entries', '5', NULL),
(720, 2, 1391627156, NULL, 'block_rss_client_timeout', '30', NULL),
(721, 2, 1391627156, 'block_section_links', 'numsections1', '22', NULL),
(722, 2, 1391627156, 'block_section_links', 'incby1', '2', NULL),
(723, 2, 1391627157, 'block_section_links', 'numsections2', '40', NULL),
(724, 2, 1391627157, 'block_section_links', 'incby2', '5', NULL),
(725, 2, 1391627157, NULL, 'block_tags_showcoursetags', '0', NULL),
(726, 2, 1391627157, NULL, 'smtphosts', '', NULL),
(727, 2, 1391627157, NULL, 'smtpsecure', '', NULL),
(728, 2, 1391627157, NULL, 'smtpuser', '', NULL),
(729, 2, 1391627157, NULL, 'smtppass', '', NULL),
(730, 2, 1391627157, NULL, 'smtpmaxbulk', '1', NULL),
(731, 2, 1391627157, NULL, 'noreplyaddress', 'noreply@localhost', NULL),
(732, 2, 1391627157, NULL, 'sitemailcharset', '0', NULL),
(733, 2, 1391627157, NULL, 'allowusermailcharset', '0', NULL),
(734, 2, 1391627158, NULL, 'allowattachments', '1', NULL),
(735, 2, 1391627158, NULL, 'mailnewline', 'LF', NULL),
(736, 2, 1391627158, NULL, 'jabberhost', '', NULL),
(737, 2, 1391627158, NULL, 'jabberserver', '', NULL),
(738, 2, 1391627158, NULL, 'jabberusername', '', NULL),
(739, 2, 1391627158, NULL, 'jabberpassword', '', NULL),
(740, 2, 1391627158, NULL, 'jabberport', '5222', NULL),
(741, 2, 1391627158, 'enrol_cohort', 'roleid', '5', NULL),
(742, 2, 1391627159, 'enrol_cohort', 'unenrolaction', '0', NULL),
(743, 2, 1391627159, 'enrol_database', 'dbtype', '', NULL),
(744, 2, 1391627159, 'enrol_database', 'dbhost', 'localhost', NULL),
(745, 2, 1391627159, 'enrol_database', 'dbuser', '', NULL),
(746, 2, 1391627159, 'enrol_database', 'dbpass', '', NULL),
(747, 2, 1391627159, 'enrol_database', 'dbname', '', NULL),
(748, 2, 1391627159, 'enrol_database', 'dbencoding', 'utf-8', NULL),
(749, 2, 1391627159, 'enrol_database', 'dbsetupsql', '', NULL),
(750, 2, 1391627159, 'enrol_database', 'dbsybasequoting', '0', NULL);
INSERT INTO `mdl_config_log` (`id`, `userid`, `timemodified`, `plugin`, `name`, `value`, `oldvalue`) VALUES
(751, 2, 1391627159, 'enrol_database', 'debugdb', '0', NULL),
(752, 2, 1391627159, 'enrol_database', 'localcoursefield', 'idnumber', NULL),
(753, 2, 1391627159, 'enrol_database', 'localuserfield', 'idnumber', NULL),
(754, 2, 1391627160, 'enrol_database', 'localrolefield', 'shortname', NULL),
(755, 2, 1391627160, 'enrol_database', 'localcategoryfield', 'id', NULL),
(756, 2, 1391627160, 'enrol_database', 'remoteenroltable', '', NULL),
(757, 2, 1391627160, 'enrol_database', 'remotecoursefield', '', NULL),
(758, 2, 1391627160, 'enrol_database', 'remoteuserfield', '', NULL),
(759, 2, 1391627160, 'enrol_database', 'remoterolefield', '', NULL),
(760, 2, 1391627160, 'enrol_database', 'defaultrole', '5', NULL),
(761, 2, 1391627160, 'enrol_database', 'ignorehiddencourses', '0', NULL),
(762, 2, 1391627160, 'enrol_database', 'unenrolaction', '0', NULL),
(763, 2, 1391627160, 'enrol_database', 'newcoursetable', '', NULL),
(764, 2, 1391627160, 'enrol_database', 'newcoursefullname', 'fullname', NULL),
(765, 2, 1391627160, 'enrol_database', 'newcourseshortname', 'shortname', NULL),
(766, 2, 1391627161, 'enrol_database', 'newcourseidnumber', 'idnumber', NULL),
(767, 2, 1391627161, 'enrol_database', 'newcoursecategory', '', NULL),
(768, 2, 1391627161, 'enrol_database', 'defaultcategory', '1', NULL),
(769, 2, 1391627161, 'enrol_database', 'templatecourse', '', NULL),
(770, 2, 1391627161, 'enrol_flatfile', 'location', '', NULL),
(771, 2, 1391627161, 'enrol_flatfile', 'encoding', 'UTF-8', NULL),
(772, 2, 1391627161, 'enrol_flatfile', 'mailstudents', '0', NULL),
(773, 2, 1391627161, 'enrol_flatfile', 'mailteachers', '0', NULL),
(774, 2, 1391627161, 'enrol_flatfile', 'mailadmins', '0', NULL),
(775, 2, 1391627161, 'enrol_flatfile', 'unenrolaction', '3', NULL),
(776, 2, 1391627161, 'enrol_flatfile', 'expiredaction', '3', NULL),
(777, 2, 1391627162, 'enrol_guest', 'requirepassword', '0', NULL),
(778, 2, 1391627162, 'enrol_guest', 'usepasswordpolicy', '0', NULL),
(779, 2, 1391627162, 'enrol_guest', 'showhint', '0', NULL),
(780, 2, 1391627162, 'enrol_guest', 'defaultenrol', '1', NULL),
(781, 2, 1391627162, 'enrol_guest', 'status', '1', NULL),
(782, 2, 1391627162, 'enrol_guest', 'status_adv', '', NULL),
(783, 2, 1391627162, 'enrol_imsenterprise', 'imsfilelocation', '', NULL),
(784, 2, 1391627162, 'enrol_imsenterprise', 'logtolocation', '', NULL),
(785, 2, 1391627162, 'enrol_imsenterprise', 'mailadmins', '0', NULL),
(786, 2, 1391627162, 'enrol_imsenterprise', 'createnewusers', '0', NULL),
(787, 2, 1391627162, 'enrol_imsenterprise', 'imsdeleteusers', '0', NULL),
(788, 2, 1391627162, 'enrol_imsenterprise', 'fixcaseusernames', '0', NULL),
(789, 2, 1391627163, 'enrol_imsenterprise', 'fixcasepersonalnames', '0', NULL),
(790, 2, 1391627163, 'enrol_imsenterprise', 'imssourcedidfallback', '0', NULL),
(791, 2, 1391627163, 'enrol_imsenterprise', 'imsrolemap01', '5', NULL),
(792, 2, 1391627164, 'enrol_imsenterprise', 'imsrolemap02', '3', NULL),
(793, 2, 1391627164, 'enrol_imsenterprise', 'imsrolemap03', '3', NULL),
(794, 2, 1391627164, 'enrol_imsenterprise', 'imsrolemap04', '5', NULL),
(795, 2, 1391627164, 'enrol_imsenterprise', 'imsrolemap05', '0', NULL),
(796, 2, 1391627164, 'enrol_imsenterprise', 'imsrolemap06', '4', NULL),
(797, 2, 1391627164, 'enrol_imsenterprise', 'imsrolemap07', '0', NULL),
(798, 2, 1391627164, 'enrol_imsenterprise', 'imsrolemap08', '4', NULL),
(799, 2, 1391627164, 'enrol_imsenterprise', 'truncatecoursecodes', '0', NULL),
(800, 2, 1391627164, 'enrol_imsenterprise', 'createnewcourses', '0', NULL),
(801, 2, 1391627164, 'enrol_imsenterprise', 'createnewcategories', '0', NULL),
(802, 2, 1391627165, 'enrol_imsenterprise', 'imsunenrol', '0', NULL),
(803, 2, 1391627165, 'enrol_imsenterprise', 'imscoursemapshortname', 'coursecode', NULL),
(804, 2, 1391627165, 'enrol_imsenterprise', 'imscoursemapfullname', 'short', NULL),
(805, 2, 1391627165, 'enrol_imsenterprise', 'imscoursemapsummary', 'ignore', NULL),
(806, 2, 1391627165, 'enrol_imsenterprise', 'imsrestricttarget', '', NULL),
(807, 2, 1391627165, 'enrol_imsenterprise', 'imscapitafix', '0', NULL),
(808, 2, 1391627165, 'enrol_manual', 'expiredaction', '1', NULL),
(809, 2, 1391627165, 'enrol_manual', 'expirynotifyhour', '6', NULL),
(810, 2, 1391627165, 'enrol_manual', 'defaultenrol', '1', NULL),
(811, 2, 1391627165, 'enrol_manual', 'status', '0', NULL),
(812, 2, 1391627165, 'enrol_manual', 'roleid', '5', NULL),
(813, 2, 1391627165, 'enrol_manual', 'enrolperiod', '0', NULL),
(814, 2, 1391627166, 'enrol_manual', 'expirynotify', '0', NULL),
(815, 2, 1391627166, 'enrol_manual', 'expirythreshold', '86400', NULL),
(816, 2, 1391627166, 'enrol_meta', 'nosyncroleids', '', NULL),
(817, 2, 1391627166, 'enrol_meta', 'syncall', '1', NULL),
(818, 2, 1391627166, 'enrol_meta', 'unenrolaction', '3', NULL),
(819, 2, 1391627166, 'enrol_mnet', 'roleid', '5', NULL),
(820, 2, 1391627166, 'enrol_mnet', 'roleid_adv', '1', NULL),
(821, 2, 1391627166, 'enrol_paypal', 'paypalbusiness', '', NULL),
(822, 2, 1391627166, 'enrol_paypal', 'mailstudents', '0', NULL),
(823, 2, 1391627166, 'enrol_paypal', 'mailteachers', '0', NULL),
(824, 2, 1391627166, 'enrol_paypal', 'mailadmins', '0', NULL),
(825, 2, 1391627167, 'enrol_paypal', 'expiredaction', '3', NULL),
(826, 2, 1391627167, 'enrol_paypal', 'status', '1', NULL),
(827, 2, 1391627167, 'enrol_paypal', 'cost', '0', NULL),
(828, 2, 1391627167, 'enrol_paypal', 'currency', 'USD', NULL),
(829, 2, 1391627167, 'enrol_paypal', 'roleid', '5', NULL),
(830, 2, 1391627167, 'enrol_paypal', 'enrolperiod', '0', NULL),
(831, 2, 1391627167, 'enrol_self', 'requirepassword', '0', NULL),
(832, 2, 1391627167, 'enrol_self', 'usepasswordpolicy', '0', NULL),
(833, 2, 1391627167, 'enrol_self', 'showhint', '0', NULL),
(834, 2, 1391627167, 'enrol_self', 'expiredaction', '1', NULL),
(835, 2, 1391627167, 'enrol_self', 'expirynotifyhour', '6', NULL),
(836, 2, 1391627168, 'enrol_self', 'defaultenrol', '1', NULL),
(837, 2, 1391627168, 'enrol_self', 'status', '1', NULL),
(838, 2, 1391627168, 'enrol_self', 'newenrols', '1', NULL),
(839, 2, 1391627168, 'enrol_self', 'groupkey', '0', NULL),
(840, 2, 1391627168, 'enrol_self', 'roleid', '5', NULL),
(841, 2, 1391627168, 'enrol_self', 'enrolperiod', '0', NULL),
(842, 2, 1391627168, 'enrol_self', 'expirynotify', '0', NULL),
(843, 2, 1391627168, 'enrol_self', 'expirythreshold', '86400', NULL),
(844, 2, 1391627168, 'enrol_self', 'longtimenosee', '0', NULL),
(845, 2, 1391627168, 'enrol_self', 'maxenrolled', '0', NULL),
(846, 2, 1391627169, 'enrol_self', 'sendcoursewelcomemessage', '1', NULL),
(847, 2, 1391627169, 'editor_tinymce', 'customtoolbar', 'wrap,formatselect,wrap,bold,italic,wrap,bullist,numlist,wrap,link,unlink,wrap,image\n\nundo,redo,wrap,underline,strikethrough,sub,sup,wrap,justifyleft,justifycenter,justifyright,wrap,outdent,indent,wrap,forecolor,backcolor,wrap,ltr,rtl\n\nfontselect,fontsizeselect,wrap,code,search,replace,wrap,nonbreaking,charmap,table,wrap,cleanup,removeformat,pastetext,pasteword,wrap,fullscreen', NULL),
(848, 2, 1391627169, 'editor_tinymce', 'fontselectlist', 'Trebuchet=Trebuchet MS,Verdana,Arial,Helvetica,sans-serif;Arial=arial,helvetica,sans-serif;Courier New=courier new,courier,monospace;Georgia=georgia,times new roman,times,serif;Tahoma=tahoma,arial,helvetica,sans-serif;Times New Roman=times new roman,times,serif;Verdana=verdana,arial,helvetica,sans-serif;Impact=impact;Wingdings=wingdings', NULL),
(849, 2, 1391627169, 'editor_tinymce', 'customconfig', '', NULL),
(850, 2, 1391627169, 'tinymce_dragmath', 'requiretex', '1', NULL),
(851, 2, 1391627169, 'tinymce_moodleemoticon', 'requireemoticon', '1', NULL),
(852, 2, 1391627169, 'tinymce_spellchecker', 'spellengine', '', NULL),
(853, 2, 1391627169, 'tinymce_spellchecker', 'spelllanguagelist', '+English=en,Danish=da,Dutch=nl,Finnish=fi,French=fr,German=de,Italian=it,Polish=pl,Portuguese=pt,Spanish=es,Swedish=sv', NULL),
(854, 2, 1391627169, NULL, 'filter_censor_badwords', '', NULL),
(855, 2, 1391627169, 'filter_emoticon', 'formats', '1,4,0', NULL),
(856, 2, 1391627169, NULL, 'filter_multilang_force_old', '0', NULL),
(857, 2, 1391627170, NULL, 'filter_tex_latexpreamble', '\\usepackage[latin1]{inputenc}\n\\usepackage{amsmath}\n\\usepackage{amsfonts}\n\\RequirePackage{amsmath,amssymb,latexsym}\n', NULL),
(858, 2, 1391627170, NULL, 'filter_tex_latexbackground', '#FFFFFF', NULL),
(859, 2, 1391627170, NULL, 'filter_tex_density', '120', NULL),
(860, 2, 1391627170, NULL, 'filter_tex_pathlatex', '/usr/bin/latex', NULL),
(861, 2, 1391627170, NULL, 'filter_tex_pathdvips', '/usr/bin/dvips', NULL),
(862, 2, 1391627170, NULL, 'filter_tex_pathconvert', '/usr/bin/convert', NULL),
(863, 2, 1391627170, NULL, 'filter_tex_convertformat', 'gif', NULL),
(864, 2, 1391627170, 'filter_urltolink', 'formats', '0', NULL),
(865, 2, 1391627170, 'filter_urltolink', 'embedimages', '1', NULL),
(866, 2, 1391627170, NULL, 'profileroles', '5,4,3', NULL),
(867, 2, 1391627171, NULL, 'coursecontact', '3', NULL),
(868, 2, 1391627171, NULL, 'frontpage', '6', NULL),
(869, 2, 1391627171, NULL, 'frontpageloggedin', '6', NULL),
(870, 2, 1391627171, NULL, 'maxcategorydepth', '2', NULL),
(871, 2, 1391627171, NULL, 'frontpagecourselimit', '200', NULL),
(872, 2, 1391627171, NULL, 'commentsperpage', '15', NULL),
(873, 2, 1391627171, NULL, 'defaultfrontpageroleid', '8', NULL),
(874, 2, 1391627172, NULL, 'supportname', 'Chitrank Dixit', NULL),
(875, 2, 1391627172, NULL, 'supportemail', 'chitrankdixit@gmail.com', NULL),
(876, 2, 1391627228, NULL, 'registerauth', 'email', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_config_plugins`
--

CREATE TABLE IF NOT EXISTS `mdl_config_plugins` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `plugin` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'core',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_confplug_plunam_uix` (`plugin`,`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Moodle modules and plugins configuration variables' AUTO_INCREMENT=1012 ;

--
-- Dumping data for table `mdl_config_plugins`
--

INSERT INTO `mdl_config_plugins` (`id`, `plugin`, `name`, `value`) VALUES
(1, 'moodlecourse', 'visible', '1'),
(2, 'moodlecourse', 'format', 'weeks'),
(3, 'moodlecourse', 'maxsections', '52'),
(4, 'moodlecourse', 'numsections', '10'),
(5, 'moodlecourse', 'hiddensections', '0'),
(6, 'moodlecourse', 'coursedisplay', '0'),
(7, 'moodlecourse', 'lang', ''),
(8, 'moodlecourse', 'newsitems', '5'),
(9, 'moodlecourse', 'showgrades', '1'),
(10, 'moodlecourse', 'showreports', '0'),
(11, 'moodlecourse', 'maxbytes', '0'),
(12, 'moodlecourse', 'enablecompletion', '0'),
(13, 'moodlecourse', 'groupmode', '0'),
(14, 'moodlecourse', 'groupmodeforce', '0'),
(15, 'backup', 'loglifetime', '30'),
(16, 'backup', 'backup_general_users', '1'),
(17, 'backup', 'backup_general_users_locked', ''),
(18, 'backup', 'backup_general_anonymize', '0'),
(19, 'backup', 'backup_general_anonymize_locked', ''),
(20, 'backup', 'backup_general_role_assignments', '1'),
(21, 'backup', 'backup_general_role_assignments_locked', ''),
(22, 'backup', 'backup_general_activities', '1'),
(23, 'backup', 'backup_general_activities_locked', ''),
(24, 'backup', 'backup_general_blocks', '1'),
(25, 'backup', 'backup_general_blocks_locked', ''),
(26, 'backup', 'backup_general_filters', '1'),
(27, 'backup', 'backup_general_filters_locked', ''),
(28, 'backup', 'backup_general_comments', '1'),
(29, 'backup', 'backup_general_comments_locked', ''),
(30, 'backup', 'backup_general_badges', '1'),
(31, 'backup', 'backup_general_badges_locked', ''),
(32, 'backup', 'backup_general_userscompletion', '1'),
(33, 'backup', 'backup_general_userscompletion_locked', ''),
(34, 'backup', 'backup_general_logs', '0'),
(35, 'backup', 'backup_general_logs_locked', ''),
(36, 'backup', 'backup_general_histories', '0'),
(37, 'backup', 'backup_general_histories_locked', ''),
(38, 'backup', 'backup_general_questionbank', '1'),
(39, 'backup', 'backup_general_questionbank_locked', ''),
(40, 'backup', 'import_general_maxresults', '10'),
(41, 'backup', 'backup_auto_active', '0'),
(42, 'backup', 'backup_auto_weekdays', '0000000'),
(43, 'backup', 'backup_auto_hour', '0'),
(44, 'backup', 'backup_auto_minute', '0'),
(45, 'backup', 'backup_auto_storage', '0'),
(46, 'backup', 'backup_auto_destination', ''),
(47, 'backup', 'backup_auto_keep', '1'),
(48, 'backup', 'backup_shortname', '0'),
(49, 'backup', 'backup_auto_skip_hidden', '1'),
(50, 'backup', 'backup_auto_skip_modif_days', '30'),
(51, 'backup', 'backup_auto_skip_modif_prev', '0'),
(52, 'backup', 'backup_auto_users', '1'),
(53, 'backup', 'backup_auto_role_assignments', '1'),
(54, 'backup', 'backup_auto_activities', '1'),
(55, 'backup', 'backup_auto_blocks', '1'),
(56, 'backup', 'backup_auto_filters', '1'),
(57, 'backup', 'backup_auto_comments', '1'),
(58, 'backup', 'backup_auto_badges', '1'),
(59, 'backup', 'backup_auto_userscompletion', '1'),
(60, 'backup', 'backup_auto_logs', '0'),
(61, 'backup', 'backup_auto_histories', '0'),
(62, 'backup', 'backup_auto_questionbank', '1'),
(63, 'question_preview', 'behaviour', 'deferredfeedback'),
(64, 'question_preview', 'correctness', '1'),
(65, 'question_preview', 'marks', '1'),
(66, 'question_preview', 'markdp', '2'),
(67, 'question_preview', 'feedback', '1'),
(68, 'question_preview', 'generalfeedback', '1'),
(69, 'question_preview', 'rightanswer', '1'),
(70, 'question_preview', 'history', '0'),
(71, 'cachestore_memcache', 'testservers', ''),
(72, 'cachestore_memcached', 'testservers', ''),
(73, 'cachestore_mongodb', 'testserver', ''),
(74, 'theme_afterburner', 'logo', ''),
(75, 'theme_afterburner', 'footnote', ''),
(76, 'theme_afterburner', 'customcss', ''),
(77, 'theme_anomaly', 'tagline', ''),
(78, 'theme_anomaly', 'customcss', ''),
(79, 'theme_arialist', 'logo', ''),
(80, 'theme_arialist', 'tagline', ''),
(81, 'theme_arialist', 'linkcolor', '#f25f0f'),
(82, 'theme_arialist', 'regionwidth', '250'),
(83, 'theme_arialist', 'customcss', ''),
(84, 'theme_brick', 'logo', ''),
(85, 'theme_brick', 'linkcolor', '#06365b'),
(86, 'theme_brick', 'linkhover', '#5487ad'),
(87, 'theme_brick', 'maincolor', '#8e2800'),
(88, 'theme_brick', 'maincolorlink', '#fff0a5'),
(89, 'theme_brick', 'headingcolor', '#5c3500'),
(90, 'theme_clean', 'invert', '0'),
(91, 'theme_clean', 'logo', ''),
(92, 'theme_clean', 'customcss', ''),
(93, 'theme_clean', 'footnote', ''),
(94, 'theme_formal_white', 'fontsizereference', '13'),
(95, 'theme_formal_white', 'noframe', '0'),
(96, 'theme_formal_white', 'framemargin', '15'),
(97, 'theme_formal_white', 'headercontent', '1'),
(98, 'theme_formal_white', 'trendcolor', 'mink'),
(99, 'theme_formal_white', 'customlogourl', ''),
(100, 'theme_formal_white', 'frontpagelogourl', ''),
(101, 'theme_formal_white', 'headerbgc', '#E3DFD4'),
(102, 'theme_formal_white', 'creditstomoodleorg', '2'),
(103, 'theme_formal_white', 'blockcolumnwidth', '200'),
(104, 'theme_formal_white', 'blockpadding', '8'),
(105, 'theme_formal_white', 'blockcontentbgc', '#F6F6F6'),
(106, 'theme_formal_white', 'lblockcolumnbgc', '#E3DFD4'),
(107, 'theme_formal_white', 'rblockcolumnbgc', ''),
(108, 'theme_formal_white', 'footnote', ''),
(109, 'theme_formal_white', 'customcss', ''),
(110, 'theme_fusion', 'linkcolor', '#2d83d5'),
(111, 'theme_fusion', 'tagline', ''),
(112, 'theme_fusion', 'footertext', ''),
(113, 'theme_fusion', 'customcss', ''),
(114, 'theme_magazine', 'background', ''),
(115, 'theme_magazine', 'logo', ''),
(116, 'theme_magazine', 'linkcolor', '#32529a'),
(117, 'theme_magazine', 'linkhover', '#4e2300'),
(118, 'theme_magazine', 'maincolor', '#002f2f'),
(119, 'theme_magazine', 'maincoloraccent', '#092323'),
(120, 'theme_magazine', 'headingcolor', '#4e0000'),
(121, 'theme_magazine', 'blockcolor', '#002f2f'),
(122, 'theme_magazine', 'forumback', '#e6e2af'),
(123, 'theme_nimble', 'tagline', ''),
(124, 'theme_nimble', 'footerline', ''),
(125, 'theme_nimble', 'backgroundcolor', '#454545'),
(126, 'theme_nimble', 'linkcolor', '#2a65b1'),
(127, 'theme_nimble', 'linkhover', '#222222'),
(128, 'theme_nonzero', 'regionprewidth', '200'),
(129, 'theme_nonzero', 'regionpostwidth', '200'),
(130, 'theme_nonzero', 'customcss', ''),
(131, 'theme_overlay', 'linkcolor', '#428ab5'),
(132, 'theme_overlay', 'headercolor', '#2a4c7b'),
(133, 'theme_overlay', 'footertext', ''),
(134, 'theme_overlay', 'customcss', ''),
(135, 'theme_sky_high', 'logo', ''),
(136, 'theme_sky_high', 'regionwidth', '240'),
(137, 'theme_sky_high', 'footnote', ''),
(138, 'theme_sky_high', 'customcss', ''),
(139, 'theme_splash', 'logo', ''),
(140, 'theme_splash', 'tagline', 'Virtual learning center'),
(141, 'theme_splash', 'hide_tagline', '0'),
(142, 'theme_splash', 'footnote', ''),
(143, 'theme_splash', 'customcss', ''),
(144, 'qtype_calculated', 'version', '2013110500'),
(145, 'qtype_calculatedmulti', 'version', '2013110500'),
(146, 'qtype_calculatedsimple', 'version', '2013110500'),
(147, 'qtype_description', 'version', '2013110500'),
(148, 'qtype_essay', 'version', '2013110500'),
(149, 'qtype_match', 'version', '2013110500'),
(150, 'qtype_missingtype', 'version', '2013110500'),
(151, 'qtype_multianswer', 'version', '2013110500'),
(152, 'qtype_multichoice', 'version', '2013110500'),
(153, 'qtype_numerical', 'version', '2013110500'),
(154, 'qtype_random', 'version', '2013110500'),
(155, 'qtype_randomsamatch', 'version', '2013110500'),
(156, 'qtype_shortanswer', 'version', '2013110500'),
(157, 'qtype_truefalse', 'version', '2013110500'),
(158, 'mod_assign', 'version', '2013110500'),
(159, 'mod_assignment', 'version', '2013110500'),
(161, 'mod_book', 'version', '2013110500'),
(162, 'mod_chat', 'version', '2013110500'),
(163, 'mod_choice', 'version', '2013110500'),
(164, 'mod_data', 'version', '2013110500'),
(165, 'mod_feedback', 'version', '2013110500'),
(167, 'mod_folder', 'version', '2013110500'),
(169, 'mod_forum', 'version', '2013110500'),
(170, 'mod_glossary', 'version', '2013110500'),
(171, 'mod_imscp', 'version', '2013110500'),
(173, 'mod_label', 'version', '2013110500'),
(174, 'mod_lesson', 'version', '2013110500'),
(175, 'mod_lti', 'version', '2013110500'),
(176, 'mod_page', 'version', '2013110500'),
(178, 'mod_quiz', 'version', '2013110501'),
(179, 'mod_resource', 'version', '2013110500'),
(180, 'mod_scorm', 'version', '2013110501'),
(181, 'mod_survey', 'version', '2013110500'),
(183, 'mod_url', 'version', '2013110500'),
(185, 'mod_wiki', 'version', '2013110500'),
(187, 'mod_workshop', 'version', '2013110500'),
(188, 'auth_cas', 'version', '2013110500'),
(190, 'auth_db', 'version', '2013110500'),
(192, 'auth_email', 'version', '2013110500'),
(193, 'auth_fc', 'version', '2013110500'),
(195, 'auth_imap', 'version', '2013110500'),
(197, 'auth_ldap', 'version', '2013110500'),
(199, 'auth_manual', 'version', '2013110500'),
(200, 'auth_mnet', 'version', '2013110500'),
(202, 'auth_nntp', 'version', '2013110500'),
(204, 'auth_nologin', 'version', '2013110500'),
(205, 'auth_none', 'version', '2013110500'),
(206, 'auth_pam', 'version', '2013110500'),
(208, 'auth_pop3', 'version', '2013110500'),
(210, 'auth_radius', 'version', '2013110500'),
(212, 'auth_shibboleth', 'version', '2013110500'),
(214, 'auth_webservice', 'version', '2013110500'),
(215, 'calendartype_gregorian', 'version', '2013110500'),
(216, 'enrol_category', 'version', '2013110500'),
(218, 'enrol_cohort', 'version', '2013110500'),
(219, 'enrol_database', 'version', '2013110500'),
(221, 'enrol_flatfile', 'version', '2013110500'),
(223, 'enrol_flatfile', 'map_1', 'manager'),
(224, 'enrol_flatfile', 'map_2', 'coursecreator'),
(225, 'enrol_flatfile', 'map_3', 'editingteacher'),
(226, 'enrol_flatfile', 'map_4', 'teacher'),
(227, 'enrol_flatfile', 'map_5', 'student'),
(228, 'enrol_flatfile', 'map_6', 'guest'),
(229, 'enrol_flatfile', 'map_7', 'user'),
(230, 'enrol_flatfile', 'map_8', 'frontpage'),
(231, 'enrol_guest', 'version', '2013110500'),
(232, 'enrol_imsenterprise', 'version', '2013110500'),
(234, 'enrol_ldap', 'version', '2013110500'),
(236, 'enrol_manual', 'version', '2013110500'),
(238, 'enrol_meta', 'version', '2013110500'),
(240, 'enrol_mnet', 'version', '2013110500'),
(241, 'enrol_paypal', 'version', '2013110500'),
(242, 'enrol_self', 'version', '2013110501'),
(244, 'message_email', 'version', '2013110500'),
(246, 'message', 'email_provider_enrol_flatfile_flatfile_enrolment_permitted', 'permitted'),
(247, 'message', 'message_provider_enrol_flatfile_flatfile_enrolment_loggedin', 'email'),
(248, 'message', 'message_provider_enrol_flatfile_flatfile_enrolment_loggedoff', 'email'),
(249, 'message', 'email_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted', 'permitted'),
(250, 'message', 'message_provider_enrol_imsenterprise_imsenterprise_enrolment_loggedin', 'email'),
(251, 'message', 'message_provider_enrol_imsenterprise_imsenterprise_enrolment_loggedoff', 'email'),
(252, 'message', 'email_provider_enrol_manual_expiry_notification_permitted', 'permitted'),
(253, 'message', 'message_provider_enrol_manual_expiry_notification_loggedin', 'email'),
(254, 'message', 'message_provider_enrol_manual_expiry_notification_loggedoff', 'email'),
(255, 'message', 'email_provider_enrol_paypal_paypal_enrolment_permitted', 'permitted'),
(256, 'message', 'message_provider_enrol_paypal_paypal_enrolment_loggedin', 'email'),
(257, 'message', 'message_provider_enrol_paypal_paypal_enrolment_loggedoff', 'email'),
(258, 'message', 'email_provider_enrol_self_expiry_notification_permitted', 'permitted'),
(259, 'message', 'message_provider_enrol_self_expiry_notification_loggedin', 'email'),
(260, 'message', 'message_provider_enrol_self_expiry_notification_loggedoff', 'email'),
(261, 'message', 'email_provider_mod_assign_assign_notification_permitted', 'permitted'),
(262, 'message', 'message_provider_mod_assign_assign_notification_loggedin', 'email'),
(263, 'message', 'message_provider_mod_assign_assign_notification_loggedoff', 'email'),
(264, 'message', 'email_provider_mod_assignment_assignment_updates_permitted', 'permitted'),
(265, 'message', 'message_provider_mod_assignment_assignment_updates_loggedin', 'email'),
(266, 'message', 'message_provider_mod_assignment_assignment_updates_loggedoff', 'email'),
(267, 'message', 'email_provider_mod_feedback_submission_permitted', 'permitted'),
(268, 'message', 'message_provider_mod_feedback_submission_loggedin', 'email'),
(269, 'message', 'message_provider_mod_feedback_submission_loggedoff', 'email'),
(270, 'message', 'email_provider_mod_feedback_message_permitted', 'permitted'),
(271, 'message', 'message_provider_mod_feedback_message_loggedin', 'email'),
(272, 'message', 'message_provider_mod_feedback_message_loggedoff', 'email'),
(273, 'message', 'email_provider_mod_forum_posts_permitted', 'permitted'),
(274, 'message', 'message_provider_mod_forum_posts_loggedin', 'email'),
(275, 'message', 'message_provider_mod_forum_posts_loggedoff', 'email'),
(276, 'message', 'email_provider_mod_lesson_graded_essay_permitted', 'permitted'),
(277, 'message', 'message_provider_mod_lesson_graded_essay_loggedin', 'email'),
(278, 'message', 'message_provider_mod_lesson_graded_essay_loggedoff', 'email'),
(279, 'message', 'email_provider_mod_quiz_submission_permitted', 'permitted'),
(280, 'message', 'message_provider_mod_quiz_submission_loggedin', 'email'),
(281, 'message', 'message_provider_mod_quiz_submission_loggedoff', 'email'),
(282, 'message', 'email_provider_mod_quiz_confirmation_permitted', 'permitted'),
(283, 'message', 'message_provider_mod_quiz_confirmation_loggedin', 'email'),
(284, 'message', 'message_provider_mod_quiz_confirmation_loggedoff', 'email'),
(285, 'message', 'email_provider_mod_quiz_attempt_overdue_permitted', 'permitted'),
(286, 'message', 'message_provider_mod_quiz_attempt_overdue_loggedin', 'email'),
(287, 'message', 'message_provider_mod_quiz_attempt_overdue_loggedoff', 'email'),
(288, 'message', 'email_provider_moodle_notices_permitted', 'permitted'),
(289, 'message', 'message_provider_moodle_notices_loggedin', 'email'),
(290, 'message', 'message_provider_moodle_notices_loggedoff', 'email'),
(291, 'message', 'email_provider_moodle_errors_permitted', 'permitted'),
(292, 'message', 'message_provider_moodle_errors_loggedin', 'email'),
(293, 'message', 'message_provider_moodle_errors_loggedoff', 'email'),
(294, 'message', 'email_provider_moodle_availableupdate_permitted', 'permitted'),
(295, 'message', 'message_provider_moodle_availableupdate_loggedin', 'email'),
(296, 'message', 'message_provider_moodle_availableupdate_loggedoff', 'email'),
(297, 'message', 'email_provider_moodle_instantmessage_permitted', 'permitted'),
(298, 'message', 'message_provider_moodle_instantmessage_loggedoff', 'popup,email'),
(299, 'message', 'email_provider_moodle_backup_permitted', 'permitted'),
(300, 'message', 'message_provider_moodle_backup_loggedin', 'email'),
(301, 'message', 'message_provider_moodle_backup_loggedoff', 'email'),
(302, 'message', 'email_provider_moodle_courserequested_permitted', 'permitted'),
(303, 'message', 'message_provider_moodle_courserequested_loggedin', 'email'),
(304, 'message', 'message_provider_moodle_courserequested_loggedoff', 'email'),
(305, 'message', 'email_provider_moodle_courserequestapproved_permitted', 'permitted'),
(306, 'message', 'message_provider_moodle_courserequestapproved_loggedin', 'email'),
(307, 'message', 'message_provider_moodle_courserequestapproved_loggedoff', 'email'),
(308, 'message', 'email_provider_moodle_courserequestrejected_permitted', 'permitted'),
(309, 'message', 'message_provider_moodle_courserequestrejected_loggedin', 'email'),
(310, 'message', 'message_provider_moodle_courserequestrejected_loggedoff', 'email'),
(311, 'message', 'email_provider_moodle_badgerecipientnotice_permitted', 'permitted'),
(312, 'message', 'message_provider_moodle_badgerecipientnotice_loggedoff', 'popup,email'),
(313, 'message', 'email_provider_moodle_badgecreatornotice_permitted', 'permitted'),
(314, 'message', 'message_provider_moodle_badgecreatornotice_loggedoff', 'email'),
(315, 'message_jabber', 'version', '2013110500'),
(317, 'message', 'jabber_provider_enrol_flatfile_flatfile_enrolment_permitted', 'permitted'),
(318, 'message', 'jabber_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted', 'permitted'),
(319, 'message', 'jabber_provider_enrol_manual_expiry_notification_permitted', 'permitted'),
(320, 'message', 'jabber_provider_enrol_paypal_paypal_enrolment_permitted', 'permitted'),
(321, 'message', 'jabber_provider_enrol_self_expiry_notification_permitted', 'permitted'),
(322, 'message', 'jabber_provider_mod_assign_assign_notification_permitted', 'permitted'),
(323, 'message', 'jabber_provider_mod_assignment_assignment_updates_permitted', 'permitted'),
(324, 'message', 'jabber_provider_mod_feedback_submission_permitted', 'permitted'),
(325, 'message', 'jabber_provider_mod_feedback_message_permitted', 'permitted'),
(326, 'message', 'jabber_provider_mod_forum_posts_permitted', 'permitted'),
(327, 'message', 'jabber_provider_mod_lesson_graded_essay_permitted', 'permitted'),
(328, 'message', 'jabber_provider_mod_quiz_submission_permitted', 'permitted'),
(329, 'message', 'jabber_provider_mod_quiz_confirmation_permitted', 'permitted'),
(330, 'message', 'jabber_provider_mod_quiz_attempt_overdue_permitted', 'permitted'),
(331, 'message', 'jabber_provider_moodle_notices_permitted', 'permitted'),
(332, 'message', 'jabber_provider_moodle_errors_permitted', 'permitted'),
(333, 'message', 'jabber_provider_moodle_availableupdate_permitted', 'permitted'),
(334, 'message', 'jabber_provider_moodle_instantmessage_permitted', 'permitted'),
(335, 'message', 'jabber_provider_moodle_backup_permitted', 'permitted'),
(336, 'message', 'jabber_provider_moodle_courserequested_permitted', 'permitted'),
(337, 'message', 'jabber_provider_moodle_courserequestapproved_permitted', 'permitted'),
(338, 'message', 'jabber_provider_moodle_courserequestrejected_permitted', 'permitted'),
(339, 'message', 'jabber_provider_moodle_badgerecipientnotice_permitted', 'permitted'),
(340, 'message', 'jabber_provider_moodle_badgecreatornotice_permitted', 'permitted'),
(341, 'message_popup', 'version', '2013110500'),
(343, 'message', 'popup_provider_enrol_flatfile_flatfile_enrolment_permitted', 'permitted'),
(344, 'message', 'popup_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted', 'permitted'),
(345, 'message', 'popup_provider_enrol_manual_expiry_notification_permitted', 'permitted'),
(346, 'message', 'popup_provider_enrol_paypal_paypal_enrolment_permitted', 'permitted'),
(347, 'message', 'popup_provider_enrol_self_expiry_notification_permitted', 'permitted'),
(348, 'message', 'popup_provider_mod_assign_assign_notification_permitted', 'permitted'),
(349, 'message', 'popup_provider_mod_assignment_assignment_updates_permitted', 'permitted'),
(350, 'message', 'popup_provider_mod_feedback_submission_permitted', 'permitted'),
(351, 'message', 'popup_provider_mod_feedback_message_permitted', 'permitted'),
(352, 'message', 'popup_provider_mod_forum_posts_permitted', 'permitted'),
(353, 'message', 'popup_provider_mod_lesson_graded_essay_permitted', 'permitted'),
(354, 'message', 'popup_provider_mod_quiz_submission_permitted', 'permitted'),
(355, 'message', 'popup_provider_mod_quiz_confirmation_permitted', 'permitted'),
(356, 'message', 'popup_provider_mod_quiz_attempt_overdue_permitted', 'permitted'),
(357, 'message', 'popup_provider_moodle_notices_permitted', 'permitted'),
(358, 'message', 'popup_provider_moodle_errors_permitted', 'permitted'),
(359, 'message', 'popup_provider_moodle_availableupdate_permitted', 'permitted'),
(360, 'message', 'popup_provider_moodle_instantmessage_permitted', 'permitted'),
(361, 'message', 'message_provider_moodle_instantmessage_loggedin', 'popup'),
(362, 'message', 'popup_provider_moodle_backup_permitted', 'permitted'),
(363, 'message', 'popup_provider_moodle_courserequested_permitted', 'permitted'),
(364, 'message', 'popup_provider_moodle_courserequestapproved_permitted', 'permitted'),
(365, 'message', 'popup_provider_moodle_courserequestrejected_permitted', 'permitted'),
(366, 'message', 'popup_provider_moodle_badgerecipientnotice_permitted', 'permitted'),
(367, 'message', 'message_provider_moodle_badgerecipientnotice_loggedin', 'popup'),
(368, 'message', 'popup_provider_moodle_badgecreatornotice_permitted', 'permitted'),
(369, 'block_activity_modules', 'version', '2013110500'),
(370, 'block_admin_bookmarks', 'version', '2013110500'),
(371, 'block_badges', 'version', '2013110500'),
(372, 'block_blog_menu', 'version', '2013110500'),
(373, 'block_blog_recent', 'version', '2013110500'),
(374, 'block_blog_tags', 'version', '2013110500'),
(375, 'block_calendar_month', 'version', '2013110500'),
(376, 'block_calendar_upcoming', 'version', '2013110500'),
(377, 'block_comments', 'version', '2013110500'),
(378, 'block_community', 'version', '2013110500'),
(379, 'block_completionstatus', 'version', '2013110500'),
(380, 'block_course_list', 'version', '2013110500'),
(381, 'block_course_overview', 'version', '2013110500'),
(382, 'block_course_summary', 'version', '2013110500'),
(383, 'block_feedback', 'version', '2013110500'),
(385, 'block_glossary_random', 'version', '2013110500'),
(386, 'block_html', 'version', '2013110500'),
(387, 'block_login', 'version', '2013110500'),
(388, 'block_mentees', 'version', '2013110500'),
(389, 'block_messages', 'version', '2013110500'),
(390, 'block_mnet_hosts', 'version', '2013110500'),
(391, 'block_myprofile', 'version', '2013110500'),
(392, 'block_navigation', 'version', '2013110500'),
(393, 'block_news_items', 'version', '2013110500'),
(394, 'block_online_users', 'version', '2013110500'),
(395, 'block_participants', 'version', '2013110500'),
(396, 'block_private_files', 'version', '2013110500'),
(397, 'block_quiz_results', 'version', '2013110500'),
(398, 'block_recent_activity', 'version', '2013110500'),
(399, 'block_rss_client', 'version', '2013110500'),
(400, 'block_search_forums', 'version', '2013110500'),
(401, 'block_section_links', 'version', '2013110500'),
(402, 'block_selfcompletion', 'version', '2013110500'),
(403, 'block_settings', 'version', '2013110500'),
(404, 'block_site_main_menu', 'version', '2013110500'),
(405, 'block_social_activities', 'version', '2013110500'),
(406, 'block_tag_flickr', 'version', '2013110500'),
(407, 'block_tag_youtube', 'version', '2013110500'),
(408, 'block_tags', 'version', '2013110500'),
(409, 'filter_activitynames', 'version', '2013110500'),
(411, 'filter_algebra', 'version', '2013110500'),
(412, 'filter_censor', 'version', '2013110500'),
(413, 'filter_data', 'version', '2013110500'),
(415, 'filter_emailprotect', 'version', '2013110500'),
(416, 'filter_emoticon', 'version', '2013110500'),
(417, 'filter_glossary', 'version', '2013110500'),
(419, 'filter_mediaplugin', 'version', '2013110500'),
(421, 'filter_multilang', 'version', '2013110500'),
(422, 'filter_tex', 'version', '2013110500'),
(424, 'filter_tidy', 'version', '2013110500'),
(425, 'filter_urltolink', 'version', '2013110500'),
(426, 'editor_textarea', 'version', '2013110500'),
(427, 'editor_tinymce', 'version', '2013110600'),
(428, 'format_singleactivity', 'version', '2013110500'),
(429, 'format_social', 'version', '2013110500'),
(430, 'format_topics', 'version', '2013110500'),
(431, 'format_weeks', 'version', '2013110500'),
(432, 'profilefield_checkbox', 'version', '2013110500'),
(433, 'profilefield_datetime', 'version', '2013110500'),
(434, 'profilefield_menu', 'version', '2013110500'),
(435, 'profilefield_text', 'version', '2013110500'),
(436, 'profilefield_textarea', 'version', '2013110500'),
(437, 'report_backups', 'version', '2013110500'),
(438, 'report_completion', 'version', '2013110500'),
(440, 'report_configlog', 'version', '2013110500'),
(441, 'report_courseoverview', 'version', '2013110500'),
(442, 'report_log', 'version', '2013110500'),
(444, 'report_loglive', 'version', '2013110500'),
(445, 'report_outline', 'version', '2013110500'),
(447, 'report_participation', 'version', '2013110500'),
(449, 'report_performance', 'version', '2013110500'),
(450, 'report_progress', 'version', '2013110500'),
(452, 'report_questioninstances', 'version', '2013110500'),
(453, 'report_security', 'version', '2013110500'),
(454, 'report_stats', 'version', '2013110500'),
(456, 'gradeexport_ods', 'version', '2013110500'),
(457, 'gradeexport_txt', 'version', '2013110500'),
(458, 'gradeexport_xls', 'version', '2013110500'),
(459, 'gradeexport_xml', 'version', '2013110500'),
(460, 'gradeimport_csv', 'version', '2013110500'),
(461, 'gradeimport_xml', 'version', '2013110500'),
(462, 'gradereport_grader', 'version', '2013110500'),
(463, 'gradereport_outcomes', 'version', '2013110500'),
(464, 'gradereport_overview', 'version', '2013110500'),
(465, 'gradereport_user', 'version', '2013110500'),
(466, 'gradingform_guide', 'version', '2013110500'),
(467, 'gradingform_rubric', 'version', '2013110500'),
(468, 'mnetservice_enrol', 'version', '2013110500'),
(469, 'webservice_amf', 'version', '2013110500'),
(470, 'webservice_rest', 'version', '2013110500'),
(471, 'webservice_soap', 'version', '2013110500'),
(472, 'webservice_xmlrpc', 'version', '2013110500'),
(473, 'repository_alfresco', 'version', '2013110500'),
(474, 'repository_areafiles', 'version', '2013110500'),
(475, 'repository_areafiles', 'installrunning', '1'),
(476, 'repository_boxnet', 'version', '2013110700'),
(477, 'repository_coursefiles', 'version', '2013110500'),
(478, 'repository_dropbox', 'version', '2013110500'),
(479, 'repository_equella', 'version', '2013110500'),
(480, 'repository_filesystem', 'version', '2013110500'),
(481, 'repository_flickr', 'version', '2013110500'),
(482, 'repository_flickr_public', 'version', '2013110500'),
(483, 'repository_googledocs', 'version', '2013110500'),
(484, 'repository_local', 'version', '2013110500'),
(486, 'local', 'enablecourseinstances', '0'),
(487, 'local', 'enableuserinstances', '0'),
(488, 'repository_merlot', 'version', '2013110500'),
(489, 'repository_picasa', 'version', '2013110500'),
(490, 'repository_recent', 'version', '2013110500'),
(492, 'recent', 'enablecourseinstances', '0'),
(493, 'recent', 'enableuserinstances', '0'),
(494, 'repository_s3', 'version', '2013110500'),
(495, 'repository_skydrive', 'version', '2013110500'),
(496, 'repository_upload', 'version', '2013110500'),
(498, 'upload', 'enablecourseinstances', '0'),
(499, 'upload', 'enableuserinstances', '0'),
(500, 'repository_url', 'version', '2013110500'),
(502, 'url', 'enablecourseinstances', '0'),
(503, 'url', 'enableuserinstances', '0'),
(504, 'repository_user', 'version', '2013110500'),
(506, 'user', 'enablecourseinstances', '0'),
(507, 'user', 'enableuserinstances', '0'),
(508, 'repository_webdav', 'version', '2013110500'),
(509, 'repository_wikimedia', 'version', '2013110500'),
(511, 'wikimedia', 'enablecourseinstances', '0'),
(512, 'wikimedia', 'enableuserinstances', '0'),
(513, 'repository_youtube', 'version', '2013110500'),
(515, 'youtube', 'enablecourseinstances', '0'),
(516, 'youtube', 'enableuserinstances', '0'),
(517, 'portfolio_boxnet', 'version', '2013110602'),
(518, 'portfolio_download', 'version', '2013110500'),
(519, 'portfolio_flickr', 'version', '2013110500'),
(520, 'portfolio_googledocs', 'version', '2013110500'),
(521, 'portfolio_mahara', 'version', '2013110500'),
(522, 'portfolio_picasa', 'version', '2013110500'),
(523, 'qbehaviour_adaptive', 'version', '2013110500'),
(524, 'qbehaviour_adaptivenopenalty', 'version', '2013110500'),
(525, 'qbehaviour_deferredcbm', 'version', '2013110500'),
(526, 'qbehaviour_deferredfeedback', 'version', '2013110500'),
(527, 'qbehaviour_immediatecbm', 'version', '2013110500'),
(528, 'qbehaviour_immediatefeedback', 'version', '2013110500'),
(529, 'qbehaviour_informationitem', 'version', '2013110500'),
(530, 'qbehaviour_interactive', 'version', '2013110500'),
(531, 'qbehaviour_interactivecountback', 'version', '2013110500'),
(532, 'qbehaviour_manualgraded', 'version', '2013110500'),
(534, 'question', 'disabledbehaviours', 'manualgraded'),
(535, 'qbehaviour_missing', 'version', '2013110500'),
(536, 'qformat_aiken', 'version', '2013110500'),
(537, 'qformat_blackboard_six', 'version', '2013110500'),
(538, 'qformat_examview', 'version', '2013110500'),
(539, 'qformat_gift', 'version', '2013110500'),
(540, 'qformat_learnwise', 'version', '2013110500'),
(541, 'qformat_missingword', 'version', '2013110500'),
(542, 'qformat_multianswer', 'version', '2013110500'),
(543, 'qformat_webct', 'version', '2013110500'),
(544, 'qformat_xhtml', 'version', '2013110500'),
(545, 'qformat_xml', 'version', '2013110500'),
(546, 'tool_assignmentupgrade', 'version', '2013110500'),
(547, 'tool_behat', 'version', '2013110501'),
(548, 'tool_capability', 'version', '2013110500'),
(549, 'tool_customlang', 'version', '2013110500'),
(551, 'tool_dbtransfer', 'version', '2013110500'),
(552, 'tool_generator', 'version', '2013110500'),
(553, 'tool_health', 'version', '2013110500'),
(554, 'tool_innodb', 'version', '2013110500'),
(555, 'tool_installaddon', 'version', '2013110500'),
(556, 'tool_langimport', 'version', '2013110500'),
(557, 'tool_multilangupgrade', 'version', '2013110500'),
(558, 'tool_phpunit', 'version', '2013110500'),
(559, 'tool_profiling', 'version', '2013110500'),
(560, 'tool_qeupgradehelper', 'version', '2013110500'),
(562, 'tool_replace', 'version', '2013110501'),
(563, 'tool_spamcleaner', 'version', '2013110500'),
(564, 'tool_timezoneimport', 'version', '2013110500'),
(565, 'tool_unsuproles', 'version', '2013110500'),
(567, 'tool_uploadcourse', 'version', '2013110500'),
(568, 'tool_uploaduser', 'version', '2013110500'),
(569, 'tool_xmldb', 'version', '2013110500'),
(570, 'cachestore_file', 'version', '2013110500'),
(571, 'cachestore_memcache', 'version', '2013110500'),
(572, 'cachestore_memcached', 'version', '2013110500'),
(573, 'cachestore_mongodb', 'version', '2013110500'),
(574, 'cachestore_session', 'version', '2013110500'),
(575, 'cachestore_static', 'version', '2013110500'),
(576, 'cachelock_file', 'version', '2013110500'),
(577, 'theme_afterburner', 'version', '2013110500'),
(578, 'theme_anomaly', 'version', '2013110500'),
(579, 'theme_arialist', 'version', '2013110500'),
(580, 'theme_base', 'version', '2013110500'),
(581, 'theme_binarius', 'version', '2013110500'),
(582, 'theme_bootstrapbase', 'version', '2013110500'),
(583, 'theme_boxxie', 'version', '2013110500'),
(584, 'theme_brick', 'version', '2013110500'),
(585, 'theme_canvas', 'version', '2013110500'),
(586, 'theme_clean', 'version', '2013110500'),
(587, 'theme_formal_white', 'version', '2013110500'),
(589, 'theme_formfactor', 'version', '2013110500'),
(590, 'theme_fusion', 'version', '2013110500'),
(591, 'theme_leatherbound', 'version', '2013110500'),
(592, 'theme_magazine', 'version', '2013110500'),
(593, 'theme_nimble', 'version', '2013110500'),
(594, 'theme_nonzero', 'version', '2013110500'),
(595, 'theme_overlay', 'version', '2013110500'),
(596, 'theme_serenity', 'version', '2013110500'),
(597, 'theme_sky_high', 'version', '2013110500'),
(598, 'theme_splash', 'version', '2013110500'),
(599, 'theme_standard', 'version', '2013110500'),
(600, 'theme_standardold', 'version', '2013110500'),
(601, 'assignsubmission_comments', 'version', '2013110500'),
(603, 'assignsubmission_file', 'sortorder', '1'),
(604, 'assignsubmission_comments', 'sortorder', '2'),
(605, 'assignsubmission_onlinetext', 'sortorder', '0'),
(606, 'assignsubmission_file', 'version', '2013110500'),
(607, 'assignsubmission_onlinetext', 'version', '2013110500'),
(609, 'assignfeedback_comments', 'version', '2013110500'),
(611, 'assignfeedback_comments', 'sortorder', '0'),
(612, 'assignfeedback_editpdf', 'sortorder', '1'),
(613, 'assignfeedback_file', 'sortorder', '3'),
(614, 'assignfeedback_offline', 'sortorder', '2'),
(615, 'assignfeedback_editpdf', 'version', '2013110800'),
(617, 'assignfeedback_file', 'version', '2013110500'),
(619, 'assignfeedback_offline', 'version', '2013110500'),
(620, 'assignment_offline', 'version', '2013110500'),
(621, 'assignment_online', 'version', '2013110500'),
(622, 'assignment_upload', 'version', '2013110500'),
(623, 'assignment_uploadsingle', 'version', '2013110500'),
(624, 'booktool_exportimscp', 'version', '2013110500'),
(625, 'booktool_importhtml', 'version', '2013110500'),
(626, 'booktool_print', 'version', '2013110500'),
(627, 'datafield_checkbox', 'version', '2013110500'),
(628, 'datafield_date', 'version', '2013110500'),
(629, 'datafield_file', 'version', '2013110500'),
(630, 'datafield_latlong', 'version', '2013110500'),
(631, 'datafield_menu', 'version', '2013110500'),
(632, 'datafield_multimenu', 'version', '2013110500'),
(633, 'datafield_number', 'version', '2013110500'),
(634, 'datafield_picture', 'version', '2013110500'),
(635, 'datafield_radiobutton', 'version', '2013110500'),
(636, 'datafield_text', 'version', '2013110500'),
(637, 'datafield_textarea', 'version', '2013110500'),
(638, 'datafield_url', 'version', '2013110500'),
(639, 'datapreset_imagegallery', 'version', '2013110500'),
(640, 'quiz_grading', 'version', '2013110500'),
(642, 'quiz_overview', 'version', '2013110500'),
(644, 'quiz_responses', 'version', '2013110500'),
(646, 'quiz_statistics', 'version', '2013110500'),
(648, 'quizaccess_delaybetweenattempts', 'version', '2013110500'),
(649, 'quizaccess_ipaddress', 'version', '2013110500'),
(650, 'quizaccess_numattempts', 'version', '2013110500'),
(651, 'quizaccess_openclosedate', 'version', '2013110500'),
(652, 'quizaccess_password', 'version', '2013110500'),
(653, 'quizaccess_safebrowser', 'version', '2013110500'),
(654, 'quizaccess_securewindow', 'version', '2013110500'),
(655, 'quizaccess_timelimit', 'version', '2013110500'),
(656, 'scormreport_basic', 'version', '2013110500'),
(657, 'scormreport_graphs', 'version', '2013110500'),
(658, 'scormreport_interactions', 'version', '2013110500'),
(659, 'scormreport_objectives', 'version', '2013110500'),
(660, 'workshopform_accumulative', 'version', '2013110500'),
(662, 'workshopform_comments', 'version', '2013110500'),
(664, 'workshopform_numerrors', 'version', '2013110500'),
(666, 'workshopform_rubric', 'version', '2013110500'),
(668, 'workshopallocation_manual', 'version', '2013110500'),
(669, 'workshopallocation_random', 'version', '2013110500'),
(670, 'workshopallocation_scheduled', 'version', '2013110500'),
(671, 'workshopeval_best', 'version', '2013110500'),
(672, 'tinymce_ctrlhelp', 'version', '2013110500'),
(673, 'tinymce_dragmath', 'version', '2013110500'),
(674, 'tinymce_managefiles', 'version', '2014010800'),
(675, 'tinymce_moodleemoticon', 'version', '2013110500'),
(676, 'tinymce_moodleimage', 'version', '2013110500'),
(677, 'tinymce_moodlemedia', 'version', '2013110500'),
(678, 'tinymce_moodlenolink', 'version', '2013110500'),
(679, 'tinymce_pdw', 'version', '2013110500'),
(680, 'tinymce_spellchecker', 'version', '2013110500'),
(682, 'tinymce_wrap', 'version', '2013110500'),
(683, 'assign', 'feedback_plugin_for_gradebook', 'assignfeedback_comments'),
(684, 'assign', 'showrecentsubmissions', '0'),
(685, 'assign', 'submissionreceipts', '1'),
(686, 'assign', 'submissionstatement', 'This assignment is my own work, except where I have acknowledged the use of the works of other people.'),
(687, 'assign', 'alwaysshowdescription', '1'),
(688, 'assign', 'alwaysshowdescription_adv', ''),
(689, 'assign', 'alwaysshowdescription_locked', ''),
(690, 'assign', 'allowsubmissionsfromdate', '0'),
(691, 'assign', 'allowsubmissionsfromdate_enabled', '1'),
(692, 'assign', 'allowsubmissionsfromdate_adv', ''),
(693, 'assign', 'duedate', '604800'),
(694, 'assign', 'duedate_enabled', '1'),
(695, 'assign', 'duedate_adv', ''),
(696, 'assign', 'cutoffdate', '1209600'),
(697, 'assign', 'cutoffdate_enabled', ''),
(698, 'assign', 'cutoffdate_adv', ''),
(699, 'assign', 'submissiondrafts', '0'),
(700, 'assign', 'submissiondrafts_adv', ''),
(701, 'assign', 'submissiondrafts_locked', ''),
(702, 'assign', 'requiresubmissionstatement', '0'),
(703, 'assign', 'requiresubmissionstatement_adv', ''),
(704, 'assign', 'requiresubmissionstatement_locked', ''),
(705, 'assign', 'attemptreopenmethod', 'none'),
(706, 'assign', 'attemptreopenmethod_adv', ''),
(707, 'assign', 'attemptreopenmethod_locked', ''),
(708, 'assign', 'maxattempts', '-1'),
(709, 'assign', 'maxattempts_adv', ''),
(710, 'assign', 'maxattempts_locked', ''),
(711, 'assign', 'teamsubmission', '0'),
(712, 'assign', 'teamsubmission_adv', ''),
(713, 'assign', 'teamsubmission_locked', ''),
(714, 'assign', 'requireallteammemberssubmit', '0'),
(715, 'assign', 'requireallteammemberssubmit_adv', ''),
(716, 'assign', 'requireallteammemberssubmit_locked', ''),
(717, 'assign', 'teamsubmissiongroupingid', ''),
(718, 'assign', 'teamsubmissiongroupingid_adv', ''),
(719, 'assign', 'sendnotifications', '0'),
(720, 'assign', 'sendnotifications_adv', ''),
(721, 'assign', 'sendnotifications_locked', ''),
(722, 'assign', 'sendlatenotifications', '0'),
(723, 'assign', 'sendlatenotifications_adv', ''),
(724, 'assign', 'sendlatenotifications_locked', ''),
(725, 'assign', 'blindmarking', '0'),
(726, 'assign', 'blindmarking_adv', ''),
(727, 'assign', 'blindmarking_locked', ''),
(728, 'assign', 'markingworkflow', '0'),
(729, 'assign', 'markingworkflow_adv', ''),
(730, 'assign', 'markingworkflow_locked', ''),
(731, 'assign', 'markingallocation', '0'),
(732, 'assign', 'markingallocation_adv', ''),
(733, 'assign', 'markingallocation_locked', ''),
(734, 'assignsubmission_file', 'default', '1'),
(735, 'assignsubmission_file', 'maxbytes', '1048576'),
(736, 'assignsubmission_onlinetext', 'default', '0'),
(737, 'assignfeedback_comments', 'default', '1'),
(738, 'assignfeedback_editpdf', 'stamps', ''),
(739, 'assignfeedback_editpdf', 'gspath', '/usr/bin/gs'),
(740, 'assignfeedback_file', 'default', '0'),
(741, 'assignfeedback_offline', 'default', '0'),
(742, 'book', 'requiremodintro', '1'),
(743, 'book', 'numberingoptions', '0,1,2,3'),
(744, 'book', 'numbering', '1'),
(745, 'folder', 'requiremodintro', '1'),
(746, 'folder', 'showexpanded', '1'),
(747, 'imscp', 'requiremodintro', '1'),
(748, 'imscp', 'keepold', '1'),
(749, 'imscp', 'keepold_adv', ''),
(750, 'label', 'dndmedia', '1'),
(751, 'label', 'dndresizewidth', '400'),
(752, 'label', 'dndresizeheight', '400'),
(753, 'page', 'requiremodintro', '1'),
(754, 'page', 'displayoptions', '5'),
(755, 'page', 'printintro', '0'),
(756, 'page', 'display', '5'),
(757, 'page', 'popupwidth', '620'),
(758, 'page', 'popupheight', '450'),
(759, 'quiz', 'timelimit', '0'),
(760, 'quiz', 'timelimit_adv', ''),
(761, 'quiz', 'overduehandling', 'autoabandon'),
(762, 'quiz', 'overduehandling_adv', ''),
(763, 'quiz', 'graceperiod', '86400'),
(764, 'quiz', 'graceperiod_adv', ''),
(765, 'quiz', 'graceperiodmin', '60'),
(766, 'quiz', 'attempts', '0'),
(767, 'quiz', 'attempts_adv', ''),
(768, 'quiz', 'grademethod', '1'),
(769, 'quiz', 'grademethod_adv', ''),
(770, 'quiz', 'maximumgrade', '10'),
(771, 'quiz', 'shufflequestions', '0'),
(772, 'quiz', 'shufflequestions_adv', ''),
(773, 'quiz', 'questionsperpage', '1'),
(774, 'quiz', 'questionsperpage_adv', ''),
(775, 'quiz', 'navmethod', 'free'),
(776, 'quiz', 'navmethod_adv', '1'),
(777, 'quiz', 'shuffleanswers', '1'),
(778, 'quiz', 'shuffleanswers_adv', ''),
(779, 'quiz', 'preferredbehaviour', 'deferredfeedback'),
(780, 'quiz', 'attemptonlast', '0'),
(781, 'quiz', 'attemptonlast_adv', '1'),
(782, 'quiz', 'reviewattempt', '69904'),
(783, 'quiz', 'reviewcorrectness', '69904'),
(784, 'quiz', 'reviewmarks', '69904'),
(785, 'quiz', 'reviewspecificfeedback', '69904'),
(786, 'quiz', 'reviewgeneralfeedback', '69904'),
(787, 'quiz', 'reviewrightanswer', '69904'),
(788, 'quiz', 'reviewoverallfeedback', '4368'),
(789, 'quiz', 'showuserpicture', '0'),
(790, 'quiz', 'showuserpicture_adv', ''),
(791, 'quiz', 'decimalpoints', '2'),
(792, 'quiz', 'decimalpoints_adv', ''),
(793, 'quiz', 'questiondecimalpoints', '-1'),
(794, 'quiz', 'questiondecimalpoints_adv', '1'),
(795, 'quiz', 'showblocks', '0'),
(796, 'quiz', 'showblocks_adv', '1'),
(797, 'quiz', 'password', ''),
(798, 'quiz', 'password_adv', '1'),
(799, 'quiz', 'subnet', ''),
(800, 'quiz', 'subnet_adv', '1'),
(801, 'quiz', 'delay1', '0'),
(802, 'quiz', 'delay1_adv', '1'),
(803, 'quiz', 'delay2', '0'),
(804, 'quiz', 'delay2_adv', '1'),
(805, 'quiz', 'browsersecurity', '-'),
(806, 'quiz', 'browsersecurity_adv', '1'),
(807, 'quiz', 'autosaveperiod', '0'),
(808, 'resource', 'framesize', '130'),
(809, 'resource', 'requiremodintro', '1'),
(810, 'resource', 'displayoptions', '0,1,4,5,6'),
(811, 'resource', 'printintro', '1'),
(812, 'resource', 'display', '0'),
(813, 'resource', 'showsize', '0'),
(814, 'resource', 'showtype', '0'),
(815, 'resource', 'popupwidth', '620'),
(816, 'resource', 'popupheight', '450'),
(817, 'resource', 'filterfiles', '0'),
(818, 'scorm', 'displaycoursestructure', '0'),
(819, 'scorm', 'displaycoursestructure_adv', ''),
(820, 'scorm', 'popup', '0'),
(821, 'scorm', 'popup_adv', ''),
(822, 'scorm', 'framewidth', '100'),
(823, 'scorm', 'framewidth_adv', '1'),
(824, 'scorm', 'frameheight', '500'),
(825, 'scorm', 'frameheight_adv', '1'),
(826, 'scorm', 'winoptgrp_adv', '1'),
(827, 'scorm', 'scrollbars', '0'),
(828, 'scorm', 'directories', '0'),
(829, 'scorm', 'location', '0'),
(830, 'scorm', 'menubar', '0'),
(831, 'scorm', 'toolbar', '0'),
(832, 'scorm', 'status', '0'),
(833, 'scorm', 'skipview', '0'),
(834, 'scorm', 'skipview_adv', '1'),
(835, 'scorm', 'hidebrowse', '0'),
(836, 'scorm', 'hidebrowse_adv', '1'),
(837, 'scorm', 'hidetoc', '0'),
(838, 'scorm', 'hidetoc_adv', '1'),
(839, 'scorm', 'nav', '1'),
(840, 'scorm', 'nav_adv', '1'),
(841, 'scorm', 'navpositionleft', '-100'),
(842, 'scorm', 'navpositionleft_adv', '1'),
(843, 'scorm', 'navpositiontop', '-100'),
(844, 'scorm', 'navpositiontop_adv', '1'),
(845, 'scorm', 'collapsetocwinsize', '767'),
(846, 'scorm', 'collapsetocwinsize_adv', '1'),
(847, 'scorm', 'displayattemptstatus', '1'),
(848, 'scorm', 'displayattemptstatus_adv', ''),
(849, 'scorm', 'grademethod', '1'),
(850, 'scorm', 'maxgrade', '100'),
(851, 'scorm', 'maxattempt', '0'),
(852, 'scorm', 'whatgrade', '0'),
(853, 'scorm', 'forcecompleted', '0'),
(854, 'scorm', 'forcenewattempt', '0'),
(855, 'scorm', 'lastattemptlock', '0'),
(856, 'scorm', 'auto', '0'),
(857, 'scorm', 'updatefreq', '0'),
(858, 'scorm', 'allowtypeexternal', '0'),
(859, 'scorm', 'allowtypelocalsync', '0'),
(860, 'scorm', 'allowtypeexternalaicc', '0'),
(861, 'scorm', 'allowaicchacp', '0'),
(862, 'scorm', 'aicchacptimeout', '30'),
(863, 'scorm', 'aicchacpkeepsessiondata', '1'),
(864, 'scorm', 'forcejavascript', '1'),
(865, 'scorm', 'allowapidebug', '0'),
(866, 'scorm', 'apidebugmask', '.*'),
(867, 'url', 'framesize', '130'),
(868, 'url', 'requiremodintro', '1'),
(869, 'url', 'secretphrase', ''),
(870, 'url', 'rolesinparams', '0'),
(871, 'url', 'displayoptions', '0,1,5,6'),
(872, 'url', 'printintro', '1'),
(873, 'url', 'display', '0'),
(874, 'url', 'popupwidth', '620'),
(875, 'url', 'popupheight', '450'),
(876, 'workshop', 'grade', '80'),
(877, 'workshop', 'gradinggrade', '20'),
(878, 'workshop', 'gradedecimals', '0'),
(879, 'workshop', 'maxbytes', '0'),
(880, 'workshop', 'strategy', 'accumulative'),
(881, 'workshop', 'examplesmode', '0'),
(882, 'workshopallocation_random', 'numofreviews', '5'),
(883, 'workshopform_numerrors', 'grade0', 'No'),
(884, 'workshopform_numerrors', 'grade1', 'Yes'),
(885, 'workshopeval_best', 'comparison', '5'),
(886, 'format_singleactivity', 'activitytype', 'forum'),
(887, 'block_course_overview', 'defaultmaxcourses', '10'),
(888, 'block_course_overview', 'forcedefaultmaxcourses', '0'),
(889, 'block_course_overview', 'showchildren', '0'),
(890, 'block_course_overview', 'showwelcomearea', '0'),
(891, 'block_section_links', 'numsections1', '22'),
(892, 'block_section_links', 'incby1', '2'),
(893, 'block_section_links', 'numsections2', '40'),
(894, 'block_section_links', 'incby2', '5'),
(895, 'enrol_cohort', 'roleid', '5'),
(896, 'enrol_cohort', 'unenrolaction', '0'),
(897, 'enrol_database', 'dbtype', ''),
(898, 'enrol_database', 'dbhost', 'localhost'),
(899, 'enrol_database', 'dbuser', ''),
(900, 'enrol_database', 'dbpass', ''),
(901, 'enrol_database', 'dbname', ''),
(902, 'enrol_database', 'dbencoding', 'utf-8'),
(903, 'enrol_database', 'dbsetupsql', ''),
(904, 'enrol_database', 'dbsybasequoting', '0'),
(905, 'enrol_database', 'debugdb', '0'),
(906, 'enrol_database', 'localcoursefield', 'idnumber'),
(907, 'enrol_database', 'localuserfield', 'idnumber'),
(908, 'enrol_database', 'localrolefield', 'shortname'),
(909, 'enrol_database', 'localcategoryfield', 'id'),
(910, 'enrol_database', 'remoteenroltable', ''),
(911, 'enrol_database', 'remotecoursefield', ''),
(912, 'enrol_database', 'remoteuserfield', ''),
(913, 'enrol_database', 'remoterolefield', ''),
(914, 'enrol_database', 'defaultrole', '5'),
(915, 'enrol_database', 'ignorehiddencourses', '0'),
(916, 'enrol_database', 'unenrolaction', '0'),
(917, 'enrol_database', 'newcoursetable', ''),
(918, 'enrol_database', 'newcoursefullname', 'fullname'),
(919, 'enrol_database', 'newcourseshortname', 'shortname'),
(920, 'enrol_database', 'newcourseidnumber', 'idnumber'),
(921, 'enrol_database', 'newcoursecategory', ''),
(922, 'enrol_database', 'defaultcategory', '1'),
(923, 'enrol_database', 'templatecourse', ''),
(924, 'enrol_flatfile', 'location', ''),
(925, 'enrol_flatfile', 'encoding', 'UTF-8'),
(926, 'enrol_flatfile', 'mailstudents', '0'),
(927, 'enrol_flatfile', 'mailteachers', '0'),
(928, 'enrol_flatfile', 'mailadmins', '0'),
(929, 'enrol_flatfile', 'unenrolaction', '3'),
(930, 'enrol_flatfile', 'expiredaction', '3'),
(931, 'enrol_guest', 'requirepassword', '0'),
(932, 'enrol_guest', 'usepasswordpolicy', '0'),
(933, 'enrol_guest', 'showhint', '0'),
(934, 'enrol_guest', 'defaultenrol', '1'),
(935, 'enrol_guest', 'status', '1'),
(936, 'enrol_guest', 'status_adv', ''),
(937, 'enrol_imsenterprise', 'imsfilelocation', ''),
(938, 'enrol_imsenterprise', 'logtolocation', ''),
(939, 'enrol_imsenterprise', 'mailadmins', '0'),
(940, 'enrol_imsenterprise', 'createnewusers', '0'),
(941, 'enrol_imsenterprise', 'imsdeleteusers', '0'),
(942, 'enrol_imsenterprise', 'fixcaseusernames', '0'),
(943, 'enrol_imsenterprise', 'fixcasepersonalnames', '0'),
(944, 'enrol_imsenterprise', 'imssourcedidfallback', '0'),
(945, 'enrol_imsenterprise', 'imsrolemap01', '5'),
(946, 'enrol_imsenterprise', 'imsrolemap02', '3'),
(947, 'enrol_imsenterprise', 'imsrolemap03', '3'),
(948, 'enrol_imsenterprise', 'imsrolemap04', '5'),
(949, 'enrol_imsenterprise', 'imsrolemap05', '0'),
(950, 'enrol_imsenterprise', 'imsrolemap06', '4'),
(951, 'enrol_imsenterprise', 'imsrolemap07', '0'),
(952, 'enrol_imsenterprise', 'imsrolemap08', '4'),
(953, 'enrol_imsenterprise', 'truncatecoursecodes', '0'),
(954, 'enrol_imsenterprise', 'createnewcourses', '0'),
(955, 'enrol_imsenterprise', 'createnewcategories', '0'),
(956, 'enrol_imsenterprise', 'imsunenrol', '0'),
(957, 'enrol_imsenterprise', 'imscoursemapshortname', 'coursecode'),
(958, 'enrol_imsenterprise', 'imscoursemapfullname', 'short'),
(959, 'enrol_imsenterprise', 'imscoursemapsummary', 'ignore'),
(960, 'enrol_imsenterprise', 'imsrestricttarget', ''),
(961, 'enrol_imsenterprise', 'imscapitafix', '0'),
(962, 'enrol_manual', 'expiredaction', '1'),
(963, 'enrol_manual', 'expirynotifyhour', '6'),
(964, 'enrol_manual', 'defaultenrol', '1'),
(965, 'enrol_manual', 'status', '0'),
(966, 'enrol_manual', 'roleid', '5'),
(967, 'enrol_manual', 'enrolperiod', '0'),
(968, 'enrol_manual', 'expirynotify', '0'),
(969, 'enrol_manual', 'expirythreshold', '86400'),
(970, 'enrol_meta', 'nosyncroleids', ''),
(971, 'enrol_meta', 'syncall', '1'),
(972, 'enrol_meta', 'unenrolaction', '3'),
(973, 'enrol_mnet', 'roleid', '5'),
(974, 'enrol_mnet', 'roleid_adv', '1'),
(975, 'enrol_paypal', 'paypalbusiness', ''),
(976, 'enrol_paypal', 'mailstudents', '0'),
(977, 'enrol_paypal', 'mailteachers', '0'),
(978, 'enrol_paypal', 'mailadmins', '0'),
(979, 'enrol_paypal', 'expiredaction', '3'),
(980, 'enrol_paypal', 'status', '1'),
(981, 'enrol_paypal', 'cost', '0'),
(982, 'enrol_paypal', 'currency', 'USD'),
(983, 'enrol_paypal', 'roleid', '5'),
(984, 'enrol_paypal', 'enrolperiod', '0'),
(985, 'enrol_self', 'requirepassword', '0'),
(986, 'enrol_self', 'usepasswordpolicy', '0'),
(987, 'enrol_self', 'showhint', '0'),
(988, 'enrol_self', 'expiredaction', '1'),
(989, 'enrol_self', 'expirynotifyhour', '6'),
(990, 'enrol_self', 'defaultenrol', '1'),
(991, 'enrol_self', 'status', '1'),
(992, 'enrol_self', 'newenrols', '1'),
(993, 'enrol_self', 'groupkey', '0'),
(994, 'enrol_self', 'roleid', '5'),
(995, 'enrol_self', 'enrolperiod', '0'),
(996, 'enrol_self', 'expirynotify', '0'),
(997, 'enrol_self', 'expirythreshold', '86400'),
(998, 'enrol_self', 'longtimenosee', '0'),
(999, 'enrol_self', 'maxenrolled', '0'),
(1000, 'enrol_self', 'sendcoursewelcomemessage', '1'),
(1001, 'editor_tinymce', 'customtoolbar', 'wrap,formatselect,wrap,bold,italic,wrap,bullist,numlist,wrap,link,unlink,wrap,image\n\nundo,redo,wrap,underline,strikethrough,sub,sup,wrap,justifyleft,justifycenter,justifyright,wrap,outdent,indent,wrap,forecolor,backcolor,wrap,ltr,rtl\n\nfontselect,fontsizeselect,wrap,code,search,replace,wrap,nonbreaking,charmap,table,wrap,cleanup,removeformat,pastetext,pasteword,wrap,fullscreen'),
(1002, 'editor_tinymce', 'fontselectlist', 'Trebuchet=Trebuchet MS,Verdana,Arial,Helvetica,sans-serif;Arial=arial,helvetica,sans-serif;Courier New=courier new,courier,monospace;Georgia=georgia,times new roman,times,serif;Tahoma=tahoma,arial,helvetica,sans-serif;Times New Roman=times new roman,times,serif;Verdana=verdana,arial,helvetica,sans-serif;Impact=impact;Wingdings=wingdings'),
(1003, 'editor_tinymce', 'customconfig', ''),
(1004, 'tinymce_dragmath', 'requiretex', '1'),
(1005, 'tinymce_moodleemoticon', 'requireemoticon', '1'),
(1006, 'tinymce_spellchecker', 'spellengine', ''),
(1007, 'tinymce_spellchecker', 'spelllanguagelist', '+English=en,Danish=da,Dutch=nl,Finnish=fi,French=fr,German=de,Italian=it,Polish=pl,Portuguese=pt,Spanish=es,Swedish=sv'),
(1008, 'filter_emoticon', 'formats', '1,4,0'),
(1009, 'filter_urltolink', 'formats', '0'),
(1010, 'filter_urltolink', 'embedimages', '1'),
(1011, 'enrol_ldap', 'objectclass', '(objectClass=*)');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_context`
--

CREATE TABLE IF NOT EXISTS `mdl_context` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextlevel` bigint(10) NOT NULL DEFAULT '0',
  `instanceid` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `depth` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_cont_conins_uix` (`contextlevel`,`instanceid`),
  KEY `mdl_cont_ins_ix` (`instanceid`),
  KEY `mdl_cont_pat_ix` (`path`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='one of these must be set' AUTO_INCREMENT=45 ;

--
-- Dumping data for table `mdl_context`
--

INSERT INTO `mdl_context` (`id`, `contextlevel`, `instanceid`, `path`, `depth`) VALUES
(1, 10, 0, '/1', 1),
(2, 50, 1, '/1/2', 2),
(3, 40, 1, '/1/3', 2),
(4, 30, 1, '/1/4', 2),
(5, 30, 2, '/1/5', 2),
(6, 80, 1, '/1/2/6', 3),
(7, 80, 2, '/1/2/7', 3),
(8, 80, 3, '/1/2/8', 3),
(9, 80, 4, '/1/9', 2),
(10, 80, 5, '/1/10', 2),
(11, 80, 6, '/1/11', 2),
(12, 80, 7, '/1/12', 2),
(13, 80, 8, '/1/13', 2),
(14, 80, 9, '/1/14', 2),
(21, 30, 3, '/1/21', 2),
(22, 80, 14, '/1/5/22', 3),
(23, 80, 15, '/1/5/23', 3),
(24, 80, 16, '/1/5/24', 3),
(33, 30, 4, '/1/33', 2),
(34, 50, 4, '/1/3/34', 3),
(35, 70, 5, '/1/3/34/35', 4),
(36, 30, 5, '/1/36', 2),
(37, 50, 5, '/1/3/37', 3),
(38, 80, 17, '/1/3/37/38', 4),
(39, 80, 18, '/1/3/37/39', 4),
(40, 80, 19, '/1/3/37/40', 4),
(41, 80, 20, '/1/3/37/41', 4),
(42, 70, 6, '/1/3/37/42', 4),
(43, 70, 7, '/1/3/37/43', 4),
(44, 30, 6, '/1/44', 2);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_context_temp`
--

CREATE TABLE IF NOT EXISTS `mdl_context_temp` (
  `id` bigint(10) NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `depth` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Used by build_context_path() in upgrade and cron to keep con';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course`
--

CREATE TABLE IF NOT EXISTS `mdl_course` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `fullname` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `summary` longtext COLLATE utf8_unicode_ci,
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `format` varchar(21) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'topics',
  `showgrades` tinyint(2) NOT NULL DEFAULT '1',
  `newsitems` mediumint(5) NOT NULL DEFAULT '1',
  `startdate` bigint(10) NOT NULL DEFAULT '0',
  `marker` bigint(10) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) NOT NULL DEFAULT '0',
  `showreports` smallint(4) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `groupmode` smallint(4) NOT NULL DEFAULT '0',
  `groupmodeforce` smallint(4) NOT NULL DEFAULT '0',
  `defaultgroupingid` bigint(10) NOT NULL DEFAULT '0',
  `lang` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `calendartype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `theme` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `requested` tinyint(1) NOT NULL DEFAULT '0',
  `enablecompletion` tinyint(1) NOT NULL DEFAULT '0',
  `completionnotify` tinyint(1) NOT NULL DEFAULT '0',
  `cacherev` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_cour_cat_ix` (`category`),
  KEY `mdl_cour_idn_ix` (`idnumber`),
  KEY `mdl_cour_sho_ix` (`shortname`),
  KEY `mdl_cour_sor_ix` (`sortorder`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Central course table' AUTO_INCREMENT=6 ;

--
-- Dumping data for table `mdl_course`
--

INSERT INTO `mdl_course` (`id`, `category`, `sortorder`, `fullname`, `shortname`, `idnumber`, `summary`, `summaryformat`, `format`, `showgrades`, `newsitems`, `startdate`, `marker`, `maxbytes`, `legacyfiles`, `showreports`, `visible`, `visibleold`, `groupmode`, `groupmodeforce`, `defaultgroupingid`, `lang`, `calendartype`, `theme`, `timecreated`, `timemodified`, `requested`, `enablecompletion`, `completionnotify`, `cacherev`) VALUES
(1, 0, 1, 'Suryodaya Online', 'Suryodaya Online', '', '', 0, 'site', 1, 3, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, '', '', '', 1391626052, 1392183506, 0, 0, 0, 1392216062),
(4, 1, 10002, 'Samvidhan Jagran', 'samvidhan', '0003', '<p>This is the Samvidhan Jagran Quiz for Suryoday Trust.</p>', 1, 'singleactivity', 1, 5, 1392057000, 0, 0, 0, 0, 1, 1, 0, 0, 0, '', '', '', 1392056317, 1392056317, 0, 0, 0, 1392216062),
(5, 1, 10001, 'Samvidhan', 'samvidhanj', '0004', '<p>Samvidhan Jagran Course</p>', 1, 'weeks', 1, 5, 1392229800, 0, 0, 0, 0, 1, 1, 0, 0, 0, '', '', '', 1392216435, 1392216435, 0, 0, 0, 1392216707);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_course_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `coursecount` bigint(10) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `depth` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `theme` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_courcate_par_ix` (`parent`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Course categories' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `mdl_course_categories`
--

INSERT INTO `mdl_course_categories` (`id`, `name`, `idnumber`, `description`, `descriptionformat`, `parent`, `sortorder`, `coursecount`, `visible`, `visibleold`, `timemodified`, `depth`, `path`, `theme`) VALUES
(1, 'Miscellaneous', NULL, NULL, 0, 0, 10000, 2, 1, 1, 1391626052, 1, '/1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_completions`
--

CREATE TABLE IF NOT EXISTS `mdl_course_completions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `timeenrolled` bigint(10) NOT NULL DEFAULT '0',
  `timestarted` bigint(10) NOT NULL DEFAULT '0',
  `timecompleted` bigint(10) DEFAULT NULL,
  `reaggregate` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courcomp_usecou_uix` (`userid`,`course`),
  KEY `mdl_courcomp_use_ix` (`userid`),
  KEY `mdl_courcomp_cou_ix` (`course`),
  KEY `mdl_courcomp_tim_ix` (`timecompleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Course completion records' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_completion_aggr_methd`
--

CREATE TABLE IF NOT EXISTS `mdl_course_completion_aggr_methd` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `criteriatype` bigint(10) DEFAULT NULL,
  `method` tinyint(1) NOT NULL DEFAULT '0',
  `value` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courcompaggrmeth_coucr_uix` (`course`,`criteriatype`),
  KEY `mdl_courcompaggrmeth_cou_ix` (`course`),
  KEY `mdl_courcompaggrmeth_cri_ix` (`criteriatype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Course completion aggregation methods for criteria' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_completion_criteria`
--

CREATE TABLE IF NOT EXISTS `mdl_course_completion_criteria` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `criteriatype` bigint(10) NOT NULL DEFAULT '0',
  `module` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `moduleinstance` bigint(10) DEFAULT NULL,
  `courseinstance` bigint(10) DEFAULT NULL,
  `enrolperiod` bigint(10) DEFAULT NULL,
  `timeend` bigint(10) DEFAULT NULL,
  `gradepass` decimal(10,5) DEFAULT NULL,
  `role` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_courcompcrit_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Course completion criteria' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_completion_crit_compl`
--

CREATE TABLE IF NOT EXISTS `mdl_course_completion_crit_compl` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `criteriaid` bigint(10) NOT NULL DEFAULT '0',
  `gradefinal` decimal(10,5) DEFAULT NULL,
  `unenroled` bigint(10) DEFAULT NULL,
  `timecompleted` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courcompcritcomp_useco_uix` (`userid`,`course`,`criteriaid`),
  KEY `mdl_courcompcritcomp_use_ix` (`userid`),
  KEY `mdl_courcompcritcomp_cou_ix` (`course`),
  KEY `mdl_courcompcritcomp_cri_ix` (`criteriaid`),
  KEY `mdl_courcompcritcomp_tim_ix` (`timecompleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Course completion user records' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_format_options`
--

CREATE TABLE IF NOT EXISTS `mdl_course_format_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `format` varchar(21) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sectionid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courformopti_couforsec_uix` (`courseid`,`format`,`sectionid`,`name`),
  KEY `mdl_courformopti_cou_ix` (`courseid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores format-specific options for the course or course sect' AUTO_INCREMENT=12 ;

--
-- Dumping data for table `mdl_course_format_options`
--

INSERT INTO `mdl_course_format_options` (`id`, `courseid`, `format`, `sectionid`, `name`, `value`) VALUES
(1, 1, 'site', 0, 'numsections', '1'),
(8, 4, 'singleactivity', 0, 'activitytype', 'quiz'),
(9, 5, 'weeks', 0, 'numsections', '10'),
(10, 5, 'weeks', 0, 'hiddensections', '0'),
(11, 5, 'weeks', 0, 'coursedisplay', '0');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_modules`
--

CREATE TABLE IF NOT EXISTS `mdl_course_modules` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `module` bigint(10) NOT NULL DEFAULT '0',
  `instance` bigint(10) NOT NULL DEFAULT '0',
  `section` bigint(10) NOT NULL DEFAULT '0',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `added` bigint(10) NOT NULL DEFAULT '0',
  `score` smallint(4) NOT NULL DEFAULT '0',
  `indent` mediumint(5) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `groupmode` smallint(4) NOT NULL DEFAULT '0',
  `groupingid` bigint(10) NOT NULL DEFAULT '0',
  `groupmembersonly` smallint(4) NOT NULL DEFAULT '0',
  `completion` tinyint(1) NOT NULL DEFAULT '0',
  `completiongradeitemnumber` bigint(10) DEFAULT NULL,
  `completionview` tinyint(1) NOT NULL DEFAULT '0',
  `completionexpected` bigint(10) NOT NULL DEFAULT '0',
  `availablefrom` bigint(10) NOT NULL DEFAULT '0',
  `availableuntil` bigint(10) NOT NULL DEFAULT '0',
  `showavailability` tinyint(1) NOT NULL DEFAULT '0',
  `showdescription` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_courmodu_vis_ix` (`visible`),
  KEY `mdl_courmodu_cou_ix` (`course`),
  KEY `mdl_courmodu_mod_ix` (`module`),
  KEY `mdl_courmodu_ins_ix` (`instance`),
  KEY `mdl_courmodu_idncou_ix` (`idnumber`,`course`),
  KEY `mdl_courmodu_gro_ix` (`groupingid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='course_modules table retrofitted from MySQL' AUTO_INCREMENT=8 ;

--
-- Dumping data for table `mdl_course_modules`
--

INSERT INTO `mdl_course_modules` (`id`, `course`, `module`, `instance`, `section`, `idnumber`, `added`, `score`, `indent`, `visible`, `visibleold`, `groupmode`, `groupingid`, `groupmembersonly`, `completion`, `completiongradeitemnumber`, `completionview`, `completionexpected`, `availablefrom`, `availableuntil`, `showavailability`, `showdescription`) VALUES
(5, 4, 16, 3, 25, '1111', 1392183212, 0, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0),
(6, 5, 9, 1, 27, NULL, 1392216446, 0, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0),
(7, 5, 16, 4, 28, '', 1392216705, 0, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_modules_availability`
--

CREATE TABLE IF NOT EXISTS `mdl_course_modules_availability` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `coursemoduleid` bigint(10) NOT NULL,
  `sourcecmid` bigint(10) DEFAULT NULL,
  `requiredcompletion` tinyint(1) DEFAULT NULL,
  `gradeitemid` bigint(10) DEFAULT NULL,
  `grademin` decimal(10,5) DEFAULT NULL,
  `grademax` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_courmoduavai_cou_ix` (`coursemoduleid`),
  KEY `mdl_courmoduavai_sou_ix` (`sourcecmid`),
  KEY `mdl_courmoduavai_gra_ix` (`gradeitemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Table stores conditions that affect whether a module/activit' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_modules_avail_fields`
--

CREATE TABLE IF NOT EXISTS `mdl_course_modules_avail_fields` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `coursemoduleid` bigint(10) NOT NULL,
  `userfield` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customfieldid` bigint(10) DEFAULT NULL,
  `operator` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_courmoduavaifiel_cou_ix` (`coursemoduleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores user field conditions that affect whether an activity' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_modules_completion`
--

CREATE TABLE IF NOT EXISTS `mdl_course_modules_completion` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `coursemoduleid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `completionstate` tinyint(1) NOT NULL,
  `viewed` tinyint(1) DEFAULT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courmoducomp_usecou_uix` (`userid`,`coursemoduleid`),
  KEY `mdl_courmoducomp_cou_ix` (`coursemoduleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the completion state (completed or not completed, etc' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_published`
--

CREATE TABLE IF NOT EXISTS `mdl_course_published` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `huburl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `courseid` bigint(10) NOT NULL,
  `timepublished` bigint(10) NOT NULL,
  `enrollable` tinyint(1) NOT NULL DEFAULT '1',
  `hubcourseid` bigint(10) NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `timechecked` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Information about how and when an local courses were publish' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_request`
--

CREATE TABLE IF NOT EXISTS `mdl_course_request` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shortname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `summary` longtext COLLATE utf8_unicode_ci NOT NULL,
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `category` bigint(10) NOT NULL DEFAULT '0',
  `reason` longtext COLLATE utf8_unicode_ci NOT NULL,
  `requester` bigint(10) NOT NULL DEFAULT '0',
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_courrequ_sho_ix` (`shortname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='course requests' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_sections`
--

CREATE TABLE IF NOT EXISTS `mdl_course_sections` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `section` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `summary` longtext COLLATE utf8_unicode_ci,
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `sequence` longtext COLLATE utf8_unicode_ci,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `availablefrom` bigint(10) NOT NULL DEFAULT '0',
  `availableuntil` bigint(10) NOT NULL DEFAULT '0',
  `showavailability` tinyint(1) NOT NULL DEFAULT '0',
  `groupingid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_coursect_cousec_uix` (`course`,`section`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='to define the sections for each course' AUTO_INCREMENT=38 ;

--
-- Dumping data for table `mdl_course_sections`
--

INSERT INTO `mdl_course_sections` (`id`, `course`, `section`, `name`, `summary`, `summaryformat`, `sequence`, `visible`, `availablefrom`, `availableuntil`, `showavailability`, `groupingid`) VALUES
(12, 1, 0, NULL, '', 1, '', 1, 0, 0, 0, 0),
(13, 1, 1, NULL, '', 1, '', 1, 0, 0, 0, 0),
(25, 4, 0, NULL, '', 1, '5', 1, 0, 0, 0, 0),
(26, 4, 1, NULL, '', 1, '', 0, 0, 0, 0, 0),
(27, 5, 0, NULL, '', 1, '6', 1, 0, 0, 0, 0),
(28, 5, 1, NULL, '', 1, '7', 1, 0, 0, 0, 0),
(29, 5, 2, NULL, '', 1, '', 1, 0, 0, 0, 0),
(30, 5, 3, NULL, '', 1, '', 1, 0, 0, 0, 0),
(31, 5, 4, NULL, '', 1, '', 1, 0, 0, 0, 0),
(32, 5, 5, NULL, '', 1, '', 1, 0, 0, 0, 0),
(33, 5, 6, NULL, '', 1, '', 1, 0, 0, 0, 0),
(34, 5, 7, NULL, '', 1, '', 1, 0, 0, 0, 0),
(35, 5, 8, NULL, '', 1, '', 1, 0, 0, 0, 0),
(36, 5, 9, NULL, '', 1, '', 1, 0, 0, 0, 0),
(37, 5, 10, NULL, '', 1, '', 1, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_sections_availability`
--

CREATE TABLE IF NOT EXISTS `mdl_course_sections_availability` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `coursesectionid` bigint(10) NOT NULL,
  `sourcecmid` bigint(10) DEFAULT NULL,
  `requiredcompletion` tinyint(1) DEFAULT NULL,
  `gradeitemid` bigint(10) DEFAULT NULL,
  `grademin` decimal(10,5) DEFAULT NULL,
  `grademax` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_coursectavai_cou_ix` (`coursesectionid`),
  KEY `mdl_coursectavai_sou_ix` (`sourcecmid`),
  KEY `mdl_coursectavai_gra_ix` (`gradeitemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Completion or grade conditions that affect if a section is c' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_sections_avail_fields`
--

CREATE TABLE IF NOT EXISTS `mdl_course_sections_avail_fields` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `coursesectionid` bigint(10) NOT NULL,
  `userfield` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customfieldid` bigint(10) DEFAULT NULL,
  `operator` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_coursectavaifiel_cou_ix` (`coursesectionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores user field conditions that affect whether an activity' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_data`
--

CREATE TABLE IF NOT EXISTS `mdl_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `comments` smallint(4) NOT NULL DEFAULT '0',
  `timeavailablefrom` bigint(10) NOT NULL DEFAULT '0',
  `timeavailableto` bigint(10) NOT NULL DEFAULT '0',
  `timeviewfrom` bigint(10) NOT NULL DEFAULT '0',
  `timeviewto` bigint(10) NOT NULL DEFAULT '0',
  `requiredentries` int(8) NOT NULL DEFAULT '0',
  `requiredentriestoview` int(8) NOT NULL DEFAULT '0',
  `maxentries` int(8) NOT NULL DEFAULT '0',
  `rssarticles` smallint(4) NOT NULL DEFAULT '0',
  `singletemplate` longtext COLLATE utf8_unicode_ci,
  `listtemplate` longtext COLLATE utf8_unicode_ci,
  `listtemplateheader` longtext COLLATE utf8_unicode_ci,
  `listtemplatefooter` longtext COLLATE utf8_unicode_ci,
  `addtemplate` longtext COLLATE utf8_unicode_ci,
  `rsstemplate` longtext COLLATE utf8_unicode_ci,
  `rsstitletemplate` longtext COLLATE utf8_unicode_ci,
  `csstemplate` longtext COLLATE utf8_unicode_ci,
  `jstemplate` longtext COLLATE utf8_unicode_ci,
  `asearchtemplate` longtext COLLATE utf8_unicode_ci,
  `approval` smallint(4) NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `assessed` bigint(10) NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) NOT NULL DEFAULT '0',
  `defaultsort` bigint(10) NOT NULL DEFAULT '0',
  `defaultsortdir` smallint(4) NOT NULL DEFAULT '0',
  `editany` smallint(4) NOT NULL DEFAULT '0',
  `notification` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_data_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='all database activities' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_data_content`
--

CREATE TABLE IF NOT EXISTS `mdl_data_content` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `fieldid` bigint(10) NOT NULL DEFAULT '0',
  `recordid` bigint(10) NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8_unicode_ci,
  `content1` longtext COLLATE utf8_unicode_ci,
  `content2` longtext COLLATE utf8_unicode_ci,
  `content3` longtext COLLATE utf8_unicode_ci,
  `content4` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_datacont_rec_ix` (`recordid`),
  KEY `mdl_datacont_fie_ix` (`fieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='the content introduced in each record/fields' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_data_fields`
--

CREATE TABLE IF NOT EXISTS `mdl_data_fields` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `dataid` bigint(10) NOT NULL DEFAULT '0',
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `param1` longtext COLLATE utf8_unicode_ci,
  `param2` longtext COLLATE utf8_unicode_ci,
  `param3` longtext COLLATE utf8_unicode_ci,
  `param4` longtext COLLATE utf8_unicode_ci,
  `param5` longtext COLLATE utf8_unicode_ci,
  `param6` longtext COLLATE utf8_unicode_ci,
  `param7` longtext COLLATE utf8_unicode_ci,
  `param8` longtext COLLATE utf8_unicode_ci,
  `param9` longtext COLLATE utf8_unicode_ci,
  `param10` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_datafiel_typdat_ix` (`type`,`dataid`),
  KEY `mdl_datafiel_dat_ix` (`dataid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='every field available' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_data_records`
--

CREATE TABLE IF NOT EXISTS `mdl_data_records` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `dataid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `approved` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_datareco_dat_ix` (`dataid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='every record introduced' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol`
--

CREATE TABLE IF NOT EXISTS `mdl_enrol` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `enrol` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enrolperiod` bigint(10) DEFAULT '0',
  `enrolstartdate` bigint(10) DEFAULT '0',
  `enrolenddate` bigint(10) DEFAULT '0',
  `expirynotify` tinyint(1) DEFAULT '0',
  `expirythreshold` bigint(10) DEFAULT '0',
  `notifyall` tinyint(1) DEFAULT '0',
  `password` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cost` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `roleid` bigint(10) DEFAULT '0',
  `customint1` bigint(10) DEFAULT NULL,
  `customint2` bigint(10) DEFAULT NULL,
  `customint3` bigint(10) DEFAULT NULL,
  `customint4` bigint(10) DEFAULT NULL,
  `customint5` bigint(10) DEFAULT NULL,
  `customint6` bigint(10) DEFAULT NULL,
  `customint7` bigint(10) DEFAULT NULL,
  `customint8` bigint(10) DEFAULT NULL,
  `customchar1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customchar2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customchar3` varchar(1333) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customdec1` decimal(12,7) DEFAULT NULL,
  `customdec2` decimal(12,7) DEFAULT NULL,
  `customtext1` longtext COLLATE utf8_unicode_ci,
  `customtext2` longtext COLLATE utf8_unicode_ci,
  `customtext3` longtext COLLATE utf8_unicode_ci,
  `customtext4` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_enro_enr_ix` (`enrol`),
  KEY `mdl_enro_cou_ix` (`courseid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Instances of enrolment plugins used in courses, fields marke' AUTO_INCREMENT=13 ;

--
-- Dumping data for table `mdl_enrol`
--

INSERT INTO `mdl_enrol` (`id`, `enrol`, `status`, `courseid`, `sortorder`, `name`, `enrolperiod`, `enrolstartdate`, `enrolenddate`, `expirynotify`, `expirythreshold`, `notifyall`, `password`, `cost`, `currency`, `roleid`, `customint1`, `customint2`, `customint3`, `customint4`, `customint5`, `customint6`, `customint7`, `customint8`, `customchar1`, `customchar2`, `customchar3`, `customdec1`, `customdec2`, `customtext1`, `customtext2`, `customtext3`, `customtext4`, `timecreated`, `timemodified`) VALUES
(7, 'manual', 0, 4, 0, NULL, 0, 0, 0, 0, 86400, 0, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1392056318, 1392056318),
(8, 'guest', 1, 4, 1, NULL, 0, 0, 0, 0, 0, 0, '', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1392056318, 1392056318),
(9, 'self', 1, 4, 2, NULL, 0, 0, 0, 0, 86400, 0, NULL, NULL, NULL, 5, 0, 0, 0, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1392056318, 1392056318),
(10, 'manual', 0, 5, 0, NULL, 0, 0, 0, 0, 86400, 0, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1392216437, 1392216437),
(11, 'guest', 1, 5, 1, NULL, 0, 0, 0, 0, 0, 0, '', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1392216437, 1392216437),
(12, 'self', 1, 5, 2, NULL, 0, 0, 0, 0, 86400, 0, NULL, NULL, NULL, 5, 0, 0, 0, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1392216437, 1392216437);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol_flatfile`
--

CREATE TABLE IF NOT EXISTS `mdl_enrol_flatfile` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `roleid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_enroflat_cou_ix` (`courseid`),
  KEY `mdl_enroflat_use_ix` (`userid`),
  KEY `mdl_enroflat_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='enrol_flatfile table retrofitted from MySQL' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol_paypal`
--

CREATE TABLE IF NOT EXISTS `mdl_enrol_paypal` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `business` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `receiver_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `receiver_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `item_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `instanceid` bigint(10) NOT NULL DEFAULT '0',
  `memo` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tax` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `option_name1` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `option_selection1_x` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `option_name2` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `option_selection2_x` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `payment_status` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pending_reason` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reason_code` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `txn_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parent_txn_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `payment_type` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timeupdated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Holds all known information about PayPal transactions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_event`
--

CREATE TABLE IF NOT EXISTS `mdl_event` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `format` smallint(4) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `repeatid` bigint(10) NOT NULL DEFAULT '0',
  `modulename` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `instance` bigint(10) NOT NULL DEFAULT '0',
  `eventtype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeduration` bigint(10) NOT NULL DEFAULT '0',
  `visible` smallint(4) NOT NULL DEFAULT '1',
  `uuid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sequence` bigint(10) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `subscriptionid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_even_cou_ix` (`courseid`),
  KEY `mdl_even_use_ix` (`userid`),
  KEY `mdl_even_tim_ix` (`timestart`),
  KEY `mdl_even_tim2_ix` (`timeduration`),
  KEY `mdl_even_grocouvisuse_ix` (`groupid`,`courseid`,`visible`,`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='For everything with a time associated to it' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `mdl_event`
--

INSERT INTO `mdl_event` (`id`, `name`, `description`, `format`, `courseid`, `groupid`, `userid`, `repeatid`, `modulename`, `instance`, `eventtype`, `timestart`, `timeduration`, `visible`, `uuid`, `sequence`, `timemodified`, `subscriptionid`) VALUES
(1, 'Quiz 1', '<div class="no-overflow"><p>The following Quiz is the Part 1 of the Main Quiz</p></div>', 1, 4, 0, 2, 0, 'quiz', 3, 'open', 1392183000, 86400, 1, '', 1, 1392183247, NULL),
(2, 'Assessment 1', '', 1, 5, 0, 2, 0, 'quiz', 4, 'open', 1392216600, 259200, 1, '', 1, 1392216705, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_events_handlers`
--

CREATE TABLE IF NOT EXISTS `mdl_events_handlers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `eventname` varchar(166) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `component` varchar(166) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `handlerfile` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `handlerfunction` longtext COLLATE utf8_unicode_ci,
  `schedule` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `internal` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_evenhand_evecom_uix` (`eventname`,`component`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table is for storing which components requests what typ' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `mdl_events_handlers`
--

INSERT INTO `mdl_events_handlers` (`id`, `eventname`, `component`, `handlerfile`, `handlerfunction`, `schedule`, `status`, `internal`) VALUES
(1, 'portfolio_send', 'moodle', '/lib/portfoliolib.php', 's:22:"portfolio_handle_event";', 'cron', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_events_queue`
--

CREATE TABLE IF NOT EXISTS `mdl_events_queue` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `eventdata` longtext COLLATE utf8_unicode_ci NOT NULL,
  `stackdump` longtext COLLATE utf8_unicode_ci,
  `userid` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_evenqueu_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table is for storing queued events. It stores only one ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_events_queue_handlers`
--

CREATE TABLE IF NOT EXISTS `mdl_events_queue_handlers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `queuedeventid` bigint(10) NOT NULL,
  `handlerid` bigint(10) NOT NULL,
  `status` bigint(10) DEFAULT NULL,
  `errormessage` longtext COLLATE utf8_unicode_ci,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_evenqueuhand_que_ix` (`queuedeventid`),
  KEY `mdl_evenqueuhand_han_ix` (`handlerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This is the list of queued handlers for processing. The even' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_event_subscriptions`
--

CREATE TABLE IF NOT EXISTS `mdl_event_subscriptions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `eventtype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pollinterval` bigint(10) NOT NULL DEFAULT '0',
  `lastupdated` bigint(10) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tracks subscriptions to remote calendars.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_external_functions`
--

CREATE TABLE IF NOT EXISTS `mdl_external_functions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `classname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `methodname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `classpath` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `capabilities` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_extefunc_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='list of all external functions' AUTO_INCREMENT=114 ;

--
-- Dumping data for table `mdl_external_functions`
--

INSERT INTO `mdl_external_functions` (`id`, `name`, `classname`, `methodname`, `classpath`, `component`, `capabilities`) VALUES
(1, 'core_cohort_create_cohorts', 'core_cohort_external', 'create_cohorts', 'cohort/externallib.php', 'moodle', 'moodle/cohort:manage'),
(2, 'core_cohort_delete_cohorts', 'core_cohort_external', 'delete_cohorts', 'cohort/externallib.php', 'moodle', 'moodle/cohort:manage'),
(3, 'core_cohort_get_cohorts', 'core_cohort_external', 'get_cohorts', 'cohort/externallib.php', 'moodle', 'moodle/cohort:view'),
(4, 'core_cohort_update_cohorts', 'core_cohort_external', 'update_cohorts', 'cohort/externallib.php', 'moodle', 'moodle/cohort:manage'),
(5, 'core_cohort_add_cohort_members', 'core_cohort_external', 'add_cohort_members', 'cohort/externallib.php', 'moodle', 'moodle/cohort:assign'),
(6, 'core_cohort_delete_cohort_members', 'core_cohort_external', 'delete_cohort_members', 'cohort/externallib.php', 'moodle', 'moodle/cohort:assign'),
(7, 'core_cohort_get_cohort_members', 'core_cohort_external', 'get_cohort_members', 'cohort/externallib.php', 'moodle', 'moodle/cohort:view'),
(8, 'moodle_group_create_groups', 'core_group_external', 'create_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(9, 'core_group_create_groups', 'core_group_external', 'create_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(10, 'moodle_group_get_groups', 'core_group_external', 'get_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(11, 'core_group_get_groups', 'core_group_external', 'get_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(12, 'moodle_group_get_course_groups', 'core_group_external', 'get_course_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(13, 'core_group_get_course_groups', 'core_group_external', 'get_course_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(14, 'moodle_group_delete_groups', 'core_group_external', 'delete_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(15, 'core_group_delete_groups', 'core_group_external', 'delete_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(16, 'moodle_group_get_groupmembers', 'core_group_external', 'get_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(17, 'core_group_get_group_members', 'core_group_external', 'get_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(18, 'moodle_group_add_groupmembers', 'core_group_external', 'add_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(19, 'core_group_add_group_members', 'core_group_external', 'add_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(20, 'moodle_group_delete_groupmembers', 'core_group_external', 'delete_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(21, 'core_group_delete_group_members', 'core_group_external', 'delete_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(22, 'core_group_create_groupings', 'core_group_external', 'create_groupings', 'group/externallib.php', 'moodle', ''),
(23, 'core_group_update_groupings', 'core_group_external', 'update_groupings', 'group/externallib.php', 'moodle', ''),
(24, 'core_group_get_groupings', 'core_group_external', 'get_groupings', 'group/externallib.php', 'moodle', ''),
(25, 'core_group_get_course_groupings', 'core_group_external', 'get_course_groupings', 'group/externallib.php', 'moodle', ''),
(26, 'core_group_delete_groupings', 'core_group_external', 'delete_groupings', 'group/externallib.php', 'moodle', ''),
(27, 'core_group_assign_grouping', 'core_group_external', 'assign_grouping', 'group/externallib.php', 'moodle', ''),
(28, 'core_group_unassign_grouping', 'core_group_external', 'unassign_grouping', 'group/externallib.php', 'moodle', ''),
(29, 'moodle_file_get_files', 'core_files_external', 'get_files', 'files/externallib.php', 'moodle', ''),
(30, 'core_files_get_files', 'core_files_external', 'get_files', 'files/externallib.php', 'moodle', ''),
(31, 'moodle_file_upload', 'core_files_external', 'upload', 'files/externallib.php', 'moodle', ''),
(32, 'core_files_upload', 'core_files_external', 'upload', 'files/externallib.php', 'moodle', ''),
(33, 'moodle_user_create_users', 'core_user_external', 'create_users', 'user/externallib.php', 'moodle', 'moodle/user:create'),
(34, 'core_user_create_users', 'core_user_external', 'create_users', 'user/externallib.php', 'moodle', 'moodle/user:create'),
(35, 'core_user_get_users', 'core_user_external', 'get_users', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update'),
(36, 'moodle_user_get_users_by_id', 'core_user_external', 'get_users_by_id', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update'),
(37, 'core_user_get_users_by_field', 'core_user_external', 'get_users_by_field', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update'),
(38, 'core_user_get_users_by_id', 'core_user_external', 'get_users_by_id', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update'),
(39, 'moodle_user_get_users_by_courseid', 'core_enrol_external', 'get_enrolled_users', 'enrol/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),
(40, 'moodle_user_get_course_participants_by_id', 'core_user_external', 'get_course_user_profiles', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),
(41, 'core_user_get_course_user_profiles', 'core_user_external', 'get_course_user_profiles', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),
(42, 'moodle_user_delete_users', 'core_user_external', 'delete_users', 'user/externallib.php', 'moodle', 'moodle/user:delete'),
(43, 'core_user_delete_users', 'core_user_external', 'delete_users', 'user/externallib.php', 'moodle', 'moodle/user:delete'),
(44, 'moodle_user_update_users', 'core_user_external', 'update_users', 'user/externallib.php', 'moodle', 'moodle/user:update'),
(45, 'core_user_update_users', 'core_user_external', 'update_users', 'user/externallib.php', 'moodle', 'moodle/user:update'),
(46, 'core_user_add_user_device', 'core_user_external', 'add_user_device', 'user/externallib.php', 'moodle', ''),
(47, 'core_enrol_get_enrolled_users_with_capability', 'core_enrol_external', 'get_enrolled_users_with_capability', 'enrol/externallib.php', 'moodle', ''),
(48, 'moodle_enrol_get_enrolled_users', 'moodle_enrol_external', 'get_enrolled_users', 'enrol/externallib.php', 'moodle', 'moodle/site:viewparticipants, moodle/course:viewparticipants,\n            moodle/role:review, moodle/site:accessallgroups, moodle/course:enrolreview'),
(49, 'core_enrol_get_enrolled_users', 'core_enrol_external', 'get_enrolled_users', 'enrol/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),
(50, 'moodle_enrol_get_users_courses', 'core_enrol_external', 'get_users_courses', 'enrol/externallib.php', 'moodle', 'moodle/course:viewparticipants'),
(51, 'core_enrol_get_users_courses', 'core_enrol_external', 'get_users_courses', 'enrol/externallib.php', 'moodle', 'moodle/course:viewparticipants'),
(52, 'core_enrol_get_course_enrolment_methods', 'core_enrol_external', 'get_course_enrolment_methods', 'enrol/externallib.php', 'moodle', ''),
(53, 'moodle_role_assign', 'core_role_external', 'assign_roles', 'enrol/externallib.php', 'moodle', 'moodle/role:assign'),
(54, 'core_role_assign_roles', 'core_role_external', 'assign_roles', 'enrol/externallib.php', 'moodle', 'moodle/role:assign'),
(55, 'moodle_role_unassign', 'core_role_external', 'unassign_roles', 'enrol/externallib.php', 'moodle', 'moodle/role:assign'),
(56, 'core_role_unassign_roles', 'core_role_external', 'unassign_roles', 'enrol/externallib.php', 'moodle', 'moodle/role:assign'),
(57, 'core_course_get_contents', 'core_course_external', 'get_course_contents', 'course/externallib.php', 'moodle', 'moodle/course:update,moodle/course:viewhiddencourses'),
(58, 'moodle_course_get_courses', 'core_course_external', 'get_courses', 'course/externallib.php', 'moodle', 'moodle/course:view,moodle/course:update,moodle/course:viewhiddencourses'),
(59, 'core_course_get_courses', 'core_course_external', 'get_courses', 'course/externallib.php', 'moodle', 'moodle/course:view,moodle/course:update,moodle/course:viewhiddencourses'),
(60, 'moodle_course_create_courses', 'core_course_external', 'create_courses', 'course/externallib.php', 'moodle', 'moodle/course:create,moodle/course:visibility'),
(61, 'core_course_create_courses', 'core_course_external', 'create_courses', 'course/externallib.php', 'moodle', 'moodle/course:create,moodle/course:visibility'),
(62, 'core_course_delete_courses', 'core_course_external', 'delete_courses', 'course/externallib.php', 'moodle', 'moodle/course:delete'),
(63, 'core_course_delete_modules', 'core_course_external', 'delete_modules', 'course/externallib.php', 'moodle', 'moodle/course:manageactivities'),
(64, 'core_course_duplicate_course', 'core_course_external', 'duplicate_course', 'course/externallib.php', 'moodle', 'moodle/backup:backupcourse,moodle/restore:restorecourse,moodle/course:create'),
(65, 'core_course_update_courses', 'core_course_external', 'update_courses', 'course/externallib.php', 'moodle', 'moodle/course:update,moodle/course:changecategory,moodle/course:changefullname,moodle/course:changeshortname,moodle/course:changeidnumber,moodle/course:changesummary,moodle/course:visibility'),
(66, 'core_course_get_categories', 'core_course_external', 'get_categories', 'course/externallib.php', 'moodle', 'moodle/category:viewhiddencategories'),
(67, 'core_course_create_categories', 'core_course_external', 'create_categories', 'course/externallib.php', 'moodle', 'moodle/category:manage'),
(68, 'core_course_update_categories', 'core_course_external', 'update_categories', 'course/externallib.php', 'moodle', 'moodle/category:manage'),
(69, 'core_course_delete_categories', 'core_course_external', 'delete_categories', 'course/externallib.php', 'moodle', 'moodle/category:manage'),
(70, 'core_course_import_course', 'core_course_external', 'import_course', 'course/externallib.php', 'moodle', 'moodle/backup:backuptargetimport, moodle/restore:restoretargetimport'),
(71, 'moodle_message_send_instantmessages', 'core_message_external', 'send_instant_messages', 'message/externallib.php', 'moodle', 'moodle/site:sendmessage'),
(72, 'core_message_send_instant_messages', 'core_message_external', 'send_instant_messages', 'message/externallib.php', 'moodle', 'moodle/site:sendmessage'),
(73, 'core_message_create_contacts', 'core_message_external', 'create_contacts', 'message/externallib.php', 'moodle', ''),
(74, 'core_message_delete_contacts', 'core_message_external', 'delete_contacts', 'message/externallib.php', 'moodle', ''),
(75, 'core_message_block_contacts', 'core_message_external', 'block_contacts', 'message/externallib.php', 'moodle', ''),
(76, 'core_message_unblock_contacts', 'core_message_external', 'unblock_contacts', 'message/externallib.php', 'moodle', ''),
(77, 'core_message_get_contacts', 'core_message_external', 'get_contacts', 'message/externallib.php', 'moodle', ''),
(78, 'core_message_search_contacts', 'core_message_external', 'search_contacts', 'message/externallib.php', 'moodle', ''),
(79, 'moodle_notes_create_notes', 'core_notes_external', 'create_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:manage'),
(80, 'core_notes_create_notes', 'core_notes_external', 'create_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:manage'),
(81, 'core_notes_delete_notes', 'core_notes_external', 'delete_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:manage'),
(82, 'core_notes_get_notes', 'core_notes_external', 'get_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:view'),
(83, 'core_notes_update_notes', 'core_notes_external', 'update_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:manage'),
(84, 'core_grading_get_definitions', 'core_grading_external', 'get_definitions', 'grade/externallib.php', 'moodle', ''),
(85, 'core_grade_get_definitions', 'core_grade_external', 'get_definitions', 'grade/externallib.php', 'moodle', ''),
(86, 'core_grading_get_gradingform_instances', 'core_grading_external', 'get_gradingform_instances', 'grade/externallib.php', 'moodle', ''),
(87, 'moodle_webservice_get_siteinfo', 'core_webservice_external', 'get_site_info', 'webservice/externallib.php', 'moodle', ''),
(88, 'core_webservice_get_site_info', 'core_webservice_external', 'get_site_info', 'webservice/externallib.php', 'moodle', ''),
(89, 'core_get_string', 'core_external', 'get_string', 'lib/external/externallib.php', 'moodle', ''),
(90, 'core_get_strings', 'core_external', 'get_strings', 'lib/external/externallib.php', 'moodle', ''),
(91, 'core_get_component_strings', 'core_external', 'get_component_strings', 'lib/external/externallib.php', 'moodle', ''),
(92, 'core_calendar_delete_calendar_events', 'core_calendar_external', 'delete_calendar_events', 'calendar/externallib.php', 'moodle', 'moodle/calendar:manageentries'),
(93, 'core_calendar_get_calendar_events', 'core_calendar_external', 'get_calendar_events', 'calendar/externallib.php', 'moodle', 'moodle/calendar:manageentries'),
(94, 'core_calendar_create_calendar_events', 'core_calendar_external', 'create_calendar_events', 'calendar/externallib.php', 'moodle', 'moodle/calendar:manageentries'),
(95, 'mod_assign_get_grades', 'mod_assign_external', 'get_grades', 'mod/assign/externallib.php', 'mod_assign', ''),
(96, 'mod_assign_get_assignments', 'mod_assign_external', 'get_assignments', 'mod/assign/externallib.php', 'mod_assign', ''),
(97, 'mod_assign_get_submissions', 'mod_assign_external', 'get_submissions', 'mod/assign/externallib.php', 'mod_assign', ''),
(98, 'mod_assign_get_user_flags', 'mod_assign_external', 'get_user_flags', 'mod/assign/externallib.php', 'mod_assign', ''),
(99, 'mod_assign_set_user_flags', 'mod_assign_external', 'set_user_flags', 'mod/assign/externallib.php', 'mod_assign', 'mod/assign:grade'),
(100, 'mod_assign_get_user_mappings', 'mod_assign_external', 'get_user_mappings', 'mod/assign/externallib.php', 'mod_assign', ''),
(101, 'mod_assign_revert_submissions_to_draft', 'mod_assign_external', 'revert_submissions_to_draft', 'mod/assign/externallib.php', 'mod_assign', ''),
(102, 'mod_assign_lock_submissions', 'mod_assign_external', 'lock_submissions', 'mod/assign/externallib.php', 'mod_assign', ''),
(103, 'mod_assign_unlock_submissions', 'mod_assign_external', 'unlock_submissions', 'mod/assign/externallib.php', 'mod_assign', ''),
(104, 'mod_assign_save_submission', 'mod_assign_external', 'save_submission', 'mod/assign/externallib.php', 'mod_assign', ''),
(105, 'mod_assign_submit_for_grading', 'mod_assign_external', 'submit_for_grading', 'mod/assign/externallib.php', 'mod_assign', ''),
(106, 'mod_assign_save_grade', 'mod_assign_external', 'save_grade', 'mod/assign/externallib.php', 'mod_assign', ''),
(107, 'mod_assign_save_user_extensions', 'mod_assign_external', 'save_user_extensions', 'mod/assign/externallib.php', 'mod_assign', ''),
(108, 'mod_assign_reveal_identities', 'mod_assign_external', 'reveal_identities', 'mod/assign/externallib.php', 'mod_assign', ''),
(109, 'mod_forum_get_forums_by_courses', 'mod_forum_external', 'get_forums_by_courses', 'mod/forum/externallib.php', 'mod_forum', 'mod/forum:viewdiscussion'),
(110, 'mod_forum_get_forum_discussions', 'mod_forum_external', 'get_forum_discussions', 'mod/forum/externallib.php', 'mod_forum', 'mod/forum:viewdiscussion, mod/forum:viewqandawithoutposting'),
(111, 'moodle_enrol_manual_enrol_users', 'enrol_manual_external', 'enrol_users', 'enrol/manual/externallib.php', 'enrol_manual', 'enrol/manual:enrol'),
(112, 'enrol_manual_enrol_users', 'enrol_manual_external', 'enrol_users', 'enrol/manual/externallib.php', 'enrol_manual', 'enrol/manual:enrol'),
(113, 'enrol_self_get_instance_info', 'enrol_self_external', 'get_instance_info', 'enrol/self/externallib.php', 'enrol_self', '');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_external_services`
--

CREATE TABLE IF NOT EXISTS `mdl_external_services` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL,
  `requiredcapability` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `restrictedusers` tinyint(1) NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `shortname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `downloadfiles` tinyint(1) NOT NULL DEFAULT '0',
  `uploadfiles` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_exteserv_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='built in and custom external services' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `mdl_external_services`
--

INSERT INTO `mdl_external_services` (`id`, `name`, `enabled`, `requiredcapability`, `restrictedusers`, `component`, `timecreated`, `timemodified`, `shortname`, `downloadfiles`, `uploadfiles`) VALUES
(1, 'Moodle mobile web service', 0, NULL, 0, 'moodle', 1391626096, NULL, 'moodle_mobile_app', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_external_services_functions`
--

CREATE TABLE IF NOT EXISTS `mdl_external_services_functions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `externalserviceid` bigint(10) NOT NULL,
  `functionname` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_exteservfunc_ext_ix` (`externalserviceid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='lists functions available in each service group' AUTO_INCREMENT=12 ;

--
-- Dumping data for table `mdl_external_services_functions`
--

INSERT INTO `mdl_external_services_functions` (`id`, `externalserviceid`, `functionname`) VALUES
(1, 1, 'moodle_enrol_get_users_courses'),
(2, 1, 'moodle_enrol_get_enrolled_users'),
(3, 1, 'moodle_user_get_users_by_id'),
(4, 1, 'moodle_webservice_get_siteinfo'),
(5, 1, 'moodle_notes_create_notes'),
(6, 1, 'moodle_user_get_course_participants_by_id'),
(7, 1, 'moodle_user_get_users_by_courseid'),
(8, 1, 'moodle_message_send_instantmessages'),
(9, 1, 'core_course_get_contents'),
(10, 1, 'core_get_component_strings'),
(11, 1, 'core_user_add_user_device');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_external_services_users`
--

CREATE TABLE IF NOT EXISTS `mdl_external_services_users` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `externalserviceid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `iprestriction` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `validuntil` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_exteservuser_ext_ix` (`externalserviceid`),
  KEY `mdl_exteservuser_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='users allowed to use services with restricted users flag' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_external_tokens`
--

CREATE TABLE IF NOT EXISTS `mdl_external_tokens` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `token` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tokentype` smallint(4) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `externalserviceid` bigint(10) NOT NULL,
  `sid` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contextid` bigint(10) NOT NULL,
  `creatorid` bigint(10) NOT NULL DEFAULT '1',
  `iprestriction` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `validuntil` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `lastaccess` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_extetoke_use_ix` (`userid`),
  KEY `mdl_extetoke_ext_ix` (`externalserviceid`),
  KEY `mdl_extetoke_con_ix` (`contextid`),
  KEY `mdl_extetoke_cre_ix` (`creatorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Security tokens for accessing of external services' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `anonymous` tinyint(1) NOT NULL DEFAULT '1',
  `email_notification` tinyint(1) NOT NULL DEFAULT '1',
  `multiple_submit` tinyint(1) NOT NULL DEFAULT '1',
  `autonumbering` tinyint(1) NOT NULL DEFAULT '1',
  `site_after_submit` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `page_after_submit` longtext COLLATE utf8_unicode_ci NOT NULL,
  `page_after_submitformat` tinyint(2) NOT NULL DEFAULT '0',
  `publish_stats` tinyint(1) NOT NULL DEFAULT '0',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feed_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='all feedbacks' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_completed`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_completed` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `random_response` bigint(10) NOT NULL DEFAULT '0',
  `anonymous_response` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedcomp_use_ix` (`userid`),
  KEY `mdl_feedcomp_fee_ix` (`feedback`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='filled out feedback' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_completedtmp`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_completedtmp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `guestid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `random_response` bigint(10) NOT NULL DEFAULT '0',
  `anonymous_response` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedcomp_use2_ix` (`userid`),
  KEY `mdl_feedcomp_fee2_ix` (`feedback`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='filled out feedback' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_item`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_item` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `template` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `presentation` longtext COLLATE utf8_unicode_ci NOT NULL,
  `typ` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hasvalue` tinyint(1) NOT NULL DEFAULT '0',
  `position` smallint(3) NOT NULL DEFAULT '0',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `dependitem` bigint(10) NOT NULL DEFAULT '0',
  `dependvalue` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `options` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_feeditem_fee_ix` (`feedback`),
  KEY `mdl_feeditem_tem_ix` (`template`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='feedback_items' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_sitecourse_map`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_sitecourse_map` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedbackid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedsitemap_cou_ix` (`courseid`),
  KEY `mdl_feedsitemap_fee_ix` (`feedbackid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='feedback sitecourse map' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_template`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_template` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `ispublic` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_feedtemp_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='templates of feedbackstructures' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_tracking`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_tracking` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedtrac_use_ix` (`userid`),
  KEY `mdl_feedtrac_fee_ix` (`feedback`),
  KEY `mdl_feedtrac_com_ix` (`completed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='feedback trackingdata' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_value`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_value` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course_id` bigint(10) NOT NULL DEFAULT '0',
  `item` bigint(10) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) NOT NULL DEFAULT '0',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_feedvalu_cou_ix` (`course_id`),
  KEY `mdl_feedvalu_ite_ix` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='values of the completeds' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_valuetmp`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_valuetmp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course_id` bigint(10) NOT NULL DEFAULT '0',
  `item` bigint(10) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) NOT NULL DEFAULT '0',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_feedvalu_cou2_ix` (`course_id`),
  KEY `mdl_feedvalu_ite2_ix` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='values of the completedstmp' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_files`
--

CREATE TABLE IF NOT EXISTS `mdl_files` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contenthash` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pathnamehash` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `filearea` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `filepath` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint(10) DEFAULT NULL,
  `filesize` bigint(10) NOT NULL,
  `mimetype` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `source` longtext COLLATE utf8_unicode_ci,
  `author` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `license` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `referencefileid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_file_pat_uix` (`pathnamehash`),
  KEY `mdl_file_comfilconite_ix` (`component`,`filearea`,`contextid`,`itemid`),
  KEY `mdl_file_con_ix` (`contenthash`),
  KEY `mdl_file_con2_ix` (`contextid`),
  KEY `mdl_file_use_ix` (`userid`),
  KEY `mdl_file_ref_ix` (`referencefileid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='description of files, content is stored in sha1 file pool' AUTO_INCREMENT=6 ;

--
-- Dumping data for table `mdl_files`
--

INSERT INTO `mdl_files` (`id`, `contenthash`, `pathnamehash`, `contextid`, `component`, `filearea`, `itemid`, `filepath`, `filename`, `userid`, `filesize`, `mimetype`, `status`, `source`, `author`, `license`, `timecreated`, `timemodified`, `sortorder`, `referencefileid`) VALUES
(1, 'fb262df98d67c4e2a5c9802403821e00cf2992af', '508e674d49c30d4fde325fe6c7f6fd3d56b247e1', 1, 'assignfeedback_editpdf', 'stamps', 0, '/', 'smile.png', 2, 1600, 'image/png', 0, NULL, NULL, NULL, 1391627018, 1391627018, 0, NULL),
(2, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '70b7cdade7b4e27d4e83f0cdaad10d6a3c0cccb5', 1, 'assignfeedback_editpdf', 'stamps', 0, '/', '.', 2, 0, NULL, 0, NULL, NULL, NULL, 1391627018, 1391627018, 0, NULL),
(3, 'a4f146f120e7e00d21291b924e26aaabe9f4297a', '68317eab56c67d32aeaee5acf509a0c4aa828b6b', 1, 'assignfeedback_editpdf', 'stamps', 0, '/', 'sad.png', 2, 1702, 'image/png', 0, NULL, NULL, NULL, 1391627018, 1391627018, 0, NULL),
(4, '33957e31ba9c763a74638b825f0a9154acf475e1', '695a55ff780e61c9e59428aa425430b0d6bde53b', 1, 'assignfeedback_editpdf', 'stamps', 0, '/', 'tick.png', 2, 1187, 'image/png', 0, NULL, NULL, NULL, 1391627018, 1391627018, 0, NULL),
(5, 'd613d55f37bb76d38d4ffb4b7b83e6c694778c30', '373e63af262a9b8466ba8632551520be793c37ff', 1, 'assignfeedback_editpdf', 'stamps', 0, '/', 'cross.png', 2, 1230, 'image/png', 0, NULL, NULL, NULL, 1391627019, 1391627019, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_files_reference`
--

CREATE TABLE IF NOT EXISTS `mdl_files_reference` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `repositoryid` bigint(10) NOT NULL,
  `lastsync` bigint(10) DEFAULT NULL,
  `reference` longtext COLLATE utf8_unicode_ci,
  `referencehash` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_filerefe_repref_uix` (`repositoryid`,`referencehash`),
  KEY `mdl_filerefe_rep_ix` (`repositoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Store files references' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_filter_active`
--

CREATE TABLE IF NOT EXISTS `mdl_filter_active` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `active` smallint(4) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_filtacti_confil_uix` (`contextid`,`filter`),
  KEY `mdl_filtacti_con_ix` (`contextid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores information about which filters are active in which c' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `mdl_filter_active`
--

INSERT INTO `mdl_filter_active` (`id`, `filter`, `contextid`, `active`, `sortorder`) VALUES
(1, 'activitynames', 1, 1, 1),
(2, 'mediaplugin', 1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_filter_config`
--

CREATE TABLE IF NOT EXISTS `mdl_filter_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_filtconf_confilnam_uix` (`contextid`,`filter`,`name`),
  KEY `mdl_filtconf_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores per-context configuration settings for filters which ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_folder`
--

CREATE TABLE IF NOT EXISTS `mdl_folder` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `display` smallint(4) NOT NULL DEFAULT '0',
  `showexpanded` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_fold_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='each record is one folder resource' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum`
--

CREATE TABLE IF NOT EXISTS `mdl_forum` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'general',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `assessed` bigint(10) NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '0',
  `maxattachments` bigint(10) NOT NULL DEFAULT '1',
  `forcesubscribe` tinyint(1) NOT NULL DEFAULT '0',
  `trackingtype` tinyint(2) NOT NULL DEFAULT '1',
  `rsstype` tinyint(2) NOT NULL DEFAULT '0',
  `rssarticles` tinyint(2) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `warnafter` bigint(10) NOT NULL DEFAULT '0',
  `blockafter` bigint(10) NOT NULL DEFAULT '0',
  `blockperiod` bigint(10) NOT NULL DEFAULT '0',
  `completiondiscussions` int(9) NOT NULL DEFAULT '0',
  `completionreplies` int(9) NOT NULL DEFAULT '0',
  `completionposts` int(9) NOT NULL DEFAULT '0',
  `displaywordcount` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_foru_cou_ix` (`course`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Forums contain and structure discussion' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `mdl_forum`
--

INSERT INTO `mdl_forum` (`id`, `course`, `type`, `name`, `intro`, `introformat`, `assessed`, `assesstimestart`, `assesstimefinish`, `scale`, `maxbytes`, `maxattachments`, `forcesubscribe`, `trackingtype`, `rsstype`, `rssarticles`, `timemodified`, `warnafter`, `blockafter`, `blockperiod`, `completiondiscussions`, `completionreplies`, `completionposts`, `displaywordcount`) VALUES
(1, 5, 'news', 'News forum', 'General news and announcements', 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1392216446, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_digests`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_digests` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `forum` bigint(10) NOT NULL,
  `maildigest` tinyint(1) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_forudige_forusemai_uix` (`forum`,`userid`,`maildigest`),
  KEY `mdl_forudige_use_ix` (`userid`),
  KEY `mdl_forudige_for_ix` (`forum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Keeps track of user mail delivery preferences for each forum' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_discussions`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_discussions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `forum` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `firstpost` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '-1',
  `assessed` tinyint(1) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `usermodified` bigint(10) NOT NULL DEFAULT '0',
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forudisc_use_ix` (`userid`),
  KEY `mdl_forudisc_for_ix` (`forum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Forums are composed of discussions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_posts`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_posts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `discussion` bigint(10) NOT NULL DEFAULT '0',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `created` bigint(10) NOT NULL DEFAULT '0',
  `modified` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(2) NOT NULL DEFAULT '0',
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `messageformat` tinyint(2) NOT NULL DEFAULT '0',
  `messagetrust` tinyint(2) NOT NULL DEFAULT '0',
  `attachment` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `totalscore` smallint(4) NOT NULL DEFAULT '0',
  `mailnow` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forupost_use_ix` (`userid`),
  KEY `mdl_forupost_cre_ix` (`created`),
  KEY `mdl_forupost_mai_ix` (`mailed`),
  KEY `mdl_forupost_dis_ix` (`discussion`),
  KEY `mdl_forupost_par_ix` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='All posts are stored in this table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_queue`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_queue` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `discussionid` bigint(10) NOT NULL DEFAULT '0',
  `postid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_foruqueu_use_ix` (`userid`),
  KEY `mdl_foruqueu_dis_ix` (`discussionid`),
  KEY `mdl_foruqueu_pos_ix` (`postid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='For keeping track of posts that will be mailed in digest for' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_read`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_read` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `forumid` bigint(10) NOT NULL DEFAULT '0',
  `discussionid` bigint(10) NOT NULL DEFAULT '0',
  `postid` bigint(10) NOT NULL DEFAULT '0',
  `firstread` bigint(10) NOT NULL DEFAULT '0',
  `lastread` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_foruread_usefor_ix` (`userid`,`forumid`),
  KEY `mdl_foruread_usedis_ix` (`userid`,`discussionid`),
  KEY `mdl_foruread_usepos_ix` (`userid`,`postid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tracks each users read posts' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_subscriptions`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_subscriptions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `forum` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forusubs_use_ix` (`userid`),
  KEY `mdl_forusubs_for_ix` (`forum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Keeps track of who is subscribed to what forum' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_track_prefs`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_track_prefs` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `forumid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forutracpref_usefor_ix` (`userid`,`forumid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tracks each users untracked forums' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `allowduplicatedentries` tinyint(2) NOT NULL DEFAULT '0',
  `displayformat` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'dictionary',
  `mainglossary` tinyint(2) NOT NULL DEFAULT '0',
  `showspecial` tinyint(2) NOT NULL DEFAULT '1',
  `showalphabet` tinyint(2) NOT NULL DEFAULT '1',
  `showall` tinyint(2) NOT NULL DEFAULT '1',
  `allowcomments` tinyint(2) NOT NULL DEFAULT '0',
  `allowprintview` tinyint(2) NOT NULL DEFAULT '1',
  `usedynalink` tinyint(2) NOT NULL DEFAULT '1',
  `defaultapproval` tinyint(2) NOT NULL DEFAULT '1',
  `approvaldisplayformat` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `globalglossary` tinyint(2) NOT NULL DEFAULT '0',
  `entbypage` smallint(3) NOT NULL DEFAULT '10',
  `editalways` tinyint(2) NOT NULL DEFAULT '0',
  `rsstype` tinyint(2) NOT NULL DEFAULT '0',
  `rssarticles` tinyint(2) NOT NULL DEFAULT '0',
  `assessed` bigint(10) NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionentries` int(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_glos_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='all glossaries' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary_alias`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_alias` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `entryid` bigint(10) NOT NULL DEFAULT '0',
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_glosalia_ent_ix` (`entryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='entries alias' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `glossaryid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `usedynalink` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_gloscate_glo_ix` (`glossaryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='all categories for glossary entries' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary_entries`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_entries` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `glossaryid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `concept` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `definition` longtext COLLATE utf8_unicode_ci NOT NULL,
  `definitionformat` tinyint(2) NOT NULL DEFAULT '0',
  `definitiontrust` tinyint(2) NOT NULL DEFAULT '0',
  `attachment` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `teacherentry` tinyint(2) NOT NULL DEFAULT '0',
  `sourceglossaryid` bigint(10) NOT NULL DEFAULT '0',
  `usedynalink` tinyint(2) NOT NULL DEFAULT '1',
  `casesensitive` tinyint(2) NOT NULL DEFAULT '0',
  `fullmatch` tinyint(2) NOT NULL DEFAULT '1',
  `approved` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_glosentr_use_ix` (`userid`),
  KEY `mdl_glosentr_con_ix` (`concept`),
  KEY `mdl_glosentr_glo_ix` (`glossaryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='all glossary entries' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary_entries_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_entries_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `categoryid` bigint(10) NOT NULL DEFAULT '0',
  `entryid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_glosentrcate_cat_ix` (`categoryid`),
  KEY `mdl_glosentrcate_ent_ix` (`entryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='categories of each glossary entry' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary_formats`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_formats` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `popupformatname` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `visible` tinyint(2) NOT NULL DEFAULT '1',
  `showgroup` tinyint(2) NOT NULL DEFAULT '1',
  `defaultmode` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `defaulthook` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sortkey` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sortorder` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Setting of the display formats' AUTO_INCREMENT=8 ;

--
-- Dumping data for table `mdl_glossary_formats`
--

INSERT INTO `mdl_glossary_formats` (`id`, `name`, `popupformatname`, `visible`, `showgroup`, `defaultmode`, `defaulthook`, `sortkey`, `sortorder`) VALUES
(1, 'continuous', 'continuous', 1, 1, '', '', '', ''),
(2, 'dictionary', 'dictionary', 1, 1, '', '', '', ''),
(3, 'encyclopedia', 'encyclopedia', 1, 1, '', '', '', ''),
(4, 'entrylist', 'entrylist', 1, 1, '', '', '', ''),
(5, 'faq', 'faq', 1, 1, '', '', '', ''),
(6, 'fullwithauthor', 'fullwithauthor', 1, 1, '', '', '', ''),
(7, 'fullwithoutauthor', 'fullwithoutauthor', 1, 1, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `parent` bigint(10) DEFAULT NULL,
  `depth` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `aggregation` bigint(10) NOT NULL DEFAULT '0',
  `keephigh` bigint(10) NOT NULL DEFAULT '0',
  `droplow` bigint(10) NOT NULL DEFAULT '0',
  `aggregateonlygraded` tinyint(1) NOT NULL DEFAULT '0',
  `aggregateoutcomes` tinyint(1) NOT NULL DEFAULT '0',
  `aggregatesubcats` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradcate_cou_ix` (`courseid`),
  KEY `mdl_gradcate_par_ix` (`parent`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table keeps information about categories, used for grou' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `mdl_grade_categories`
--

INSERT INTO `mdl_grade_categories` (`id`, `courseid`, `parent`, `depth`, `path`, `fullname`, `aggregation`, `keephigh`, `droplow`, `aggregateonlygraded`, `aggregateoutcomes`, `aggregatesubcats`, `timecreated`, `timemodified`, `hidden`) VALUES
(3, 4, NULL, 1, '/3/', '?', 11, 0, 0, 1, 0, 0, 1392111049, 1392111050, 0),
(4, 5, NULL, 1, '/4/', '?', 11, 0, 0, 1, 0, 0, 1392216641, 1392216641, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_categories_history`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_categories_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) NOT NULL,
  `parent` bigint(10) DEFAULT NULL,
  `depth` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `aggregation` bigint(10) NOT NULL DEFAULT '0',
  `keephigh` bigint(10) NOT NULL DEFAULT '0',
  `droplow` bigint(10) NOT NULL DEFAULT '0',
  `aggregateonlygraded` tinyint(1) NOT NULL DEFAULT '0',
  `aggregateoutcomes` tinyint(1) NOT NULL DEFAULT '0',
  `aggregatesubcats` tinyint(1) NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradcatehist_act_ix` (`action`),
  KEY `mdl_gradcatehist_old_ix` (`oldid`),
  KEY `mdl_gradcatehist_cou_ix` (`courseid`),
  KEY `mdl_gradcatehist_par_ix` (`parent`),
  KEY `mdl_gradcatehist_log_ix` (`loggeduser`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='History of grade_categories' AUTO_INCREMENT=11 ;

--
-- Dumping data for table `mdl_grade_categories_history`
--

INSERT INTO `mdl_grade_categories_history` (`id`, `action`, `oldid`, `source`, `timemodified`, `loggeduser`, `courseid`, `parent`, `depth`, `path`, `fullname`, `aggregation`, `keephigh`, `droplow`, `aggregateonlygraded`, `aggregateoutcomes`, `aggregatesubcats`, `hidden`) VALUES
(1, 1, 1, 'system', 1391763015, 2, 2, NULL, 0, NULL, '?', 11, 0, 0, 1, 0, 0, 0),
(2, 2, 1, 'system', 1391763016, 2, 2, NULL, 1, '/1/', '?', 11, 0, 0, 1, 0, 0, 0),
(3, 1, 2, 'system', 1391775376, 2, 3, NULL, 0, NULL, '?', 11, 0, 0, 1, 0, 0, 0),
(4, 2, 2, 'system', 1391775377, 2, 3, NULL, 1, '/2/', '?', 11, 0, 0, 1, 0, 0, 0),
(5, 1, 3, 'system', 1392111049, 2, 4, NULL, 0, NULL, '?', 11, 0, 0, 1, 0, 0, 0),
(6, 2, 3, 'system', 1392111050, 2, 4, NULL, 1, '/3/', '?', 11, 0, 0, 1, 0, 0, 0),
(7, 3, 1, 'coursedelete', 1392184483, 2, 2, NULL, 1, '/1/', '?', 11, 0, 0, 1, 0, 0, 0),
(8, 3, 2, 'coursedelete', 1392184511, 2, 3, NULL, 1, '/2/', '?', 11, 0, 0, 1, 0, 0, 0),
(9, 1, 4, 'system', 1392216641, 2, 5, NULL, 0, NULL, '?', 11, 0, 0, 1, 0, 0, 0),
(10, 2, 4, 'system', 1392216641, 2, 5, NULL, 1, '/4/', '?', 11, 0, 0, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_grades`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `itemid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `rawgrademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `rawgrademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `rawscaleid` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `exported` bigint(10) NOT NULL DEFAULT '0',
  `overridden` bigint(10) NOT NULL DEFAULT '0',
  `excluded` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext COLLATE utf8_unicode_ci,
  `feedbackformat` bigint(10) NOT NULL DEFAULT '0',
  `information` longtext COLLATE utf8_unicode_ci,
  `informationformat` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradgrad_useite_uix` (`userid`,`itemid`),
  KEY `mdl_gradgrad_locloc_ix` (`locked`,`locktime`),
  KEY `mdl_gradgrad_ite_ix` (`itemid`),
  KEY `mdl_gradgrad_use_ix` (`userid`),
  KEY `mdl_gradgrad_raw_ix` (`rawscaleid`),
  KEY `mdl_gradgrad_use2_ix` (`usermodified`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='grade_grades  This table keeps individual grades for each us' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `mdl_grade_grades`
--

INSERT INTO `mdl_grade_grades` (`id`, `itemid`, `userid`, `rawgrade`, `rawgrademax`, `rawgrademin`, `rawscaleid`, `usermodified`, `finalgrade`, `hidden`, `locked`, `locktime`, `exported`, `overridden`, `excluded`, `feedback`, `feedbackformat`, `information`, `informationformat`, `timecreated`, `timemodified`) VALUES
(1, 8, 2, NULL, 10.00000, 0.00000, NULL, 2, NULL, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0, NULL, NULL),
(2, 7, 2, NULL, 100.00000, 0.00000, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0, NULL, NULL),
(3, 6, 2, NULL, 10.00000, 0.00000, NULL, 2, NULL, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0, NULL, NULL),
(4, 5, 2, NULL, 100.00000, 0.00000, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_grades_history`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_grades_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `itemid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `rawgrademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `rawgrademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `rawscaleid` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `exported` bigint(10) NOT NULL DEFAULT '0',
  `overridden` bigint(10) NOT NULL DEFAULT '0',
  `excluded` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext COLLATE utf8_unicode_ci,
  `feedbackformat` bigint(10) NOT NULL DEFAULT '0',
  `information` longtext COLLATE utf8_unicode_ci,
  `informationformat` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradgradhist_act_ix` (`action`),
  KEY `mdl_gradgradhist_tim_ix` (`timemodified`),
  KEY `mdl_gradgradhist_old_ix` (`oldid`),
  KEY `mdl_gradgradhist_ite_ix` (`itemid`),
  KEY `mdl_gradgradhist_use_ix` (`userid`),
  KEY `mdl_gradgradhist_raw_ix` (`rawscaleid`),
  KEY `mdl_gradgradhist_use2_ix` (`usermodified`),
  KEY `mdl_gradgradhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='History table' AUTO_INCREMENT=20 ;

--
-- Dumping data for table `mdl_grade_grades_history`
--

INSERT INTO `mdl_grade_grades_history` (`id`, `action`, `oldid`, `source`, `timemodified`, `loggeduser`, `itemid`, `userid`, `rawgrade`, `rawgrademax`, `rawgrademin`, `rawscaleid`, `usermodified`, `finalgrade`, `hidden`, `locked`, `locktime`, `exported`, `overridden`, `excluded`, `feedback`, `feedbackformat`, `information`, `informationformat`) VALUES
(1, 1, 1, 'mod/quiz', 1391774181, 3, 2, 3, 10.00000, 10.00000, 0.00000, NULL, 3, 10.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(2, 1, 2, 'system', 1391774181, 3, 1, 3, NULL, 100.00000, 0.00000, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(3, 2, 2, 'aggregation', 1391774181, 3, 1, 3, NULL, 100.00000, 0.00000, NULL, NULL, 100.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(4, 1, 3, 'mod/quiz', 1391775859, 3, 4, 3, 5.00000, 10.00000, 0.00000, NULL, 3, 5.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(5, 1, 4, 'system', 1391775859, 3, 3, 3, NULL, 100.00000, 0.00000, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(6, 2, 4, 'aggregation', 1391775859, 3, 3, 3, NULL, 100.00000, 0.00000, NULL, NULL, 50.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(7, 1, 5, 'mod/quiz', 1392019795, 4, 4, 4, 5.00000, 10.00000, 0.00000, NULL, 4, 5.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(8, 1, 6, 'system', 1392019795, 4, 3, 4, NULL, 100.00000, 0.00000, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(9, 2, 6, 'aggregation', 1392019795, 4, 3, 4, NULL, 100.00000, 0.00000, NULL, NULL, 50.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(10, 3, 1, 'coursedelete', 1392184482, 2, 2, 3, 10.00000, 10.00000, 0.00000, NULL, 3, 10.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(11, 3, 2, 'coursedelete', 1392184483, 2, 1, 3, NULL, 100.00000, 0.00000, NULL, NULL, 100.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(12, 3, 3, 'coursedelete', 1392184510, 2, 4, 3, 5.00000, 10.00000, 0.00000, NULL, 3, 5.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(13, 3, 5, 'coursedelete', 1392184510, 2, 4, 4, 5.00000, 10.00000, 0.00000, NULL, 4, 5.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(14, 3, 4, 'coursedelete', 1392184510, 2, 3, 3, NULL, 100.00000, 0.00000, NULL, NULL, 50.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(15, 3, 6, 'coursedelete', 1392184510, 2, 3, 4, NULL, 100.00000, 0.00000, NULL, NULL, 50.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(16, 1, 1, 'mod/quiz', 1392221309, 2, 8, 2, NULL, 10.00000, 0.00000, NULL, 2, NULL, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(17, 1, 2, 'system', 1392221309, 2, 7, 2, NULL, 100.00000, 0.00000, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(18, 1, 3, 'mod/quiz', 1392288786, 2, 6, 2, NULL, 10.00000, 0.00000, NULL, 2, NULL, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(19, 1, 4, 'system', 1392288786, 2, 5, 2, NULL, 100.00000, 0.00000, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_import_newitem`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_import_newitem` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `itemname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `importcode` bigint(10) NOT NULL,
  `importer` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradimponewi_imp_ix` (`importer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='temporary table for storing new grade_item names from grade ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_import_values`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_import_values` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `itemid` bigint(10) DEFAULT NULL,
  `newgradeitem` bigint(10) DEFAULT NULL,
  `userid` bigint(10) NOT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `feedback` longtext COLLATE utf8_unicode_ci,
  `importcode` bigint(10) NOT NULL,
  `importer` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradimpovalu_ite_ix` (`itemid`),
  KEY `mdl_gradimpovalu_new_ix` (`newgradeitem`),
  KEY `mdl_gradimpovalu_imp_ix` (`importer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Temporary table for importing grades' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_items`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_items` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) DEFAULT NULL,
  `categoryid` bigint(10) DEFAULT NULL,
  `itemname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itemtype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemmodule` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iteminstance` bigint(10) DEFAULT NULL,
  `itemnumber` bigint(10) DEFAULT NULL,
  `iteminfo` longtext COLLATE utf8_unicode_ci,
  `idnumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `calculation` longtext COLLATE utf8_unicode_ci,
  `gradetype` smallint(4) NOT NULL DEFAULT '1',
  `grademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `grademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `scaleid` bigint(10) DEFAULT NULL,
  `outcomeid` bigint(10) DEFAULT NULL,
  `gradepass` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `multfactor` decimal(10,5) NOT NULL DEFAULT '1.00000',
  `plusfactor` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `display` bigint(10) NOT NULL DEFAULT '0',
  `decimals` tinyint(1) DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `needsupdate` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_graditem_locloc_ix` (`locked`,`locktime`),
  KEY `mdl_graditem_itenee_ix` (`itemtype`,`needsupdate`),
  KEY `mdl_graditem_gra_ix` (`gradetype`),
  KEY `mdl_graditem_idncou_ix` (`idnumber`,`courseid`),
  KEY `mdl_graditem_cou_ix` (`courseid`),
  KEY `mdl_graditem_cat_ix` (`categoryid`),
  KEY `mdl_graditem_sca_ix` (`scaleid`),
  KEY `mdl_graditem_out_ix` (`outcomeid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table keeps information about gradeable items (ie colum' AUTO_INCREMENT=9 ;

--
-- Dumping data for table `mdl_grade_items`
--

INSERT INTO `mdl_grade_items` (`id`, `courseid`, `categoryid`, `itemname`, `itemtype`, `itemmodule`, `iteminstance`, `itemnumber`, `iteminfo`, `idnumber`, `calculation`, `gradetype`, `grademax`, `grademin`, `scaleid`, `outcomeid`, `gradepass`, `multfactor`, `plusfactor`, `aggregationcoef`, `sortorder`, `display`, `decimals`, `hidden`, `locked`, `locktime`, `needsupdate`, `timecreated`, `timemodified`) VALUES
(5, 4, NULL, NULL, 'course', NULL, 3, NULL, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 1, 0, NULL, 0, 0, 0, 0, 1392111049, 1392111049),
(6, 4, 3, 'Quiz 1', 'mod', 'quiz', 3, 0, NULL, '1111', NULL, 1, 10.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 2, 0, NULL, 0, 0, 0, 0, 1392183214, 1392183214),
(7, 5, NULL, NULL, 'course', NULL, 4, NULL, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 1, 0, NULL, 0, 0, 0, 0, 1392216641, 1392216641),
(8, 5, 4, 'Assessment 1', 'mod', 'quiz', 4, 0, NULL, '', NULL, 1, 10.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 2, 0, NULL, 0, 0, 0, 0, 1392216706, 1392216706);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_items_history`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_items_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) DEFAULT NULL,
  `categoryid` bigint(10) DEFAULT NULL,
  `itemname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itemtype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemmodule` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iteminstance` bigint(10) DEFAULT NULL,
  `itemnumber` bigint(10) DEFAULT NULL,
  `iteminfo` longtext COLLATE utf8_unicode_ci,
  `idnumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `calculation` longtext COLLATE utf8_unicode_ci,
  `gradetype` smallint(4) NOT NULL DEFAULT '1',
  `grademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `grademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `scaleid` bigint(10) DEFAULT NULL,
  `outcomeid` bigint(10) DEFAULT NULL,
  `gradepass` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `multfactor` decimal(10,5) NOT NULL DEFAULT '1.00000',
  `plusfactor` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `needsupdate` bigint(10) NOT NULL DEFAULT '0',
  `display` bigint(10) NOT NULL DEFAULT '0',
  `decimals` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_graditemhist_act_ix` (`action`),
  KEY `mdl_graditemhist_old_ix` (`oldid`),
  KEY `mdl_graditemhist_cou_ix` (`courseid`),
  KEY `mdl_graditemhist_cat_ix` (`categoryid`),
  KEY `mdl_graditemhist_sca_ix` (`scaleid`),
  KEY `mdl_graditemhist_out_ix` (`outcomeid`),
  KEY `mdl_graditemhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='History of grade_items' AUTO_INCREMENT=13 ;

--
-- Dumping data for table `mdl_grade_items_history`
--

INSERT INTO `mdl_grade_items_history` (`id`, `action`, `oldid`, `source`, `timemodified`, `loggeduser`, `courseid`, `categoryid`, `itemname`, `itemtype`, `itemmodule`, `iteminstance`, `itemnumber`, `iteminfo`, `idnumber`, `calculation`, `gradetype`, `grademax`, `grademin`, `scaleid`, `outcomeid`, `gradepass`, `multfactor`, `plusfactor`, `aggregationcoef`, `sortorder`, `hidden`, `locked`, `locktime`, `needsupdate`, `display`, `decimals`) VALUES
(1, 1, 1, 'system', 1391763015, 2, 2, NULL, NULL, 'course', NULL, 1, NULL, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 1, 0, 0, 0, 1, 0, NULL),
(2, 1, 2, NULL, 1391763321, 2, 2, 1, 'Assignment 1', 'mod', 'quiz', 1, 0, NULL, '', NULL, 1, 10.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 2, 0, 0, 0, 1, 0, NULL),
(3, 1, 3, 'system', 1391775376, 2, 3, NULL, NULL, 'course', NULL, 2, NULL, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 1, 0, 0, 0, 1, 0, NULL),
(4, 1, 4, NULL, 1391775687, 2, 3, 2, 'Week 1 Exercises', 'mod', 'quiz', 2, 0, NULL, '', NULL, 1, 10.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 2, 0, 0, 0, 1, 0, NULL),
(5, 1, 5, 'system', 1392111049, 2, 4, NULL, NULL, 'course', NULL, 3, NULL, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 1, 0, 0, 0, 1, 0, NULL),
(6, 1, 6, NULL, 1392183214, 2, 4, 3, 'Quiz 1', 'mod', 'quiz', 3, 0, NULL, '1111', NULL, 1, 10.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 2, 0, 0, 0, 1, 0, NULL),
(7, 3, 2, 'coursedelete', 1392184483, 2, 2, 1, 'Assignment 1', 'mod', 'quiz', 1, 0, NULL, '', NULL, 1, 10.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 2, 0, 0, 0, 1, 0, NULL),
(8, 3, 1, 'coursedelete', 1392184483, 2, 2, NULL, NULL, 'course', NULL, 1, NULL, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 1, 0, 0, 0, 0, 0, NULL),
(9, 3, 4, 'coursedelete', 1392184510, 2, 3, 2, 'Week 1 Exercises', 'mod', 'quiz', 2, 0, NULL, '', NULL, 1, 10.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 2, 0, 0, 0, 1, 0, NULL),
(10, 3, 3, 'coursedelete', 1392184511, 2, 3, NULL, NULL, 'course', NULL, 2, NULL, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 1, 0, 0, 0, 0, 0, NULL),
(11, 1, 7, 'system', 1392216641, 2, 5, NULL, NULL, 'course', NULL, 4, NULL, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 1, 0, 0, 0, 1, 0, NULL),
(12, 1, 8, NULL, 1392216706, 2, 5, 4, 'Assessment 1', 'mod', 'quiz', 4, 0, NULL, '', NULL, 1, 10.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 2, 0, 0, 0, 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_letters`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_letters` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `lowerboundary` decimal(10,5) NOT NULL,
  `letter` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradlett_conlowlet_uix` (`contextid`,`lowerboundary`,`letter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Repository for grade letters, for courses and other moodle e' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_outcomes`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_outcomes` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) DEFAULT NULL,
  `shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fullname` longtext COLLATE utf8_unicode_ci NOT NULL,
  `scaleid` bigint(10) DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradoutc_cousho_uix` (`courseid`,`shortname`),
  KEY `mdl_gradoutc_cou_ix` (`courseid`),
  KEY `mdl_gradoutc_sca_ix` (`scaleid`),
  KEY `mdl_gradoutc_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table describes the outcomes used in the system. An out' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_outcomes_courses`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_outcomes_courses` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `outcomeid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradoutccour_couout_uix` (`courseid`,`outcomeid`),
  KEY `mdl_gradoutccour_cou_ix` (`courseid`),
  KEY `mdl_gradoutccour_out_ix` (`outcomeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='stores what outcomes are used in what courses.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_outcomes_history`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_outcomes_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) DEFAULT NULL,
  `shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fullname` longtext COLLATE utf8_unicode_ci NOT NULL,
  `scaleid` bigint(10) DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradoutchist_act_ix` (`action`),
  KEY `mdl_gradoutchist_old_ix` (`oldid`),
  KEY `mdl_gradoutchist_cou_ix` (`courseid`),
  KEY `mdl_gradoutchist_sca_ix` (`scaleid`),
  KEY `mdl_gradoutchist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='History table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_settings`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_settings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradsett_counam_uix` (`courseid`,`name`),
  KEY `mdl_gradsett_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='gradebook settings' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_guide_comments`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_guide_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradguidcomm_def_ix` (`definitionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='frequently used comments used in marking guide' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_guide_criteria`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_guide_criteria` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  `descriptionmarkers` longtext COLLATE utf8_unicode_ci,
  `descriptionmarkersformat` tinyint(2) DEFAULT NULL,
  `maxscore` decimal(10,5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradguidcrit_def_ix` (`definitionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the rows of the criteria grid.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_guide_fillings`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_guide_fillings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instanceid` bigint(10) NOT NULL,
  `criterionid` bigint(10) NOT NULL,
  `remark` longtext COLLATE utf8_unicode_ci,
  `remarkformat` tinyint(2) DEFAULT NULL,
  `score` decimal(10,5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradguidfill_inscri_uix` (`instanceid`,`criterionid`),
  KEY `mdl_gradguidfill_ins_ix` (`instanceid`),
  KEY `mdl_gradguidfill_cri_ix` (`criterionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the data of how the guide is filled by a particular r' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_rubric_criteria`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_rubric_criteria` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradrubrcrit_def_ix` (`definitionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the rows of the rubric grid.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_rubric_fillings`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_rubric_fillings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instanceid` bigint(10) NOT NULL,
  `criterionid` bigint(10) NOT NULL,
  `levelid` bigint(10) DEFAULT NULL,
  `remark` longtext COLLATE utf8_unicode_ci,
  `remarkformat` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradrubrfill_inscri_uix` (`instanceid`,`criterionid`),
  KEY `mdl_gradrubrfill_lev_ix` (`levelid`),
  KEY `mdl_gradrubrfill_ins_ix` (`instanceid`),
  KEY `mdl_gradrubrfill_cri_ix` (`criterionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the data of how the rubric is filled by a particular ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_rubric_levels`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_rubric_levels` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `criterionid` bigint(10) NOT NULL,
  `score` decimal(10,5) NOT NULL,
  `definition` longtext COLLATE utf8_unicode_ci,
  `definitionformat` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradrubrleve_cri_ix` (`criterionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the columns of the rubric grid.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grading_areas`
--

CREATE TABLE IF NOT EXISTS `mdl_grading_areas` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `areaname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `activemethod` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradarea_concomare_uix` (`contextid`,`component`,`areaname`),
  KEY `mdl_gradarea_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Identifies gradable areas where advanced grading can happen.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grading_definitions`
--

CREATE TABLE IF NOT EXISTS `mdl_grading_definitions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `areaid` bigint(10) NOT NULL,
  `method` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `copiedfromid` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `usercreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `timecopied` bigint(10) DEFAULT '0',
  `options` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_graddefi_aremet_uix` (`areaid`,`method`),
  KEY `mdl_graddefi_are_ix` (`areaid`),
  KEY `mdl_graddefi_use_ix` (`usermodified`),
  KEY `mdl_graddefi_use2_ix` (`usercreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Contains the basic information about an advanced grading for' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grading_instances`
--

CREATE TABLE IF NOT EXISTS `mdl_grading_instances` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `raterid` bigint(10) NOT NULL,
  `itemid` bigint(10) DEFAULT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext COLLATE utf8_unicode_ci,
  `feedbackformat` tinyint(2) DEFAULT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradinst_def_ix` (`definitionid`),
  KEY `mdl_gradinst_rat_ix` (`raterid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Grading form instance is an assessment record for one gradab' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_groupings`
--

CREATE TABLE IF NOT EXISTS `mdl_groupings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `configdata` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_grou_idn2_ix` (`idnumber`),
  KEY `mdl_grou_cou2_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='A grouping is a collection of groups. WAS: groups_groupings' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_groupings_groups`
--

CREATE TABLE IF NOT EXISTS `mdl_groupings_groups` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `groupingid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `timeadded` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_grougrou_gro_ix` (`groupingid`),
  KEY `mdl_grougrou_gro2_ix` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Link a grouping to a group (note, groups can be in multiple ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_groups`
--

CREATE TABLE IF NOT EXISTS `mdl_groups` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `idnumber` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `enrolmentkey` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture` bigint(10) NOT NULL DEFAULT '0',
  `hidepicture` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_grou_idn_ix` (`idnumber`),
  KEY `mdl_grou_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each record represents a group.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_groups_members`
--

CREATE TABLE IF NOT EXISTS `mdl_groups_members` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timeadded` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_groumemb_gro_ix` (`groupid`),
  KEY `mdl_groumemb_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Link a user to a group.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_imscp`
--

CREATE TABLE IF NOT EXISTS `mdl_imscp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `keepold` bigint(10) NOT NULL DEFAULT '-1',
  `structure` longtext COLLATE utf8_unicode_ci,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_imsc_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='each record is one imscp resource' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_label`
--

CREATE TABLE IF NOT EXISTS `mdl_label` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_labe_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines labels' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `practice` smallint(3) NOT NULL DEFAULT '0',
  `modattempts` smallint(3) NOT NULL DEFAULT '0',
  `usepassword` smallint(3) NOT NULL DEFAULT '0',
  `password` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dependency` bigint(10) NOT NULL DEFAULT '0',
  `conditions` longtext COLLATE utf8_unicode_ci NOT NULL,
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `custom` smallint(3) NOT NULL DEFAULT '0',
  `ongoing` smallint(3) NOT NULL DEFAULT '0',
  `usemaxgrade` smallint(3) NOT NULL DEFAULT '0',
  `maxanswers` smallint(3) NOT NULL DEFAULT '4',
  `maxattempts` smallint(3) NOT NULL DEFAULT '5',
  `review` smallint(3) NOT NULL DEFAULT '0',
  `nextpagedefault` smallint(3) NOT NULL DEFAULT '0',
  `feedback` smallint(3) NOT NULL DEFAULT '1',
  `minquestions` smallint(3) NOT NULL DEFAULT '0',
  `maxpages` smallint(3) NOT NULL DEFAULT '0',
  `timed` smallint(3) NOT NULL DEFAULT '0',
  `maxtime` bigint(10) NOT NULL DEFAULT '0',
  `retake` smallint(3) NOT NULL DEFAULT '1',
  `activitylink` bigint(10) NOT NULL DEFAULT '0',
  `mediafile` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mediaheight` bigint(10) NOT NULL DEFAULT '100',
  `mediawidth` bigint(10) NOT NULL DEFAULT '650',
  `mediaclose` smallint(3) NOT NULL DEFAULT '0',
  `slideshow` smallint(3) NOT NULL DEFAULT '0',
  `width` bigint(10) NOT NULL DEFAULT '640',
  `height` bigint(10) NOT NULL DEFAULT '480',
  `bgcolor` varchar(7) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#FFFFFF',
  `displayleft` smallint(3) NOT NULL DEFAULT '0',
  `displayleftif` smallint(3) NOT NULL DEFAULT '0',
  `progressbar` smallint(3) NOT NULL DEFAULT '0',
  `highscores` smallint(3) NOT NULL DEFAULT '0',
  `maxhighscores` bigint(10) NOT NULL DEFAULT '0',
  `available` bigint(10) NOT NULL DEFAULT '0',
  `deadline` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_less_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines lesson' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_answers`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `jumpto` bigint(11) NOT NULL DEFAULT '0',
  `grade` smallint(4) NOT NULL DEFAULT '0',
  `score` bigint(10) NOT NULL DEFAULT '0',
  `flags` smallint(3) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `answer` longtext COLLATE utf8_unicode_ci,
  `answerformat` tinyint(2) NOT NULL DEFAULT '0',
  `response` longtext COLLATE utf8_unicode_ci,
  `responseformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessansw_les_ix` (`lessonid`),
  KEY `mdl_lessansw_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines lesson_answers' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_attempts`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_attempts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `answerid` bigint(10) NOT NULL DEFAULT '0',
  `retry` smallint(3) NOT NULL DEFAULT '0',
  `correct` bigint(10) NOT NULL DEFAULT '0',
  `useranswer` longtext COLLATE utf8_unicode_ci,
  `timeseen` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessatte_use_ix` (`userid`),
  KEY `mdl_lessatte_les_ix` (`lessonid`),
  KEY `mdl_lessatte_pag_ix` (`pageid`),
  KEY `mdl_lessatte_ans_ix` (`answerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines lesson_attempts' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_branch`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_branch` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `retry` bigint(10) NOT NULL DEFAULT '0',
  `flag` smallint(3) NOT NULL DEFAULT '0',
  `timeseen` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessbran_use_ix` (`userid`),
  KEY `mdl_lessbran_les_ix` (`lessonid`),
  KEY `mdl_lessbran_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='branches for each lesson/user' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_grades`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `grade` double NOT NULL DEFAULT '0',
  `late` smallint(3) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessgrad_use_ix` (`userid`),
  KEY `mdl_lessgrad_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines lesson_grades' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_high_scores`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_high_scores` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `gradeid` bigint(10) NOT NULL DEFAULT '0',
  `nickname` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_lesshighscor_use_ix` (`userid`),
  KEY `mdl_lesshighscor_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='high scores for each lesson' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_pages`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_pages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `prevpageid` bigint(10) NOT NULL DEFAULT '0',
  `nextpageid` bigint(10) NOT NULL DEFAULT '0',
  `qtype` smallint(3) NOT NULL DEFAULT '0',
  `qoption` smallint(3) NOT NULL DEFAULT '0',
  `layout` smallint(3) NOT NULL DEFAULT '1',
  `display` smallint(3) NOT NULL DEFAULT '1',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contents` longtext COLLATE utf8_unicode_ci NOT NULL,
  `contentsformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lesspage_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines lesson_pages' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_timer`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_timer` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `starttime` bigint(10) NOT NULL DEFAULT '0',
  `lessontime` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lesstime_use_ix` (`userid`),
  KEY `mdl_lesstime_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='lesson timer for each lesson' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_license`
--

CREATE TABLE IF NOT EXISTS `mdl_license` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `shortname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullname` longtext COLLATE utf8_unicode_ci,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `version` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='store licenses used by moodle' AUTO_INCREMENT=10 ;

--
-- Dumping data for table `mdl_license`
--

INSERT INTO `mdl_license` (`id`, `shortname`, `fullname`, `source`, `enabled`, `version`) VALUES
(1, 'unknown', 'Unknown license', '', 1, 2010033100),
(2, 'allrightsreserved', 'All rights reserved', 'http://en.wikipedia.org/wiki/All_rights_reserved', 1, 2010033100),
(3, 'public', 'Public Domain', 'http://creativecommons.org/licenses/publicdomain/', 1, 2010033100),
(4, 'cc', 'Creative Commons', 'http://creativecommons.org/licenses/by/3.0/', 1, 2010033100),
(5, 'cc-nd', 'Creative Commons - NoDerivs', 'http://creativecommons.org/licenses/by-nd/3.0/', 1, 2010033100),
(6, 'cc-nc-nd', 'Creative Commons - No Commercial NoDerivs', 'http://creativecommons.org/licenses/by-nc-nd/3.0/', 1, 2010033100),
(7, 'cc-nc', 'Creative Commons - No Commercial', 'http://creativecommons.org/licenses/by-nc/3.0/', 1, 2013051500),
(8, 'cc-nc-sa', 'Creative Commons - No Commercial ShareAlike', 'http://creativecommons.org/licenses/by-nc-sa/3.0/', 1, 2010033100),
(9, 'cc-sa', 'Creative Commons - ShareAlike', 'http://creativecommons.org/licenses/by-sa/3.0/', 1, 2010033100);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_log`
--

CREATE TABLE IF NOT EXISTS `mdl_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `time` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `ip` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `module` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cmid` bigint(10) NOT NULL DEFAULT '0',
  `action` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `info` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_log_coumodact_ix` (`course`,`module`,`action`),
  KEY `mdl_log_tim_ix` (`time`),
  KEY `mdl_log_act_ix` (`action`),
  KEY `mdl_log_usecou_ix` (`userid`,`course`),
  KEY `mdl_log_cmi_ix` (`cmid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Every action is logged as far as possible' AUTO_INCREMENT=500 ;

--
-- Dumping data for table `mdl_log`
--

INSERT INTO `mdl_log` (`id`, `time`, `userid`, `ip`, `course`, `module`, `cmid`, `action`, `url`, `info`) VALUES
(1, 1391627050, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(2, 1391627050, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(3, 1391627119, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(4, 1391627119, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(5, 1391627229, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(6, 1391627236, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(7, 1391664985, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(8, 1391664985, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(9, 1391664996, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(10, 1391665012, 2, '127.0.0.1', 1, 'user', 0, 'view all', 'index.php?id=1', ''),
(11, 1391665015, 2, '127.0.0.1', 1, 'blog', 0, 'view', 'index.php?entryid=&tagid=&tag=', 'view blog entry'),
(12, 1391665022, 2, '127.0.0.1', 1, 'notes', 0, 'view', 'index.php?course=1&user=0', 'view notes'),
(13, 1391665029, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(14, 1391665107, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(15, 1391665130, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(16, 1391665148, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(17, 1391665148, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(18, 1391665149, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(19, 1391665192, 2, '127.0.0.1', 1, 'course', 0, 'new', 'view.php?id=2', 'Intro to Databases (ID 2)'),
(29, 1391665935, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(30, 1391674101, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(31, 1391674101, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(32, 1391674104, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(34, 1391674124, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(35, 1391674183, 0, '127.0.0.1', 1, 'user', 0, 'add', '/view.php?id=3', 'Ankit  Kulkarni'),
(36, 1391675248, 3, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=3', ''),
(37, 1391675248, 3, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=3&course=1', '3'),
(38, 1391675248, 3, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(39, 1391675333, 3, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(40, 1391675338, 3, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=3&course=1', '3'),
(41, 1391675353, 0, '127.0.0.1', 1, 'login', 0, 'error', 'index.php', 'admin'),
(42, 1391675443, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(43, 1391675443, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(44, 1391675443, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(50, 1391750123, 0, '127.0.0.1', 1, 'login', 0, 'error', 'index.php', 'admin'),
(51, 1391750137, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(52, 1391750137, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(53, 1391750140, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(58, 1391762263, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(59, 1391762263, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(60, 1391762267, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(88, 1391763500, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(89, 1391773981, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(90, 1391773981, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(91, 1391773984, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(96, 1391774101, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(97, 1391774112, 3, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=3', ''),
(98, 1391774112, 3, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=3&course=1', '3'),
(99, 1391774113, 3, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(113, 1391774238, 3, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(114, 1391774241, 3, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=3&course=1', '3'),
(115, 1391774266, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(116, 1391774266, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(117, 1391774309, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(118, 1391774406, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(119, 1391774406, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(120, 1391774604, 2, '127.0.0.1', 1, 'course', 0, 'new', 'view.php?id=3', 'mania ki dunia (ID 3)'),
(146, 1391775742, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(147, 1391775756, 3, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=3', ''),
(148, 1391775756, 3, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=3&course=1', '3'),
(149, 1391775757, 3, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(162, 1391954701, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(163, 1391954701, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(164, 1391954704, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(165, 1392017913, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(166, 1392017913, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(167, 1392017917, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(168, 1392017929, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(169, 1392018001, 0, '127.0.0.1', 1, 'user', 0, 'add', '/view.php?id=4', 'Bedi Yadav'),
(170, 1392018050, 4, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=4', ''),
(171, 1392018050, 4, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=4&course=1', '4'),
(172, 1392018147, 4, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=4&course=1', '4'),
(173, 1392018163, 4, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=4', ''),
(174, 1392018164, 4, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=4&course=1', '4'),
(175, 1392018164, 4, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(176, 1392018167, 4, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=4&course=1', '4'),
(177, 1392018182, 0, '127.0.0.1', 1, 'login', 0, 'error', 'index.php', 'admin'),
(178, 1392018197, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(179, 1392018197, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(180, 1392018198, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(184, 1392018269, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(185, 1392018284, 4, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=4', ''),
(186, 1392018284, 4, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=4&course=1', '4'),
(187, 1392018285, 4, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(200, 1392020033, 4, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(201, 1392020037, 4, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=4&course=1', '4'),
(202, 1392021567, 0, '127.0.0.1', 1, 'login', 0, 'error', 'index.php', 'admin'),
(203, 1392021576, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(204, 1392021577, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(205, 1392021577, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(206, 1392022531, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(211, 1392022664, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(212, 1392022676, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(213, 1392022676, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(214, 1392022676, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(216, 1392022716, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(217, 1392022729, 3, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=3', ''),
(218, 1392022729, 3, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=3&course=1', '3'),
(219, 1392022729, 3, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(222, 1392024015, 3, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=3&course=1', '3'),
(223, 1392055806, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(224, 1392055807, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(225, 1392055810, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(228, 1392056318, 2, '127.0.0.1', 1, 'course', 0, 'new', 'view.php?id=4', 'Samvidhan Jagran (ID 4)'),
(229, 1392057552, 2, '127.0.0.1', 4, 'role', 0, 'assign', 'admin/roles/assign.php?contextid=34&roleid=5', 'Student'),
(230, 1392057554, 2, '127.0.0.1', 4, 'role', 0, 'assign', 'admin/roles/assign.php?contextid=34&roleid=5', 'Student'),
(231, 1392057555, 2, '127.0.0.1', 4, 'role', 0, 'assign', 'admin/roles/assign.php?contextid=34&roleid=5', 'Student'),
(232, 1392111047, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(233, 1392111047, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(234, 1392111068, 2, '127.0.0.1', 1, 'user', 0, 'view all', 'index.php?id=1', ''),
(235, 1392111181, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(236, 1392111184, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(237, 1392131453, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(238, 1392131453, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(239, 1392131457, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(240, 1392134990, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(241, 1392137656, 2, '127.0.0.1', 4, 'user', 0, 'view all', 'index.php?id=4', ''),
(242, 1392138930, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(243, 1392143256, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(244, 1392143256, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(245, 1392144245, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(246, 1392144272, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(247, 1392144272, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(248, 1392144275, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(249, 1392145260, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(250, 1392145263, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(251, 1392151526, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(252, 1392151527, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(253, 1392153281, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(254, 1392153678, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(255, 1392153817, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(256, 1392153829, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(257, 1392153950, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(258, 1392153971, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(259, 1392154034, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(260, 1392154076, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(261, 1392154076, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(262, 1392154156, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(263, 1392154182, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(264, 1392154182, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(265, 1392154186, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(266, 1392154253, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(267, 1392154314, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(268, 1392154314, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(269, 1392154315, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(270, 1392154510, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(271, 1392180648, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(272, 1392180648, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(273, 1392180652, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(274, 1392181673, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(275, 1392181750, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(276, 1392182353, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(277, 1392182444, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(278, 1392183213, 2, '127.0.0.1', 4, 'calendar', 0, 'add', 'event.php?action=edit&id=1', 'Quiz 1'),
(279, 1392183214, 2, '127.0.0.1', 4, 'course', 0, 'add mod', '../mod/quiz/view.php?id=3', 'quiz 3'),
(280, 1392183215, 2, '127.0.0.1', 4, 'quiz', 5, 'add', 'view.php?id=5', '3'),
(281, 1392183215, 2, '127.0.0.1', 4, 'quiz', 5, 'view', 'view.php?id=5', '3'),
(282, 1392183223, 2, '127.0.0.1', 4, 'quiz', 5, 'editquestions', 'view.php?id=5', '3'),
(283, 1392183236, 2, '127.0.0.1', 4, 'quiz', 5, 'editquestions', 'view.php?id=5', '3'),
(284, 1392183237, 2, '127.0.0.1', 4, 'quiz', 5, 'editquestions', 'view.php?id=5', '3'),
(285, 1392183247, 2, '127.0.0.1', 4, 'calendar', 0, 'edit', 'event.php?action=edit&id=1', 'Quiz 1'),
(286, 1392183248, 2, '127.0.0.1', 4, 'course', 0, 'update mod', '../mod/quiz/view.php?id=3', 'quiz 3'),
(287, 1392183248, 2, '127.0.0.1', 4, 'quiz', 5, 'update', 'view.php?id=5', '3'),
(288, 1392183248, 2, '127.0.0.1', 4, 'quiz', 5, 'view', 'view.php?id=5', '3'),
(289, 1392183251, 2, '127.0.0.1', 4, 'quiz', 5, 'view', 'view.php?id=5', '3'),
(290, 1392183254, 2, '127.0.0.1', 4, 'user', 0, 'view all', 'index.php?id=4', ''),
(292, 1392183273, 2, '127.0.0.1', 4, 'quiz', 5, 'view', 'view.php?id=5', '3'),
(293, 1392183278, 2, '127.0.0.1', 4, 'quiz', 5, 'preview', 'view.php?id=5', '3'),
(294, 1392183278, 2, '127.0.0.1', 4, 'quiz', 5, 'continue attempt', 'review.php?attempt=5', '3'),
(295, 1392183285, 2, '127.0.0.1', 4, 'quiz', 5, 'continue attempt', 'review.php?attempt=5', '3'),
(296, 1392183289, 2, '127.0.0.1', 4, 'quiz', 5, 'view summary', 'summary.php?attempt=5', '3'),
(297, 1392183295, 2, '127.0.0.1', 4, 'quiz', 5, 'close attempt', 'review.php?attempt=5', '3'),
(298, 1392183295, 2, '127.0.0.1', 4, 'quiz', 5, 'review', 'review.php?attempt=5', '3'),
(299, 1392183305, 2, '127.0.0.1', 4, 'quiz', 5, 'review', 'review.php?attempt=5', '3'),
(300, 1392183310, 2, '127.0.0.1', 4, 'quiz', 5, 'view', 'view.php?id=5', '3'),
(301, 1392183317, 2, '127.0.0.1', 4, 'quiz', 5, 'view', 'view.php?id=5', '3'),
(302, 1392183322, 2, '127.0.0.1', 4, 'quiz', 5, 'view', 'view.php?id=5', '3'),
(303, 1392183340, 2, '127.0.0.1', 4, 'quiz', 5, 'view', 'view.php?id=5', '3'),
(304, 1392183346, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(305, 1392183383, 2, '127.0.0.1', 4, 'quiz', 5, 'view', 'view.php?id=5', '3'),
(306, 1392183386, 2, '127.0.0.1', 4, 'quiz', 5, 'review', 'review.php?attempt=5', '3'),
(307, 1392183403, 2, '127.0.0.1', 4, 'quiz', 5, 'review', 'review.php?attempt=5', '3'),
(308, 1392183412, 2, '127.0.0.1', 4, 'quiz', 5, 'review', 'review.php?attempt=5', '3'),
(309, 1392183416, 2, '127.0.0.1', 4, 'quiz', 5, 'view', 'view.php?id=5', '3'),
(310, 1392183440, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(311, 1392183511, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(312, 1392183616, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(313, 1392183636, 3, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=3', ''),
(314, 1392183636, 3, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=3&course=1', '3'),
(315, 1392183637, 3, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(316, 1392183685, 3, '127.0.0.1', 4, 'quiz', 5, 'view', 'view.php?id=5', '3'),
(317, 1392183787, 3, '127.0.0.1', 4, 'quiz', 5, 'view', 'view.php?id=5', '3'),
(323, 1392184305, 3, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(324, 1392184308, 3, '127.0.0.1', 4, 'quiz', 5, 'view', 'view.php?id=5', '3'),
(325, 1392184420, 3, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=3&course=1', '3'),
(326, 1392184433, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(327, 1392184433, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(328, 1392184436, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(332, 1392184491, 2, '127.0.0.1', 1, 'course', 0, 'delete', 'view.php?id=2', 'Intro to Databases(ID 2)'),
(336, 1392184514, 2, '127.0.0.1', 1, 'course', 0, 'delete', 'view.php?id=3', 'mania ki dunia(ID 3)'),
(337, 1392184522, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(338, 1392184883, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(339, 1392215575, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(340, 1392215576, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(341, 1392215586, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(342, 1392215627, 2, '127.0.0.1', 4, 'quiz', 5, 'view', 'view.php?id=5', '3'),
(343, 1392215724, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(344, 1392215743, 0, '127.0.0.1', 1, 'login', 0, 'error', 'index.php', 'bedi'),
(345, 1392215766, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(346, 1392215766, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(347, 1392215767, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(348, 1392215769, 2, '127.0.0.1', 4, 'quiz', 5, 'view', 'view.php?id=5', '3'),
(349, 1392215785, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(350, 1392215788, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(351, 1392215882, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(352, 1392215882, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(353, 1392215883, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(354, 1392215944, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(355, 1392216038, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(356, 1392216038, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(357, 1392216038, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(358, 1392216067, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(359, 1392216182, 0, '127.0.0.1', 1, 'user', 0, 'add', '/view.php?id=5', 'Sunny  Raikwar'),
(360, 1392216216, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(361, 1392216216, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(362, 1392216217, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(363, 1392216223, 2, '127.0.0.1', 4, 'quiz', 5, 'view', 'view.php?id=5', '3'),
(364, 1392216256, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(365, 1392216288, 2, '127.0.0.1', 4, 'quiz', 5, 'view', 'view.php?id=5', '3'),
(366, 1392216317, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(367, 1392216437, 2, '127.0.0.1', 1, 'course', 0, 'new', 'view.php?id=5', 'Samvidhan (ID 5)'),
(368, 1392216441, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(369, 1392216446, 2, '127.0.0.1', 5, 'course', 0, 'view', 'view.php?id=5', '5'),
(370, 1392216465, 2, '127.0.0.1', 5, 'user', 0, 'view all', 'index.php?id=5', ''),
(371, 1392216604, 2, '127.0.0.1', 4, 'quiz', 5, 'view', 'view.php?id=5', '3'),
(372, 1392216607, 2, '127.0.0.1', 4, 'quiz', 5, 'view', 'view.php?id=5', '3'),
(373, 1392216610, 2, '127.0.0.1', 4, 'user', 0, 'view all', 'index.php?id=4', ''),
(374, 1392216620, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(375, 1392216626, 2, '127.0.0.1', 5, 'course', 0, 'view', 'view.php?id=5', '5'),
(376, 1392216634, 2, '127.0.0.1', 5, 'course', 0, 'view', 'view.php?id=5', '5'),
(377, 1392216634, 2, '127.0.0.1', 5, 'course', 0, 'view', 'view.php?id=5', '5'),
(378, 1392216705, 2, '127.0.0.1', 5, 'calendar', 0, 'add', 'event.php?action=edit&id=2', 'Assessment 1'),
(379, 1392216706, 2, '127.0.0.1', 5, 'course', 0, 'add mod', '../mod/quiz/view.php?id=4', 'quiz 4'),
(380, 1392216706, 2, '127.0.0.1', 5, 'quiz', 7, 'add', 'view.php?id=7', '4'),
(381, 1392216706, 2, '127.0.0.1', 5, 'course', 0, 'view', 'view.php?id=5', '5'),
(382, 1392216712, 2, '127.0.0.1', 5, 'course', 0, 'view', 'view.php?id=5', '5'),
(383, 1392216712, 2, '127.0.0.1', 5, 'course', 0, 'view', 'view.php?id=5', '5'),
(384, 1392216726, 2, '127.0.0.1', 5, 'role', 0, 'assign', 'admin/roles/assign.php?contextid=37&roleid=5', 'Student'),
(385, 1392216728, 2, '127.0.0.1', 5, 'role', 0, 'assign', 'admin/roles/assign.php?contextid=37&roleid=5', 'Student'),
(386, 1392216734, 2, '127.0.0.1', 4, 'quiz', 5, 'view', 'view.php?id=5', '3'),
(387, 1392216740, 2, '127.0.0.1', 5, 'course', 0, 'view', 'view.php?id=5', '5'),
(388, 1392216758, 2, '127.0.0.1', 5, 'quiz', 7, 'view', 'view.php?id=7', '4'),
(389, 1392216762, 2, '127.0.0.1', 5, 'quiz', 7, 'editquestions', 'view.php?id=7', '4'),
(390, 1392216768, 2, '127.0.0.1', 5, 'quiz', 7, 'editquestions', 'view.php?id=7', '4'),
(391, 1392216769, 2, '127.0.0.1', 5, 'quiz', 7, 'editquestions', 'view.php?id=7', '4'),
(392, 1392216772, 2, '127.0.0.1', 5, 'quiz', 7, 'editquestions', 'view.php?id=7', '4'),
(393, 1392216772, 2, '127.0.0.1', 5, 'quiz', 7, 'editquestions', 'view.php?id=7', '4'),
(394, 1392216816, 2, '127.0.0.1', 5, 'course', 0, 'view', 'view.php?id=5', '5'),
(395, 1392216818, 2, '127.0.0.1', 5, 'quiz', 7, 'view', 'view.php?id=7', '4'),
(396, 1392216824, 2, '127.0.0.1', 5, 'quiz', 7, 'preview', 'view.php?id=7', '4'),
(397, 1392216824, 2, '127.0.0.1', 5, 'quiz', 7, 'continue attempt', 'review.php?attempt=6', '4'),
(398, 1392216839, 2, '127.0.0.1', 5, 'quiz', 7, 'view summary', 'summary.php?attempt=6', '4'),
(399, 1392216871, 2, '127.0.0.1', 5, 'quiz', 7, 'close attempt', 'review.php?attempt=6', '4'),
(400, 1392216872, 2, '127.0.0.1', 5, 'quiz', 7, 'review', 'review.php?attempt=6', '4'),
(401, 1392216921, 2, '127.0.0.1', 5, 'quiz', 7, 'view', 'view.php?id=7', '4'),
(402, 1392220632, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(403, 1392220632, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(404, 1392220633, 2, '127.0.0.1', 5, 'course', 0, 'view', 'view.php?id=5', '5'),
(405, 1392221303, 2, '127.0.0.1', 5, 'quiz', 7, 'view', 'view.php?id=7', '4'),
(406, 1392221309, 2, '127.0.0.1', 5, 'quiz', 7, 'preview', 'view.php?id=7', '4'),
(407, 1392221310, 2, '127.0.0.1', 5, 'quiz', 7, 'continue attempt', 'review.php?attempt=7', '4'),
(408, 1392221327, 2, '127.0.0.1', 5, 'quiz', 7, 'view summary', 'summary.php?attempt=7', '4'),
(409, 1392221335, 2, '127.0.0.1', 5, 'quiz', 7, 'close attempt', 'review.php?attempt=7', '4'),
(410, 1392221335, 2, '127.0.0.1', 5, 'quiz', 7, 'review', 'review.php?attempt=7', '4'),
(411, 1392221351, 2, '127.0.0.1', 5, 'quiz', 7, 'view', 'view.php?id=7', '4'),
(412, 1392221425, 2, '127.0.0.1', 5, 'quiz', 7, 'review', 'review.php?attempt=7', '4'),
(413, 1392221436, 2, '127.0.0.1', 5, 'quiz', 7, 'view', 'view.php?id=7', '4'),
(414, 1392221719, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(415, 1392284942, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(416, 1392284942, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(417, 1392284945, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(418, 1392285465, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(419, 1392288244, 0, '127.0.0.1', 1, 'user', 0, 'add', '/view.php?id=6', 'qwerty input'),
(420, 1392288763, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(421, 1392288763, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(422, 1392288764, 2, '127.0.0.1', 4, 'quiz', 5, 'view', 'view.php?id=5', '3'),
(423, 1392288776, 2, '127.0.0.1', 4, 'quiz', 5, 'review', 'review.php?attempt=5', '3'),
(424, 1392288787, 2, '127.0.0.1', 4, 'quiz', 5, 'preview', 'view.php?id=5', '3'),
(425, 1392288787, 2, '127.0.0.1', 4, 'quiz', 5, 'continue attempt', 'review.php?attempt=8', '3'),
(426, 1392288803, 2, '127.0.0.1', 4, 'quiz', 5, 'continue attempt', 'review.php?attempt=8', '3'),
(427, 1392288809, 2, '127.0.0.1', 4, 'quiz', 5, 'view summary', 'summary.php?attempt=8', '3'),
(428, 1392288816, 2, '127.0.0.1', 4, 'quiz', 5, 'continue attempt', 'review.php?attempt=8', '3'),
(429, 1392288820, 2, '127.0.0.1', 4, 'quiz', 5, 'view summary', 'summary.php?attempt=8', '3'),
(430, 1392288827, 2, '127.0.0.1', 4, 'quiz', 5, 'close attempt', 'review.php?attempt=8', '3'),
(431, 1392288827, 2, '127.0.0.1', 4, 'quiz', 5, 'review', 'review.php?attempt=8', '3'),
(432, 1392288869, 2, '127.0.0.1', 4, 'quiz', 5, 'report', 'report.php?id=5&mode=overview', '3'),
(433, 1392288874, 2, '127.0.0.1', 4, 'quiz', 5, 'report', 'report.php?id=5&mode=overview', '3'),
(434, 1392288880, 2, '127.0.0.1', 4, 'quiz', 5, 'report', 'report.php?id=5&mode=overview', '3'),
(435, 1392288882, 2, '127.0.0.1', 4, 'quiz', 5, 'report', 'report.php?id=5&mode=overview', '3'),
(436, 1392288883, 2, '127.0.0.1', 4, 'quiz', 5, 'report', 'report.php?id=5&mode=overview', '3'),
(437, 1392288883, 2, '127.0.0.1', 4, 'quiz', 5, 'report', 'report.php?id=5&mode=overview', '3'),
(438, 1392288888, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(439, 1392288892, 2, '127.0.0.1', 5, 'course', 0, 'view', 'view.php?id=5', '5'),
(440, 1392288895, 2, '127.0.0.1', 5, 'quiz', 7, 'view', 'view.php?id=7', '4'),
(441, 1392288900, 2, '127.0.0.1', 5, 'quiz', 7, 'preview', 'view.php?id=7', '4'),
(442, 1392288900, 2, '127.0.0.1', 5, 'quiz', 7, 'continue attempt', 'review.php?attempt=9', '4'),
(443, 1392288919, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(444, 1392302425, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(445, 1392302425, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(446, 1392302428, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(447, 1392302436, 2, '127.0.0.1', 4, 'quiz', 5, 'view', 'view.php?id=5', '3'),
(448, 1392302445, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(449, 1392302451, 2, '127.0.0.1', 5, 'course', 0, 'view', 'view.php?id=5', '5'),
(450, 1392302476, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(451, 1392303614, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(452, 1392303637, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(453, 1392303638, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(454, 1392303638, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(455, 1392303644, 2, '127.0.0.1', 5, 'course', 0, 'view', 'view.php?id=5', '5'),
(456, 1392303647, 2, '127.0.0.1', 5, 'quiz', 7, 'view', 'view.php?id=7', '4'),
(457, 1392303662, 2, '127.0.0.1', 5, 'course', 0, 'view', 'view.php?id=5', '5'),
(458, 1392303675, 2, '127.0.0.1', 5, 'course', 0, 'view', 'view.php?id=5', '5'),
(459, 1392303678, 2, '127.0.0.1', 5, 'quiz', 7, 'view', 'view.php?id=7', '4'),
(460, 1392303688, 2, '127.0.0.1', 5, 'quiz', 7, 'continue attempt', 'review.php?attempt=9', '4'),
(461, 1392303696, 2, '127.0.0.1', 5, 'quiz', 7, 'view summary', 'summary.php?attempt=9', '4'),
(462, 1392303703, 2, '127.0.0.1', 5, 'course', 0, 'view', 'view.php?id=5', '5'),
(463, 1392303706, 2, '127.0.0.1', 5, 'quiz', 7, 'view', 'view.php?id=7', '4'),
(464, 1392303737, 2, '127.0.0.1', 5, 'quiz', 7, 'editquestions', 'view.php?id=7', '4'),
(465, 1392303756, 2, '127.0.0.1', 5, 'quiz', 7, 'editquestions', 'view.php?id=7', '4'),
(466, 1392303774, 2, '127.0.0.1', 4, 'quiz', 5, 'view', 'view.php?id=5', '3'),
(467, 1392303790, 2, '127.0.0.1', 5, 'course', 0, 'view', 'view.php?id=5', '5'),
(468, 1392303806, 2, '127.0.0.1', 5, 'course', 0, 'view', 'view.php?id=5', '5'),
(469, 1392303806, 2, '127.0.0.1', 5, 'course', 0, 'view', 'view.php?id=5', '5'),
(470, 1392303842, 2, '127.0.0.1', 5, 'course', 0, 'view', 'view.php?id=5', '5'),
(471, 1392303846, 2, '127.0.0.1', 5, 'course', 0, 'view', 'view.php?id=5', '5'),
(472, 1392303846, 2, '127.0.0.1', 5, 'course', 0, 'view', 'view.php?id=5', '5'),
(473, 1392303848, 2, '127.0.0.1', 5, 'quiz', 7, 'view', 'view.php?id=7', '4'),
(474, 1392303851, 2, '127.0.0.1', 5, 'quiz', 7, 'continue attempt', 'review.php?attempt=9', '4'),
(475, 1392303856, 2, '127.0.0.1', 5, 'quiz', 7, 'view summary', 'summary.php?attempt=9', '4'),
(476, 1392303861, 2, '127.0.0.1', 5, 'quiz', 7, 'close attempt', 'review.php?attempt=9', '4'),
(477, 1392303861, 2, '127.0.0.1', 5, 'quiz', 7, 'review', 'review.php?attempt=9', '4'),
(478, 1392303868, 2, '127.0.0.1', 5, 'course', 0, 'view', 'view.php?id=5', '5'),
(479, 1392303871, 2, '127.0.0.1', 5, 'quiz', 7, 'view', 'view.php?id=7', '4'),
(480, 1392303891, 2, '127.0.0.1', 5, 'quiz', 7, 'preview', 'view.php?id=7', '4'),
(481, 1392303891, 2, '127.0.0.1', 5, 'quiz', 7, 'continue attempt', 'review.php?attempt=10', '4'),
(482, 1392303901, 2, '127.0.0.1', 5, 'quiz', 7, 'view summary', 'summary.php?attempt=10', '4'),
(483, 1392303947, 2, '127.0.0.1', 5, 'quiz', 7, 'close attempt', 'review.php?attempt=10', '4'),
(484, 1392303948, 2, '127.0.0.1', 5, 'quiz', 7, 'review', 'review.php?attempt=10', '4'),
(485, 1392303954, 2, '127.0.0.1', 5, 'quiz', 7, 'view', 'view.php?id=7', '4'),
(486, 1392304634, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(487, 1392315467, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(488, 1392315467, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(489, 1392315468, 2, '127.0.0.1', 5, 'course', 0, 'view', 'view.php?id=5', '5'),
(490, 1392315470, 2, '127.0.0.1', 5, 'quiz', 7, 'view', 'view.php?id=7', '4'),
(491, 1392315474, 2, '127.0.0.1', 5, 'course', 0, 'view', 'view.php?id=5', '5'),
(492, 1392315629, 2, '127.0.0.1', 5, 'quiz', 7, 'view', 'view.php?id=7', '4'),
(493, 1392315637, 2, '127.0.0.1', 5, 'quiz', 7, 'preview', 'view.php?id=7', '4'),
(494, 1392315637, 2, '127.0.0.1', 5, 'quiz', 7, 'continue attempt', 'review.php?attempt=11', '4'),
(495, 1392315651, 2, '127.0.0.1', 5, 'quiz', 7, 'view summary', 'summary.php?attempt=11', '4'),
(496, 1392315697, 2, '127.0.0.1', 5, 'quiz', 7, 'close attempt', 'review.php?attempt=11', '4'),
(497, 1392315697, 2, '127.0.0.1', 5, 'quiz', 7, 'review', 'review.php?attempt=11', '4'),
(498, 1392315702, 2, '127.0.0.1', 5, 'quiz', 7, 'review', 'review.php?attempt=11', '4'),
(499, 1392315761, 2, '127.0.0.1', 5, 'quiz', 7, 'view', 'view.php?id=7', '4');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_log_display`
--

CREATE TABLE IF NOT EXISTS `mdl_log_display` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `module` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `action` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mtable` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `field` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_logdisp_modact_uix` (`module`,`action`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='For a particular module/action, specifies a moodle table/fie' AUTO_INCREMENT=188 ;

--
-- Dumping data for table `mdl_log_display`
--

INSERT INTO `mdl_log_display` (`id`, `module`, `action`, `mtable`, `field`, `component`) VALUES
(1, 'course', 'user report', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(2, 'course', 'view', 'course', 'fullname', 'moodle'),
(3, 'course', 'view section', 'course_sections', 'name', 'moodle'),
(4, 'course', 'update', 'course', 'fullname', 'moodle'),
(5, 'course', 'hide', 'course', 'fullname', 'moodle'),
(6, 'course', 'show', 'course', 'fullname', 'moodle'),
(7, 'course', 'move', 'course', 'fullname', 'moodle'),
(8, 'course', 'enrol', 'course', 'fullname', 'moodle'),
(9, 'course', 'unenrol', 'course', 'fullname', 'moodle'),
(10, 'course', 'report log', 'course', 'fullname', 'moodle'),
(11, 'course', 'report live', 'course', 'fullname', 'moodle'),
(12, 'course', 'report outline', 'course', 'fullname', 'moodle'),
(13, 'course', 'report participation', 'course', 'fullname', 'moodle'),
(14, 'course', 'report stats', 'course', 'fullname', 'moodle'),
(15, 'category', 'add', 'course_categories', 'name', 'moodle'),
(16, 'category', 'hide', 'course_categories', 'name', 'moodle'),
(17, 'category', 'move', 'course_categories', 'name', 'moodle'),
(18, 'category', 'show', 'course_categories', 'name', 'moodle'),
(19, 'category', 'update', 'course_categories', 'name', 'moodle'),
(20, 'message', 'write', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(21, 'message', 'read', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(22, 'message', 'add contact', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(23, 'message', 'remove contact', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(24, 'message', 'block contact', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(25, 'message', 'unblock contact', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(26, 'group', 'view', 'groups', 'name', 'moodle'),
(27, 'tag', 'update', 'tag', 'name', 'moodle'),
(28, 'tag', 'flag', 'tag', 'name', 'moodle'),
(29, 'user', 'view', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(30, 'assign', 'add', 'assign', 'name', 'mod_assign'),
(31, 'assign', 'delete mod', 'assign', 'name', 'mod_assign'),
(32, 'assign', 'download all submissions', 'assign', 'name', 'mod_assign'),
(33, 'assign', 'grade submission', 'assign', 'name', 'mod_assign'),
(34, 'assign', 'lock submission', 'assign', 'name', 'mod_assign'),
(35, 'assign', 'reveal identities', 'assign', 'name', 'mod_assign'),
(36, 'assign', 'revert submission to draft', 'assign', 'name', 'mod_assign'),
(37, 'assign', 'set marking workflow state', 'assign', 'name', 'mod_assign'),
(38, 'assign', 'submission statement accepted', 'assign', 'name', 'mod_assign'),
(39, 'assign', 'submit', 'assign', 'name', 'mod_assign'),
(40, 'assign', 'submit for grading', 'assign', 'name', 'mod_assign'),
(41, 'assign', 'unlock submission', 'assign', 'name', 'mod_assign'),
(42, 'assign', 'update', 'assign', 'name', 'mod_assign'),
(43, 'assign', 'upload', 'assign', 'name', 'mod_assign'),
(44, 'assign', 'view', 'assign', 'name', 'mod_assign'),
(45, 'assign', 'view all', 'course', 'fullname', 'mod_assign'),
(46, 'assign', 'view confirm submit assignment form', 'assign', 'name', 'mod_assign'),
(47, 'assign', 'view grading form', 'assign', 'name', 'mod_assign'),
(48, 'assign', 'view submission', 'assign', 'name', 'mod_assign'),
(49, 'assign', 'view submission grading table', 'assign', 'name', 'mod_assign'),
(50, 'assign', 'view submit assignment form', 'assign', 'name', 'mod_assign'),
(51, 'assign', 'view feedback', 'assign', 'name', 'mod_assign'),
(52, 'assign', 'view batch set marking workflow state', 'assign', 'name', 'mod_assign'),
(53, 'assignment', 'view', 'assignment', 'name', 'mod_assignment'),
(54, 'assignment', 'add', 'assignment', 'name', 'mod_assignment'),
(55, 'assignment', 'update', 'assignment', 'name', 'mod_assignment'),
(56, 'assignment', 'view submission', 'assignment', 'name', 'mod_assignment'),
(57, 'assignment', 'upload', 'assignment', 'name', 'mod_assignment'),
(58, 'book', 'add', 'book', 'name', 'mod_book'),
(59, 'book', 'update', 'book', 'name', 'mod_book'),
(60, 'book', 'view', 'book', 'name', 'mod_book'),
(61, 'book', 'add chapter', 'book_chapters', 'title', 'mod_book'),
(62, 'book', 'update chapter', 'book_chapters', 'title', 'mod_book'),
(63, 'book', 'view chapter', 'book_chapters', 'title', 'mod_book'),
(64, 'chat', 'view', 'chat', 'name', 'mod_chat'),
(65, 'chat', 'add', 'chat', 'name', 'mod_chat'),
(66, 'chat', 'update', 'chat', 'name', 'mod_chat'),
(67, 'chat', 'report', 'chat', 'name', 'mod_chat'),
(68, 'chat', 'talk', 'chat', 'name', 'mod_chat'),
(69, 'choice', 'view', 'choice', 'name', 'mod_choice'),
(70, 'choice', 'update', 'choice', 'name', 'mod_choice'),
(71, 'choice', 'add', 'choice', 'name', 'mod_choice'),
(72, 'choice', 'report', 'choice', 'name', 'mod_choice'),
(73, 'choice', 'choose', 'choice', 'name', 'mod_choice'),
(74, 'choice', 'choose again', 'choice', 'name', 'mod_choice'),
(75, 'data', 'view', 'data', 'name', 'mod_data'),
(76, 'data', 'add', 'data', 'name', 'mod_data'),
(77, 'data', 'update', 'data', 'name', 'mod_data'),
(78, 'data', 'record delete', 'data', 'name', 'mod_data'),
(79, 'data', 'fields add', 'data_fields', 'name', 'mod_data'),
(80, 'data', 'fields update', 'data_fields', 'name', 'mod_data'),
(81, 'data', 'templates saved', 'data', 'name', 'mod_data'),
(82, 'data', 'templates def', 'data', 'name', 'mod_data'),
(83, 'feedback', 'startcomplete', 'feedback', 'name', 'mod_feedback'),
(84, 'feedback', 'submit', 'feedback', 'name', 'mod_feedback'),
(85, 'feedback', 'delete', 'feedback', 'name', 'mod_feedback'),
(86, 'feedback', 'view', 'feedback', 'name', 'mod_feedback'),
(87, 'feedback', 'view all', 'course', 'shortname', 'mod_feedback'),
(88, 'folder', 'view', 'folder', 'name', 'mod_folder'),
(89, 'folder', 'view all', 'folder', 'name', 'mod_folder'),
(90, 'folder', 'update', 'folder', 'name', 'mod_folder'),
(91, 'folder', 'add', 'folder', 'name', 'mod_folder'),
(92, 'forum', 'add', 'forum', 'name', 'mod_forum'),
(93, 'forum', 'update', 'forum', 'name', 'mod_forum'),
(94, 'forum', 'add discussion', 'forum_discussions', 'name', 'mod_forum'),
(95, 'forum', 'add post', 'forum_posts', 'subject', 'mod_forum'),
(96, 'forum', 'update post', 'forum_posts', 'subject', 'mod_forum'),
(97, 'forum', 'user report', 'user', 'CONCAT(firstname, '' '', lastname)', 'mod_forum'),
(98, 'forum', 'move discussion', 'forum_discussions', 'name', 'mod_forum'),
(99, 'forum', 'view subscribers', 'forum', 'name', 'mod_forum'),
(100, 'forum', 'view discussion', 'forum_discussions', 'name', 'mod_forum'),
(101, 'forum', 'view forum', 'forum', 'name', 'mod_forum'),
(102, 'forum', 'subscribe', 'forum', 'name', 'mod_forum'),
(103, 'forum', 'unsubscribe', 'forum', 'name', 'mod_forum'),
(104, 'glossary', 'add', 'glossary', 'name', 'mod_glossary'),
(105, 'glossary', 'update', 'glossary', 'name', 'mod_glossary'),
(106, 'glossary', 'view', 'glossary', 'name', 'mod_glossary'),
(107, 'glossary', 'view all', 'glossary', 'name', 'mod_glossary'),
(108, 'glossary', 'add entry', 'glossary', 'name', 'mod_glossary'),
(109, 'glossary', 'update entry', 'glossary', 'name', 'mod_glossary'),
(110, 'glossary', 'add category', 'glossary', 'name', 'mod_glossary'),
(111, 'glossary', 'update category', 'glossary', 'name', 'mod_glossary'),
(112, 'glossary', 'delete category', 'glossary', 'name', 'mod_glossary'),
(113, 'glossary', 'approve entry', 'glossary', 'name', 'mod_glossary'),
(114, 'glossary', 'disapprove entry', 'glossary', 'name', 'mod_glossary'),
(115, 'glossary', 'view entry', 'glossary_entries', 'concept', 'mod_glossary'),
(116, 'imscp', 'view', 'imscp', 'name', 'mod_imscp'),
(117, 'imscp', 'view all', 'imscp', 'name', 'mod_imscp'),
(118, 'imscp', 'update', 'imscp', 'name', 'mod_imscp'),
(119, 'imscp', 'add', 'imscp', 'name', 'mod_imscp'),
(120, 'label', 'add', 'label', 'name', 'mod_label'),
(121, 'label', 'update', 'label', 'name', 'mod_label'),
(122, 'lesson', 'start', 'lesson', 'name', 'mod_lesson'),
(123, 'lesson', 'end', 'lesson', 'name', 'mod_lesson'),
(124, 'lesson', 'view', 'lesson_pages', 'title', 'mod_lesson'),
(125, 'lti', 'view', 'lti', 'name', 'mod_lti'),
(126, 'lti', 'launch', 'lti', 'name', 'mod_lti'),
(127, 'lti', 'view all', 'lti', 'name', 'mod_lti'),
(128, 'page', 'view', 'page', 'name', 'mod_page'),
(129, 'page', 'view all', 'page', 'name', 'mod_page'),
(130, 'page', 'update', 'page', 'name', 'mod_page'),
(131, 'page', 'add', 'page', 'name', 'mod_page'),
(132, 'quiz', 'add', 'quiz', 'name', 'mod_quiz'),
(133, 'quiz', 'update', 'quiz', 'name', 'mod_quiz'),
(134, 'quiz', 'view', 'quiz', 'name', 'mod_quiz'),
(135, 'quiz', 'report', 'quiz', 'name', 'mod_quiz'),
(136, 'quiz', 'attempt', 'quiz', 'name', 'mod_quiz'),
(137, 'quiz', 'submit', 'quiz', 'name', 'mod_quiz'),
(138, 'quiz', 'review', 'quiz', 'name', 'mod_quiz'),
(139, 'quiz', 'editquestions', 'quiz', 'name', 'mod_quiz'),
(140, 'quiz', 'preview', 'quiz', 'name', 'mod_quiz'),
(141, 'quiz', 'start attempt', 'quiz', 'name', 'mod_quiz'),
(142, 'quiz', 'close attempt', 'quiz', 'name', 'mod_quiz'),
(143, 'quiz', 'continue attempt', 'quiz', 'name', 'mod_quiz'),
(144, 'quiz', 'edit override', 'quiz', 'name', 'mod_quiz'),
(145, 'quiz', 'delete override', 'quiz', 'name', 'mod_quiz'),
(146, 'quiz', 'view summary', 'quiz', 'name', 'mod_quiz'),
(147, 'resource', 'view', 'resource', 'name', 'mod_resource'),
(148, 'resource', 'view all', 'resource', 'name', 'mod_resource'),
(149, 'resource', 'update', 'resource', 'name', 'mod_resource'),
(150, 'resource', 'add', 'resource', 'name', 'mod_resource'),
(151, 'scorm', 'view', 'scorm', 'name', 'mod_scorm'),
(152, 'scorm', 'review', 'scorm', 'name', 'mod_scorm'),
(153, 'scorm', 'update', 'scorm', 'name', 'mod_scorm'),
(154, 'scorm', 'add', 'scorm', 'name', 'mod_scorm'),
(155, 'survey', 'add', 'survey', 'name', 'mod_survey'),
(156, 'survey', 'update', 'survey', 'name', 'mod_survey'),
(157, 'survey', 'download', 'survey', 'name', 'mod_survey'),
(158, 'survey', 'view form', 'survey', 'name', 'mod_survey'),
(159, 'survey', 'view graph', 'survey', 'name', 'mod_survey'),
(160, 'survey', 'view report', 'survey', 'name', 'mod_survey'),
(161, 'survey', 'submit', 'survey', 'name', 'mod_survey'),
(162, 'url', 'view', 'url', 'name', 'mod_url'),
(163, 'url', 'view all', 'url', 'name', 'mod_url'),
(164, 'url', 'update', 'url', 'name', 'mod_url'),
(165, 'url', 'add', 'url', 'name', 'mod_url'),
(166, 'workshop', 'add', 'workshop', 'name', 'mod_workshop'),
(167, 'workshop', 'update', 'workshop', 'name', 'mod_workshop'),
(168, 'workshop', 'view', 'workshop', 'name', 'mod_workshop'),
(169, 'workshop', 'view all', 'workshop', 'name', 'mod_workshop'),
(170, 'workshop', 'add submission', 'workshop_submissions', 'title', 'mod_workshop'),
(171, 'workshop', 'update submission', 'workshop_submissions', 'title', 'mod_workshop'),
(172, 'workshop', 'view submission', 'workshop_submissions', 'title', 'mod_workshop'),
(173, 'workshop', 'add assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(174, 'workshop', 'update assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(175, 'workshop', 'add example', 'workshop_submissions', 'title', 'mod_workshop'),
(176, 'workshop', 'update example', 'workshop_submissions', 'title', 'mod_workshop'),
(177, 'workshop', 'view example', 'workshop_submissions', 'title', 'mod_workshop'),
(178, 'workshop', 'add reference assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(179, 'workshop', 'update reference assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(180, 'workshop', 'add example assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(181, 'workshop', 'update example assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(182, 'workshop', 'update aggregate grades', 'workshop', 'name', 'mod_workshop'),
(183, 'workshop', 'update clear aggregated grades', 'workshop', 'name', 'mod_workshop'),
(184, 'workshop', 'update clear assessments', 'workshop', 'name', 'mod_workshop'),
(185, 'book', 'exportimscp', 'book', 'name', 'booktool_exportimscp'),
(186, 'book', 'print', 'book', 'name', 'booktool_print'),
(187, 'book', 'print chapter', 'book_chapters', 'title', 'booktool_print');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_log_queries`
--

CREATE TABLE IF NOT EXISTS `mdl_log_queries` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `qtype` mediumint(5) NOT NULL,
  `sqltext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sqlparams` longtext COLLATE utf8_unicode_ci,
  `error` mediumint(5) NOT NULL DEFAULT '0',
  `info` longtext COLLATE utf8_unicode_ci,
  `backtrace` longtext COLLATE utf8_unicode_ci,
  `exectime` decimal(10,5) NOT NULL,
  `timelogged` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Logged database queries.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lti`
--

CREATE TABLE IF NOT EXISTS `mdl_lti` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `typeid` bigint(10) DEFAULT NULL,
  `toolurl` longtext COLLATE utf8_unicode_ci NOT NULL,
  `securetoolurl` longtext COLLATE utf8_unicode_ci,
  `instructorchoicesendname` tinyint(1) DEFAULT NULL,
  `instructorchoicesendemailaddr` tinyint(1) DEFAULT NULL,
  `instructorchoiceallowroster` tinyint(1) DEFAULT NULL,
  `instructorchoiceallowsetting` tinyint(1) DEFAULT NULL,
  `instructorcustomparameters` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instructorchoiceacceptgrades` tinyint(1) DEFAULT NULL,
  `grade` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `launchcontainer` tinyint(2) NOT NULL DEFAULT '1',
  `resourcekey` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `debuglaunch` tinyint(1) NOT NULL DEFAULT '0',
  `showtitlelaunch` tinyint(1) NOT NULL DEFAULT '0',
  `showdescriptionlaunch` tinyint(1) NOT NULL DEFAULT '0',
  `servicesalt` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` longtext COLLATE utf8_unicode_ci,
  `secureicon` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_lti_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table contains Basic LTI activities instances' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lti_submission`
--

CREATE TABLE IF NOT EXISTS `mdl_lti_submission` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `ltiid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `datesubmitted` bigint(10) NOT NULL,
  `dateupdated` bigint(10) NOT NULL,
  `gradepercent` decimal(10,5) NOT NULL,
  `originalgrade` decimal(10,5) NOT NULL,
  `launchid` bigint(10) NOT NULL,
  `state` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ltisubm_lti_ix` (`ltiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Keeps track of individual submissions for LTI activities.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lti_types`
--

CREATE TABLE IF NOT EXISTS `mdl_lti_types` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'basiclti Activity',
  `baseurl` longtext COLLATE utf8_unicode_ci NOT NULL,
  `tooldomain` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `state` tinyint(2) NOT NULL DEFAULT '2',
  `course` bigint(10) NOT NULL,
  `coursevisible` tinyint(1) NOT NULL DEFAULT '0',
  `createdby` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ltitype_cou_ix` (`course`),
  KEY `mdl_ltitype_too_ix` (`tooldomain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Basic LTI pre-configured activities' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lti_types_config`
--

CREATE TABLE IF NOT EXISTS `mdl_lti_types_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `typeid` bigint(10) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_ltitypeconf_typ_ix` (`typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Basic LTI types configuration' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message`
--

CREATE TABLE IF NOT EXISTS `mdl_message` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `useridfrom` bigint(10) NOT NULL DEFAULT '0',
  `useridto` bigint(10) NOT NULL DEFAULT '0',
  `subject` longtext COLLATE utf8_unicode_ci,
  `fullmessage` longtext COLLATE utf8_unicode_ci,
  `fullmessageformat` smallint(4) DEFAULT '0',
  `fullmessagehtml` longtext COLLATE utf8_unicode_ci,
  `smallmessage` longtext COLLATE utf8_unicode_ci,
  `notification` tinyint(1) DEFAULT '0',
  `contexturl` longtext COLLATE utf8_unicode_ci,
  `contexturlname` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_mess_use_ix` (`useridfrom`),
  KEY `mdl_mess_use2_ix` (`useridto`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores all unread messages' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `mdl_message`
--

INSERT INTO `mdl_message` (`id`, `useridfrom`, `useridto`, `subject`, `fullmessage`, `fullmessageformat`, `fullmessagehtml`, `smallmessage`, `notification`, `contexturl`, `contexturlname`, `timecreated`) VALUES
(2, 2, 4, 'New message from Chitrank Dixit', 'Hello Students, \n\nHope you have enjoyed the First Quiz. \n\nNext Quiz coming up on Saturday\n\n---------------------------------------------------------------------\nThis is a copy of a message sent to you at "e-exams". Go to http://localhost/moodle/message/index.php?user=4&id=2 to reply.', 1, '<p>Hello Students,</p>\r\n<p>Hope you have enjoyed the First Quiz.</p>\r\n<p></p>\r\n<p>Next Quiz coming up on Saturday</p><br /><br />---------------------------------------------------------------------<br />This is a copy of a message sent to you at "e-exams". Go to http://localhost/moodle/message/index.php?user=4&id=2 to reply.', '<p>Hello Students,</p>\r\n<p>Hope you have enjoyed the First Quiz.</p>\r\n<p></p>\r\n<p>Next Quiz coming up on Saturday</p>', 0, NULL, NULL, 1392022645);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_contacts`
--

CREATE TABLE IF NOT EXISTS `mdl_message_contacts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `contactid` bigint(10) NOT NULL DEFAULT '0',
  `blocked` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messcont_usecon_uix` (`userid`,`contactid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Maintains lists of relationships between users' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_processors`
--

CREATE TABLE IF NOT EXISTS `mdl_message_processors` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(166) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='List of message output plugins' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `mdl_message_processors`
--

INSERT INTO `mdl_message_processors` (`id`, `name`, `enabled`) VALUES
(1, 'email', 1),
(2, 'jabber', 1),
(3, 'popup', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_providers`
--

CREATE TABLE IF NOT EXISTS `mdl_message_providers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `component` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `capability` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messprov_comnam_uix` (`component`,`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table stores the message providers (modules and core sy' AUTO_INCREMENT=25 ;

--
-- Dumping data for table `mdl_message_providers`
--

INSERT INTO `mdl_message_providers` (`id`, `name`, `component`, `capability`) VALUES
(1, 'notices', 'moodle', 'moodle/site:config'),
(2, 'errors', 'moodle', 'moodle/site:config'),
(3, 'availableupdate', 'moodle', 'moodle/site:config'),
(4, 'instantmessage', 'moodle', NULL),
(5, 'backup', 'moodle', 'moodle/site:config'),
(6, 'courserequested', 'moodle', 'moodle/site:approvecourse'),
(7, 'courserequestapproved', 'moodle', 'moodle/course:request'),
(8, 'courserequestrejected', 'moodle', 'moodle/course:request'),
(9, 'badgerecipientnotice', 'moodle', 'moodle/badges:earnbadge'),
(10, 'badgecreatornotice', 'moodle', NULL),
(11, 'assign_notification', 'mod_assign', NULL),
(12, 'assignment_updates', 'mod_assignment', NULL),
(13, 'submission', 'mod_feedback', NULL),
(14, 'message', 'mod_feedback', NULL),
(15, 'posts', 'mod_forum', NULL),
(16, 'graded_essay', 'mod_lesson', NULL),
(17, 'submission', 'mod_quiz', 'mod/quiz:emailnotifysubmission'),
(18, 'confirmation', 'mod_quiz', 'mod/quiz:emailconfirmsubmission'),
(19, 'attempt_overdue', 'mod_quiz', 'mod/quiz:emailwarnoverdue'),
(20, 'flatfile_enrolment', 'enrol_flatfile', NULL),
(21, 'imsenterprise_enrolment', 'enrol_imsenterprise', NULL),
(22, 'expiry_notification', 'enrol_manual', NULL),
(23, 'paypal_enrolment', 'enrol_paypal', NULL),
(24, 'expiry_notification', 'enrol_self', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_read`
--

CREATE TABLE IF NOT EXISTS `mdl_message_read` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `useridfrom` bigint(10) NOT NULL DEFAULT '0',
  `useridto` bigint(10) NOT NULL DEFAULT '0',
  `subject` longtext COLLATE utf8_unicode_ci,
  `fullmessage` longtext COLLATE utf8_unicode_ci,
  `fullmessageformat` smallint(4) DEFAULT '0',
  `fullmessagehtml` longtext COLLATE utf8_unicode_ci,
  `smallmessage` longtext COLLATE utf8_unicode_ci,
  `notification` tinyint(1) DEFAULT '0',
  `contexturl` longtext COLLATE utf8_unicode_ci,
  `contexturlname` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timeread` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_messread_use_ix` (`useridfrom`),
  KEY `mdl_messread_use2_ix` (`useridto`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores all messages that have been read' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `mdl_message_read`
--

INSERT INTO `mdl_message_read` (`id`, `useridfrom`, `useridto`, `subject`, `fullmessage`, `fullmessageformat`, `fullmessagehtml`, `smallmessage`, `notification`, `contexturl`, `contexturlname`, `timecreated`, `timeread`) VALUES
(1, 2, 2, 'New message from Chitrank Dixit', 'Hello Students, \n\nHope you have enjoyed the First Quiz. \n\nNext Quiz coming up on Saturday\n\n---------------------------------------------------------------------\nThis is a copy of a message sent to you at "e-exams". Go to http://localhost/moodle/message/index.php?user=2&id=2 to reply.', 1, '<p>Hello Students,</p>\r\n<p>Hope you have enjoyed the First Quiz.</p>\r\n<p></p>\r\n<p>Next Quiz coming up on Saturday</p><br /><br />---------------------------------------------------------------------<br />This is a copy of a message sent to you at "e-exams". Go to http://localhost/moodle/message/index.php?user=2&id=2 to reply.', '<p>Hello Students,</p>\r\n<p>Hope you have enjoyed the First Quiz.</p>\r\n<p></p>\r\n<p>Next Quiz coming up on Saturday</p>', 0, NULL, NULL, 1392022645, 1392022645),
(2, 2, 3, 'New message from Chitrank Dixit', 'Hello Students, \n\nHope you have enjoyed the First Quiz. \n\nNext Quiz coming up on Saturday\n\n---------------------------------------------------------------------\nThis is a copy of a message sent to you at "e-exams". Go to http://localhost/moodle/message/index.php?user=3&id=2 to reply.', 1, '<p>Hello Students,</p>\r\n<p>Hope you have enjoyed the First Quiz.</p>\r\n<p></p>\r\n<p>Next Quiz coming up on Saturday</p><br /><br />---------------------------------------------------------------------<br />This is a copy of a message sent to you at "e-exams". Go to http://localhost/moodle/message/index.php?user=3&id=2 to reply.', '<p>Hello Students,</p>\r\n<p>Hope you have enjoyed the First Quiz.</p>\r\n<p></p>\r\n<p>Next Quiz coming up on Saturday</p>', 0, NULL, NULL, 1392022645, 1392183671);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_working`
--

CREATE TABLE IF NOT EXISTS `mdl_message_working` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `unreadmessageid` bigint(10) NOT NULL,
  `processorid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_messwork_unr_ix` (`unreadmessageid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Lists all the messages and processors that need to be proces' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `mdl_message_working`
--

INSERT INTO `mdl_message_working` (`id`, `unreadmessageid`, `processorid`) VALUES
(1, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnetservice_enrol_courses`
--

CREATE TABLE IF NOT EXISTS `mdl_mnetservice_enrol_courses` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL,
  `remoteid` bigint(10) NOT NULL,
  `categoryid` bigint(10) NOT NULL,
  `categoryname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `fullname` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shortname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `summary` longtext COLLATE utf8_unicode_ci NOT NULL,
  `summaryformat` smallint(3) DEFAULT '0',
  `startdate` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL,
  `rolename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetenrocour_hosrem_uix` (`hostid`,`remoteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Caches the information fetched via XML-RPC about courses on ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnetservice_enrol_enrolments`
--

CREATE TABLE IF NOT EXISTS `mdl_mnetservice_enrol_enrolments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `remotecourseid` bigint(10) NOT NULL,
  `rolename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enroltime` bigint(10) NOT NULL DEFAULT '0',
  `enroltype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_mnetenroenro_use_ix` (`userid`),
  KEY `mdl_mnetenroenro_hos_ix` (`hostid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Caches the information about enrolments of our local users i' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_application`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_application` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `display_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `xmlrpc_server_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sso_land_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sso_jump_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Information about applications on remote hosts' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `mdl_mnet_application`
--

INSERT INTO `mdl_mnet_application` (`id`, `name`, `display_name`, `xmlrpc_server_url`, `sso_land_url`, `sso_jump_url`) VALUES
(1, 'moodle', 'Moodle', '/mnet/xmlrpc/server.php', '/auth/mnet/land.php', '/auth/mnet/jump.php'),
(2, 'mahara', 'Mahara', '/api/xmlrpc/server.php', '/auth/xmlrpc/land.php', '/auth/xmlrpc/jump.php');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_host`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_host` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `wwwroot` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `public_key` longtext COLLATE utf8_unicode_ci NOT NULL,
  `public_key_expires` bigint(10) NOT NULL DEFAULT '0',
  `transport` tinyint(2) NOT NULL DEFAULT '0',
  `portno` mediumint(5) NOT NULL DEFAULT '0',
  `last_connect_time` bigint(10) NOT NULL DEFAULT '0',
  `last_log_id` bigint(10) NOT NULL DEFAULT '0',
  `force_theme` tinyint(1) NOT NULL DEFAULT '0',
  `theme` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `applicationid` bigint(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_mnethost_app_ix` (`applicationid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Information about the local and remote hosts for RPC' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `mdl_mnet_host`
--

INSERT INTO `mdl_mnet_host` (`id`, `deleted`, `wwwroot`, `ip_address`, `name`, `public_key`, `public_key_expires`, `transport`, `portno`, `last_connect_time`, `last_log_id`, `force_theme`, `theme`, `applicationid`) VALUES
(1, 0, 'http://localhost/moodle', '127.0.0.1', '', '', 0, 0, 0, 0, 0, 0, NULL, 1),
(2, 0, '', '', 'All Hosts', '', 0, 0, 0, 0, 0, 0, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_host2service`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_host2service` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL DEFAULT '0',
  `serviceid` bigint(10) NOT NULL DEFAULT '0',
  `publish` tinyint(1) NOT NULL DEFAULT '0',
  `subscribe` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnethost_hosser_uix` (`hostid`,`serviceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Information about the services for a given host' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_log`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL DEFAULT '0',
  `remoteid` bigint(10) NOT NULL DEFAULT '0',
  `time` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `ip` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `coursename` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `module` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cmid` bigint(10) NOT NULL DEFAULT '0',
  `action` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `info` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_mnetlog_hosusecou_ix` (`hostid`,`userid`,`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Store session data from users migrating to other sites' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_remote_rpc`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_remote_rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `functionname` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `xmlrpcpath` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `plugintype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pluginname` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table describes functions that might be called remotely' AUTO_INCREMENT=17 ;

--
-- Dumping data for table `mdl_mnet_remote_rpc`
--

INSERT INTO `mdl_mnet_remote_rpc` (`id`, `functionname`, `xmlrpcpath`, `plugintype`, `pluginname`, `enabled`) VALUES
(1, 'user_authorise', 'auth/mnet/auth.php/user_authorise', 'auth', 'mnet', 1),
(2, 'keepalive_server', 'auth/mnet/auth.php/keepalive_server', 'auth', 'mnet', 1),
(3, 'kill_children', 'auth/mnet/auth.php/kill_children', 'auth', 'mnet', 1),
(4, 'refresh_log', 'auth/mnet/auth.php/refresh_log', 'auth', 'mnet', 1),
(5, 'fetch_user_image', 'auth/mnet/auth.php/fetch_user_image', 'auth', 'mnet', 1),
(6, 'fetch_theme_info', 'auth/mnet/auth.php/fetch_theme_info', 'auth', 'mnet', 1),
(7, 'update_enrolments', 'auth/mnet/auth.php/update_enrolments', 'auth', 'mnet', 1),
(8, 'keepalive_client', 'auth/mnet/auth.php/keepalive_client', 'auth', 'mnet', 1),
(9, 'kill_child', 'auth/mnet/auth.php/kill_child', 'auth', 'mnet', 1),
(10, 'available_courses', 'enrol/mnet/enrol.php/available_courses', 'enrol', 'mnet', 1),
(11, 'user_enrolments', 'enrol/mnet/enrol.php/user_enrolments', 'enrol', 'mnet', 1),
(12, 'enrol_user', 'enrol/mnet/enrol.php/enrol_user', 'enrol', 'mnet', 1),
(13, 'unenrol_user', 'enrol/mnet/enrol.php/unenrol_user', 'enrol', 'mnet', 1),
(14, 'course_enrolments', 'enrol/mnet/enrol.php/course_enrolments', 'enrol', 'mnet', 1),
(15, 'send_content_intent', 'portfolio/mahara/lib.php/send_content_intent', 'portfolio', 'mahara', 1),
(16, 'send_content_ready', 'portfolio/mahara/lib.php/send_content_ready', 'portfolio', 'mahara', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_remote_service2rpc`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_remote_service2rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `serviceid` bigint(10) NOT NULL DEFAULT '0',
  `rpcid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetremoserv_rpcser_uix` (`rpcid`,`serviceid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Group functions or methods under a service' AUTO_INCREMENT=17 ;

--
-- Dumping data for table `mdl_mnet_remote_service2rpc`
--

INSERT INTO `mdl_mnet_remote_service2rpc` (`id`, `serviceid`, `rpcid`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 2, 8),
(9, 2, 9),
(10, 3, 10),
(11, 3, 11),
(12, 3, 12),
(13, 3, 13),
(14, 3, 14),
(15, 4, 15),
(16, 4, 16);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_rpc`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `functionname` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `xmlrpcpath` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `plugintype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pluginname` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `help` longtext COLLATE utf8_unicode_ci NOT NULL,
  `profile` longtext COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `classname` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `static` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_mnetrpc_enaxml_ix` (`enabled`,`xmlrpcpath`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Functions or methods that we may publish or subscribe to' AUTO_INCREMENT=16 ;

--
-- Dumping data for table `mdl_mnet_rpc`
--

INSERT INTO `mdl_mnet_rpc` (`id`, `functionname`, `xmlrpcpath`, `plugintype`, `pluginname`, `enabled`, `help`, `profile`, `filename`, `classname`, `static`) VALUES
(1, 'user_authorise', 'auth/mnet/auth.php/user_authorise', 'auth', 'mnet', 1, 'Return user data for the provided token, compare with user_agent string.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:5:"token";s:4:"type";s:6:"string";s:11:"description";s:37:"The unique ID provided by remotehost.";}i:1;a:3:{s:4:"name";s:9:"useragent";s:4:"type";s:6:"string";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:44:"$userdata Array of user info for remote host";}}', 'auth.php', 'auth_plugin_mnet', 0),
(2, 'keepalive_server', 'auth/mnet/auth.php/keepalive_server', 'auth', 'mnet', 1, 'Receives an array of usernames from a remote machine and prods their\nsessions to keep them alive', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:5:"array";s:4:"type";s:5:"array";s:11:"description";s:21:"An array of usernames";}}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:28:""All ok" or an error message";}}', 'auth.php', 'auth_plugin_mnet', 0),
(3, 'kill_children', 'auth/mnet/auth.php/kill_children', 'auth', 'mnet', 1, 'The IdP uses this function to kill child sessions on other hosts', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:28:"Username for session to kill";}i:1;a:3:{s:4:"name";s:9:"useragent";s:4:"type";s:6:"string";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:39:"A plaintext report of what has happened";}}', 'auth.php', 'auth_plugin_mnet', 0),
(4, 'refresh_log', 'auth/mnet/auth.php/refresh_log', 'auth', 'mnet', 1, 'Receives an array of log entries from an SP and adds them to the mnet_log\ntable', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:5:"array";s:4:"type";s:5:"array";s:11:"description";s:21:"An array of usernames";}}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:28:""All ok" or an error message";}}', 'auth.php', 'auth_plugin_mnet', 0),
(5, 'fetch_user_image', 'auth/mnet/auth.php/fetch_user_image', 'auth', 'mnet', 1, 'Returns the user''s profile image info\nIf the user exists and has a profile picture, the returned array will contain keys:\n f1          - the content of the default 100x100px image\n f1_mimetype - the mimetype of the f1 file\n f2          - the content of the 35x35px variant of the image\n f2_mimetype - the mimetype of the f2 file\nThe mimetype information was added in Moodle 2.0. In Moodle 1.x, images are always jpegs.', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:3:"int";s:11:"description";s:18:"The id of the user";}}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:84:"false if user not found, empty array if no picture exists, array with data otherwise";}}', 'auth.php', 'auth_plugin_mnet', 0),
(6, 'fetch_theme_info', 'auth/mnet/auth.php/fetch_theme_info', 'auth', 'mnet', 1, 'Returns the theme information and logo url as strings.', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:14:"The theme info";}}', 'auth.php', 'auth_plugin_mnet', 0),
(7, 'update_enrolments', 'auth/mnet/auth.php/update_enrolments', 'auth', 'mnet', 1, 'Invoke this function _on_ the IDP to update it with enrolment info local to\nthe SP right after calling user_authorise()\nNormally called by the SP after calling user_authorise()', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:12:"The username";}i:1;a:3:{s:4:"name";s:7:"courses";s:4:"type";s:5:"array";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:0:"";}}', 'auth.php', 'auth_plugin_mnet', 0),
(8, 'keepalive_client', 'auth/mnet/auth.php/keepalive_client', 'auth', 'mnet', 1, 'Poll the IdP server to let it know that a user it has authenticated is still\nonline', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:4:"void";s:11:"description";s:0:"";}}', 'auth.php', 'auth_plugin_mnet', 0),
(9, 'kill_child', 'auth/mnet/auth.php/kill_child', 'auth', 'mnet', 1, 'When the IdP requests that child sessions are terminated,\nthis function will be called on each of the child hosts. The machine that\ncalls the function (over xmlrpc) provides us with the mnethostid we need.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:28:"Username for session to kill";}i:1;a:3:{s:4:"name";s:9:"useragent";s:4:"type";s:6:"string";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:15:"True on success";}}', 'auth.php', 'auth_plugin_mnet', 0),
(10, 'available_courses', 'enrol/mnet/enrol.php/available_courses', 'enrol', 'mnet', 1, 'Returns list of courses that we offer to the caller for remote enrolment of their users\nSince Moodle 2.0, courses are made available for MNet peers by creating an instance\nof enrol_mnet plugin for the course. Hidden courses are not returned. If there are two\ninstances - one specific for the host and one for ''All hosts'', the setting of the specific\none is used. The id of the peer is kept in customint1, no other custom fields are used.', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:0:"";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(11, 'user_enrolments', 'enrol/mnet/enrol.php/user_enrolments', 'enrol', 'mnet', 1, 'This method has never been implemented in Moodle MNet API', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:11:"empty array";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(12, 'enrol_user', 'enrol/mnet/enrol.php/enrol_user', 'enrol', 'mnet', 1, 'Enrol remote user to our course\nIf we do not have local record for the remote user in our database,\nit gets created here.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"userdata";s:4:"type";s:5:"array";s:11:"description";s:14:"user details {";}i:1;a:3:{s:4:"name";s:8:"courseid";s:4:"type";s:3:"int";s:11:"description";s:19:"our local course id";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:69:"true if the enrolment has been successful, throws exception otherwise";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(13, 'unenrol_user', 'enrol/mnet/enrol.php/unenrol_user', 'enrol', 'mnet', 1, 'Unenrol remote user from our course\nOnly users enrolled via enrol_mnet plugin can be unenrolled remotely. If the\nremote user is enrolled into the local course via some other enrol plugin\n(enrol_manual for example), the remote host can''t touch such enrolment. Please\ndo not report this behaviour as bug, it is a feature ;-)', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:18:"of the remote user";}i:1;a:3:{s:4:"name";s:8:"courseid";s:4:"type";s:3:"int";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:71:"true if the unenrolment has been successful, throws exception otherwise";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(14, 'course_enrolments', 'enrol/mnet/enrol.php/course_enrolments', 'enrol', 'mnet', 1, 'Returns a list of users from the client server who are enrolled in our course\nSuitable instance of enrol_mnet must be created in the course. This method will not\nreturn any information about the enrolments in courses that are not available for\nremote enrolment, even if their users are enrolled into them via other plugin\n(note the difference from {@link self::user_enrolments()}).\nThis method will return enrolment information for users from hosts regardless\nthe enrolment plugin. It does not matter if the user was enrolled remotely by\ntheir admin or locally. Once the course is available for remote enrolments, we\nwill tell them everything about their users.\nIn Moodle 1.x the returned array used to be indexed by username. The side effect\nof MDL-19219 fix is that we do not need to use such index and therefore we can\nreturn all enrolment records. MNet clients 1.x will only use the last record for\nthe student, if she is enrolled via multiple plugins.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"courseid";s:4:"type";s:3:"int";s:11:"description";s:16:"ID of our course";}i:1;a:3:{s:4:"name";s:5:"roles";s:4:"type";s:5:"array";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:0:"";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(15, 'fetch_file', 'portfolio/mahara/lib.php/fetch_file', 'portfolio', 'mahara', 1, 'xmlrpc (mnet) function to get the file.\nreads in the file and returns it base_64 encoded\nso that it can be enrypted by mnet.', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:5:"token";s:4:"type";s:6:"string";s:11:"description";s:56:"the token recieved previously during send_content_intent";}}s:6:"return";a:2:{s:4:"type";s:4:"void";s:11:"description";s:0:"";}}', 'lib.php', 'portfolio_plugin_mahara', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_service`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_service` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `apiversion` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `offer` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='A service is a group of functions' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `mdl_mnet_service`
--

INSERT INTO `mdl_mnet_service` (`id`, `name`, `description`, `apiversion`, `offer`) VALUES
(1, 'sso_idp', '', '1', 1),
(2, 'sso_sp', '', '1', 1),
(3, 'mnet_enrol', '', '1', 1),
(4, 'pf', '', '1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_service2rpc`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_service2rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `serviceid` bigint(10) NOT NULL DEFAULT '0',
  `rpcid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetserv_rpcser_uix` (`rpcid`,`serviceid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Group functions or methods under a service' AUTO_INCREMENT=16 ;

--
-- Dumping data for table `mdl_mnet_service2rpc`
--

INSERT INTO `mdl_mnet_service2rpc` (`id`, `serviceid`, `rpcid`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 2, 8),
(9, 2, 9),
(10, 3, 10),
(11, 3, 11),
(12, 3, 12),
(13, 3, 13),
(14, 3, 14),
(15, 4, 15);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_session`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_session` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `token` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mnethostid` bigint(10) NOT NULL DEFAULT '0',
  `useragent` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `confirm_timeout` bigint(10) NOT NULL DEFAULT '0',
  `session_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetsess_tok_uix` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Store session data from users migrating to other sites' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_sso_access_control`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_sso_access_control` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mnet_host_id` bigint(10) NOT NULL DEFAULT '0',
  `accessctrl` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'allow',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetssoaccecont_mneuse_uix` (`mnet_host_id`,`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Users by host permitted (or not) to login from a remote prov' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_modules`
--

CREATE TABLE IF NOT EXISTS `mdl_modules` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cron` bigint(10) NOT NULL DEFAULT '0',
  `lastcron` bigint(10) NOT NULL DEFAULT '0',
  `search` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_modu_nam_ix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='modules available in the site' AUTO_INCREMENT=23 ;

--
-- Dumping data for table `mdl_modules`
--

INSERT INTO `mdl_modules` (`id`, `name`, `cron`, `lastcron`, `search`, `visible`) VALUES
(1, 'assign', 60, 0, '', 1),
(2, 'assignment', 60, 0, '', 0),
(3, 'book', 0, 0, '', 1),
(4, 'chat', 300, 0, '', 1),
(5, 'choice', 0, 0, '', 1),
(6, 'data', 0, 0, '', 1),
(7, 'feedback', 0, 0, '', 0),
(8, 'folder', 0, 0, '', 1),
(9, 'forum', 60, 0, '', 1),
(10, 'glossary', 0, 0, '', 1),
(11, 'imscp', 0, 0, '', 1),
(12, 'label', 0, 0, '', 1),
(13, 'lesson', 0, 0, '', 1),
(14, 'lti', 0, 0, '', 1),
(15, 'page', 0, 0, '', 1),
(16, 'quiz', 60, 0, '', 1),
(17, 'resource', 0, 0, '', 1),
(18, 'scorm', 300, 0, '', 1),
(19, 'survey', 0, 0, '', 1),
(20, 'url', 0, 0, '', 1),
(21, 'wiki', 0, 0, '', 1),
(22, 'workshop', 60, 0, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_my_pages`
--

CREATE TABLE IF NOT EXISTS `mdl_my_pages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) DEFAULT '0',
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `private` tinyint(1) NOT NULL DEFAULT '1',
  `sortorder` mediumint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_mypage_usepri_ix` (`userid`,`private`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Extra user pages for the My Moodle system' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `mdl_my_pages`
--

INSERT INTO `mdl_my_pages` (`id`, `userid`, `name`, `private`, `sortorder`) VALUES
(1, NULL, '__default', 0, 0),
(2, NULL, '__default', 1, 0),
(3, 2, '__default', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_page`
--

CREATE TABLE IF NOT EXISTS `mdl_page` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8_unicode_ci,
  `contentformat` smallint(4) NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) NOT NULL DEFAULT '0',
  `legacyfileslast` bigint(10) DEFAULT NULL,
  `display` smallint(4) NOT NULL DEFAULT '0',
  `displayoptions` longtext COLLATE utf8_unicode_ci,
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_page_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each record is one page and its config data' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_instance`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_instance` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `plugin` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='base table (not including config data) for instances of port' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_instance_config`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_instance_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instance` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_portinstconf_nam_ix` (`name`),
  KEY `mdl_portinstconf_ins_ix` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='config for portfolio plugin instances' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_instance_user`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_instance_user` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instance` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_portinstuser_ins_ix` (`instance`),
  KEY `mdl_portinstuser_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='user data for portfolio instances.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_log`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `time` bigint(10) NOT NULL,
  `portfolio` bigint(10) NOT NULL,
  `caller_class` varchar(150) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `caller_file` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `caller_component` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `caller_sha1` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tempdataid` bigint(10) NOT NULL DEFAULT '0',
  `returnurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `continueurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_portlog_use_ix` (`userid`),
  KEY `mdl_portlog_por_ix` (`portfolio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='log of portfolio transfers (used to later check for duplicat' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_mahara_queue`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_mahara_queue` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `transferid` bigint(10) NOT NULL,
  `token` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_portmahaqueu_tok_ix` (`token`),
  KEY `mdl_portmahaqueu_tra_ix` (`transferid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='maps mahara tokens to transfer ids' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_tempdata`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_tempdata` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `data` longtext COLLATE utf8_unicode_ci,
  `expirytime` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `instance` bigint(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_porttemp_use_ix` (`userid`),
  KEY `mdl_porttemp_ins_ix` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='stores temporary data for portfolio exports. the id of this ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_post`
--

CREATE TABLE IF NOT EXISTS `mdl_post` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `module` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `moduleid` bigint(10) NOT NULL DEFAULT '0',
  `coursemoduleid` bigint(10) NOT NULL DEFAULT '0',
  `subject` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `summary` longtext COLLATE utf8_unicode_ci,
  `content` longtext COLLATE utf8_unicode_ci,
  `uniquehash` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rating` bigint(10) NOT NULL DEFAULT '0',
  `format` bigint(10) NOT NULL DEFAULT '0',
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `attachment` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `publishstate` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'draft',
  `lastmodified` bigint(10) NOT NULL DEFAULT '0',
  `created` bigint(10) NOT NULL DEFAULT '0',
  `usermodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_post_iduse_uix` (`id`,`userid`),
  KEY `mdl_post_las_ix` (`lastmodified`),
  KEY `mdl_post_mod_ix` (`module`),
  KEY `mdl_post_sub_ix` (`subject`),
  KEY `mdl_post_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Generic post table to hold data blog entries etc in differen' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_profiling`
--

CREATE TABLE IF NOT EXISTS `mdl_profiling` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `runid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `totalexecutiontime` bigint(10) NOT NULL,
  `totalcputime` bigint(10) NOT NULL,
  `totalcalls` bigint(10) NOT NULL,
  `totalmemory` bigint(10) NOT NULL,
  `runreference` tinyint(2) NOT NULL DEFAULT '0',
  `runcomment` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_prof_run_uix` (`runid`),
  KEY `mdl_prof_urlrun_ix` (`url`,`runreference`),
  KEY `mdl_prof_timrun_ix` (`timecreated`,`runreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the results of all the profiling runs' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_essay_options`
--

CREATE TABLE IF NOT EXISTS `mdl_qtype_essay_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL,
  `responseformat` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'editor',
  `responsefieldlines` smallint(4) NOT NULL DEFAULT '15',
  `attachments` smallint(4) NOT NULL DEFAULT '0',
  `graderinfo` longtext COLLATE utf8_unicode_ci,
  `graderinfoformat` smallint(4) NOT NULL DEFAULT '0',
  `responsetemplate` longtext COLLATE utf8_unicode_ci,
  `responsetemplateformat` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtypessaopti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Extra options for essay questions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_match_options`
--

CREATE TABLE IF NOT EXISTS `mdl_qtype_match_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtypmatcopti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines the question-type specific options for matching ques' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_match_subquestions`
--

CREATE TABLE IF NOT EXISTS `mdl_qtype_match_subquestions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `questiontext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `questiontextformat` tinyint(2) NOT NULL DEFAULT '0',
  `answertext` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_qtypmatcsubq_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The subquestions that make up a matching question' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_multichoice_options`
--

CREATE TABLE IF NOT EXISTS `mdl_qtype_multichoice_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `layout` smallint(4) NOT NULL DEFAULT '0',
  `single` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `answernumbering` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'abc',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtypmultopti_que_uix` (`questionid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for multiple choice questions' AUTO_INCREMENT=7 ;

--
-- Dumping data for table `mdl_qtype_multichoice_options`
--

INSERT INTO `mdl_qtype_multichoice_options` (`id`, `questionid`, `layout`, `single`, `shuffleanswers`, `correctfeedback`, `correctfeedbackformat`, `partiallycorrectfeedback`, `partiallycorrectfeedbackformat`, `incorrectfeedback`, `incorrectfeedbackformat`, `answernumbering`, `shownumcorrect`) VALUES
(5, 6, 0, 1, 1, '<p>Your answer is correct.</p>', 1, '<p>Your answer is partially correct.</p>', 1, '<p>Your answer is incorrect.</p>', 1, 'abc', 1),
(6, 8, 0, 1, 1, '<p>Your answer is correct.</p>', 1, '<p>Your answer is partially correct.</p>', 1, '<p>Your answer is incorrect.</p>', 1, 'abc', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_shortanswer_options`
--

CREATE TABLE IF NOT EXISTS `mdl_qtype_shortanswer_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `usecase` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtypshoropti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for short answer questions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question`
--

CREATE TABLE IF NOT EXISTS `mdl_question` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `questiontext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `questiontextformat` tinyint(2) NOT NULL DEFAULT '0',
  `generalfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `generalfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `defaultmark` decimal(12,7) NOT NULL DEFAULT '1.0000000',
  `penalty` decimal(12,7) NOT NULL DEFAULT '0.3333333',
  `qtype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `length` bigint(10) NOT NULL DEFAULT '1',
  `stamp` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `createdby` bigint(10) DEFAULT NULL,
  `modifiedby` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ques_cat_ix` (`category`),
  KEY `mdl_ques_par_ix` (`parent`),
  KEY `mdl_ques_cre_ix` (`createdby`),
  KEY `mdl_ques_mod_ix` (`modifiedby`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The questions themselves' AUTO_INCREMENT=9 ;

--
-- Dumping data for table `mdl_question`
--

INSERT INTO `mdl_question` (`id`, `category`, `parent`, `name`, `questiontext`, `questiontextformat`, `generalfeedback`, `generalfeedbackformat`, `defaultmark`, `penalty`, `qtype`, `length`, `stamp`, `version`, `hidden`, `timecreated`, `timemodified`, `createdby`, `modifiedby`) VALUES
(6, 10, 0, 'Who is the President of India ?', '<p>P</p>', 1, '', 1, 1.0000000, 0.3333333, 'multichoice', 1, 'localhost+140212052801+uHTkdu', 'localhost+140212052802+ziTrwF', 0, 1392182881, 1392182881, 2, 2),
(7, 10, 0, 'India is a Democratic Country ?', '<p>India is a Democratic Country ?</p>', 1, '', 1, 1.0000000, 1.0000000, 'truefalse', 1, 'localhost+140212052924+bWrvMR', 'localhost+140212053643+6l2IRD', 0, 1392182964, 1392183402, 2, 2),
(8, 12, 0, 'Who is the Chief Minister of Delhi ?', '<p>Who is the Chief Minister of Delhi ?</p>', 1, '', 1, 1.0000000, 0.3333333, 'multichoice', 1, 'localhost+140212144953+bAy2Go', 'localhost+140212144954+TpErmN', 0, 1392216593, 1392216593, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_answers`
--

CREATE TABLE IF NOT EXISTS `mdl_question_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `answer` longtext COLLATE utf8_unicode_ci NOT NULL,
  `answerformat` tinyint(2) NOT NULL DEFAULT '0',
  `fraction` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `feedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `feedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesansw_que_ix` (`question`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Answers, with a fractional grade (0-1) and feedback' AUTO_INCREMENT=27 ;

--
-- Dumping data for table `mdl_question_answers`
--

INSERT INTO `mdl_question_answers` (`id`, `question`, `answer`, `answerformat`, `fraction`, `feedback`, `feedbackformat`) VALUES
(17, 6, '<p>Pranab Mukherjee</p>', 1, 1.0000000, '', 1),
(18, 6, '<p>Dr. A P J Abdul Kalam</p>', 1, 0.0000000, '', 1),
(19, 6, '<p>Dr. Manmohan Singh</p>', 1, 0.0000000, '', 1),
(20, 6, '<p>Meira Kumar</p>', 1, 0.0000000, '', 1),
(21, 7, 'True', 0, 1.0000000, '<p>Correct </p>', 1),
(22, 7, 'False', 0, 0.0000000, '<p>Incorrect</p>', 1),
(23, 8, '<p>Arvind Kejriwal</p>', 1, 1.0000000, '', 1),
(24, 8, '<p>Narendra Modi</p>', 1, 0.0000000, '', 1),
(25, 8, '<p>Somnath Bharti</p>', 1, 0.0000000, '', 1),
(26, 8, '<p>Sheela Dikshit</p>', 1, 0.0000000, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_attempts`
--

CREATE TABLE IF NOT EXISTS `mdl_question_attempts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionusageid` bigint(10) NOT NULL,
  `slot` bigint(10) NOT NULL,
  `behaviour` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `questionid` bigint(10) NOT NULL,
  `variant` bigint(10) NOT NULL DEFAULT '1',
  `maxmark` decimal(12,7) NOT NULL,
  `minfraction` decimal(12,7) NOT NULL,
  `maxfraction` decimal(12,7) NOT NULL DEFAULT '1.0000000',
  `flagged` tinyint(1) NOT NULL DEFAULT '0',
  `questionsummary` longtext COLLATE utf8_unicode_ci,
  `rightanswer` longtext COLLATE utf8_unicode_ci,
  `responsesummary` longtext COLLATE utf8_unicode_ci,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesatte_queslo_uix` (`questionusageid`,`slot`),
  KEY `mdl_quesatte_que_ix` (`questionid`),
  KEY `mdl_quesatte_que2_ix` (`questionusageid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each row here corresponds to an attempt at one question, as ' AUTO_INCREMENT=18 ;

--
-- Dumping data for table `mdl_question_attempts`
--

INSERT INTO `mdl_question_attempts` (`id`, `questionusageid`, `slot`, `behaviour`, `questionid`, `variant`, `maxmark`, `minfraction`, `maxfraction`, `flagged`, `questionsummary`, `rightanswer`, `responsesummary`, `timemodified`) VALUES
(13, 8, 1, 'deferredfeedback', 6, 1, 1.0000000, 0.0000000, 1.0000000, 0, 'P: Meira Kumar; Dr. A P J Abdul Kalam; Dr. Manmohan Singh; Pranab Mukherjee', 'Pranab Mukherjee', 'Pranab Mukherjee', 1392288827),
(14, 8, 2, 'deferredfeedback', 7, 1, 1.0000000, 0.0000000, 1.0000000, 0, 'India is a Democratic Country ?', 'True', 'True', 1392288827),
(17, 11, 1, 'deferredfeedback', 8, 1, 1.0000000, 0.0000000, 1.0000000, 0, 'Who is the Chief Minister of Delhi ?: Arvind Kejriwal; Narendra Modi; Somnath Bharti; Sheela Dikshit', 'Arvind Kejriwal', 'Arvind Kejriwal', 1392315697);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_attempt_steps`
--

CREATE TABLE IF NOT EXISTS `mdl_question_attempt_steps` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionattemptid` bigint(10) NOT NULL,
  `sequencenumber` bigint(10) NOT NULL,
  `state` varchar(13) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fraction` decimal(12,7) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `userid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesattestep_queseq_uix` (`questionattemptid`,`sequencenumber`),
  KEY `mdl_quesattestep_que_ix` (`questionattemptid`),
  KEY `mdl_quesattestep_use_ix` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores one step in in a question attempt. As well as the dat' AUTO_INCREMENT=52 ;

--
-- Dumping data for table `mdl_question_attempt_steps`
--

INSERT INTO `mdl_question_attempt_steps` (`id`, `questionattemptid`, `sequencenumber`, `state`, `fraction`, `timecreated`, `userid`) VALUES
(37, 13, 0, 'todo', NULL, 1392288787, 2),
(38, 14, 0, 'todo', NULL, 1392288787, 2),
(39, 13, 1, 'complete', NULL, 1392288803, 2),
(40, 14, 1, 'complete', NULL, 1392288808, 2),
(41, 13, 2, 'gradedright', 1.0000000, 1392288826, 2),
(42, 14, 2, 'gradedright', 1.0000000, 1392288826, 2),
(49, 17, 0, 'todo', NULL, 1392315637, 2),
(50, 17, 1, 'complete', NULL, 1392315651, 2),
(51, 17, 2, 'gradedright', 1.0000000, 1392315697, 2);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_attempt_step_data`
--

CREATE TABLE IF NOT EXISTS `mdl_question_attempt_step_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `attemptstepid` bigint(10) NOT NULL,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesattestepdata_attna_uix` (`attemptstepid`,`name`),
  KEY `mdl_quesattestepdata_att_ix` (`attemptstepid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each question_attempt_step has an associative array of the d' AUTO_INCREMENT=50 ;

--
-- Dumping data for table `mdl_question_attempt_step_data`
--

INSERT INTO `mdl_question_attempt_step_data` (`id`, `attemptstepid`, `name`, `value`) VALUES
(36, 37, '_order', '20,18,19,17'),
(37, 39, 'answer', '3'),
(38, 40, 'answer', '1'),
(39, 41, '-finish', '1'),
(40, 42, '-finish', '1'),
(47, 49, '_order', '23,24,25,26'),
(48, 50, 'answer', '0'),
(49, 51, '-finish', '1');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_calculated`
--

CREATE TABLE IF NOT EXISTS `mdl_question_calculated` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `answer` bigint(10) NOT NULL DEFAULT '0',
  `tolerance` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.0',
  `tolerancetype` bigint(10) NOT NULL DEFAULT '1',
  `correctanswerlength` bigint(10) NOT NULL DEFAULT '2',
  `correctanswerformat` bigint(10) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`),
  KEY `mdl_quescalc_ans_ix` (`answer`),
  KEY `mdl_quescalc_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for questions of type calculated' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_calculated_options`
--

CREATE TABLE IF NOT EXISTS `mdl_question_calculated_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `synchronize` tinyint(2) NOT NULL DEFAULT '0',
  `single` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '0',
  `correctfeedback` longtext COLLATE utf8_unicode_ci,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext COLLATE utf8_unicode_ci,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext COLLATE utf8_unicode_ci,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `answernumbering` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'abc',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quescalcopti_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for questions of type calculated' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_question_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `info` longtext COLLATE utf8_unicode_ci NOT NULL,
  `infoformat` tinyint(2) NOT NULL DEFAULT '0',
  `stamp` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '999',
  PRIMARY KEY (`id`),
  KEY `mdl_quescate_con_ix` (`contextid`),
  KEY `mdl_quescate_par_ix` (`parent`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Categories are for grouping questions' AUTO_INCREMENT=14 ;

--
-- Dumping data for table `mdl_question_categories`
--

INSERT INTO `mdl_question_categories` (`id`, `name`, `contextid`, `info`, `infoformat`, `stamp`, `parent`, `sortorder`) VALUES
(1, 'Default for Front page', 2, 'The default category for questions shared in context ''Front page''.', 0, 'localhost+140206055221+845iO5', 0, 999),
(2, 'Default for System', 1, 'The default category for questions shared in context ''System''.', 0, 'localhost+140206055221+2wh6RE', 0, 999),
(4, 'Default for Miscellaneous', 3, 'The default category for questions shared in context ''Miscellaneous''.', 0, 'localhost+140206083322+CYkxmO', 0, 999),
(10, 'Default for samvidhan', 34, 'The default category for questions shared in context ''samvidhan''.', 0, 'localhost+140210183924+5lLP1U', 0, 999),
(11, 'Default for Quiz 1', 35, 'The default category for questions shared in context ''Quiz 1''.', 0, 'localhost+140212053343+ZZB6Uz', 0, 999),
(12, 'Default for samvidhanj', 37, 'The default category for questions shared in context ''samvidhanj''.', 0, 'localhost+140212144759+XWdj5m', 0, 999),
(13, 'Default for Assessment 1', 43, 'The default category for questions shared in context ''Assessment 1''.', 0, 'localhost+140212145242+k3xYXk', 0, 999);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_datasets`
--

CREATE TABLE IF NOT EXISTS `mdl_question_datasets` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `datasetdefinition` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesdata_quedat_ix` (`question`,`datasetdefinition`),
  KEY `mdl_quesdata_que_ix` (`question`),
  KEY `mdl_quesdata_dat_ix` (`datasetdefinition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Many-many relation between questions and dataset definitions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_dataset_definitions`
--

CREATE TABLE IF NOT EXISTS `mdl_question_dataset_definitions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` bigint(10) NOT NULL DEFAULT '0',
  `options` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemcount` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesdatadefi_cat_ix` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Organises and stores properties for dataset items' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_dataset_items`
--

CREATE TABLE IF NOT EXISTS `mdl_question_dataset_items` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definition` bigint(10) NOT NULL DEFAULT '0',
  `itemnumber` bigint(10) NOT NULL DEFAULT '0',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_quesdataitem_def_ix` (`definition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Individual dataset items' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_hints`
--

CREATE TABLE IF NOT EXISTS `mdl_question_hints` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL,
  `hint` longtext COLLATE utf8_unicode_ci NOT NULL,
  `hintformat` smallint(4) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(1) DEFAULT NULL,
  `clearwrong` tinyint(1) DEFAULT NULL,
  `options` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_queshint_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the the part of the question definition that gives di' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_multianswer`
--

CREATE TABLE IF NOT EXISTS `mdl_question_multianswer` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `sequence` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_quesmult_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for multianswer questions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_numerical`
--

CREATE TABLE IF NOT EXISTS `mdl_question_numerical` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `answer` bigint(10) NOT NULL DEFAULT '0',
  `tolerance` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesnume_ans_ix` (`answer`),
  KEY `mdl_quesnume_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for numerical questions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_numerical_options`
--

CREATE TABLE IF NOT EXISTS `mdl_question_numerical_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `showunits` smallint(4) NOT NULL DEFAULT '0',
  `unitsleft` smallint(4) NOT NULL DEFAULT '0',
  `unitgradingtype` smallint(4) NOT NULL DEFAULT '0',
  `unitpenalty` decimal(12,7) NOT NULL DEFAULT '0.1000000',
  PRIMARY KEY (`id`),
  KEY `mdl_quesnumeopti_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for questions of type numerical This table is also u' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_numerical_units`
--

CREATE TABLE IF NOT EXISTS `mdl_question_numerical_units` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `multiplier` decimal(40,20) NOT NULL DEFAULT '1.00000000000000000000',
  `unit` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesnumeunit_queuni_uix` (`question`,`unit`),
  KEY `mdl_quesnumeunit_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Optional unit options for numerical questions. This table is' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_randomsamatch`
--

CREATE TABLE IF NOT EXISTS `mdl_question_randomsamatch` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `choose` bigint(10) NOT NULL DEFAULT '4',
  PRIMARY KEY (`id`),
  KEY `mdl_quesrand_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about a random short-answer matching question' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_response_analysis`
--

CREATE TABLE IF NOT EXISTS `mdl_question_response_analysis` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hashcode` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL,
  `subqid` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `aid` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `response` longtext COLLATE utf8_unicode_ci,
  `rcount` bigint(10) DEFAULT NULL,
  `credit` decimal(15,5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Analysis of student responses given to questions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_sessions`
--

CREATE TABLE IF NOT EXISTS `mdl_question_sessions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `attemptid` bigint(10) NOT NULL DEFAULT '0',
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `newest` bigint(10) NOT NULL DEFAULT '0',
  `newgraded` bigint(10) NOT NULL DEFAULT '0',
  `sumpenalty` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `manualcomment` longtext COLLATE utf8_unicode_ci NOT NULL,
  `manualcommentformat` tinyint(2) NOT NULL DEFAULT '0',
  `flagged` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quessess_attque_uix` (`attemptid`,`questionid`),
  KEY `mdl_quessess_att_ix` (`attemptid`),
  KEY `mdl_quessess_que_ix` (`questionid`),
  KEY `mdl_quessess_new_ix` (`newest`),
  KEY `mdl_quessess_new2_ix` (`newgraded`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Gives ids of the newest open and newest graded states' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_states`
--

CREATE TABLE IF NOT EXISTS `mdl_question_states` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `attempt` bigint(10) NOT NULL DEFAULT '0',
  `question` bigint(10) NOT NULL DEFAULT '0',
  `seq_number` mediumint(6) NOT NULL DEFAULT '0',
  `answer` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` bigint(10) NOT NULL DEFAULT '0',
  `event` smallint(4) NOT NULL DEFAULT '0',
  `grade` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `raw_grade` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `penalty` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  PRIMARY KEY (`id`),
  KEY `mdl_quesstat_att_ix` (`attempt`),
  KEY `mdl_quesstat_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores user responses to an attempt, and percentage grades' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_statistics`
--

CREATE TABLE IF NOT EXISTS `mdl_question_statistics` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hashcode` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL,
  `slot` bigint(10) DEFAULT NULL,
  `subquestion` smallint(4) NOT NULL,
  `s` bigint(10) NOT NULL DEFAULT '0',
  `effectiveweight` decimal(15,5) DEFAULT NULL,
  `negcovar` tinyint(2) NOT NULL DEFAULT '0',
  `discriminationindex` decimal(15,5) DEFAULT NULL,
  `discriminativeefficiency` decimal(15,5) DEFAULT NULL,
  `sd` decimal(15,10) DEFAULT NULL,
  `facility` decimal(15,10) DEFAULT NULL,
  `subquestions` longtext COLLATE utf8_unicode_ci,
  `maxmark` decimal(12,7) DEFAULT NULL,
  `positions` longtext COLLATE utf8_unicode_ci,
  `randomguessscore` decimal(12,7) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Statistics for individual questions used in an activity.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_truefalse`
--

CREATE TABLE IF NOT EXISTS `mdl_question_truefalse` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `trueanswer` bigint(10) NOT NULL DEFAULT '0',
  `falseanswer` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_questrue_que_ix` (`question`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for True-False questions' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `mdl_question_truefalse`
--

INSERT INTO `mdl_question_truefalse` (`id`, `question`, `trueanswer`, `falseanswer`) VALUES
(2, 7, 21, 22);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_usages`
--

CREATE TABLE IF NOT EXISTS `mdl_question_usages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `preferredbehaviour` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_quesusag_con_ix` (`contextid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table''s main purpose it to assign a unique id to each a' AUTO_INCREMENT=12 ;

--
-- Dumping data for table `mdl_question_usages`
--

INSERT INTO `mdl_question_usages` (`id`, `contextid`, `component`, `preferredbehaviour`) VALUES
(8, 35, 'mod_quiz', 'deferredfeedback'),
(11, 43, 'mod_quiz', 'deferredfeedback');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timelimit` bigint(10) NOT NULL DEFAULT '0',
  `overduehandling` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'autoabandon',
  `graceperiod` bigint(10) NOT NULL DEFAULT '0',
  `preferredbehaviour` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `attempts` mediumint(6) NOT NULL DEFAULT '0',
  `attemptonlast` smallint(4) NOT NULL DEFAULT '0',
  `grademethod` smallint(4) NOT NULL DEFAULT '1',
  `decimalpoints` smallint(4) NOT NULL DEFAULT '2',
  `questiondecimalpoints` smallint(4) NOT NULL DEFAULT '-1',
  `reviewattempt` mediumint(6) NOT NULL DEFAULT '0',
  `reviewcorrectness` mediumint(6) NOT NULL DEFAULT '0',
  `reviewmarks` mediumint(6) NOT NULL DEFAULT '0',
  `reviewspecificfeedback` mediumint(6) NOT NULL DEFAULT '0',
  `reviewgeneralfeedback` mediumint(6) NOT NULL DEFAULT '0',
  `reviewrightanswer` mediumint(6) NOT NULL DEFAULT '0',
  `reviewoverallfeedback` mediumint(6) NOT NULL DEFAULT '0',
  `questionsperpage` bigint(10) NOT NULL DEFAULT '0',
  `navmethod` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'free',
  `shufflequestions` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '0',
  `questions` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sumgrades` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `grade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subnet` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `browsersecurity` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `delay1` bigint(10) NOT NULL DEFAULT '0',
  `delay2` bigint(10) NOT NULL DEFAULT '0',
  `showuserpicture` smallint(4) NOT NULL DEFAULT '0',
  `showblocks` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quiz_cou_ix` (`course`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The settings for each quiz.' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `mdl_quiz`
--

INSERT INTO `mdl_quiz` (`id`, `course`, `name`, `intro`, `introformat`, `timeopen`, `timeclose`, `timelimit`, `overduehandling`, `graceperiod`, `preferredbehaviour`, `attempts`, `attemptonlast`, `grademethod`, `decimalpoints`, `questiondecimalpoints`, `reviewattempt`, `reviewcorrectness`, `reviewmarks`, `reviewspecificfeedback`, `reviewgeneralfeedback`, `reviewrightanswer`, `reviewoverallfeedback`, `questionsperpage`, `navmethod`, `shufflequestions`, `shuffleanswers`, `questions`, `sumgrades`, `grade`, `timecreated`, `timemodified`, `password`, `subnet`, `browsersecurity`, `delay1`, `delay2`, `showuserpicture`, `showblocks`) VALUES
(3, 4, 'Quiz 1', '<p>The following Quiz is the Part 1 of the Main Quiz</p>', 1, 1392183000, 1392269400, 300, 'autoabandon', 0, 'deferredfeedback', 1, 0, 1, 2, -1, 69904, 4368, 4368, 4368, 4368, 4368, 4368, 1, 'free', 1, 1, '6,0,7,0', 2.00000, 10.00000, 0, 1392183247, '', '', '-', 0, 0, 0, 0),
(4, 5, 'Assessment 1', '', 1, 1392216600, 1392475800, 60, 'autoabandon', 0, 'deferredfeedback', 0, 0, 1, 2, -1, 69904, 4368, 4368, 4368, 4368, 4368, 4368, 1, 'free', 0, 1, '8,0', 1.00000, 10.00000, 0, 1392216705, '', '', '-', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_attempts`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_attempts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `attempt` mediumint(6) NOT NULL DEFAULT '0',
  `uniqueid` bigint(10) NOT NULL DEFAULT '0',
  `layout` longtext COLLATE utf8_unicode_ci NOT NULL,
  `currentpage` bigint(10) NOT NULL DEFAULT '0',
  `preview` smallint(3) NOT NULL DEFAULT '0',
  `state` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'inprogress',
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timefinish` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `timecheckstate` bigint(10) DEFAULT '0',
  `sumgrades` decimal(10,5) DEFAULT NULL,
  `needsupgradetonewqe` smallint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quizatte_quiuseatt_uix` (`quiz`,`userid`,`attempt`),
  UNIQUE KEY `mdl_quizatte_uni_uix` (`uniqueid`),
  KEY `mdl_quizatte_statim_ix` (`state`,`timecheckstate`),
  KEY `mdl_quizatte_qui_ix` (`quiz`),
  KEY `mdl_quizatte_use_ix` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores users attempts at quizzes.' AUTO_INCREMENT=12 ;

--
-- Dumping data for table `mdl_quiz_attempts`
--

INSERT INTO `mdl_quiz_attempts` (`id`, `quiz`, `userid`, `attempt`, `uniqueid`, `layout`, `currentpage`, `preview`, `state`, `timestart`, `timefinish`, `timemodified`, `timecheckstate`, `sumgrades`, `needsupgradetonewqe`) VALUES
(8, 3, 2, 1, 8, '1,0,2,0', 1, 1, 'finished', 1392288787, 1392288826, 1392288826, NULL, 2.00000, 0),
(11, 4, 2, 1, 11, '1,0', 0, 1, 'finished', 1392315637, 1392315697, 1392315697, NULL, 1.00000, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_feedback`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_feedback` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quizid` bigint(10) NOT NULL DEFAULT '0',
  `feedbacktext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `feedbacktextformat` tinyint(2) NOT NULL DEFAULT '0',
  `mingrade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `maxgrade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  PRIMARY KEY (`id`),
  KEY `mdl_quizfeed_qui_ix` (`quizid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Feedback given to students based on which grade band their o' AUTO_INCREMENT=8 ;

--
-- Dumping data for table `mdl_quiz_feedback`
--

INSERT INTO `mdl_quiz_feedback` (`id`, `quizid`, `feedbacktext`, `feedbacktextformat`, `mingrade`, `maxgrade`) VALUES
(5, 3, '<p>You have done an Excellent work</p>', 1, 9.00000, 11.00000),
(6, 3, '<p>You have done a great work</p>', 1, 0.00000, 9.00000),
(7, 4, '', 1, 0.00000, 11.00000);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_grades`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `grade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quizgrad_use_ix` (`userid`),
  KEY `mdl_quizgrad_qui_ix` (`quiz`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the overall grade for each user on the quiz, based on' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_overrides`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_overrides` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) DEFAULT NULL,
  `userid` bigint(10) DEFAULT NULL,
  `timeopen` bigint(10) DEFAULT NULL,
  `timeclose` bigint(10) DEFAULT NULL,
  `timelimit` bigint(10) DEFAULT NULL,
  `attempts` mediumint(6) DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_quizover_qui_ix` (`quiz`),
  KEY `mdl_quizover_gro_ix` (`groupid`),
  KEY `mdl_quizover_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The overrides to quiz settings on a per-user and per-group b' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_overview_regrades`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_overview_regrades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionusageid` bigint(10) NOT NULL,
  `slot` bigint(10) NOT NULL,
  `newfraction` decimal(12,7) DEFAULT NULL,
  `oldfraction` decimal(12,7) DEFAULT NULL,
  `regraded` smallint(4) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table records which question attempts need regrading an' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_question_instances`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_question_instances` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `question` bigint(10) NOT NULL DEFAULT '0',
  `grade` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  PRIMARY KEY (`id`),
  KEY `mdl_quizquesinst_qui_ix` (`quiz`),
  KEY `mdl_quizquesinst_que_ix` (`question`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the maximum possible grade (weight) for each question' AUTO_INCREMENT=8 ;

--
-- Dumping data for table `mdl_quiz_question_instances`
--

INSERT INTO `mdl_quiz_question_instances` (`id`, `quiz`, `question`, `grade`) VALUES
(5, 3, 6, 1.0000000),
(6, 3, 7, 1.0000000),
(7, 4, 8, 1.0000000);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_reports`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_reports` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `displayorder` bigint(10) NOT NULL,
  `capability` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quizrepo_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Lists all the installed quiz reports and their display order' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `mdl_quiz_reports`
--

INSERT INTO `mdl_quiz_reports` (`id`, `name`, `displayorder`, `capability`) VALUES
(1, 'grading', 6000, 'mod/quiz:grade'),
(2, 'overview', 10000, NULL),
(3, 'responses', 9000, NULL),
(4, 'statistics', 8000, 'quiz/statistics:view');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_statistics`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_statistics` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hashcode` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `whichattempts` smallint(4) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `firstattemptscount` bigint(10) NOT NULL,
  `highestattemptscount` bigint(10) NOT NULL,
  `lastattemptscount` bigint(10) NOT NULL,
  `allattemptscount` bigint(10) NOT NULL,
  `firstattemptsavg` decimal(15,5) DEFAULT NULL,
  `highestattemptsavg` decimal(15,5) DEFAULT NULL,
  `lastattemptsavg` decimal(15,5) DEFAULT NULL,
  `allattemptsavg` decimal(15,5) DEFAULT NULL,
  `median` decimal(15,5) DEFAULT NULL,
  `standarddeviation` decimal(15,5) DEFAULT NULL,
  `skewness` decimal(15,10) DEFAULT NULL,
  `kurtosis` decimal(15,5) DEFAULT NULL,
  `cic` decimal(15,10) DEFAULT NULL,
  `errorratio` decimal(15,10) DEFAULT NULL,
  `standarderror` decimal(15,10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='table to cache results from analysis done in statistics repo' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_rating`
--

CREATE TABLE IF NOT EXISTS `mdl_rating` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ratingarea` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `scaleid` bigint(10) NOT NULL,
  `rating` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_rati_comratconite_ix` (`component`,`ratingarea`,`contextid`,`itemid`),
  KEY `mdl_rati_con_ix` (`contextid`),
  KEY `mdl_rati_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='moodle ratings' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_registration_hubs`
--

CREATE TABLE IF NOT EXISTS `mdl_registration_hubs` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hubname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `huburl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `secret` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='hub where the site is registered on with their associated to' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_repository`
--

CREATE TABLE IF NOT EXISTS `mdl_repository` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `visible` tinyint(1) DEFAULT '1',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table contains one entry for every configured external ' AUTO_INCREMENT=9 ;

--
-- Dumping data for table `mdl_repository`
--

INSERT INTO `mdl_repository` (`id`, `type`, `visible`, `sortorder`) VALUES
(1, 'areafiles', 1, 1),
(2, 'local', 1, 2),
(3, 'recent', 1, 3),
(4, 'upload', 1, 4),
(5, 'url', 1, 5),
(6, 'user', 1, 6),
(7, 'wikimedia', 1, 7),
(8, 'youtube', 1, 8);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_repository_instances`
--

CREATE TABLE IF NOT EXISTS `mdl_repository_instances` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `typeid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `contextid` bigint(10) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `readonly` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table contains one entry for every configured external ' AUTO_INCREMENT=8 ;

--
-- Dumping data for table `mdl_repository_instances`
--

INSERT INTO `mdl_repository_instances` (`id`, `name`, `typeid`, `userid`, `contextid`, `username`, `password`, `timecreated`, `timemodified`, `readonly`) VALUES
(1, '', 2, 0, 1, NULL, NULL, 1391626975, 1391626975, 0),
(2, '', 3, 0, 1, NULL, NULL, 1391626977, 1391626977, 0),
(3, '', 4, 0, 1, NULL, NULL, 1391626980, 1391626980, 0),
(4, '', 5, 0, 1, NULL, NULL, 1391626980, 1391626980, 0),
(5, '', 6, 0, 1, NULL, NULL, 1391626981, 1391626981, 0),
(6, '', 7, 0, 1, NULL, NULL, 1391626983, 1391626983, 0),
(7, '', 8, 0, 1, NULL, NULL, 1391626983, 1391626983, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_repository_instance_config`
--

CREATE TABLE IF NOT EXISTS `mdl_repository_instance_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instanceid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The config for intances' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_resource`
--

CREATE TABLE IF NOT EXISTS `mdl_resource` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `tobemigrated` smallint(4) NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) NOT NULL DEFAULT '0',
  `legacyfileslast` bigint(10) DEFAULT NULL,
  `display` smallint(4) NOT NULL DEFAULT '0',
  `displayoptions` longtext COLLATE utf8_unicode_ci,
  `filterfiles` smallint(4) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_reso_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each record is one resource and its config data' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_resource_old`
--

CREATE TABLE IF NOT EXISTS `mdl_resource_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `alltext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `popup` longtext COLLATE utf8_unicode_ci NOT NULL,
  `options` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `cmid` bigint(10) DEFAULT NULL,
  `newmodule` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  `migrated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_resoold_old_uix` (`oldid`),
  KEY `mdl_resoold_cmi_ix` (`cmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='backup of all old resource instances from 1.9' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role`
--

CREATE TABLE IF NOT EXISTS `mdl_role` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shortname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `archetype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_role_sor_uix` (`sortorder`),
  UNIQUE KEY `mdl_role_sho_uix` (`shortname`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='moodle roles' AUTO_INCREMENT=9 ;

--
-- Dumping data for table `mdl_role`
--

INSERT INTO `mdl_role` (`id`, `name`, `shortname`, `description`, `sortorder`, `archetype`) VALUES
(1, '', 'manager', '', 1, 'manager'),
(2, '', 'coursecreator', '', 2, 'coursecreator'),
(3, '', 'editingteacher', '', 3, 'editingteacher'),
(4, '', 'teacher', '', 4, 'teacher'),
(5, '', 'student', '', 5, 'student'),
(6, '', 'guest', '', 6, 'guest'),
(7, '', 'user', '', 7, 'user'),
(8, '', 'frontpage', '', 8, 'frontpage');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_allow_assign`
--

CREATE TABLE IF NOT EXISTS `mdl_role_allow_assign` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `allowassign` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolealloassi_rolall_uix` (`roleid`,`allowassign`),
  KEY `mdl_rolealloassi_rol_ix` (`roleid`),
  KEY `mdl_rolealloassi_all_ix` (`allowassign`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='this defines what role can assign what role' AUTO_INCREMENT=8 ;

--
-- Dumping data for table `mdl_role_allow_assign`
--

INSERT INTO `mdl_role_allow_assign` (`id`, `roleid`, `allowassign`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 3, 4),
(7, 3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_allow_override`
--

CREATE TABLE IF NOT EXISTS `mdl_role_allow_override` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `allowoverride` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolealloover_rolall_uix` (`roleid`,`allowoverride`),
  KEY `mdl_rolealloover_rol_ix` (`roleid`),
  KEY `mdl_rolealloover_all_ix` (`allowoverride`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='this defines what role can override what role' AUTO_INCREMENT=12 ;

--
-- Dumping data for table `mdl_role_allow_override`
--

INSERT INTO `mdl_role_allow_override` (`id`, `roleid`, `allowoverride`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 3, 4),
(10, 3, 5),
(11, 3, 6);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_allow_switch`
--

CREATE TABLE IF NOT EXISTS `mdl_role_allow_switch` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL,
  `allowswitch` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolealloswit_rolall_uix` (`roleid`,`allowswitch`),
  KEY `mdl_rolealloswit_rol_ix` (`roleid`),
  KEY `mdl_rolealloswit_all_ix` (`allowswitch`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table stores which which other roles a user is allowed ' AUTO_INCREMENT=10 ;

--
-- Dumping data for table `mdl_role_allow_switch`
--

INSERT INTO `mdl_role_allow_switch` (`id`, `roleid`, `allowswitch`) VALUES
(1, 1, 3),
(2, 1, 4),
(3, 1, 5),
(4, 1, 6),
(5, 3, 4),
(6, 3, 5),
(7, 3, 6),
(8, 4, 5),
(9, 4, 6);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_assignments`
--

CREATE TABLE IF NOT EXISTS `mdl_role_assignments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `modifierid` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_roleassi_sor_ix` (`sortorder`),
  KEY `mdl_roleassi_rolcon_ix` (`roleid`,`contextid`),
  KEY `mdl_roleassi_useconrol_ix` (`userid`,`contextid`,`roleid`),
  KEY `mdl_roleassi_comiteuse_ix` (`component`,`itemid`,`userid`),
  KEY `mdl_roleassi_rol_ix` (`roleid`),
  KEY `mdl_roleassi_con_ix` (`contextid`),
  KEY `mdl_roleassi_use_ix` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='assigning roles in different context' AUTO_INCREMENT=13 ;

--
-- Dumping data for table `mdl_role_assignments`
--

INSERT INTO `mdl_role_assignments` (`id`, `roleid`, `contextid`, `userid`, `timemodified`, `modifierid`, `component`, `itemid`, `sortorder`) VALUES
(8, 5, 34, 2, 1392057552, 2, '', 0, 0),
(9, 5, 34, 3, 1392057554, 2, '', 0, 0),
(10, 5, 34, 4, 1392057555, 2, '', 0, 0),
(11, 5, 37, 2, 1392216726, 2, '', 0, 0),
(12, 5, 37, 3, 1392216728, 2, '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_capabilities`
--

CREATE TABLE IF NOT EXISTS `mdl_role_capabilities` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `capability` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `permission` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `modifierid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolecapa_rolconcap_uix` (`roleid`,`contextid`,`capability`),
  KEY `mdl_rolecapa_rol_ix` (`roleid`),
  KEY `mdl_rolecapa_con_ix` (`contextid`),
  KEY `mdl_rolecapa_mod_ix` (`modifierid`),
  KEY `mdl_rolecapa_cap_ix` (`capability`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='permission has to be signed, overriding a capability for a p' AUTO_INCREMENT=1119 ;

--
-- Dumping data for table `mdl_role_capabilities`
--

INSERT INTO `mdl_role_capabilities` (`id`, `contextid`, `roleid`, `capability`, `permission`, `timemodified`, `modifierid`) VALUES
(1, 1, 1, 'moodle/site:readallmessages', 1, 1391626054, 0),
(2, 1, 3, 'moodle/site:readallmessages', 1, 1391626054, 0),
(3, 1, 1, 'moodle/site:sendmessage', 1, 1391626054, 0),
(4, 1, 7, 'moodle/site:sendmessage', 1, 1391626054, 0),
(5, 1, 1, 'moodle/site:approvecourse', 1, 1391626054, 0),
(6, 1, 3, 'moodle/backup:backupcourse', 1, 1391626055, 0),
(7, 1, 1, 'moodle/backup:backupcourse', 1, 1391626055, 0),
(8, 1, 3, 'moodle/backup:backupsection', 1, 1391626055, 0),
(9, 1, 1, 'moodle/backup:backupsection', 1, 1391626055, 0),
(10, 1, 3, 'moodle/backup:backupactivity', 1, 1391626055, 0),
(11, 1, 1, 'moodle/backup:backupactivity', 1, 1391626055, 0),
(12, 1, 3, 'moodle/backup:backuptargethub', 1, 1391626055, 0),
(13, 1, 1, 'moodle/backup:backuptargethub', 1, 1391626055, 0),
(14, 1, 3, 'moodle/backup:backuptargetimport', 1, 1391626055, 0),
(15, 1, 1, 'moodle/backup:backuptargetimport', 1, 1391626055, 0),
(16, 1, 3, 'moodle/backup:downloadfile', 1, 1391626055, 0),
(17, 1, 1, 'moodle/backup:downloadfile', 1, 1391626055, 0),
(18, 1, 3, 'moodle/backup:configure', 1, 1391626055, 0),
(19, 1, 1, 'moodle/backup:configure', 1, 1391626055, 0),
(20, 1, 1, 'moodle/backup:userinfo', 1, 1391626055, 0),
(21, 1, 1, 'moodle/backup:anonymise', 1, 1391626056, 0),
(22, 1, 3, 'moodle/restore:restorecourse', 1, 1391626056, 0),
(23, 1, 1, 'moodle/restore:restorecourse', 1, 1391626056, 0),
(24, 1, 3, 'moodle/restore:restoresection', 1, 1391626056, 0),
(25, 1, 1, 'moodle/restore:restoresection', 1, 1391626056, 0),
(26, 1, 3, 'moodle/restore:restoreactivity', 1, 1391626056, 0),
(27, 1, 1, 'moodle/restore:restoreactivity', 1, 1391626056, 0),
(28, 1, 3, 'moodle/restore:restoretargethub', 1, 1391626056, 0),
(29, 1, 1, 'moodle/restore:restoretargethub', 1, 1391626056, 0),
(30, 1, 3, 'moodle/restore:restoretargetimport', 1, 1391626056, 0),
(31, 1, 1, 'moodle/restore:restoretargetimport', 1, 1391626056, 0),
(32, 1, 3, 'moodle/restore:uploadfile', 1, 1391626056, 0),
(33, 1, 1, 'moodle/restore:uploadfile', 1, 1391626056, 0),
(34, 1, 3, 'moodle/restore:configure', 1, 1391626056, 0),
(35, 1, 1, 'moodle/restore:configure', 1, 1391626056, 0),
(36, 1, 2, 'moodle/restore:rolldates', 1, 1391626057, 0),
(37, 1, 1, 'moodle/restore:rolldates', 1, 1391626057, 0),
(38, 1, 1, 'moodle/restore:userinfo', 1, 1391626057, 0),
(39, 1, 1, 'moodle/restore:createuser', 1, 1391626057, 0),
(40, 1, 3, 'moodle/site:manageblocks', 1, 1391626057, 0),
(41, 1, 1, 'moodle/site:manageblocks', 1, 1391626057, 0),
(42, 1, 4, 'moodle/site:accessallgroups', 1, 1391626057, 0),
(43, 1, 3, 'moodle/site:accessallgroups', 1, 1391626057, 0),
(44, 1, 1, 'moodle/site:accessallgroups', 1, 1391626057, 0),
(45, 1, 4, 'moodle/site:viewfullnames', 1, 1391626057, 0),
(46, 1, 3, 'moodle/site:viewfullnames', 1, 1391626057, 0),
(47, 1, 1, 'moodle/site:viewfullnames', 1, 1391626057, 0),
(48, 1, 4, 'moodle/site:viewuseridentity', 1, 1391626058, 0),
(49, 1, 3, 'moodle/site:viewuseridentity', 1, 1391626058, 0),
(50, 1, 1, 'moodle/site:viewuseridentity', 1, 1391626058, 0),
(51, 1, 4, 'moodle/site:viewreports', 1, 1391626058, 0),
(52, 1, 3, 'moodle/site:viewreports', 1, 1391626058, 0),
(53, 1, 1, 'moodle/site:viewreports', 1, 1391626058, 0),
(54, 1, 3, 'moodle/site:trustcontent', 1, 1391626058, 0),
(55, 1, 1, 'moodle/site:trustcontent', 1, 1391626058, 0),
(56, 1, 1, 'moodle/site:uploadusers', 1, 1391626058, 0),
(57, 1, 3, 'moodle/filter:manage', 1, 1391626058, 0),
(58, 1, 1, 'moodle/filter:manage', 1, 1391626058, 0),
(59, 1, 1, 'moodle/user:create', 1, 1391626058, 0),
(60, 1, 1, 'moodle/user:delete', 1, 1391626058, 0),
(61, 1, 1, 'moodle/user:update', 1, 1391626059, 0),
(62, 1, 6, 'moodle/user:viewdetails', 1, 1391626059, 0),
(63, 1, 5, 'moodle/user:viewdetails', 1, 1391626059, 0),
(64, 1, 4, 'moodle/user:viewdetails', 1, 1391626059, 0),
(65, 1, 3, 'moodle/user:viewdetails', 1, 1391626059, 0),
(66, 1, 1, 'moodle/user:viewdetails', 1, 1391626059, 0),
(67, 1, 1, 'moodle/user:viewalldetails', 1, 1391626059, 0),
(68, 1, 4, 'moodle/user:viewhiddendetails', 1, 1391626059, 0),
(69, 1, 3, 'moodle/user:viewhiddendetails', 1, 1391626059, 0),
(70, 1, 1, 'moodle/user:viewhiddendetails', 1, 1391626059, 0),
(71, 1, 1, 'moodle/user:loginas', 1, 1391626059, 0),
(72, 1, 1, 'moodle/user:managesyspages', 1, 1391626059, 0),
(73, 1, 7, 'moodle/user:manageownblocks', 1, 1391626059, 0),
(74, 1, 7, 'moodle/user:manageownfiles', 1, 1391626059, 0),
(75, 1, 1, 'moodle/my:configsyspages', 1, 1391626060, 0),
(76, 1, 3, 'moodle/role:assign', 1, 1391626060, 0),
(77, 1, 1, 'moodle/role:assign', 1, 1391626060, 0),
(78, 1, 4, 'moodle/role:review', 1, 1391626060, 0),
(79, 1, 3, 'moodle/role:review', 1, 1391626060, 0),
(80, 1, 1, 'moodle/role:review', 1, 1391626060, 0),
(81, 1, 1, 'moodle/role:override', 1, 1391626060, 0),
(82, 1, 3, 'moodle/role:safeoverride', 1, 1391626060, 0),
(83, 1, 1, 'moodle/role:manage', 1, 1391626060, 0),
(84, 1, 3, 'moodle/role:switchroles', 1, 1391626060, 0),
(85, 1, 1, 'moodle/role:switchroles', 1, 1391626060, 0),
(86, 1, 1, 'moodle/category:manage', 1, 1391626060, 0),
(87, 1, 2, 'moodle/category:viewhiddencategories', 1, 1391626061, 0),
(88, 1, 1, 'moodle/category:viewhiddencategories', 1, 1391626061, 0),
(89, 1, 1, 'moodle/cohort:manage', 1, 1391626061, 0),
(90, 1, 1, 'moodle/cohort:assign', 1, 1391626061, 0),
(91, 1, 3, 'moodle/cohort:view', 1, 1391626061, 0),
(92, 1, 1, 'moodle/cohort:view', 1, 1391626061, 0),
(93, 1, 2, 'moodle/course:create', 1, 1391626061, 0),
(94, 1, 1, 'moodle/course:create', 1, 1391626061, 0),
(95, 1, 7, 'moodle/course:request', 1, 1391626061, 0),
(96, 1, 1, 'moodle/course:delete', 1, 1391626061, 0),
(97, 1, 3, 'moodle/course:update', 1, 1391626062, 0),
(98, 1, 1, 'moodle/course:update', 1, 1391626062, 0),
(99, 1, 1, 'moodle/course:view', 1, 1391626063, 0),
(100, 1, 3, 'moodle/course:enrolreview', 1, 1391626063, 0),
(101, 1, 1, 'moodle/course:enrolreview', 1, 1391626063, 0),
(102, 1, 3, 'moodle/course:enrolconfig', 1, 1391626063, 0),
(103, 1, 1, 'moodle/course:enrolconfig', 1, 1391626063, 0),
(104, 1, 4, 'moodle/course:bulkmessaging', 1, 1391626063, 0),
(105, 1, 3, 'moodle/course:bulkmessaging', 1, 1391626063, 0),
(106, 1, 1, 'moodle/course:bulkmessaging', 1, 1391626063, 0),
(107, 1, 4, 'moodle/course:viewhiddenuserfields', 1, 1391626064, 0),
(108, 1, 3, 'moodle/course:viewhiddenuserfields', 1, 1391626064, 0),
(109, 1, 1, 'moodle/course:viewhiddenuserfields', 1, 1391626064, 0),
(110, 1, 2, 'moodle/course:viewhiddencourses', 1, 1391626064, 0),
(111, 1, 4, 'moodle/course:viewhiddencourses', 1, 1391626064, 0),
(112, 1, 3, 'moodle/course:viewhiddencourses', 1, 1391626064, 0),
(113, 1, 1, 'moodle/course:viewhiddencourses', 1, 1391626064, 0),
(114, 1, 3, 'moodle/course:visibility', 1, 1391626065, 0),
(115, 1, 1, 'moodle/course:visibility', 1, 1391626065, 0),
(116, 1, 3, 'moodle/course:managefiles', 1, 1391626065, 0),
(117, 1, 1, 'moodle/course:managefiles', 1, 1391626065, 0),
(118, 1, 3, 'moodle/course:manageactivities', 1, 1391626066, 0),
(119, 1, 1, 'moodle/course:manageactivities', 1, 1391626066, 0),
(120, 1, 3, 'moodle/course:activityvisibility', 1, 1391626066, 0),
(121, 1, 1, 'moodle/course:activityvisibility', 1, 1391626067, 0),
(122, 1, 4, 'moodle/course:viewhiddenactivities', 1, 1391626067, 0),
(123, 1, 3, 'moodle/course:viewhiddenactivities', 1, 1391626067, 0),
(124, 1, 1, 'moodle/course:viewhiddenactivities', 1, 1391626067, 0),
(125, 1, 5, 'moodle/course:viewparticipants', 1, 1391626067, 0),
(126, 1, 4, 'moodle/course:viewparticipants', 1, 1391626067, 0),
(127, 1, 3, 'moodle/course:viewparticipants', 1, 1391626068, 0),
(128, 1, 1, 'moodle/course:viewparticipants', 1, 1391626068, 0),
(129, 1, 3, 'moodle/course:changefullname', 1, 1391626068, 0),
(130, 1, 1, 'moodle/course:changefullname', 1, 1391626069, 0),
(131, 1, 3, 'moodle/course:changeshortname', 1, 1391626069, 0),
(132, 1, 1, 'moodle/course:changeshortname', 1, 1391626069, 0),
(133, 1, 3, 'moodle/course:changeidnumber', 1, 1391626069, 0),
(134, 1, 1, 'moodle/course:changeidnumber', 1, 1391626069, 0),
(135, 1, 3, 'moodle/course:changecategory', 1, 1391626069, 0),
(136, 1, 1, 'moodle/course:changecategory', 1, 1391626070, 0),
(137, 1, 3, 'moodle/course:changesummary', 1, 1391626070, 0),
(138, 1, 1, 'moodle/course:changesummary', 1, 1391626070, 0),
(139, 1, 1, 'moodle/site:viewparticipants', 1, 1391626070, 0),
(140, 1, 5, 'moodle/course:isincompletionreports', 1, 1391626070, 0),
(141, 1, 5, 'moodle/course:viewscales', 1, 1391626070, 0),
(142, 1, 4, 'moodle/course:viewscales', 1, 1391626070, 0),
(143, 1, 3, 'moodle/course:viewscales', 1, 1391626070, 0),
(144, 1, 1, 'moodle/course:viewscales', 1, 1391626070, 0),
(145, 1, 3, 'moodle/course:managescales', 1, 1391626070, 0),
(146, 1, 1, 'moodle/course:managescales', 1, 1391626070, 0),
(147, 1, 3, 'moodle/course:managegroups', 1, 1391626070, 0),
(148, 1, 1, 'moodle/course:managegroups', 1, 1391626070, 0),
(149, 1, 3, 'moodle/course:reset', 1, 1391626070, 0),
(150, 1, 1, 'moodle/course:reset', 1, 1391626070, 0),
(151, 1, 3, 'moodle/course:viewsuspendedusers', 1, 1391626071, 0),
(152, 1, 1, 'moodle/course:viewsuspendedusers', 1, 1391626071, 0),
(153, 1, 6, 'moodle/blog:view', 1, 1391626071, 0),
(154, 1, 7, 'moodle/blog:view', 1, 1391626071, 0),
(155, 1, 5, 'moodle/blog:view', 1, 1391626071, 0),
(156, 1, 4, 'moodle/blog:view', 1, 1391626071, 0),
(157, 1, 3, 'moodle/blog:view', 1, 1391626071, 0),
(158, 1, 1, 'moodle/blog:view', 1, 1391626071, 0),
(159, 1, 6, 'moodle/blog:search', 1, 1391626071, 0),
(160, 1, 7, 'moodle/blog:search', 1, 1391626071, 0),
(161, 1, 5, 'moodle/blog:search', 1, 1391626071, 0),
(162, 1, 4, 'moodle/blog:search', 1, 1391626071, 0),
(163, 1, 3, 'moodle/blog:search', 1, 1391626071, 0),
(164, 1, 1, 'moodle/blog:search', 1, 1391626071, 0),
(165, 1, 1, 'moodle/blog:viewdrafts', 1, 1391626071, 0),
(166, 1, 7, 'moodle/blog:create', 1, 1391626071, 0),
(167, 1, 1, 'moodle/blog:create', 1, 1391626071, 0),
(168, 1, 4, 'moodle/blog:manageentries', 1, 1391626071, 0),
(169, 1, 3, 'moodle/blog:manageentries', 1, 1391626072, 0),
(170, 1, 1, 'moodle/blog:manageentries', 1, 1391626072, 0),
(171, 1, 5, 'moodle/blog:manageexternal', 1, 1391626072, 0),
(172, 1, 7, 'moodle/blog:manageexternal', 1, 1391626072, 0),
(173, 1, 4, 'moodle/blog:manageexternal', 1, 1391626072, 0),
(174, 1, 3, 'moodle/blog:manageexternal', 1, 1391626072, 0),
(175, 1, 1, 'moodle/blog:manageexternal', 1, 1391626072, 0),
(176, 1, 7, 'moodle/calendar:manageownentries', 1, 1391626072, 0),
(177, 1, 1, 'moodle/calendar:manageownentries', 1, 1391626072, 0),
(178, 1, 4, 'moodle/calendar:managegroupentries', 1, 1391626072, 0),
(179, 1, 3, 'moodle/calendar:managegroupentries', 1, 1391626072, 0),
(180, 1, 1, 'moodle/calendar:managegroupentries', 1, 1391626072, 0),
(181, 1, 4, 'moodle/calendar:manageentries', 1, 1391626072, 0),
(182, 1, 3, 'moodle/calendar:manageentries', 1, 1391626072, 0),
(183, 1, 1, 'moodle/calendar:manageentries', 1, 1391626072, 0),
(184, 1, 1, 'moodle/user:editprofile', 1, 1391626072, 0),
(185, 1, 6, 'moodle/user:editownprofile', -1000, 1391626073, 0),
(186, 1, 7, 'moodle/user:editownprofile', 1, 1391626073, 0),
(187, 1, 1, 'moodle/user:editownprofile', 1, 1391626073, 0),
(188, 1, 6, 'moodle/user:changeownpassword', -1000, 1391626073, 0),
(189, 1, 7, 'moodle/user:changeownpassword', 1, 1391626073, 0),
(190, 1, 1, 'moodle/user:changeownpassword', 1, 1391626074, 0),
(191, 1, 5, 'moodle/user:readuserposts', 1, 1391626074, 0),
(192, 1, 4, 'moodle/user:readuserposts', 1, 1391626074, 0),
(193, 1, 3, 'moodle/user:readuserposts', 1, 1391626074, 0),
(194, 1, 1, 'moodle/user:readuserposts', 1, 1391626074, 0),
(195, 1, 5, 'moodle/user:readuserblogs', 1, 1391626074, 0),
(196, 1, 4, 'moodle/user:readuserblogs', 1, 1391626074, 0),
(197, 1, 3, 'moodle/user:readuserblogs', 1, 1391626074, 0),
(198, 1, 1, 'moodle/user:readuserblogs', 1, 1391626074, 0),
(199, 1, 1, 'moodle/user:editmessageprofile', 1, 1391626074, 0),
(200, 1, 6, 'moodle/user:editownmessageprofile', -1000, 1391626074, 0),
(201, 1, 7, 'moodle/user:editownmessageprofile', 1, 1391626074, 0),
(202, 1, 1, 'moodle/user:editownmessageprofile', 1, 1391626074, 0),
(203, 1, 3, 'moodle/question:managecategory', 1, 1391626074, 0),
(204, 1, 1, 'moodle/question:managecategory', 1, 1391626074, 0),
(205, 1, 3, 'moodle/question:add', 1, 1391626075, 0),
(206, 1, 1, 'moodle/question:add', 1, 1391626075, 0),
(207, 1, 3, 'moodle/question:editmine', 1, 1391626075, 0),
(208, 1, 1, 'moodle/question:editmine', 1, 1391626075, 0),
(209, 1, 3, 'moodle/question:editall', 1, 1391626075, 0),
(210, 1, 1, 'moodle/question:editall', 1, 1391626075, 0),
(211, 1, 3, 'moodle/question:viewmine', 1, 1391626075, 0),
(212, 1, 1, 'moodle/question:viewmine', 1, 1391626075, 0),
(213, 1, 3, 'moodle/question:viewall', 1, 1391626075, 0),
(214, 1, 1, 'moodle/question:viewall', 1, 1391626075, 0),
(215, 1, 3, 'moodle/question:usemine', 1, 1391626075, 0),
(216, 1, 1, 'moodle/question:usemine', 1, 1391626075, 0),
(217, 1, 3, 'moodle/question:useall', 1, 1391626075, 0),
(218, 1, 1, 'moodle/question:useall', 1, 1391626075, 0),
(219, 1, 3, 'moodle/question:movemine', 1, 1391626075, 0),
(220, 1, 1, 'moodle/question:movemine', 1, 1391626076, 0),
(221, 1, 3, 'moodle/question:moveall', 1, 1391626076, 0),
(222, 1, 1, 'moodle/question:moveall', 1, 1391626076, 0),
(223, 1, 1, 'moodle/question:config', 1, 1391626076, 0),
(224, 1, 5, 'moodle/question:flag', 1, 1391626076, 0),
(225, 1, 4, 'moodle/question:flag', 1, 1391626076, 0),
(226, 1, 3, 'moodle/question:flag', 1, 1391626076, 0),
(227, 1, 1, 'moodle/question:flag', 1, 1391626076, 0),
(228, 1, 4, 'moodle/site:doclinks', 1, 1391626076, 0),
(229, 1, 3, 'moodle/site:doclinks', 1, 1391626076, 0),
(230, 1, 1, 'moodle/site:doclinks', 1, 1391626076, 0),
(231, 1, 3, 'moodle/course:sectionvisibility', 1, 1391626076, 0),
(232, 1, 1, 'moodle/course:sectionvisibility', 1, 1391626076, 0),
(233, 1, 3, 'moodle/course:useremail', 1, 1391626076, 0),
(234, 1, 1, 'moodle/course:useremail', 1, 1391626076, 0),
(235, 1, 3, 'moodle/course:viewhiddensections', 1, 1391626077, 0),
(236, 1, 1, 'moodle/course:viewhiddensections', 1, 1391626077, 0),
(237, 1, 3, 'moodle/course:setcurrentsection', 1, 1391626077, 0),
(238, 1, 1, 'moodle/course:setcurrentsection', 1, 1391626077, 0),
(239, 1, 3, 'moodle/course:movesections', 1, 1391626077, 0),
(240, 1, 1, 'moodle/course:movesections', 1, 1391626077, 0),
(241, 1, 4, 'moodle/grade:viewall', 1, 1391626077, 0),
(242, 1, 3, 'moodle/grade:viewall', 1, 1391626077, 0),
(243, 1, 1, 'moodle/grade:viewall', 1, 1391626077, 0),
(244, 1, 5, 'moodle/grade:view', 1, 1391626077, 0),
(245, 1, 4, 'moodle/grade:viewhidden', 1, 1391626077, 0),
(246, 1, 3, 'moodle/grade:viewhidden', 1, 1391626077, 0),
(247, 1, 1, 'moodle/grade:viewhidden', 1, 1391626077, 0),
(248, 1, 3, 'moodle/grade:import', 1, 1391626077, 0),
(249, 1, 1, 'moodle/grade:import', 1, 1391626077, 0),
(250, 1, 4, 'moodle/grade:export', 1, 1391626078, 0),
(251, 1, 3, 'moodle/grade:export', 1, 1391626078, 0),
(252, 1, 1, 'moodle/grade:export', 1, 1391626078, 0),
(253, 1, 3, 'moodle/grade:manage', 1, 1391626078, 0),
(254, 1, 1, 'moodle/grade:manage', 1, 1391626078, 0),
(255, 1, 3, 'moodle/grade:edit', 1, 1391626078, 0),
(256, 1, 1, 'moodle/grade:edit', 1, 1391626078, 0),
(257, 1, 3, 'moodle/grade:managegradingforms', 1, 1391626078, 0),
(258, 1, 1, 'moodle/grade:managegradingforms', 1, 1391626078, 0),
(259, 1, 1, 'moodle/grade:sharegradingforms', 1, 1391626078, 0),
(260, 1, 1, 'moodle/grade:managesharedforms', 1, 1391626078, 0),
(261, 1, 3, 'moodle/grade:manageoutcomes', 1, 1391626078, 0),
(262, 1, 1, 'moodle/grade:manageoutcomes', 1, 1391626078, 0),
(263, 1, 3, 'moodle/grade:manageletters', 1, 1391626078, 0),
(264, 1, 1, 'moodle/grade:manageletters', 1, 1391626078, 0),
(265, 1, 3, 'moodle/grade:hide', 1, 1391626079, 0),
(266, 1, 1, 'moodle/grade:hide', 1, 1391626079, 0),
(267, 1, 3, 'moodle/grade:lock', 1, 1391626079, 0),
(268, 1, 1, 'moodle/grade:lock', 1, 1391626079, 0),
(269, 1, 3, 'moodle/grade:unlock', 1, 1391626079, 0),
(270, 1, 1, 'moodle/grade:unlock', 1, 1391626079, 0),
(271, 1, 7, 'moodle/my:manageblocks', 1, 1391626079, 0),
(272, 1, 4, 'moodle/notes:view', 1, 1391626079, 0),
(273, 1, 3, 'moodle/notes:view', 1, 1391626079, 0),
(274, 1, 1, 'moodle/notes:view', 1, 1391626079, 0),
(275, 1, 4, 'moodle/notes:manage', 1, 1391626079, 0),
(276, 1, 3, 'moodle/notes:manage', 1, 1391626079, 0),
(277, 1, 1, 'moodle/notes:manage', 1, 1391626079, 0),
(278, 1, 4, 'moodle/tag:manage', 1, 1391626079, 0),
(279, 1, 3, 'moodle/tag:manage', 1, 1391626079, 0),
(280, 1, 1, 'moodle/tag:manage', 1, 1391626079, 0),
(281, 1, 1, 'moodle/tag:create', 1, 1391626080, 0),
(282, 1, 7, 'moodle/tag:create', 1, 1391626080, 0),
(283, 1, 1, 'moodle/tag:edit', 1, 1391626080, 0),
(284, 1, 7, 'moodle/tag:edit', 1, 1391626080, 0),
(285, 1, 1, 'moodle/tag:flag', 1, 1391626080, 0),
(286, 1, 7, 'moodle/tag:flag', 1, 1391626080, 0),
(287, 1, 4, 'moodle/tag:editblocks', 1, 1391626080, 0),
(288, 1, 3, 'moodle/tag:editblocks', 1, 1391626080, 0),
(289, 1, 1, 'moodle/tag:editblocks', 1, 1391626080, 0),
(290, 1, 6, 'moodle/block:view', 1, 1391626080, 0),
(291, 1, 7, 'moodle/block:view', 1, 1391626080, 0),
(292, 1, 5, 'moodle/block:view', 1, 1391626080, 0),
(293, 1, 4, 'moodle/block:view', 1, 1391626080, 0),
(294, 1, 3, 'moodle/block:view', 1, 1391626080, 0),
(295, 1, 3, 'moodle/block:edit', 1, 1391626080, 0),
(296, 1, 1, 'moodle/block:edit', 1, 1391626080, 0),
(297, 1, 7, 'moodle/portfolio:export', 1, 1391626081, 0),
(298, 1, 5, 'moodle/portfolio:export', 1, 1391626081, 0),
(299, 1, 4, 'moodle/portfolio:export', 1, 1391626081, 0),
(300, 1, 3, 'moodle/portfolio:export', 1, 1391626081, 0),
(301, 1, 8, 'moodle/comment:view', 1, 1391626081, 0),
(302, 1, 6, 'moodle/comment:view', 1, 1391626081, 0),
(303, 1, 7, 'moodle/comment:view', 1, 1391626081, 0),
(304, 1, 5, 'moodle/comment:view', 1, 1391626081, 0),
(305, 1, 4, 'moodle/comment:view', 1, 1391626081, 0),
(306, 1, 3, 'moodle/comment:view', 1, 1391626081, 0),
(307, 1, 1, 'moodle/comment:view', 1, 1391626081, 0),
(308, 1, 7, 'moodle/comment:post', 1, 1391626081, 0),
(309, 1, 5, 'moodle/comment:post', 1, 1391626081, 0),
(310, 1, 4, 'moodle/comment:post', 1, 1391626081, 0),
(311, 1, 3, 'moodle/comment:post', 1, 1391626081, 0),
(312, 1, 1, 'moodle/comment:post', 1, 1391626081, 0),
(313, 1, 3, 'moodle/comment:delete', 1, 1391626081, 0),
(314, 1, 1, 'moodle/comment:delete', 1, 1391626081, 0),
(315, 1, 1, 'moodle/webservice:createtoken', 1, 1391626082, 0),
(316, 1, 7, 'moodle/webservice:createmobiletoken', 1, 1391626082, 0),
(317, 1, 7, 'moodle/rating:view', 1, 1391626082, 0),
(318, 1, 5, 'moodle/rating:view', 1, 1391626082, 0),
(319, 1, 4, 'moodle/rating:view', 1, 1391626082, 0),
(320, 1, 3, 'moodle/rating:view', 1, 1391626082, 0),
(321, 1, 1, 'moodle/rating:view', 1, 1391626082, 0),
(322, 1, 7, 'moodle/rating:viewany', 1, 1391626082, 0),
(323, 1, 5, 'moodle/rating:viewany', 1, 1391626082, 0),
(324, 1, 4, 'moodle/rating:viewany', 1, 1391626082, 0),
(325, 1, 3, 'moodle/rating:viewany', 1, 1391626082, 0),
(326, 1, 1, 'moodle/rating:viewany', 1, 1391626082, 0),
(327, 1, 7, 'moodle/rating:viewall', 1, 1391626082, 0),
(328, 1, 5, 'moodle/rating:viewall', 1, 1391626082, 0),
(329, 1, 4, 'moodle/rating:viewall', 1, 1391626082, 0),
(330, 1, 3, 'moodle/rating:viewall', 1, 1391626082, 0),
(331, 1, 1, 'moodle/rating:viewall', 1, 1391626082, 0),
(332, 1, 7, 'moodle/rating:rate', 1, 1391626082, 0),
(333, 1, 5, 'moodle/rating:rate', 1, 1391626083, 0),
(334, 1, 4, 'moodle/rating:rate', 1, 1391626083, 0),
(335, 1, 3, 'moodle/rating:rate', 1, 1391626083, 0),
(336, 1, 1, 'moodle/rating:rate', 1, 1391626083, 0),
(337, 1, 1, 'moodle/course:publish', 1, 1391626083, 0),
(338, 1, 4, 'moodle/course:markcomplete', 1, 1391626083, 0),
(339, 1, 3, 'moodle/course:markcomplete', 1, 1391626083, 0),
(340, 1, 1, 'moodle/course:markcomplete', 1, 1391626083, 0),
(341, 1, 1, 'moodle/community:add', 1, 1391626083, 0),
(342, 1, 4, 'moodle/community:add', 1, 1391626083, 0),
(343, 1, 3, 'moodle/community:add', 1, 1391626083, 0),
(344, 1, 1, 'moodle/community:download', 1, 1391626083, 0),
(345, 1, 3, 'moodle/community:download', 1, 1391626084, 0),
(346, 1, 1, 'moodle/badges:manageglobalsettings', 1, 1391626084, 0),
(347, 1, 7, 'moodle/badges:viewbadges', 1, 1391626085, 0),
(348, 1, 7, 'moodle/badges:manageownbadges', 1, 1391626085, 0),
(349, 1, 7, 'moodle/badges:viewotherbadges', 1, 1391626085, 0),
(350, 1, 7, 'moodle/badges:earnbadge', 1, 1391626085, 0),
(351, 1, 1, 'moodle/badges:createbadge', 1, 1391626085, 0),
(352, 1, 3, 'moodle/badges:createbadge', 1, 1391626086, 0),
(353, 1, 1, 'moodle/badges:deletebadge', 1, 1391626086, 0),
(354, 1, 3, 'moodle/badges:deletebadge', 1, 1391626086, 0),
(355, 1, 1, 'moodle/badges:configuredetails', 1, 1391626086, 0),
(356, 1, 3, 'moodle/badges:configuredetails', 1, 1391626086, 0),
(357, 1, 1, 'moodle/badges:configurecriteria', 1, 1391626086, 0),
(358, 1, 3, 'moodle/badges:configurecriteria', 1, 1391626086, 0),
(359, 1, 1, 'moodle/badges:configuremessages', 1, 1391626086, 0),
(360, 1, 3, 'moodle/badges:configuremessages', 1, 1391626086, 0),
(361, 1, 1, 'moodle/badges:awardbadge', 1, 1391626086, 0),
(362, 1, 4, 'moodle/badges:awardbadge', 1, 1391626086, 0),
(363, 1, 3, 'moodle/badges:awardbadge', 1, 1391626086, 0),
(364, 1, 1, 'moodle/badges:viewawarded', 1, 1391626086, 0),
(365, 1, 4, 'moodle/badges:viewawarded', 1, 1391626086, 0),
(366, 1, 3, 'moodle/badges:viewawarded', 1, 1391626086, 0),
(367, 1, 6, 'mod/assign:view', 1, 1391626225, 0),
(368, 1, 5, 'mod/assign:view', 1, 1391626225, 0),
(369, 1, 4, 'mod/assign:view', 1, 1391626225, 0),
(370, 1, 3, 'mod/assign:view', 1, 1391626225, 0),
(371, 1, 1, 'mod/assign:view', 1, 1391626225, 0),
(372, 1, 5, 'mod/assign:submit', 1, 1391626225, 0),
(373, 1, 4, 'mod/assign:grade', 1, 1391626225, 0),
(374, 1, 3, 'mod/assign:grade', 1, 1391626225, 0),
(375, 1, 1, 'mod/assign:grade', 1, 1391626225, 0),
(376, 1, 4, 'mod/assign:exportownsubmission', 1, 1391626225, 0),
(377, 1, 3, 'mod/assign:exportownsubmission', 1, 1391626225, 0),
(378, 1, 1, 'mod/assign:exportownsubmission', 1, 1391626225, 0),
(379, 1, 5, 'mod/assign:exportownsubmission', 1, 1391626225, 0),
(380, 1, 3, 'mod/assign:addinstance', 1, 1391626225, 0),
(381, 1, 1, 'mod/assign:addinstance', 1, 1391626225, 0),
(382, 1, 4, 'mod/assign:grantextension', 1, 1391626226, 0),
(383, 1, 3, 'mod/assign:grantextension', 1, 1391626226, 0),
(384, 1, 1, 'mod/assign:grantextension', 1, 1391626226, 0),
(385, 1, 3, 'mod/assign:revealidentities', 1, 1391626226, 0),
(386, 1, 1, 'mod/assign:revealidentities', 1, 1391626226, 0),
(387, 1, 3, 'mod/assign:reviewgrades', 1, 1391626226, 0),
(388, 1, 1, 'mod/assign:reviewgrades', 1, 1391626226, 0),
(389, 1, 3, 'mod/assign:releasegrades', 1, 1391626226, 0),
(390, 1, 1, 'mod/assign:releasegrades', 1, 1391626226, 0),
(391, 1, 3, 'mod/assign:managegrades', 1, 1391626226, 0),
(392, 1, 1, 'mod/assign:managegrades', 1, 1391626226, 0),
(393, 1, 3, 'mod/assign:manageallocations', 1, 1391626226, 0),
(394, 1, 1, 'mod/assign:manageallocations', 1, 1391626226, 0),
(395, 1, 6, 'mod/assignment:view', 1, 1391626230, 0),
(396, 1, 5, 'mod/assignment:view', 1, 1391626230, 0),
(397, 1, 4, 'mod/assignment:view', 1, 1391626230, 0),
(398, 1, 3, 'mod/assignment:view', 1, 1391626230, 0),
(399, 1, 1, 'mod/assignment:view', 1, 1391626230, 0),
(400, 1, 3, 'mod/assignment:addinstance', 1, 1391626230, 0),
(401, 1, 1, 'mod/assignment:addinstance', 1, 1391626230, 0),
(402, 1, 5, 'mod/assignment:submit', 1, 1391626230, 0),
(403, 1, 4, 'mod/assignment:grade', 1, 1391626230, 0),
(404, 1, 3, 'mod/assignment:grade', 1, 1391626230, 0),
(405, 1, 1, 'mod/assignment:grade', 1, 1391626230, 0),
(406, 1, 4, 'mod/assignment:exportownsubmission', 1, 1391626230, 0),
(407, 1, 3, 'mod/assignment:exportownsubmission', 1, 1391626230, 0),
(408, 1, 1, 'mod/assignment:exportownsubmission', 1, 1391626231, 0),
(409, 1, 5, 'mod/assignment:exportownsubmission', 1, 1391626231, 0),
(410, 1, 3, 'mod/book:addinstance', 1, 1391626232, 0),
(411, 1, 1, 'mod/book:addinstance', 1, 1391626232, 0),
(412, 1, 6, 'mod/book:read', 1, 1391626232, 0),
(413, 1, 8, 'mod/book:read', 1, 1391626232, 0),
(414, 1, 5, 'mod/book:read', 1, 1391626232, 0),
(415, 1, 4, 'mod/book:read', 1, 1391626232, 0),
(416, 1, 3, 'mod/book:read', 1, 1391626232, 0),
(417, 1, 1, 'mod/book:read', 1, 1391626232, 0),
(418, 1, 4, 'mod/book:viewhiddenchapters', 1, 1391626232, 0),
(419, 1, 3, 'mod/book:viewhiddenchapters', 1, 1391626232, 0),
(420, 1, 1, 'mod/book:viewhiddenchapters', 1, 1391626232, 0),
(421, 1, 3, 'mod/book:edit', 1, 1391626232, 0),
(422, 1, 1, 'mod/book:edit', 1, 1391626232, 0),
(423, 1, 3, 'mod/chat:addinstance', 1, 1391626237, 0),
(424, 1, 1, 'mod/chat:addinstance', 1, 1391626237, 0),
(425, 1, 5, 'mod/chat:chat', 1, 1391626237, 0),
(426, 1, 4, 'mod/chat:chat', 1, 1391626237, 0),
(427, 1, 3, 'mod/chat:chat', 1, 1391626237, 0),
(428, 1, 1, 'mod/chat:chat', 1, 1391626237, 0),
(429, 1, 5, 'mod/chat:readlog', 1, 1391626237, 0),
(430, 1, 4, 'mod/chat:readlog', 1, 1391626237, 0),
(431, 1, 3, 'mod/chat:readlog', 1, 1391626237, 0),
(432, 1, 1, 'mod/chat:readlog', 1, 1391626237, 0),
(433, 1, 4, 'mod/chat:deletelog', 1, 1391626237, 0),
(434, 1, 3, 'mod/chat:deletelog', 1, 1391626237, 0),
(435, 1, 1, 'mod/chat:deletelog', 1, 1391626238, 0),
(436, 1, 4, 'mod/chat:exportparticipatedsession', 1, 1391626238, 0),
(437, 1, 3, 'mod/chat:exportparticipatedsession', 1, 1391626238, 0),
(438, 1, 1, 'mod/chat:exportparticipatedsession', 1, 1391626238, 0),
(439, 1, 4, 'mod/chat:exportsession', 1, 1391626238, 0),
(440, 1, 3, 'mod/chat:exportsession', 1, 1391626238, 0),
(441, 1, 1, 'mod/chat:exportsession', 1, 1391626238, 0),
(442, 1, 3, 'mod/choice:addinstance', 1, 1391626240, 0),
(443, 1, 1, 'mod/choice:addinstance', 1, 1391626240, 0),
(444, 1, 5, 'mod/choice:choose', 1, 1391626240, 0),
(445, 1, 4, 'mod/choice:choose', 1, 1391626240, 0),
(446, 1, 3, 'mod/choice:choose', 1, 1391626240, 0),
(447, 1, 4, 'mod/choice:readresponses', 1, 1391626240, 0),
(448, 1, 3, 'mod/choice:readresponses', 1, 1391626240, 0),
(449, 1, 1, 'mod/choice:readresponses', 1, 1391626240, 0),
(450, 1, 4, 'mod/choice:deleteresponses', 1, 1391626240, 0),
(451, 1, 3, 'mod/choice:deleteresponses', 1, 1391626240, 0),
(452, 1, 1, 'mod/choice:deleteresponses', 1, 1391626240, 0),
(453, 1, 4, 'mod/choice:downloadresponses', 1, 1391626240, 0),
(454, 1, 3, 'mod/choice:downloadresponses', 1, 1391626241, 0),
(455, 1, 1, 'mod/choice:downloadresponses', 1, 1391626241, 0),
(456, 1, 3, 'mod/data:addinstance', 1, 1391626243, 0),
(457, 1, 1, 'mod/data:addinstance', 1, 1391626243, 0),
(458, 1, 8, 'mod/data:viewentry', 1, 1391626243, 0),
(459, 1, 6, 'mod/data:viewentry', 1, 1391626243, 0),
(460, 1, 5, 'mod/data:viewentry', 1, 1391626243, 0),
(461, 1, 4, 'mod/data:viewentry', 1, 1391626243, 0),
(462, 1, 3, 'mod/data:viewentry', 1, 1391626243, 0),
(463, 1, 1, 'mod/data:viewentry', 1, 1391626243, 0),
(464, 1, 5, 'mod/data:writeentry', 1, 1391626243, 0),
(465, 1, 4, 'mod/data:writeentry', 1, 1391626243, 0),
(466, 1, 3, 'mod/data:writeentry', 1, 1391626243, 0),
(467, 1, 1, 'mod/data:writeentry', 1, 1391626243, 0),
(468, 1, 5, 'mod/data:comment', 1, 1391626244, 0),
(469, 1, 4, 'mod/data:comment', 1, 1391626244, 0),
(470, 1, 3, 'mod/data:comment', 1, 1391626244, 0),
(471, 1, 1, 'mod/data:comment', 1, 1391626244, 0),
(472, 1, 4, 'mod/data:rate', 1, 1391626244, 0),
(473, 1, 3, 'mod/data:rate', 1, 1391626244, 0),
(474, 1, 1, 'mod/data:rate', 1, 1391626244, 0),
(475, 1, 4, 'mod/data:viewrating', 1, 1391626244, 0),
(476, 1, 3, 'mod/data:viewrating', 1, 1391626244, 0),
(477, 1, 1, 'mod/data:viewrating', 1, 1391626244, 0),
(478, 1, 4, 'mod/data:viewanyrating', 1, 1391626244, 0),
(479, 1, 3, 'mod/data:viewanyrating', 1, 1391626244, 0),
(480, 1, 1, 'mod/data:viewanyrating', 1, 1391626244, 0),
(481, 1, 4, 'mod/data:viewallratings', 1, 1391626244, 0),
(482, 1, 3, 'mod/data:viewallratings', 1, 1391626244, 0),
(483, 1, 1, 'mod/data:viewallratings', 1, 1391626244, 0),
(484, 1, 4, 'mod/data:approve', 1, 1391626244, 0),
(485, 1, 3, 'mod/data:approve', 1, 1391626244, 0),
(486, 1, 1, 'mod/data:approve', 1, 1391626245, 0),
(487, 1, 4, 'mod/data:manageentries', 1, 1391626245, 0),
(488, 1, 3, 'mod/data:manageentries', 1, 1391626246, 0),
(489, 1, 1, 'mod/data:manageentries', 1, 1391626246, 0),
(490, 1, 4, 'mod/data:managecomments', 1, 1391626246, 0),
(491, 1, 3, 'mod/data:managecomments', 1, 1391626246, 0),
(492, 1, 1, 'mod/data:managecomments', 1, 1391626246, 0),
(493, 1, 3, 'mod/data:managetemplates', 1, 1391626246, 0),
(494, 1, 1, 'mod/data:managetemplates', 1, 1391626246, 0),
(495, 1, 4, 'mod/data:viewalluserpresets', 1, 1391626246, 0),
(496, 1, 3, 'mod/data:viewalluserpresets', 1, 1391626246, 0),
(497, 1, 1, 'mod/data:viewalluserpresets', 1, 1391626246, 0),
(498, 1, 1, 'mod/data:manageuserpresets', 1, 1391626246, 0),
(499, 1, 1, 'mod/data:exportentry', 1, 1391626246, 0),
(500, 1, 4, 'mod/data:exportentry', 1, 1391626246, 0),
(501, 1, 3, 'mod/data:exportentry', 1, 1391626246, 0),
(502, 1, 1, 'mod/data:exportownentry', 1, 1391626247, 0),
(503, 1, 4, 'mod/data:exportownentry', 1, 1391626247, 0),
(504, 1, 3, 'mod/data:exportownentry', 1, 1391626247, 0),
(505, 1, 5, 'mod/data:exportownentry', 1, 1391626247, 0),
(506, 1, 1, 'mod/data:exportallentries', 1, 1391626247, 0),
(507, 1, 4, 'mod/data:exportallentries', 1, 1391626247, 0),
(508, 1, 3, 'mod/data:exportallentries', 1, 1391626247, 0),
(509, 1, 1, 'mod/data:exportuserinfo', 1, 1391626247, 0),
(510, 1, 4, 'mod/data:exportuserinfo', 1, 1391626247, 0),
(511, 1, 3, 'mod/data:exportuserinfo', 1, 1391626247, 0),
(512, 1, 3, 'mod/feedback:addinstance', 1, 1391626253, 0),
(513, 1, 1, 'mod/feedback:addinstance', 1, 1391626253, 0),
(514, 1, 6, 'mod/feedback:view', 1, 1391626253, 0),
(515, 1, 5, 'mod/feedback:view', 1, 1391626253, 0),
(516, 1, 4, 'mod/feedback:view', 1, 1391626253, 0),
(517, 1, 3, 'mod/feedback:view', 1, 1391626253, 0),
(518, 1, 1, 'mod/feedback:view', 1, 1391626253, 0),
(519, 1, 5, 'mod/feedback:complete', 1, 1391626254, 0),
(520, 1, 5, 'mod/feedback:viewanalysepage', 1, 1391626254, 0),
(521, 1, 3, 'mod/feedback:viewanalysepage', 1, 1391626254, 0),
(522, 1, 1, 'mod/feedback:viewanalysepage', 1, 1391626254, 0),
(523, 1, 3, 'mod/feedback:deletesubmissions', 1, 1391626254, 0),
(524, 1, 1, 'mod/feedback:deletesubmissions', 1, 1391626254, 0),
(525, 1, 1, 'mod/feedback:mapcourse', 1, 1391626254, 0),
(526, 1, 3, 'mod/feedback:edititems', 1, 1391626254, 0),
(527, 1, 1, 'mod/feedback:edititems', 1, 1391626254, 0),
(528, 1, 3, 'mod/feedback:createprivatetemplate', 1, 1391626254, 0),
(529, 1, 1, 'mod/feedback:createprivatetemplate', 1, 1391626254, 0),
(530, 1, 3, 'mod/feedback:createpublictemplate', 1, 1391626254, 0),
(531, 1, 1, 'mod/feedback:createpublictemplate', 1, 1391626254, 0),
(532, 1, 3, 'mod/feedback:deletetemplate', 1, 1391626254, 0),
(533, 1, 1, 'mod/feedback:deletetemplate', 1, 1391626254, 0),
(534, 1, 4, 'mod/feedback:viewreports', 1, 1391626255, 0),
(535, 1, 3, 'mod/feedback:viewreports', 1, 1391626255, 0),
(536, 1, 1, 'mod/feedback:viewreports', 1, 1391626255, 0),
(537, 1, 4, 'mod/feedback:receivemail', 1, 1391626255, 0),
(538, 1, 3, 'mod/feedback:receivemail', 1, 1391626255, 0),
(539, 1, 3, 'mod/folder:addinstance', 1, 1391626257, 0),
(540, 1, 1, 'mod/folder:addinstance', 1, 1391626257, 0),
(541, 1, 6, 'mod/folder:view', 1, 1391626257, 0),
(542, 1, 7, 'mod/folder:view', 1, 1391626257, 0),
(543, 1, 3, 'mod/folder:managefiles', 1, 1391626257, 0),
(544, 1, 3, 'mod/forum:addinstance', 1, 1391626263, 0),
(545, 1, 1, 'mod/forum:addinstance', 1, 1391626263, 0),
(546, 1, 8, 'mod/forum:viewdiscussion', 1, 1391626263, 0),
(547, 1, 6, 'mod/forum:viewdiscussion', 1, 1391626263, 0),
(548, 1, 5, 'mod/forum:viewdiscussion', 1, 1391626263, 0),
(549, 1, 4, 'mod/forum:viewdiscussion', 1, 1391626263, 0),
(550, 1, 3, 'mod/forum:viewdiscussion', 1, 1391626263, 0),
(551, 1, 1, 'mod/forum:viewdiscussion', 1, 1391626263, 0),
(552, 1, 4, 'mod/forum:viewhiddentimedposts', 1, 1391626263, 0),
(553, 1, 3, 'mod/forum:viewhiddentimedposts', 1, 1391626263, 0),
(554, 1, 1, 'mod/forum:viewhiddentimedposts', 1, 1391626263, 0),
(555, 1, 5, 'mod/forum:startdiscussion', 1, 1391626263, 0),
(556, 1, 4, 'mod/forum:startdiscussion', 1, 1391626263, 0),
(557, 1, 3, 'mod/forum:startdiscussion', 1, 1391626263, 0),
(558, 1, 1, 'mod/forum:startdiscussion', 1, 1391626263, 0),
(559, 1, 5, 'mod/forum:replypost', 1, 1391626263, 0),
(560, 1, 4, 'mod/forum:replypost', 1, 1391626263, 0),
(561, 1, 3, 'mod/forum:replypost', 1, 1391626264, 0),
(562, 1, 1, 'mod/forum:replypost', 1, 1391626264, 0),
(563, 1, 4, 'mod/forum:addnews', 1, 1391626264, 0),
(564, 1, 3, 'mod/forum:addnews', 1, 1391626264, 0),
(565, 1, 1, 'mod/forum:addnews', 1, 1391626264, 0),
(566, 1, 4, 'mod/forum:replynews', 1, 1391626264, 0),
(567, 1, 3, 'mod/forum:replynews', 1, 1391626264, 0),
(568, 1, 1, 'mod/forum:replynews', 1, 1391626264, 0),
(569, 1, 5, 'mod/forum:viewrating', 1, 1391626264, 0),
(570, 1, 4, 'mod/forum:viewrating', 1, 1391626264, 0),
(571, 1, 3, 'mod/forum:viewrating', 1, 1391626264, 0),
(572, 1, 1, 'mod/forum:viewrating', 1, 1391626264, 0),
(573, 1, 4, 'mod/forum:viewanyrating', 1, 1391626264, 0),
(574, 1, 3, 'mod/forum:viewanyrating', 1, 1391626264, 0),
(575, 1, 1, 'mod/forum:viewanyrating', 1, 1391626264, 0),
(576, 1, 4, 'mod/forum:viewallratings', 1, 1391626264, 0),
(577, 1, 3, 'mod/forum:viewallratings', 1, 1391626264, 0),
(578, 1, 1, 'mod/forum:viewallratings', 1, 1391626264, 0),
(579, 1, 4, 'mod/forum:rate', 1, 1391626265, 0),
(580, 1, 3, 'mod/forum:rate', 1, 1391626265, 0),
(581, 1, 1, 'mod/forum:rate', 1, 1391626265, 0),
(582, 1, 5, 'mod/forum:createattachment', 1, 1391626265, 0),
(583, 1, 4, 'mod/forum:createattachment', 1, 1391626265, 0),
(584, 1, 3, 'mod/forum:createattachment', 1, 1391626265, 0),
(585, 1, 1, 'mod/forum:createattachment', 1, 1391626265, 0),
(586, 1, 5, 'mod/forum:deleteownpost', 1, 1391626265, 0),
(587, 1, 4, 'mod/forum:deleteownpost', 1, 1391626265, 0),
(588, 1, 3, 'mod/forum:deleteownpost', 1, 1391626265, 0),
(589, 1, 1, 'mod/forum:deleteownpost', 1, 1391626265, 0),
(590, 1, 4, 'mod/forum:deleteanypost', 1, 1391626265, 0),
(591, 1, 3, 'mod/forum:deleteanypost', 1, 1391626265, 0),
(592, 1, 1, 'mod/forum:deleteanypost', 1, 1391626265, 0),
(593, 1, 4, 'mod/forum:splitdiscussions', 1, 1391626265, 0),
(594, 1, 3, 'mod/forum:splitdiscussions', 1, 1391626265, 0),
(595, 1, 1, 'mod/forum:splitdiscussions', 1, 1391626265, 0),
(596, 1, 4, 'mod/forum:movediscussions', 1, 1391626266, 0),
(597, 1, 3, 'mod/forum:movediscussions', 1, 1391626266, 0),
(598, 1, 1, 'mod/forum:movediscussions', 1, 1391626266, 0),
(599, 1, 4, 'mod/forum:editanypost', 1, 1391626266, 0),
(600, 1, 3, 'mod/forum:editanypost', 1, 1391626266, 0),
(601, 1, 1, 'mod/forum:editanypost', 1, 1391626266, 0),
(602, 1, 4, 'mod/forum:viewqandawithoutposting', 1, 1391626266, 0),
(603, 1, 3, 'mod/forum:viewqandawithoutposting', 1, 1391626266, 0),
(604, 1, 1, 'mod/forum:viewqandawithoutposting', 1, 1391626266, 0),
(605, 1, 4, 'mod/forum:viewsubscribers', 1, 1391626266, 0),
(606, 1, 3, 'mod/forum:viewsubscribers', 1, 1391626266, 0),
(607, 1, 1, 'mod/forum:viewsubscribers', 1, 1391626266, 0),
(608, 1, 4, 'mod/forum:managesubscriptions', 1, 1391626266, 0),
(609, 1, 3, 'mod/forum:managesubscriptions', 1, 1391626266, 0),
(610, 1, 1, 'mod/forum:managesubscriptions', 1, 1391626266, 0),
(611, 1, 4, 'mod/forum:postwithoutthrottling', 1, 1391626266, 0),
(612, 1, 3, 'mod/forum:postwithoutthrottling', 1, 1391626266, 0),
(613, 1, 1, 'mod/forum:postwithoutthrottling', 1, 1391626267, 0),
(614, 1, 4, 'mod/forum:exportdiscussion', 1, 1391626267, 0),
(615, 1, 3, 'mod/forum:exportdiscussion', 1, 1391626267, 0),
(616, 1, 1, 'mod/forum:exportdiscussion', 1, 1391626267, 0),
(617, 1, 4, 'mod/forum:exportpost', 1, 1391626267, 0),
(618, 1, 3, 'mod/forum:exportpost', 1, 1391626267, 0),
(619, 1, 1, 'mod/forum:exportpost', 1, 1391626267, 0),
(620, 1, 4, 'mod/forum:exportownpost', 1, 1391626267, 0),
(621, 1, 3, 'mod/forum:exportownpost', 1, 1391626268, 0),
(622, 1, 1, 'mod/forum:exportownpost', 1, 1391626268, 0),
(623, 1, 5, 'mod/forum:exportownpost', 1, 1391626268, 0),
(624, 1, 4, 'mod/forum:addquestion', 1, 1391626268, 0),
(625, 1, 3, 'mod/forum:addquestion', 1, 1391626269, 0),
(626, 1, 1, 'mod/forum:addquestion', 1, 1391626269, 0),
(627, 1, 5, 'mod/forum:allowforcesubscribe', 1, 1391626269, 0),
(628, 1, 4, 'mod/forum:allowforcesubscribe', 1, 1391626269, 0),
(629, 1, 3, 'mod/forum:allowforcesubscribe', 1, 1391626269, 0),
(630, 1, 8, 'mod/forum:allowforcesubscribe', 1, 1391626269, 0),
(631, 1, 3, 'mod/glossary:addinstance', 1, 1391626272, 0),
(632, 1, 1, 'mod/glossary:addinstance', 1, 1391626272, 0),
(633, 1, 8, 'mod/glossary:view', 1, 1391626272, 0),
(634, 1, 6, 'mod/glossary:view', 1, 1391626272, 0),
(635, 1, 5, 'mod/glossary:view', 1, 1391626273, 0),
(636, 1, 4, 'mod/glossary:view', 1, 1391626273, 0),
(637, 1, 3, 'mod/glossary:view', 1, 1391626273, 0),
(638, 1, 1, 'mod/glossary:view', 1, 1391626273, 0),
(639, 1, 5, 'mod/glossary:write', 1, 1391626273, 0),
(640, 1, 4, 'mod/glossary:write', 1, 1391626273, 0),
(641, 1, 3, 'mod/glossary:write', 1, 1391626273, 0),
(642, 1, 1, 'mod/glossary:write', 1, 1391626273, 0),
(643, 1, 4, 'mod/glossary:manageentries', 1, 1391626273, 0),
(644, 1, 3, 'mod/glossary:manageentries', 1, 1391626273, 0),
(645, 1, 1, 'mod/glossary:manageentries', 1, 1391626273, 0),
(646, 1, 4, 'mod/glossary:managecategories', 1, 1391626273, 0),
(647, 1, 3, 'mod/glossary:managecategories', 1, 1391626273, 0),
(648, 1, 1, 'mod/glossary:managecategories', 1, 1391626273, 0),
(649, 1, 5, 'mod/glossary:comment', 1, 1391626273, 0),
(650, 1, 4, 'mod/glossary:comment', 1, 1391626273, 0),
(651, 1, 3, 'mod/glossary:comment', 1, 1391626273, 0),
(652, 1, 1, 'mod/glossary:comment', 1, 1391626274, 0),
(653, 1, 4, 'mod/glossary:managecomments', 1, 1391626274, 0),
(654, 1, 3, 'mod/glossary:managecomments', 1, 1391626274, 0),
(655, 1, 1, 'mod/glossary:managecomments', 1, 1391626274, 0),
(656, 1, 4, 'mod/glossary:import', 1, 1391626274, 0),
(657, 1, 3, 'mod/glossary:import', 1, 1391626274, 0),
(658, 1, 1, 'mod/glossary:import', 1, 1391626274, 0),
(659, 1, 4, 'mod/glossary:export', 1, 1391626274, 0),
(660, 1, 3, 'mod/glossary:export', 1, 1391626274, 0),
(661, 1, 1, 'mod/glossary:export', 1, 1391626274, 0),
(662, 1, 4, 'mod/glossary:approve', 1, 1391626274, 0),
(663, 1, 3, 'mod/glossary:approve', 1, 1391626274, 0),
(664, 1, 1, 'mod/glossary:approve', 1, 1391626274, 0),
(665, 1, 4, 'mod/glossary:rate', 1, 1391626274, 0),
(666, 1, 3, 'mod/glossary:rate', 1, 1391626274, 0),
(667, 1, 1, 'mod/glossary:rate', 1, 1391626274, 0),
(668, 1, 4, 'mod/glossary:viewrating', 1, 1391626274, 0),
(669, 1, 3, 'mod/glossary:viewrating', 1, 1391626275, 0),
(670, 1, 1, 'mod/glossary:viewrating', 1, 1391626275, 0),
(671, 1, 4, 'mod/glossary:viewanyrating', 1, 1391626275, 0),
(672, 1, 3, 'mod/glossary:viewanyrating', 1, 1391626275, 0),
(673, 1, 1, 'mod/glossary:viewanyrating', 1, 1391626275, 0),
(674, 1, 4, 'mod/glossary:viewallratings', 1, 1391626275, 0),
(675, 1, 3, 'mod/glossary:viewallratings', 1, 1391626275, 0),
(676, 1, 1, 'mod/glossary:viewallratings', 1, 1391626275, 0),
(677, 1, 4, 'mod/glossary:exportentry', 1, 1391626275, 0),
(678, 1, 3, 'mod/glossary:exportentry', 1, 1391626275, 0),
(679, 1, 1, 'mod/glossary:exportentry', 1, 1391626275, 0),
(680, 1, 4, 'mod/glossary:exportownentry', 1, 1391626275, 0),
(681, 1, 3, 'mod/glossary:exportownentry', 1, 1391626275, 0),
(682, 1, 1, 'mod/glossary:exportownentry', 1, 1391626275, 0),
(683, 1, 5, 'mod/glossary:exportownentry', 1, 1391626275, 0),
(684, 1, 6, 'mod/imscp:view', 1, 1391626277, 0),
(685, 1, 7, 'mod/imscp:view', 1, 1391626277, 0),
(686, 1, 3, 'mod/imscp:addinstance', 1, 1391626277, 0),
(687, 1, 1, 'mod/imscp:addinstance', 1, 1391626277, 0),
(688, 1, 3, 'mod/label:addinstance', 1, 1391626278, 0),
(689, 1, 1, 'mod/label:addinstance', 1, 1391626278, 0),
(690, 1, 3, 'mod/lesson:addinstance', 1, 1391626284, 0),
(691, 1, 1, 'mod/lesson:addinstance', 1, 1391626284, 0),
(692, 1, 3, 'mod/lesson:edit', 1, 1391626284, 0),
(693, 1, 1, 'mod/lesson:edit', 1, 1391626284, 0),
(694, 1, 4, 'mod/lesson:manage', 1, 1391626284, 0),
(695, 1, 3, 'mod/lesson:manage', 1, 1391626284, 0),
(696, 1, 1, 'mod/lesson:manage', 1, 1391626284, 0),
(697, 1, 5, 'mod/lti:view', 1, 1391626286, 0),
(698, 1, 4, 'mod/lti:view', 1, 1391626286, 0),
(699, 1, 3, 'mod/lti:view', 1, 1391626286, 0),
(700, 1, 1, 'mod/lti:view', 1, 1391626287, 0),
(701, 1, 3, 'mod/lti:addinstance', 1, 1391626287, 0),
(702, 1, 1, 'mod/lti:addinstance', 1, 1391626287, 0),
(703, 1, 4, 'mod/lti:grade', 1, 1391626287, 0),
(704, 1, 3, 'mod/lti:grade', 1, 1391626287, 0),
(705, 1, 1, 'mod/lti:grade', 1, 1391626287, 0),
(706, 1, 4, 'mod/lti:manage', 1, 1391626287, 0),
(707, 1, 3, 'mod/lti:manage', 1, 1391626287, 0),
(708, 1, 1, 'mod/lti:manage', 1, 1391626287, 0),
(709, 1, 3, 'mod/lti:addcoursetool', 1, 1391626287, 0),
(710, 1, 1, 'mod/lti:addcoursetool', 1, 1391626287, 0),
(711, 1, 3, 'mod/lti:requesttooladd', 1, 1391626287, 0),
(712, 1, 1, 'mod/lti:requesttooladd', 1, 1391626287, 0),
(713, 1, 6, 'mod/page:view', 1, 1391626288, 0),
(714, 1, 7, 'mod/page:view', 1, 1391626288, 0),
(715, 1, 3, 'mod/page:addinstance', 1, 1391626289, 0),
(716, 1, 1, 'mod/page:addinstance', 1, 1391626289, 0),
(717, 1, 6, 'mod/quiz:view', 1, 1391626294, 0),
(718, 1, 5, 'mod/quiz:view', 1, 1391626294, 0),
(719, 1, 4, 'mod/quiz:view', 1, 1391626294, 0),
(720, 1, 3, 'mod/quiz:view', 1, 1391626294, 0),
(721, 1, 1, 'mod/quiz:view', 1, 1391626294, 0),
(722, 1, 3, 'mod/quiz:addinstance', 1, 1391626294, 0),
(723, 1, 1, 'mod/quiz:addinstance', 1, 1391626294, 0),
(724, 1, 5, 'mod/quiz:attempt', 1, 1391626294, 0),
(725, 1, 5, 'mod/quiz:reviewmyattempts', 1, 1391626294, 0),
(726, 1, 3, 'mod/quiz:manage', 1, 1391626295, 0),
(727, 1, 1, 'mod/quiz:manage', 1, 1391626295, 0),
(728, 1, 3, 'mod/quiz:manageoverrides', 1, 1391626295, 0),
(729, 1, 1, 'mod/quiz:manageoverrides', 1, 1391626295, 0),
(730, 1, 4, 'mod/quiz:preview', 1, 1391626295, 0),
(731, 1, 3, 'mod/quiz:preview', 1, 1391626295, 0),
(732, 1, 1, 'mod/quiz:preview', 1, 1391626295, 0),
(733, 1, 4, 'mod/quiz:grade', 1, 1391626295, 0),
(734, 1, 3, 'mod/quiz:grade', 1, 1391626295, 0),
(735, 1, 1, 'mod/quiz:grade', 1, 1391626295, 0),
(736, 1, 4, 'mod/quiz:regrade', 1, 1391626295, 0),
(737, 1, 3, 'mod/quiz:regrade', 1, 1391626295, 0),
(738, 1, 1, 'mod/quiz:regrade', 1, 1391626295, 0),
(739, 1, 4, 'mod/quiz:viewreports', 1, 1391626295, 0),
(740, 1, 3, 'mod/quiz:viewreports', 1, 1391626295, 0),
(741, 1, 1, 'mod/quiz:viewreports', 1, 1391626295, 0),
(742, 1, 3, 'mod/quiz:deleteattempts', 1, 1391626296, 0),
(743, 1, 1, 'mod/quiz:deleteattempts', 1, 1391626296, 0),
(744, 1, 6, 'mod/resource:view', 1, 1391626298, 0),
(745, 1, 7, 'mod/resource:view', 1, 1391626298, 0),
(746, 1, 3, 'mod/resource:addinstance', 1, 1391626298, 0),
(747, 1, 1, 'mod/resource:addinstance', 1, 1391626298, 0),
(748, 1, 3, 'mod/scorm:addinstance', 1, 1391626305, 0),
(749, 1, 1, 'mod/scorm:addinstance', 1, 1391626306, 0),
(750, 1, 4, 'mod/scorm:viewreport', 1, 1391626306, 0),
(751, 1, 3, 'mod/scorm:viewreport', 1, 1391626306, 0),
(752, 1, 1, 'mod/scorm:viewreport', 1, 1391626306, 0),
(753, 1, 5, 'mod/scorm:skipview', 1, 1391626306, 0),
(754, 1, 5, 'mod/scorm:savetrack', 1, 1391626306, 0),
(755, 1, 4, 'mod/scorm:savetrack', 1, 1391626306, 0),
(756, 1, 3, 'mod/scorm:savetrack', 1, 1391626306, 0),
(757, 1, 1, 'mod/scorm:savetrack', 1, 1391626306, 0),
(758, 1, 5, 'mod/scorm:viewscores', 1, 1391626306, 0),
(759, 1, 4, 'mod/scorm:viewscores', 1, 1391626306, 0),
(760, 1, 3, 'mod/scorm:viewscores', 1, 1391626306, 0),
(761, 1, 1, 'mod/scorm:viewscores', 1, 1391626306, 0),
(762, 1, 4, 'mod/scorm:deleteresponses', 1, 1391626306, 0),
(763, 1, 3, 'mod/scorm:deleteresponses', 1, 1391626306, 0),
(764, 1, 1, 'mod/scorm:deleteresponses', 1, 1391626306, 0),
(765, 1, 3, 'mod/survey:addinstance', 1, 1391626312, 0),
(766, 1, 1, 'mod/survey:addinstance', 1, 1391626313, 0),
(767, 1, 5, 'mod/survey:participate', 1, 1391626313, 0),
(768, 1, 4, 'mod/survey:participate', 1, 1391626313, 0),
(769, 1, 3, 'mod/survey:participate', 1, 1391626313, 0),
(770, 1, 1, 'mod/survey:participate', 1, 1391626313, 0),
(771, 1, 4, 'mod/survey:readresponses', 1, 1391626314, 0),
(772, 1, 3, 'mod/survey:readresponses', 1, 1391626314, 0),
(773, 1, 1, 'mod/survey:readresponses', 1, 1391626314, 0),
(774, 1, 4, 'mod/survey:download', 1, 1391626314, 0),
(775, 1, 3, 'mod/survey:download', 1, 1391626314, 0),
(776, 1, 1, 'mod/survey:download', 1, 1391626314, 0),
(777, 1, 6, 'mod/url:view', 1, 1391626315, 0),
(778, 1, 7, 'mod/url:view', 1, 1391626315, 0),
(779, 1, 3, 'mod/url:addinstance', 1, 1391626315, 0),
(780, 1, 1, 'mod/url:addinstance', 1, 1391626315, 0),
(781, 1, 3, 'mod/wiki:addinstance', 1, 1391626319, 0),
(782, 1, 1, 'mod/wiki:addinstance', 1, 1391626319, 0),
(783, 1, 6, 'mod/wiki:viewpage', 1, 1391626319, 0),
(784, 1, 5, 'mod/wiki:viewpage', 1, 1391626319, 0),
(785, 1, 4, 'mod/wiki:viewpage', 1, 1391626319, 0),
(786, 1, 3, 'mod/wiki:viewpage', 1, 1391626319, 0),
(787, 1, 1, 'mod/wiki:viewpage', 1, 1391626319, 0),
(788, 1, 5, 'mod/wiki:editpage', 1, 1391626319, 0),
(789, 1, 4, 'mod/wiki:editpage', 1, 1391626319, 0),
(790, 1, 3, 'mod/wiki:editpage', 1, 1391626319, 0),
(791, 1, 1, 'mod/wiki:editpage', 1, 1391626319, 0),
(792, 1, 5, 'mod/wiki:createpage', 1, 1391626319, 0),
(793, 1, 4, 'mod/wiki:createpage', 1, 1391626319, 0),
(794, 1, 3, 'mod/wiki:createpage', 1, 1391626319, 0),
(795, 1, 1, 'mod/wiki:createpage', 1, 1391626319, 0),
(796, 1, 5, 'mod/wiki:viewcomment', 1, 1391626319, 0),
(797, 1, 4, 'mod/wiki:viewcomment', 1, 1391626319, 0),
(798, 1, 3, 'mod/wiki:viewcomment', 1, 1391626319, 0),
(799, 1, 1, 'mod/wiki:viewcomment', 1, 1391626320, 0),
(800, 1, 5, 'mod/wiki:editcomment', 1, 1391626320, 0),
(801, 1, 4, 'mod/wiki:editcomment', 1, 1391626320, 0),
(802, 1, 3, 'mod/wiki:editcomment', 1, 1391626320, 0),
(803, 1, 1, 'mod/wiki:editcomment', 1, 1391626320, 0),
(804, 1, 4, 'mod/wiki:managecomment', 1, 1391626320, 0),
(805, 1, 3, 'mod/wiki:managecomment', 1, 1391626320, 0),
(806, 1, 1, 'mod/wiki:managecomment', 1, 1391626320, 0),
(807, 1, 4, 'mod/wiki:managefiles', 1, 1391626320, 0),
(808, 1, 3, 'mod/wiki:managefiles', 1, 1391626320, 0),
(809, 1, 1, 'mod/wiki:managefiles', 1, 1391626320, 0),
(810, 1, 4, 'mod/wiki:overridelock', 1, 1391626320, 0),
(811, 1, 3, 'mod/wiki:overridelock', 1, 1391626320, 0),
(812, 1, 1, 'mod/wiki:overridelock', 1, 1391626320, 0),
(813, 1, 4, 'mod/wiki:managewiki', 1, 1391626320, 0),
(814, 1, 3, 'mod/wiki:managewiki', 1, 1391626320, 0),
(815, 1, 1, 'mod/wiki:managewiki', 1, 1391626321, 0),
(816, 1, 6, 'mod/workshop:view', 1, 1391626329, 0),
(817, 1, 5, 'mod/workshop:view', 1, 1391626329, 0),
(818, 1, 4, 'mod/workshop:view', 1, 1391626329, 0),
(819, 1, 3, 'mod/workshop:view', 1, 1391626329, 0),
(820, 1, 1, 'mod/workshop:view', 1, 1391626329, 0),
(821, 1, 3, 'mod/workshop:addinstance', 1, 1391626329, 0),
(822, 1, 1, 'mod/workshop:addinstance', 1, 1391626329, 0),
(823, 1, 4, 'mod/workshop:switchphase', 1, 1391626329, 0),
(824, 1, 3, 'mod/workshop:switchphase', 1, 1391626330, 0),
(825, 1, 1, 'mod/workshop:switchphase', 1, 1391626330, 0),
(826, 1, 3, 'mod/workshop:editdimensions', 1, 1391626330, 0),
(827, 1, 1, 'mod/workshop:editdimensions', 1, 1391626330, 0),
(828, 1, 5, 'mod/workshop:submit', 1, 1391626330, 0),
(829, 1, 5, 'mod/workshop:peerassess', 1, 1391626330, 0),
(830, 1, 4, 'mod/workshop:manageexamples', 1, 1391626330, 0),
(831, 1, 3, 'mod/workshop:manageexamples', 1, 1391626330, 0),
(832, 1, 1, 'mod/workshop:manageexamples', 1, 1391626330, 0),
(833, 1, 4, 'mod/workshop:allocate', 1, 1391626330, 0),
(834, 1, 3, 'mod/workshop:allocate', 1, 1391626330, 0),
(835, 1, 1, 'mod/workshop:allocate', 1, 1391626330, 0),
(836, 1, 4, 'mod/workshop:publishsubmissions', 1, 1391626330, 0),
(837, 1, 3, 'mod/workshop:publishsubmissions', 1, 1391626330, 0),
(838, 1, 1, 'mod/workshop:publishsubmissions', 1, 1391626330, 0),
(839, 1, 5, 'mod/workshop:viewauthornames', 1, 1391626331, 0),
(840, 1, 4, 'mod/workshop:viewauthornames', 1, 1391626331, 0),
(841, 1, 3, 'mod/workshop:viewauthornames', 1, 1391626331, 0),
(842, 1, 1, 'mod/workshop:viewauthornames', 1, 1391626331, 0),
(843, 1, 4, 'mod/workshop:viewreviewernames', 1, 1391626331, 0),
(844, 1, 3, 'mod/workshop:viewreviewernames', 1, 1391626331, 0),
(845, 1, 1, 'mod/workshop:viewreviewernames', 1, 1391626331, 0),
(846, 1, 4, 'mod/workshop:viewallsubmissions', 1, 1391626331, 0),
(847, 1, 3, 'mod/workshop:viewallsubmissions', 1, 1391626331, 0),
(848, 1, 1, 'mod/workshop:viewallsubmissions', 1, 1391626331, 0),
(849, 1, 5, 'mod/workshop:viewpublishedsubmissions', 1, 1391626331, 0),
(850, 1, 4, 'mod/workshop:viewpublishedsubmissions', 1, 1391626331, 0),
(851, 1, 3, 'mod/workshop:viewpublishedsubmissions', 1, 1391626331, 0),
(852, 1, 1, 'mod/workshop:viewpublishedsubmissions', 1, 1391626331, 0),
(853, 1, 5, 'mod/workshop:viewauthorpublished', 1, 1391626331, 0),
(854, 1, 4, 'mod/workshop:viewauthorpublished', 1, 1391626331, 0),
(855, 1, 3, 'mod/workshop:viewauthorpublished', 1, 1391626331, 0),
(856, 1, 1, 'mod/workshop:viewauthorpublished', 1, 1391626331, 0),
(857, 1, 4, 'mod/workshop:viewallassessments', 1, 1391626332, 0),
(858, 1, 3, 'mod/workshop:viewallassessments', 1, 1391626332, 0),
(859, 1, 1, 'mod/workshop:viewallassessments', 1, 1391626332, 0),
(860, 1, 4, 'mod/workshop:overridegrades', 1, 1391626332, 0),
(861, 1, 3, 'mod/workshop:overridegrades', 1, 1391626332, 0),
(862, 1, 1, 'mod/workshop:overridegrades', 1, 1391626332, 0),
(863, 1, 4, 'mod/workshop:ignoredeadlines', 1, 1391626332, 0),
(864, 1, 3, 'mod/workshop:ignoredeadlines', 1, 1391626332, 0),
(865, 1, 1, 'mod/workshop:ignoredeadlines', 1, 1391626332, 0),
(866, 1, 3, 'enrol/cohort:config', 1, 1391626342, 0),
(867, 1, 1, 'enrol/cohort:config', 1, 1391626343, 0),
(868, 1, 1, 'enrol/cohort:unenrol', 1, 1391626343, 0),
(869, 1, 1, 'enrol/database:unenrol', 1, 1391626343, 0),
(870, 1, 1, 'enrol/guest:config', 1, 1391626345, 0),
(871, 1, 3, 'enrol/guest:config', 1, 1391626345, 0),
(872, 1, 1, 'enrol/ldap:manage', 1, 1391626346, 0),
(873, 1, 1, 'enrol/manual:config', 1, 1391626347, 0),
(874, 1, 1, 'enrol/manual:enrol', 1, 1391626347, 0),
(875, 1, 3, 'enrol/manual:enrol', 1, 1391626347, 0),
(876, 1, 1, 'enrol/manual:manage', 1, 1391626348, 0),
(877, 1, 3, 'enrol/manual:manage', 1, 1391626348, 0),
(878, 1, 1, 'enrol/manual:unenrol', 1, 1391626348, 0),
(879, 1, 3, 'enrol/manual:unenrol', 1, 1391626348, 0),
(880, 1, 1, 'enrol/meta:config', 1, 1391626348, 0),
(881, 1, 3, 'enrol/meta:config', 1, 1391626348, 0),
(882, 1, 1, 'enrol/meta:selectaslinked', 1, 1391626348, 0),
(883, 1, 1, 'enrol/meta:unenrol', 1, 1391626349, 0),
(884, 1, 1, 'enrol/paypal:config', 1, 1391626351, 0),
(885, 1, 1, 'enrol/paypal:manage', 1, 1391626351, 0),
(886, 1, 3, 'enrol/paypal:manage', 1, 1391626351, 0),
(887, 1, 1, 'enrol/paypal:unenrol', 1, 1391626351, 0),
(888, 1, 3, 'enrol/self:config', 1, 1391626351, 0),
(889, 1, 1, 'enrol/self:config', 1, 1391626352, 0),
(890, 1, 3, 'enrol/self:manage', 1, 1391626352, 0),
(891, 1, 1, 'enrol/self:manage', 1, 1391626352, 0),
(892, 1, 5, 'enrol/self:unenrolself', 1, 1391626352, 0),
(893, 1, 3, 'enrol/self:unenrol', 1, 1391626352, 0),
(894, 1, 1, 'enrol/self:unenrol', 1, 1391626352, 0),
(895, 1, 3, 'block/activity_modules:addinstance', 1, 1391626355, 0),
(896, 1, 1, 'block/activity_modules:addinstance', 1, 1391626355, 0),
(897, 1, 7, 'block/admin_bookmarks:myaddinstance', 1, 1391626355, 0);
INSERT INTO `mdl_role_capabilities` (`id`, `contextid`, `roleid`, `capability`, `permission`, `timemodified`, `modifierid`) VALUES
(898, 1, 3, 'block/admin_bookmarks:addinstance', 1, 1391626356, 0),
(899, 1, 1, 'block/admin_bookmarks:addinstance', 1, 1391626356, 0),
(900, 1, 3, 'block/badges:addinstance', 1, 1391626356, 0),
(901, 1, 1, 'block/badges:addinstance', 1, 1391626356, 0),
(902, 1, 7, 'block/badges:myaddinstance', 1, 1391626356, 0),
(903, 1, 3, 'block/blog_menu:addinstance', 1, 1391626357, 0),
(904, 1, 1, 'block/blog_menu:addinstance', 1, 1391626357, 0),
(905, 1, 3, 'block/blog_recent:addinstance', 1, 1391626357, 0),
(906, 1, 1, 'block/blog_recent:addinstance', 1, 1391626357, 0),
(907, 1, 3, 'block/blog_tags:addinstance', 1, 1391626359, 0),
(908, 1, 1, 'block/blog_tags:addinstance', 1, 1391626359, 0),
(909, 1, 7, 'block/calendar_month:myaddinstance', 1, 1391626359, 0),
(910, 1, 3, 'block/calendar_month:addinstance', 1, 1391626359, 0),
(911, 1, 1, 'block/calendar_month:addinstance', 1, 1391626359, 0),
(912, 1, 7, 'block/calendar_upcoming:myaddinstance', 1, 1391626360, 0),
(913, 1, 3, 'block/calendar_upcoming:addinstance', 1, 1391626360, 0),
(914, 1, 1, 'block/calendar_upcoming:addinstance', 1, 1391626360, 0),
(915, 1, 7, 'block/comments:myaddinstance', 1, 1391626360, 0),
(916, 1, 3, 'block/comments:addinstance', 1, 1391626360, 0),
(917, 1, 1, 'block/comments:addinstance', 1, 1391626360, 0),
(918, 1, 7, 'block/community:myaddinstance', 1, 1391626361, 0),
(919, 1, 3, 'block/community:addinstance', 1, 1391626361, 0),
(920, 1, 1, 'block/community:addinstance', 1, 1391626361, 0),
(921, 1, 3, 'block/completionstatus:addinstance', 1, 1391626362, 0),
(922, 1, 1, 'block/completionstatus:addinstance', 1, 1391626362, 0),
(923, 1, 7, 'block/course_list:myaddinstance', 1, 1391626362, 0),
(924, 1, 3, 'block/course_list:addinstance', 1, 1391626362, 0),
(925, 1, 1, 'block/course_list:addinstance', 1, 1391626362, 0),
(926, 1, 7, 'block/course_overview:myaddinstance', 1, 1391626363, 0),
(927, 1, 3, 'block/course_overview:addinstance', 1, 1391626363, 0),
(928, 1, 1, 'block/course_overview:addinstance', 1, 1391626363, 0),
(929, 1, 3, 'block/course_summary:addinstance', 1, 1391626363, 0),
(930, 1, 1, 'block/course_summary:addinstance', 1, 1391626363, 0),
(931, 1, 3, 'block/feedback:addinstance', 1, 1391626364, 0),
(932, 1, 1, 'block/feedback:addinstance', 1, 1391626364, 0),
(933, 1, 7, 'block/glossary_random:myaddinstance', 1, 1391626364, 0),
(934, 1, 3, 'block/glossary_random:addinstance', 1, 1391626365, 0),
(935, 1, 1, 'block/glossary_random:addinstance', 1, 1391626365, 0),
(936, 1, 7, 'block/html:myaddinstance', 1, 1391626365, 0),
(937, 1, 3, 'block/html:addinstance', 1, 1391626365, 0),
(938, 1, 1, 'block/html:addinstance', 1, 1391626365, 0),
(939, 1, 3, 'block/login:addinstance', 1, 1391626366, 0),
(940, 1, 1, 'block/login:addinstance', 1, 1391626366, 0),
(941, 1, 7, 'block/mentees:myaddinstance', 1, 1391626366, 0),
(942, 1, 3, 'block/mentees:addinstance', 1, 1391626366, 0),
(943, 1, 1, 'block/mentees:addinstance', 1, 1391626366, 0),
(944, 1, 7, 'block/messages:myaddinstance', 1, 1391626367, 0),
(945, 1, 3, 'block/messages:addinstance', 1, 1391626367, 0),
(946, 1, 1, 'block/messages:addinstance', 1, 1391626367, 0),
(947, 1, 7, 'block/mnet_hosts:myaddinstance', 1, 1391626368, 0),
(948, 1, 3, 'block/mnet_hosts:addinstance', 1, 1391626368, 0),
(949, 1, 1, 'block/mnet_hosts:addinstance', 1, 1391626368, 0),
(950, 1, 7, 'block/myprofile:myaddinstance', 1, 1391626368, 0),
(951, 1, 3, 'block/myprofile:addinstance', 1, 1391626368, 0),
(952, 1, 1, 'block/myprofile:addinstance', 1, 1391626368, 0),
(953, 1, 7, 'block/navigation:myaddinstance', 1, 1391626369, 0),
(954, 1, 3, 'block/navigation:addinstance', 1, 1391626370, 0),
(955, 1, 1, 'block/navigation:addinstance', 1, 1391626370, 0),
(956, 1, 7, 'block/news_items:myaddinstance', 1, 1391626371, 0),
(957, 1, 3, 'block/news_items:addinstance', 1, 1391626371, 0),
(958, 1, 1, 'block/news_items:addinstance', 1, 1391626371, 0),
(959, 1, 7, 'block/online_users:myaddinstance', 1, 1391626371, 0),
(960, 1, 3, 'block/online_users:addinstance', 1, 1391626371, 0),
(961, 1, 1, 'block/online_users:addinstance', 1, 1391626371, 0),
(962, 1, 7, 'block/online_users:viewlist', 1, 1391626372, 0),
(963, 1, 6, 'block/online_users:viewlist', 1, 1391626372, 0),
(964, 1, 5, 'block/online_users:viewlist', 1, 1391626372, 0),
(965, 1, 4, 'block/online_users:viewlist', 1, 1391626372, 0),
(966, 1, 3, 'block/online_users:viewlist', 1, 1391626372, 0),
(967, 1, 1, 'block/online_users:viewlist', 1, 1391626372, 0),
(968, 1, 3, 'block/participants:addinstance', 1, 1391626372, 0),
(969, 1, 1, 'block/participants:addinstance', 1, 1391626372, 0),
(970, 1, 7, 'block/private_files:myaddinstance', 1, 1391626373, 0),
(971, 1, 3, 'block/private_files:addinstance', 1, 1391626373, 0),
(972, 1, 1, 'block/private_files:addinstance', 1, 1391626373, 0),
(973, 1, 3, 'block/quiz_results:addinstance', 1, 1391626373, 0),
(974, 1, 1, 'block/quiz_results:addinstance', 1, 1391626373, 0),
(975, 1, 3, 'block/recent_activity:addinstance', 1, 1391626374, 0),
(976, 1, 1, 'block/recent_activity:addinstance', 1, 1391626374, 0),
(977, 1, 7, 'block/rss_client:myaddinstance', 1, 1391626374, 0),
(978, 1, 3, 'block/rss_client:addinstance', 1, 1391626375, 0),
(979, 1, 1, 'block/rss_client:addinstance', 1, 1391626375, 0),
(980, 1, 4, 'block/rss_client:manageownfeeds', 1, 1391626375, 0),
(981, 1, 3, 'block/rss_client:manageownfeeds', 1, 1391626375, 0),
(982, 1, 1, 'block/rss_client:manageownfeeds', 1, 1391626375, 0),
(983, 1, 1, 'block/rss_client:manageanyfeeds', 1, 1391626375, 0),
(984, 1, 3, 'block/search_forums:addinstance', 1, 1391626375, 0),
(985, 1, 1, 'block/search_forums:addinstance', 1, 1391626375, 0),
(986, 1, 3, 'block/section_links:addinstance', 1, 1391626376, 0),
(987, 1, 1, 'block/section_links:addinstance', 1, 1391626376, 0),
(988, 1, 3, 'block/selfcompletion:addinstance', 1, 1391626376, 0),
(989, 1, 1, 'block/selfcompletion:addinstance', 1, 1391626376, 0),
(990, 1, 7, 'block/settings:myaddinstance', 1, 1391626377, 0),
(991, 1, 3, 'block/settings:addinstance', 1, 1391626377, 0),
(992, 1, 1, 'block/settings:addinstance', 1, 1391626377, 0),
(993, 1, 3, 'block/site_main_menu:addinstance', 1, 1391626378, 0),
(994, 1, 1, 'block/site_main_menu:addinstance', 1, 1391626378, 0),
(995, 1, 3, 'block/social_activities:addinstance', 1, 1391626378, 0),
(996, 1, 1, 'block/social_activities:addinstance', 1, 1391626378, 0),
(997, 1, 3, 'block/tag_flickr:addinstance', 1, 1391626379, 0),
(998, 1, 1, 'block/tag_flickr:addinstance', 1, 1391626379, 0),
(999, 1, 3, 'block/tag_youtube:addinstance', 1, 1391626379, 0),
(1000, 1, 1, 'block/tag_youtube:addinstance', 1, 1391626379, 0),
(1001, 1, 7, 'block/tags:myaddinstance', 1, 1391626380, 0),
(1002, 1, 3, 'block/tags:addinstance', 1, 1391626380, 0),
(1003, 1, 1, 'block/tags:addinstance', 1, 1391626380, 0),
(1004, 1, 4, 'report/completion:view', 1, 1391626395, 0),
(1005, 1, 3, 'report/completion:view', 1, 1391626395, 0),
(1006, 1, 1, 'report/completion:view', 1, 1391626395, 0),
(1007, 1, 4, 'report/courseoverview:view', 1, 1391626396, 0),
(1008, 1, 3, 'report/courseoverview:view', 1, 1391626396, 0),
(1009, 1, 1, 'report/courseoverview:view', 1, 1391626396, 0),
(1010, 1, 4, 'report/log:view', 1, 1391626396, 0),
(1011, 1, 3, 'report/log:view', 1, 1391626396, 0),
(1012, 1, 1, 'report/log:view', 1, 1391626396, 0),
(1013, 1, 4, 'report/log:viewtoday', 1, 1391626397, 0),
(1014, 1, 3, 'report/log:viewtoday', 1, 1391626397, 0),
(1015, 1, 1, 'report/log:viewtoday', 1, 1391626397, 0),
(1016, 1, 4, 'report/loglive:view', 1, 1391626397, 0),
(1017, 1, 3, 'report/loglive:view', 1, 1391626397, 0),
(1018, 1, 1, 'report/loglive:view', 1, 1391626397, 0),
(1019, 1, 4, 'report/outline:view', 1, 1391626398, 0),
(1020, 1, 3, 'report/outline:view', 1, 1391626398, 0),
(1021, 1, 1, 'report/outline:view', 1, 1391626398, 0),
(1022, 1, 4, 'report/participation:view', 1, 1391626399, 0),
(1023, 1, 3, 'report/participation:view', 1, 1391626399, 0),
(1024, 1, 1, 'report/participation:view', 1, 1391626399, 0),
(1025, 1, 1, 'report/performance:view', 1, 1391626399, 0),
(1026, 1, 4, 'report/progress:view', 1, 1391626400, 0),
(1027, 1, 3, 'report/progress:view', 1, 1391626400, 0),
(1028, 1, 1, 'report/progress:view', 1, 1391626400, 0),
(1029, 1, 1, 'report/security:view', 1, 1391626401, 0),
(1030, 1, 4, 'report/stats:view', 1, 1391626402, 0),
(1031, 1, 3, 'report/stats:view', 1, 1391626402, 0),
(1032, 1, 1, 'report/stats:view', 1, 1391626402, 0),
(1033, 1, 4, 'gradeexport/ods:view', 1, 1391626402, 0),
(1034, 1, 3, 'gradeexport/ods:view', 1, 1391626402, 0),
(1035, 1, 1, 'gradeexport/ods:view', 1, 1391626402, 0),
(1036, 1, 1, 'gradeexport/ods:publish', 1, 1391626402, 0),
(1037, 1, 4, 'gradeexport/txt:view', 1, 1391626403, 0),
(1038, 1, 3, 'gradeexport/txt:view', 1, 1391626403, 0),
(1039, 1, 1, 'gradeexport/txt:view', 1, 1391626403, 0),
(1040, 1, 1, 'gradeexport/txt:publish', 1, 1391626403, 0),
(1041, 1, 4, 'gradeexport/xls:view', 1, 1391626404, 0),
(1042, 1, 3, 'gradeexport/xls:view', 1, 1391626404, 0),
(1043, 1, 1, 'gradeexport/xls:view', 1, 1391626405, 0),
(1044, 1, 1, 'gradeexport/xls:publish', 1, 1391626405, 0),
(1045, 1, 4, 'gradeexport/xml:view', 1, 1391626406, 0),
(1046, 1, 3, 'gradeexport/xml:view', 1, 1391626406, 0),
(1047, 1, 1, 'gradeexport/xml:view', 1, 1391626406, 0),
(1048, 1, 1, 'gradeexport/xml:publish', 1, 1391626407, 0),
(1049, 1, 3, 'gradeimport/csv:view', 1, 1391626407, 0),
(1050, 1, 1, 'gradeimport/csv:view', 1, 1391626407, 0),
(1051, 1, 3, 'gradeimport/xml:view', 1, 1391626408, 0),
(1052, 1, 1, 'gradeimport/xml:view', 1, 1391626408, 0),
(1053, 1, 1, 'gradeimport/xml:publish', 1, 1391626408, 0),
(1054, 1, 4, 'gradereport/grader:view', 1, 1391626408, 0),
(1055, 1, 3, 'gradereport/grader:view', 1, 1391626408, 0),
(1056, 1, 1, 'gradereport/grader:view', 1, 1391626408, 0),
(1057, 1, 4, 'gradereport/outcomes:view', 1, 1391626409, 0),
(1058, 1, 3, 'gradereport/outcomes:view', 1, 1391626409, 0),
(1059, 1, 1, 'gradereport/outcomes:view', 1, 1391626409, 0),
(1060, 1, 5, 'gradereport/overview:view', 1, 1391626410, 0),
(1061, 1, 1, 'gradereport/overview:view', 1, 1391626410, 0),
(1062, 1, 5, 'gradereport/user:view', 1, 1391626411, 0),
(1063, 1, 4, 'gradereport/user:view', 1, 1391626411, 0),
(1064, 1, 3, 'gradereport/user:view', 1, 1391626411, 0),
(1065, 1, 1, 'gradereport/user:view', 1, 1391626411, 0),
(1066, 1, 7, 'repository/alfresco:view', 1, 1391626433, 0),
(1067, 1, 7, 'repository/boxnet:view', 1, 1391626971, 0),
(1068, 1, 2, 'repository/coursefiles:view', 1, 1391626972, 0),
(1069, 1, 4, 'repository/coursefiles:view', 1, 1391626972, 0),
(1070, 1, 3, 'repository/coursefiles:view', 1, 1391626972, 0),
(1071, 1, 1, 'repository/coursefiles:view', 1, 1391626972, 0),
(1072, 1, 7, 'repository/dropbox:view', 1, 1391626972, 0),
(1073, 1, 7, 'repository/equella:view', 1, 1391626973, 0),
(1074, 1, 2, 'repository/filesystem:view', 1, 1391626973, 0),
(1075, 1, 4, 'repository/filesystem:view', 1, 1391626973, 0),
(1076, 1, 3, 'repository/filesystem:view', 1, 1391626973, 0),
(1077, 1, 1, 'repository/filesystem:view', 1, 1391626973, 0),
(1078, 1, 7, 'repository/flickr:view', 1, 1391626974, 0),
(1079, 1, 7, 'repository/flickr_public:view', 1, 1391626974, 0),
(1080, 1, 7, 'repository/googledocs:view', 1, 1391626975, 0),
(1081, 1, 2, 'repository/local:view', 1, 1391626975, 0),
(1082, 1, 4, 'repository/local:view', 1, 1391626975, 0),
(1083, 1, 3, 'repository/local:view', 1, 1391626975, 0),
(1084, 1, 1, 'repository/local:view', 1, 1391626975, 0),
(1085, 1, 7, 'repository/merlot:view', 1, 1391626976, 0),
(1086, 1, 7, 'repository/picasa:view', 1, 1391626976, 0),
(1087, 1, 7, 'repository/recent:view', 1, 1391626977, 0),
(1088, 1, 7, 'repository/s3:view', 1, 1391626977, 0),
(1089, 1, 7, 'repository/skydrive:view', 1, 1391626978, 0),
(1090, 1, 7, 'repository/upload:view', 1, 1391626980, 0),
(1091, 1, 7, 'repository/url:view', 1, 1391626981, 0),
(1092, 1, 7, 'repository/user:view', 1, 1391626981, 0),
(1093, 1, 2, 'repository/webdav:view', 1, 1391626982, 0),
(1094, 1, 4, 'repository/webdav:view', 1, 1391626982, 0),
(1095, 1, 3, 'repository/webdav:view', 1, 1391626982, 0),
(1096, 1, 1, 'repository/webdav:view', 1, 1391626982, 0),
(1097, 1, 7, 'repository/wikimedia:view', 1, 1391626983, 0),
(1098, 1, 7, 'repository/youtube:view', 1, 1391626983, 0),
(1099, 1, 1, 'tool/customlang:view', 1, 1391626996, 0),
(1100, 1, 1, 'tool/customlang:edit', 1, 1391626996, 0),
(1101, 1, 1, 'tool/uploaduser:uploaduserpictures', 1, 1391627002, 0),
(1102, 1, 3, 'booktool/importhtml:import', 1, 1391627022, 0),
(1103, 1, 1, 'booktool/importhtml:import', 1, 1391627022, 0),
(1104, 1, 6, 'booktool/print:print', 1, 1391627022, 0),
(1105, 1, 8, 'booktool/print:print', 1, 1391627022, 0),
(1106, 1, 5, 'booktool/print:print', 1, 1391627023, 0),
(1107, 1, 4, 'booktool/print:print', 1, 1391627023, 0),
(1108, 1, 3, 'booktool/print:print', 1, 1391627023, 0),
(1109, 1, 1, 'booktool/print:print', 1, 1391627023, 0),
(1110, 1, 4, 'quiz/grading:viewstudentnames', 1, 1391627028, 0),
(1111, 1, 3, 'quiz/grading:viewstudentnames', 1, 1391627028, 0),
(1112, 1, 1, 'quiz/grading:viewstudentnames', 1, 1391627028, 0),
(1113, 1, 4, 'quiz/grading:viewidnumber', 1, 1391627028, 0),
(1114, 1, 3, 'quiz/grading:viewidnumber', 1, 1391627028, 0),
(1115, 1, 1, 'quiz/grading:viewidnumber', 1, 1391627028, 0),
(1116, 1, 4, 'quiz/statistics:view', 1, 1391627030, 0),
(1117, 1, 3, 'quiz/statistics:view', 1, 1391627030, 0),
(1118, 1, 1, 'quiz/statistics:view', 1, 1391627030, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_context_levels`
--

CREATE TABLE IF NOT EXISTS `mdl_role_context_levels` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL,
  `contextlevel` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolecontleve_conrol_uix` (`contextlevel`,`roleid`),
  KEY `mdl_rolecontleve_rol_ix` (`roleid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Lists which roles can be assigned at which context levels. T' AUTO_INCREMENT=12 ;

--
-- Dumping data for table `mdl_role_context_levels`
--

INSERT INTO `mdl_role_context_levels` (`id`, `roleid`, `contextlevel`) VALUES
(1, 1, 10),
(4, 2, 10),
(2, 1, 40),
(5, 2, 40),
(3, 1, 50),
(6, 3, 50),
(8, 4, 50),
(10, 5, 50),
(7, 3, 70),
(9, 4, 70),
(11, 5, 70);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_names`
--

CREATE TABLE IF NOT EXISTS `mdl_role_names` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolename_rolcon_uix` (`roleid`,`contextid`),
  KEY `mdl_rolename_rol_ix` (`roleid`),
  KEY `mdl_rolename_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='role names in native strings' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_sortorder`
--

CREATE TABLE IF NOT EXISTS `mdl_role_sortorder` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `sortoder` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolesort_userolcon_uix` (`userid`,`roleid`,`contextid`),
  KEY `mdl_rolesort_use_ix` (`userid`),
  KEY `mdl_rolesort_rol_ix` (`roleid`),
  KEY `mdl_rolesort_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='sort order of course managers in a course' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scale`
--

CREATE TABLE IF NOT EXISTS `mdl_scale` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `scale` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scal_cou_ix` (`courseid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines grading scales' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `mdl_scale`
--

INSERT INTO `mdl_scale` (`id`, `courseid`, `userid`, `name`, `scale`, `description`, `descriptionformat`, `timemodified`) VALUES
(1, 0, 0, 'Separate and Connected ways of knowing', 'Mostly separate knowing,Separate and connected,Mostly connected knowing', 'The scale based on the theory of separate and connected knowing. This theory describes two different ways that we can evaluate and learn about the things we see and hear.<ul><li><strong>Separate knowers</strong> remain as objective as possible without including feelings and emotions. In a discussion with other people, they like to defend their own ideas, using logic to find holes in opponent''s ideas.</li><li><strong>Connected knowers</strong> are more sensitive to other people. They are skilled at empathy and tends to listen and ask questions until they feel they can connect and "understand things from their point of view". They learn by trying to share the experiences that led to the knowledge they find in other people.</li></ul>', 0, 1391763015);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scale_history`
--

CREATE TABLE IF NOT EXISTS `mdl_scale_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `scale` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_scalhist_act_ix` (`action`),
  KEY `mdl_scalhist_old_ix` (`oldid`),
  KEY `mdl_scalhist_cou_ix` (`courseid`),
  KEY `mdl_scalhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='History table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `scormtype` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'local',
  `reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `version` varchar(9) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `maxgrade` double NOT NULL DEFAULT '0',
  `grademethod` tinyint(2) NOT NULL DEFAULT '0',
  `whatgrade` bigint(10) NOT NULL DEFAULT '0',
  `maxattempt` bigint(10) NOT NULL DEFAULT '1',
  `forcecompleted` tinyint(1) NOT NULL DEFAULT '1',
  `forcenewattempt` tinyint(1) NOT NULL DEFAULT '0',
  `lastattemptlock` tinyint(1) NOT NULL DEFAULT '0',
  `displayattemptstatus` tinyint(1) NOT NULL DEFAULT '1',
  `displaycoursestructure` tinyint(1) NOT NULL DEFAULT '1',
  `updatefreq` tinyint(1) NOT NULL DEFAULT '0',
  `sha1hash` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `md5hash` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `launch` bigint(10) NOT NULL DEFAULT '0',
  `skipview` tinyint(1) NOT NULL DEFAULT '1',
  `hidebrowse` tinyint(1) NOT NULL DEFAULT '0',
  `hidetoc` tinyint(1) NOT NULL DEFAULT '0',
  `nav` tinyint(1) NOT NULL DEFAULT '1',
  `navpositionleft` bigint(10) DEFAULT '-100',
  `navpositiontop` bigint(10) DEFAULT '-100',
  `auto` tinyint(1) NOT NULL DEFAULT '0',
  `popup` tinyint(1) NOT NULL DEFAULT '0',
  `options` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `width` bigint(10) NOT NULL DEFAULT '100',
  `height` bigint(10) NOT NULL DEFAULT '600',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionstatusrequired` tinyint(1) DEFAULT NULL,
  `completionscorerequired` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_scor_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='each table is one SCORM module and its configuration' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_aicc_session`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_aicc_session` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `scormid` bigint(10) NOT NULL DEFAULT '0',
  `hacpsession` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `scoid` bigint(10) DEFAULT '0',
  `scormmode` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scormstatus` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempt` bigint(10) DEFAULT NULL,
  `lessonstatus` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sessiontime` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scoraiccsess_sco_ix` (`scormid`),
  KEY `mdl_scoraiccsess_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Used by AICC HACP to store session information' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_scoes`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_scoes` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scorm` bigint(10) NOT NULL DEFAULT '0',
  `manifest` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `organization` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parent` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `identifier` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `launch` longtext COLLATE utf8_unicode_ci NOT NULL,
  `scormtype` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scorscoe_sco_ix` (`scorm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='each SCO part of the SCORM module' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_scoes_data`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_scoes_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_scorscoedata_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Contains variable data get from packages' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_scoes_track`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_scoes_track` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `scormid` bigint(10) NOT NULL DEFAULT '0',
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `attempt` bigint(10) NOT NULL DEFAULT '1',
  `element` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorscoetrac_usescosco_uix` (`userid`,`scormid`,`scoid`,`attempt`,`element`),
  KEY `mdl_scorscoetrac_use_ix` (`userid`),
  KEY `mdl_scorscoetrac_ele_ix` (`element`),
  KEY `mdl_scorscoetrac_sco_ix` (`scormid`),
  KEY `mdl_scorscoetrac_sco2_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='to track SCOes' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_mapinfo`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_mapinfo` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `objectiveid` bigint(10) NOT NULL DEFAULT '0',
  `targetobjectiveid` bigint(10) NOT NULL DEFAULT '0',
  `readsatisfiedstatus` tinyint(1) NOT NULL DEFAULT '1',
  `readnormalizedmeasure` tinyint(1) NOT NULL DEFAULT '1',
  `writesatisfiedstatus` tinyint(1) NOT NULL DEFAULT '0',
  `writenormalizedmeasure` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqmapi_scoidobj_uix` (`scoid`,`id`,`objectiveid`),
  KEY `mdl_scorseqmapi_sco_ix` (`scoid`),
  KEY `mdl_scorseqmapi_obj_ix` (`objectiveid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 objective mapinfo description' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_objective`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_objective` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `primaryobj` tinyint(1) NOT NULL DEFAULT '0',
  `objectiveid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `satisfiedbymeasure` tinyint(1) NOT NULL DEFAULT '1',
  `minnormalizedmeasure` float(11,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqobje_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqobje_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 objective description' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_rolluprule`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_rolluprule` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `childactivityset` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `minimumcount` bigint(10) NOT NULL DEFAULT '0',
  `minimumpercent` float(11,4) NOT NULL DEFAULT '0.0000',
  `conditioncombination` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `action` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqroll_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqroll_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 sequencing rule' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_rolluprulecond`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_rolluprulecond` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `rollupruleid` bigint(10) NOT NULL DEFAULT '0',
  `operator` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'noOp',
  `cond` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqroll_scorolid_uix` (`scoid`,`rollupruleid`,`id`),
  KEY `mdl_scorseqroll_sco2_ix` (`scoid`),
  KEY `mdl_scorseqroll_rol_ix` (`rollupruleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 sequencing rule' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_rulecond`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_rulecond` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `ruleconditionsid` bigint(10) NOT NULL DEFAULT '0',
  `refrencedobjective` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `measurethreshold` float(11,4) NOT NULL DEFAULT '0.0000',
  `operator` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'noOp',
  `cond` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'always',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqrule_idscorul_uix` (`id`,`scoid`,`ruleconditionsid`),
  KEY `mdl_scorseqrule_sco2_ix` (`scoid`),
  KEY `mdl_scorseqrule_rul_ix` (`ruleconditionsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 rule condition' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_ruleconds`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_ruleconds` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `conditioncombination` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `ruletype` tinyint(2) NOT NULL DEFAULT '0',
  `action` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqrule_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqrule_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 rule conditions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_sessions`
--

CREATE TABLE IF NOT EXISTS `mdl_sessions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `state` bigint(10) NOT NULL DEFAULT '0',
  `sid` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL,
  `sessdata` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `firstip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_sess_sid_uix` (`sid`),
  KEY `mdl_sess_sta_ix` (`state`),
  KEY `mdl_sess_tim_ix` (`timecreated`),
  KEY `mdl_sess_tim2_ix` (`timemodified`),
  KEY `mdl_sess_use_ix` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Database based session storage - now recommended' AUTO_INCREMENT=99 ;

--
-- Dumping data for table `mdl_sessions`
--

INSERT INTO `mdl_sessions` (`id`, `state`, `sid`, `userid`, `sessdata`, `timecreated`, `timemodified`, `firstip`, `lastip`) VALUES
(3, 0, '4r2kisqufci9q068440mgsf9s5', 2, NULL, 1391627050, 1391627227, '127.0.0.1', '127.0.0.1'),
(7, 0, 'iuj3b51crpqrstdkjnvc2atdv4', 2, NULL, 1391665148, 1391665952, '127.0.0.1', '127.0.0.1'),
(13, 0, 't2qo7mchv4jgopldqgqgt52ao7', 2, NULL, 1391675442, 1391675602, '127.0.0.1', '127.0.0.1'),
(15, 0, '4v1a4saeb6q7m5j4kvihral151', 2, NULL, 1391750136, 1391750828, '127.0.0.1', '127.0.0.1'),
(17, 0, 't41repo14ku0hqv9kq3u4n05u7', 2, NULL, 1391762263, 1391763487, '127.0.0.1', '127.0.0.1'),
(26, 0, 'dvqi80ht7ccko494qq4lkl1ga6', 0, NULL, 1391784812, 1391784813, '127.0.0.1', '127.0.0.1'),
(28, 0, '2m4vsvfqg2hsfmjrf8lbrs57j6', 2, NULL, 1391954700, 1391954701, '127.0.0.1', '127.0.0.1'),
(45, 0, '10llskdotbc5pbm2m29sh17rq3', 0, NULL, 1392024015, 1392024018, '127.0.0.1', '127.0.0.1'),
(47, 0, 'bsen5oqn5vpbj9e1idc825g3c6', 2, NULL, 1392055806, 1392057549, '127.0.0.1', '127.0.0.1'),
(50, 0, '86dj6ih6j9b94p8atjdrb77ut6', 0, NULL, 1392111184, 1392111185, '127.0.0.1', '127.0.0.1'),
(52, 0, '846dnnkmmpsqd3podfa4buq541', 2, NULL, 1392131453, 1392138925, '127.0.0.1', '127.0.0.1'),
(59, 0, '81hh5bnt94omcjj23hcj54tmu5', 0, NULL, 1392153380, 1392154806, '127.0.0.1', '127.0.0.1'),
(66, 0, 't8e27sv74qn0ujugtibrmflhd7', 0, NULL, 1392154510, 1392154510, '127.0.0.1', '127.0.0.1'),
(72, 0, 'ldqaldvapfu6tidld62s5v3hn0', 2, NULL, 1392184433, 1392184883, '127.0.0.1', '127.0.0.1'),
(73, 0, 'ge187k6u7dmhu6r53dikelfqo6', 0, NULL, 1392190838, 1392198664, '127.0.0.1', '127.0.0.1'),
(83, 0, '3pcjv9klurs41u36tjrofte000', 2, NULL, 1392216216, 1392216920, '127.0.0.1', '127.0.0.1'),
(86, 0, '56lsquifbufs91929r2ajmhhf7', 0, NULL, 1392221719, 1392221719, '127.0.0.1', '127.0.0.1'),
(87, 0, 'c8u6u06slnvk97k14qvh348ob4', 0, NULL, 1392233368, 1392233377, '127.0.0.1', '127.0.0.1'),
(92, 0, '2tbo1dhkbrimffktno3db2p470', 0, NULL, 1392288919, 1392288920, '127.0.0.1', '127.0.0.1'),
(98, 0, '8io4eg34sb2rahmp97ir480h80', 2, NULL, 1392315467, 1392315761, '127.0.0.1', '127.0.0.1');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_daily`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_daily` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) NOT NULL DEFAULT '0',
  `stat2` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_statdail_cou_ix` (`courseid`),
  KEY `mdl_statdail_tim_ix` (`timeend`),
  KEY `mdl_statdail_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='to accumulate daily stats' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_monthly`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_monthly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) NOT NULL DEFAULT '0',
  `stat2` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_statmont_cou_ix` (`courseid`),
  KEY `mdl_statmont_tim_ix` (`timeend`),
  KEY `mdl_statmont_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To accumulate monthly stats' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_user_daily`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_user_daily` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `statsreads` bigint(10) NOT NULL DEFAULT '0',
  `statswrites` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_statuserdail_cou_ix` (`courseid`),
  KEY `mdl_statuserdail_use_ix` (`userid`),
  KEY `mdl_statuserdail_rol_ix` (`roleid`),
  KEY `mdl_statuserdail_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To accumulate daily stats per course/user' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_user_monthly`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_user_monthly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `statsreads` bigint(10) NOT NULL DEFAULT '0',
  `statswrites` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_statusermont_cou_ix` (`courseid`),
  KEY `mdl_statusermont_use_ix` (`userid`),
  KEY `mdl_statusermont_rol_ix` (`roleid`),
  KEY `mdl_statusermont_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To accumulate monthly stats per course/user' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_user_weekly`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_user_weekly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `statsreads` bigint(10) NOT NULL DEFAULT '0',
  `statswrites` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_statuserweek_cou_ix` (`courseid`),
  KEY `mdl_statuserweek_use_ix` (`userid`),
  KEY `mdl_statuserweek_rol_ix` (`roleid`),
  KEY `mdl_statuserweek_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To accumulate weekly stats per course/user' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_weekly`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_weekly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) NOT NULL DEFAULT '0',
  `stat2` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_statweek_cou_ix` (`courseid`),
  KEY `mdl_statweek_tim_ix` (`timeend`),
  KEY `mdl_statweek_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To accumulate weekly stats' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_survey`
--

CREATE TABLE IF NOT EXISTS `mdl_survey` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `template` bigint(10) NOT NULL DEFAULT '0',
  `days` mediumint(6) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `questions` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_surv_cou_ix` (`course`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each record is one SURVEY module with its configuration' AUTO_INCREMENT=6 ;

--
-- Dumping data for table `mdl_survey`
--

INSERT INTO `mdl_survey` (`id`, `course`, `template`, `days`, `timecreated`, `timemodified`, `name`, `intro`, `introformat`, `questions`) VALUES
(1, 0, 0, 0, 985017600, 985017600, 'collesaname', 'collesaintro', 0, '25,26,27,28,29,30,43,44'),
(2, 0, 0, 0, 985017600, 985017600, 'collespname', 'collespintro', 0, '31,32,33,34,35,36,43,44'),
(3, 0, 0, 0, 985017600, 985017600, 'collesapname', 'collesapintro', 0, '37,38,39,40,41,42,43,44'),
(4, 0, 0, 0, 985017600, 985017600, 'attlsname', 'attlsintro', 0, '65,67,68'),
(5, 0, 0, 0, 985017600, 985017600, 'ciqname', 'ciqintro', 0, '69,70,71,72,73');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_survey_analysis`
--

CREATE TABLE IF NOT EXISTS `mdl_survey_analysis` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `survey` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `notes` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_survanal_use_ix` (`userid`),
  KEY `mdl_survanal_sur_ix` (`survey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='text about each survey submission' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_survey_answers`
--

CREATE TABLE IF NOT EXISTS `mdl_survey_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `survey` bigint(10) NOT NULL DEFAULT '0',
  `question` bigint(10) NOT NULL DEFAULT '0',
  `time` bigint(10) NOT NULL DEFAULT '0',
  `answer1` longtext COLLATE utf8_unicode_ci NOT NULL,
  `answer2` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_survansw_use_ix` (`userid`),
  KEY `mdl_survansw_sur_ix` (`survey`),
  KEY `mdl_survansw_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='the answers to each questions filled by the users' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_survey_questions`
--

CREATE TABLE IF NOT EXISTS `mdl_survey_questions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shorttext` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `multi` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` smallint(3) NOT NULL DEFAULT '0',
  `options` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='the questions conforming one survey' AUTO_INCREMENT=74 ;

--
-- Dumping data for table `mdl_survey_questions`
--

INSERT INTO `mdl_survey_questions` (`id`, `text`, `shorttext`, `multi`, `intro`, `type`, `options`) VALUES
(1, 'colles1', 'colles1short', '', '', 1, 'scaletimes5'),
(2, 'colles2', 'colles2short', '', '', 1, 'scaletimes5'),
(3, 'colles3', 'colles3short', '', '', 1, 'scaletimes5'),
(4, 'colles4', 'colles4short', '', '', 1, 'scaletimes5'),
(5, 'colles5', 'colles5short', '', '', 1, 'scaletimes5'),
(6, 'colles6', 'colles6short', '', '', 1, 'scaletimes5'),
(7, 'colles7', 'colles7short', '', '', 1, 'scaletimes5'),
(8, 'colles8', 'colles8short', '', '', 1, 'scaletimes5'),
(9, 'colles9', 'colles9short', '', '', 1, 'scaletimes5'),
(10, 'colles10', 'colles10short', '', '', 1, 'scaletimes5'),
(11, 'colles11', 'colles11short', '', '', 1, 'scaletimes5'),
(12, 'colles12', 'colles12short', '', '', 1, 'scaletimes5'),
(13, 'colles13', 'colles13short', '', '', 1, 'scaletimes5'),
(14, 'colles14', 'colles14short', '', '', 1, 'scaletimes5'),
(15, 'colles15', 'colles15short', '', '', 1, 'scaletimes5'),
(16, 'colles16', 'colles16short', '', '', 1, 'scaletimes5'),
(17, 'colles17', 'colles17short', '', '', 1, 'scaletimes5'),
(18, 'colles18', 'colles18short', '', '', 1, 'scaletimes5'),
(19, 'colles19', 'colles19short', '', '', 1, 'scaletimes5'),
(20, 'colles20', 'colles20short', '', '', 1, 'scaletimes5'),
(21, 'colles21', 'colles21short', '', '', 1, 'scaletimes5'),
(22, 'colles22', 'colles22short', '', '', 1, 'scaletimes5'),
(23, 'colles23', 'colles23short', '', '', 1, 'scaletimes5'),
(24, 'colles24', 'colles24short', '', '', 1, 'scaletimes5'),
(25, 'collesm1', 'collesm1short', '1,2,3,4', 'collesmintro', 1, 'scaletimes5'),
(26, 'collesm2', 'collesm2short', '5,6,7,8', 'collesmintro', 1, 'scaletimes5'),
(27, 'collesm3', 'collesm3short', '9,10,11,12', 'collesmintro', 1, 'scaletimes5'),
(28, 'collesm4', 'collesm4short', '13,14,15,16', 'collesmintro', 1, 'scaletimes5'),
(29, 'collesm5', 'collesm5short', '17,18,19,20', 'collesmintro', 1, 'scaletimes5'),
(30, 'collesm6', 'collesm6short', '21,22,23,24', 'collesmintro', 1, 'scaletimes5'),
(31, 'collesm1', 'collesm1short', '1,2,3,4', 'collesmintro', 2, 'scaletimes5'),
(32, 'collesm2', 'collesm2short', '5,6,7,8', 'collesmintro', 2, 'scaletimes5'),
(33, 'collesm3', 'collesm3short', '9,10,11,12', 'collesmintro', 2, 'scaletimes5'),
(34, 'collesm4', 'collesm4short', '13,14,15,16', 'collesmintro', 2, 'scaletimes5'),
(35, 'collesm5', 'collesm5short', '17,18,19,20', 'collesmintro', 2, 'scaletimes5'),
(36, 'collesm6', 'collesm6short', '21,22,23,24', 'collesmintro', 2, 'scaletimes5'),
(37, 'collesm1', 'collesm1short', '1,2,3,4', 'collesmintro', 3, 'scaletimes5'),
(38, 'collesm2', 'collesm2short', '5,6,7,8', 'collesmintro', 3, 'scaletimes5'),
(39, 'collesm3', 'collesm3short', '9,10,11,12', 'collesmintro', 3, 'scaletimes5'),
(40, 'collesm4', 'collesm4short', '13,14,15,16', 'collesmintro', 3, 'scaletimes5'),
(41, 'collesm5', 'collesm5short', '17,18,19,20', 'collesmintro', 3, 'scaletimes5'),
(42, 'collesm6', 'collesm6short', '21,22,23,24', 'collesmintro', 3, 'scaletimes5'),
(43, 'howlong', '', '', '', 1, 'howlongoptions'),
(44, 'othercomments', '', '', '', 0, NULL),
(45, 'attls1', 'attls1short', '', '', 1, 'scaleagree5'),
(46, 'attls2', 'attls2short', '', '', 1, 'scaleagree5'),
(47, 'attls3', 'attls3short', '', '', 1, 'scaleagree5'),
(48, 'attls4', 'attls4short', '', '', 1, 'scaleagree5'),
(49, 'attls5', 'attls5short', '', '', 1, 'scaleagree5'),
(50, 'attls6', 'attls6short', '', '', 1, 'scaleagree5'),
(51, 'attls7', 'attls7short', '', '', 1, 'scaleagree5'),
(52, 'attls8', 'attls8short', '', '', 1, 'scaleagree5'),
(53, 'attls9', 'attls9short', '', '', 1, 'scaleagree5'),
(54, 'attls10', 'attls10short', '', '', 1, 'scaleagree5'),
(55, 'attls11', 'attls11short', '', '', 1, 'scaleagree5'),
(56, 'attls12', 'attls12short', '', '', 1, 'scaleagree5'),
(57, 'attls13', 'attls13short', '', '', 1, 'scaleagree5'),
(58, 'attls14', 'attls14short', '', '', 1, 'scaleagree5'),
(59, 'attls15', 'attls15short', '', '', 1, 'scaleagree5'),
(60, 'attls16', 'attls16short', '', '', 1, 'scaleagree5'),
(61, 'attls17', 'attls17short', '', '', 1, 'scaleagree5'),
(62, 'attls18', 'attls18short', '', '', 1, 'scaleagree5'),
(63, 'attls19', 'attls19short', '', '', 1, 'scaleagree5'),
(64, 'attls20', 'attls20short', '', '', 1, 'scaleagree5'),
(65, 'attlsm1', 'attlsm1', '45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64', 'attlsmintro', 1, 'scaleagree5'),
(66, '-', '-', '-', '-', 0, '-'),
(67, 'attlsm2', 'attlsm2', '63,62,59,57,55,49,52,50,48,47', 'attlsmintro', -1, 'scaleagree5'),
(68, 'attlsm3', 'attlsm3', '46,54,45,51,60,53,56,58,61,64', 'attlsmintro', -1, 'scaleagree5'),
(69, 'ciq1', 'ciq1short', '', '', 0, NULL),
(70, 'ciq2', 'ciq2short', '', '', 0, NULL),
(71, 'ciq3', 'ciq3short', '', '', 0, NULL),
(72, 'ciq4', 'ciq4short', '', '', 0, NULL),
(73, 'ciq5', 'ciq5short', '', '', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tag`
--

CREATE TABLE IF NOT EXISTS `mdl_tag` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rawname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tagtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `flag` smallint(4) DEFAULT '0',
  `timemodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_tag_nam_uix` (`name`),
  UNIQUE KEY `mdl_tag_idnam_uix` (`id`,`name`),
  KEY `mdl_tag_use_ix` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tag table - this generic table will replace the old "tags" t' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `mdl_tag`
--

INSERT INTO `mdl_tag` (`id`, `userid`, `name`, `rawname`, `tagtype`, `description`, `descriptionformat`, `flag`, `timemodified`) VALUES
(1, 2, 'assignment 1', 'assignment 1', 'default', NULL, 0, 0, 1391762743),
(2, 2, 'bollywood', 'bollywood', 'default', NULL, 0, 0, 1391775019),
(3, 2, 'youtube', 'youtube', 'default', NULL, 0, 0, 1391775019);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tag_correlation`
--

CREATE TABLE IF NOT EXISTS `mdl_tag_correlation` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `tagid` bigint(10) NOT NULL,
  `correlatedtags` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_tagcorr_tag_ix` (`tagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The rationale for the ''tag_correlation'' table is performance' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tag_instance`
--

CREATE TABLE IF NOT EXISTS `mdl_tag_instance` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `tagid` bigint(10) NOT NULL,
  `itemtype` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `tiuserid` bigint(10) NOT NULL DEFAULT '0',
  `ordering` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_taginst_iteitetagtiu_uix` (`itemtype`,`itemid`,`tagid`,`tiuserid`),
  KEY `mdl_taginst_tag_ix` (`tagid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='tag_instance table holds the information of associations bet' AUTO_INCREMENT=6 ;

--
-- Dumping data for table `mdl_tag_instance`
--

INSERT INTO `mdl_tag_instance` (`id`, `tagid`, `itemtype`, `itemid`, `tiuserid`, `ordering`, `timemodified`) VALUES
(1, 1, 'question', 2, 0, 0, 1391762743),
(2, 2, 'question', 4, 0, 0, 1391775019),
(3, 3, 'question', 4, 0, 1, 1391775019),
(4, 2, 'question', 5, 0, 0, 1391775267),
(5, 3, 'question', 5, 0, 1, 1391775267);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_timezone`
--

CREATE TABLE IF NOT EXISTS `mdl_timezone` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `year` bigint(11) NOT NULL DEFAULT '0',
  `tzrule` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gmtoff` bigint(11) NOT NULL DEFAULT '0',
  `dstoff` bigint(11) NOT NULL DEFAULT '0',
  `dst_month` tinyint(2) NOT NULL DEFAULT '0',
  `dst_startday` smallint(3) NOT NULL DEFAULT '0',
  `dst_weekday` smallint(3) NOT NULL DEFAULT '0',
  `dst_skipweeks` smallint(3) NOT NULL DEFAULT '0',
  `dst_time` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT '00:00',
  `std_month` tinyint(2) NOT NULL DEFAULT '0',
  `std_startday` smallint(3) NOT NULL DEFAULT '0',
  `std_weekday` smallint(3) NOT NULL DEFAULT '0',
  `std_skipweeks` smallint(3) NOT NULL DEFAULT '0',
  `std_time` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT '00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Rules for calculating local wall clock time for users' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_customlang`
--

CREATE TABLE IF NOT EXISTS `mdl_tool_customlang` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lang` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `componentid` bigint(10) NOT NULL,
  `stringid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `original` longtext COLLATE utf8_unicode_ci NOT NULL,
  `master` longtext COLLATE utf8_unicode_ci,
  `local` longtext COLLATE utf8_unicode_ci,
  `timemodified` bigint(10) NOT NULL,
  `timecustomized` bigint(10) DEFAULT NULL,
  `outdated` smallint(3) DEFAULT '0',
  `modified` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_toolcust_lancomstr_uix` (`lang`,`componentid`,`stringid`),
  KEY `mdl_toolcust_com_ix` (`componentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Contains the working checkout of all strings and their custo' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_customlang_components`
--

CREATE TABLE IF NOT EXISTS `mdl_tool_customlang_components` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Contains the list of all installed plugins that provide thei' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_upgrade_log`
--

CREATE TABLE IF NOT EXISTS `mdl_upgrade_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `type` bigint(10) NOT NULL,
  `plugin` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `version` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `targetversion` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `info` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `details` longtext COLLATE utf8_unicode_ci,
  `backtrace` longtext COLLATE utf8_unicode_ci,
  `userid` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_upgrlog_tim_ix` (`timemodified`),
  KEY `mdl_upgrlog_typtim_ix` (`type`,`timemodified`),
  KEY `mdl_upgrlog_use_ix` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Upgrade logging' AUTO_INCREMENT=965 ;

--
-- Dumping data for table `mdl_upgrade_log`
--

INSERT INTO `mdl_upgrade_log` (`id`, `type`, `plugin`, `version`, `targetversion`, `info`, `details`, `backtrace`, `userid`, `timemodified`) VALUES
(1, 0, 'core', '2013111801.05', '2013111801.05', 'Upgrade savepoint reached', NULL, '', 0, 1391626089),
(2, 0, 'core', '2013111801.05', '2013111801.05', 'Core installed', NULL, '', 0, 1391626199),
(3, 0, 'qtype_calculated', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626200),
(4, 0, 'qtype_calculated', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626203),
(5, 0, 'qtype_calculated', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626203),
(6, 0, 'qtype_calculatedmulti', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626203),
(7, 0, 'qtype_calculatedmulti', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626203),
(8, 0, 'qtype_calculatedmulti', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626203),
(9, 0, 'qtype_calculatedsimple', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626203),
(10, 0, 'qtype_calculatedsimple', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626203),
(11, 0, 'qtype_calculatedsimple', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626203),
(12, 0, 'qtype_description', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626204),
(13, 0, 'qtype_description', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626204),
(14, 0, 'qtype_description', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626204),
(15, 0, 'qtype_essay', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626204),
(16, 0, 'qtype_essay', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626204),
(17, 0, 'qtype_essay', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626204),
(18, 0, 'qtype_match', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626204),
(19, 0, 'qtype_match', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626205),
(20, 0, 'qtype_match', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626205),
(21, 0, 'qtype_missingtype', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626205),
(22, 0, 'qtype_missingtype', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626206),
(23, 0, 'qtype_missingtype', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626206),
(24, 0, 'qtype_multianswer', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626206),
(25, 0, 'qtype_multianswer', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626206),
(26, 0, 'qtype_multianswer', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626206),
(27, 0, 'qtype_multichoice', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626206),
(28, 0, 'qtype_multichoice', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626207),
(29, 0, 'qtype_multichoice', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626207),
(30, 0, 'qtype_numerical', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626207),
(31, 0, 'qtype_numerical', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626211),
(32, 0, 'qtype_numerical', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626211),
(33, 0, 'qtype_random', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626211),
(34, 0, 'qtype_random', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626211),
(35, 0, 'qtype_random', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626212),
(36, 0, 'qtype_randomsamatch', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626212),
(37, 0, 'qtype_randomsamatch', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626213),
(38, 0, 'qtype_randomsamatch', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626214),
(39, 0, 'qtype_shortanswer', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626214),
(40, 0, 'qtype_shortanswer', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626215),
(41, 0, 'qtype_shortanswer', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626215),
(42, 0, 'qtype_truefalse', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626215),
(43, 0, 'qtype_truefalse', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626216),
(44, 0, 'qtype_truefalse', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626217),
(45, 0, 'mod_assign', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626217),
(46, 0, 'mod_assign', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626225),
(47, 0, 'mod_assign', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626228),
(48, 0, 'mod_assignment', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626228),
(49, 0, 'mod_assignment', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626230),
(50, 0, 'mod_assignment', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626231),
(51, 0, 'mod_book', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626231),
(52, 0, 'mod_book', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626231),
(53, 0, 'mod_book', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626233),
(54, 0, 'mod_chat', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626233),
(55, 0, 'mod_chat', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626237),
(56, 0, 'mod_chat', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626238),
(57, 0, 'mod_choice', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626238),
(58, 0, 'mod_choice', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626240),
(59, 0, 'mod_choice', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626241),
(60, 0, 'mod_data', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626241),
(61, 0, 'mod_data', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626243),
(62, 0, 'mod_data', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626248),
(63, 0, 'mod_feedback', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626248),
(64, 0, 'mod_feedback', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626253),
(65, 0, 'mod_feedback', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626255),
(66, 0, 'mod_folder', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626255),
(67, 0, 'mod_folder', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626256),
(68, 0, 'mod_folder', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626258),
(69, 0, 'mod_forum', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626258),
(70, 0, 'mod_forum', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626262),
(71, 0, 'mod_forum', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626270),
(72, 0, 'mod_glossary', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626270),
(73, 0, 'mod_glossary', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626272),
(74, 0, 'mod_glossary', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626276),
(75, 0, 'mod_imscp', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626276),
(76, 0, 'mod_imscp', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626277),
(77, 0, 'mod_imscp', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626277),
(78, 0, 'mod_label', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626277),
(79, 0, 'mod_label', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626278),
(80, 0, 'mod_label', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626278),
(81, 0, 'mod_lesson', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626278),
(82, 0, 'mod_lesson', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626284),
(83, 0, 'mod_lesson', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626285),
(84, 0, 'mod_lti', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626285),
(85, 0, 'mod_lti', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626286),
(86, 0, 'mod_lti', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626288),
(87, 0, 'mod_page', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626288),
(88, 0, 'mod_page', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626288),
(89, 0, 'mod_page', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626289),
(90, 0, 'mod_quiz', NULL, '2013110501', 'Starting plugin installation', NULL, '', 0, 1391626289),
(91, 0, 'mod_quiz', '2013110501', '2013110501', 'Upgrade savepoint reached', NULL, '', 0, 1391626294),
(92, 0, 'mod_quiz', '2013110501', '2013110501', 'Plugin installed', NULL, '', 0, 1391626297),
(93, 0, 'mod_resource', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626297),
(94, 0, 'mod_resource', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626298),
(95, 0, 'mod_resource', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626298),
(96, 0, 'mod_scorm', NULL, '2013110501', 'Starting plugin installation', NULL, '', 0, 1391626298),
(97, 0, 'mod_scorm', '2013110501', '2013110501', 'Upgrade savepoint reached', NULL, '', 0, 1391626305),
(98, 0, 'mod_scorm', '2013110501', '2013110501', 'Plugin installed', NULL, '', 0, 1391626307),
(99, 0, 'mod_survey', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626307),
(100, 0, 'mod_survey', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626309),
(101, 0, 'mod_survey', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626314),
(102, 0, 'mod_url', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626314),
(103, 0, 'mod_url', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626315),
(104, 0, 'mod_url', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626315),
(105, 0, 'mod_wiki', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626316),
(106, 0, 'mod_wiki', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626318),
(107, 0, 'mod_wiki', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626321),
(108, 0, 'mod_workshop', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626321),
(109, 0, 'mod_workshop', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626329),
(110, 0, 'mod_workshop', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626333),
(111, 0, 'auth_cas', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626333),
(112, 0, 'auth_cas', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626333),
(113, 0, 'auth_cas', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626333),
(114, 0, 'auth_db', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626333),
(115, 0, 'auth_db', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626333),
(116, 0, 'auth_db', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626334),
(117, 0, 'auth_email', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626334),
(118, 0, 'auth_email', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626334),
(119, 0, 'auth_email', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626334),
(120, 0, 'auth_fc', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626334),
(121, 0, 'auth_fc', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626334),
(122, 0, 'auth_fc', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626334),
(123, 0, 'auth_imap', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626334),
(124, 0, 'auth_imap', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626334),
(125, 0, 'auth_imap', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626335),
(126, 0, 'auth_ldap', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626335),
(127, 0, 'auth_ldap', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626335),
(128, 0, 'auth_ldap', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626336),
(129, 0, 'auth_manual', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626336),
(130, 0, 'auth_manual', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626336),
(131, 0, 'auth_manual', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626336),
(132, 0, 'auth_mnet', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626336),
(133, 0, 'auth_mnet', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626336),
(134, 0, 'auth_mnet', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626339),
(135, 0, 'auth_nntp', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626339),
(136, 0, 'auth_nntp', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626339),
(137, 0, 'auth_nntp', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626339),
(138, 0, 'auth_nologin', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626339),
(139, 0, 'auth_nologin', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626339),
(140, 0, 'auth_nologin', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626339),
(141, 0, 'auth_none', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626339),
(142, 0, 'auth_none', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626340),
(143, 0, 'auth_none', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626340),
(144, 0, 'auth_pam', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626340),
(145, 0, 'auth_pam', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626340),
(146, 0, 'auth_pam', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626340),
(147, 0, 'auth_pop3', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626340),
(148, 0, 'auth_pop3', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626340),
(149, 0, 'auth_pop3', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626340),
(150, 0, 'auth_radius', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626341),
(151, 0, 'auth_radius', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626341),
(152, 0, 'auth_radius', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626341),
(153, 0, 'auth_shibboleth', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626341),
(154, 0, 'auth_shibboleth', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626341),
(155, 0, 'auth_shibboleth', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626341),
(156, 0, 'auth_webservice', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626341),
(157, 0, 'auth_webservice', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626341),
(158, 0, 'auth_webservice', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626341),
(159, 0, 'calendartype_gregorian', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626342),
(160, 0, 'calendartype_gregorian', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626342),
(161, 0, 'calendartype_gregorian', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626342),
(162, 0, 'enrol_category', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626342),
(163, 0, 'enrol_category', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626342),
(164, 0, 'enrol_category', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626342),
(165, 0, 'enrol_cohort', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626342),
(166, 0, 'enrol_cohort', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626342),
(167, 0, 'enrol_cohort', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626343),
(168, 0, 'enrol_database', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626343),
(169, 0, 'enrol_database', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626343),
(170, 0, 'enrol_database', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626343),
(171, 0, 'enrol_flatfile', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626343),
(172, 0, 'enrol_flatfile', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626344),
(173, 0, 'enrol_flatfile', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626345),
(174, 0, 'enrol_guest', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626345),
(175, 0, 'enrol_guest', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626345),
(176, 0, 'enrol_guest', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626345),
(177, 0, 'enrol_imsenterprise', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626345),
(178, 0, 'enrol_imsenterprise', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626345),
(179, 0, 'enrol_imsenterprise', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626346),
(180, 0, 'enrol_ldap', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626346),
(181, 0, 'enrol_ldap', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626346),
(182, 0, 'enrol_ldap', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626346),
(183, 0, 'enrol_manual', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626346),
(184, 0, 'enrol_manual', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626346),
(185, 0, 'enrol_manual', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626348),
(186, 0, 'enrol_meta', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626348),
(187, 0, 'enrol_meta', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626348),
(188, 0, 'enrol_meta', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626349),
(189, 0, 'enrol_mnet', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626349),
(190, 0, 'enrol_mnet', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626349),
(191, 0, 'enrol_mnet', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626350),
(192, 0, 'enrol_paypal', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626350),
(193, 0, 'enrol_paypal', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626351),
(194, 0, 'enrol_paypal', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626351),
(195, 0, 'enrol_self', NULL, '2013110501', 'Starting plugin installation', NULL, '', 0, 1391626351),
(196, 0, 'enrol_self', '2013110501', '2013110501', 'Upgrade savepoint reached', NULL, '', 0, 1391626351),
(197, 0, 'enrol_self', '2013110501', '2013110501', 'Plugin installed', NULL, '', 0, 1391626352),
(198, 0, 'message_email', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626352),
(199, 0, 'message_email', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626352),
(200, 0, 'message_email', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626353),
(201, 0, 'message_jabber', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626353),
(202, 0, 'message_jabber', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626353),
(203, 0, 'message_jabber', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626354),
(204, 0, 'message_popup', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626354),
(205, 0, 'message_popup', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626354),
(206, 0, 'message_popup', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626355),
(207, 0, 'block_activity_modules', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626355),
(208, 0, 'block_activity_modules', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626355),
(209, 0, 'block_activity_modules', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626355),
(210, 0, 'block_admin_bookmarks', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626355),
(211, 0, 'block_admin_bookmarks', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626355),
(212, 0, 'block_admin_bookmarks', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626356),
(213, 0, 'block_badges', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626356),
(214, 0, 'block_badges', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626356),
(215, 0, 'block_badges', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626356),
(216, 0, 'block_blog_menu', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626356),
(217, 0, 'block_blog_menu', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626356),
(218, 0, 'block_blog_menu', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626357),
(219, 0, 'block_blog_recent', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626357),
(220, 0, 'block_blog_recent', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626357),
(221, 0, 'block_blog_recent', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626357),
(222, 0, 'block_blog_tags', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626357),
(223, 0, 'block_blog_tags', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626357),
(224, 0, 'block_blog_tags', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626359),
(225, 0, 'block_calendar_month', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626359),
(226, 0, 'block_calendar_month', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626359),
(227, 0, 'block_calendar_month', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626359),
(228, 0, 'block_calendar_upcoming', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626360),
(229, 0, 'block_calendar_upcoming', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626360),
(230, 0, 'block_calendar_upcoming', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626360),
(231, 0, 'block_comments', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626360),
(232, 0, 'block_comments', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626360),
(233, 0, 'block_comments', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626361),
(234, 0, 'block_community', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626361),
(235, 0, 'block_community', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626361),
(236, 0, 'block_community', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626361),
(237, 0, 'block_completionstatus', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626361),
(238, 0, 'block_completionstatus', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626362),
(239, 0, 'block_completionstatus', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626362),
(240, 0, 'block_course_list', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626362),
(241, 0, 'block_course_list', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626362),
(242, 0, 'block_course_list', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626362),
(243, 0, 'block_course_overview', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626362),
(244, 0, 'block_course_overview', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626363),
(245, 0, 'block_course_overview', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626363),
(246, 0, 'block_course_summary', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626363),
(247, 0, 'block_course_summary', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626363),
(248, 0, 'block_course_summary', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626363),
(249, 0, 'block_feedback', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626364),
(250, 0, 'block_feedback', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626364),
(251, 0, 'block_feedback', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626364),
(252, 0, 'block_glossary_random', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626364),
(253, 0, 'block_glossary_random', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626364),
(254, 0, 'block_glossary_random', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626365),
(255, 0, 'block_html', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626365),
(256, 0, 'block_html', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626365),
(257, 0, 'block_html', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626365),
(258, 0, 'block_login', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626365),
(259, 0, 'block_login', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626365),
(260, 0, 'block_login', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626366),
(261, 0, 'block_mentees', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626366),
(262, 0, 'block_mentees', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626366),
(263, 0, 'block_mentees', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626366),
(264, 0, 'block_messages', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626366),
(265, 0, 'block_messages', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626367),
(266, 0, 'block_messages', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626367),
(267, 0, 'block_mnet_hosts', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626367),
(268, 0, 'block_mnet_hosts', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626367),
(269, 0, 'block_mnet_hosts', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626368),
(270, 0, 'block_myprofile', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626368),
(271, 0, 'block_myprofile', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626368),
(272, 0, 'block_myprofile', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626368),
(273, 0, 'block_navigation', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626369),
(274, 0, 'block_navigation', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626369),
(275, 0, 'block_navigation', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626370),
(276, 0, 'block_news_items', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626370),
(277, 0, 'block_news_items', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626371),
(278, 0, 'block_news_items', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626371),
(279, 0, 'block_online_users', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626371),
(280, 0, 'block_online_users', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626371),
(281, 0, 'block_online_users', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626372),
(282, 0, 'block_participants', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626372),
(283, 0, 'block_participants', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626372),
(284, 0, 'block_participants', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626372),
(285, 0, 'block_private_files', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626372),
(286, 0, 'block_private_files', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626373),
(287, 0, 'block_private_files', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626373),
(288, 0, 'block_quiz_results', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626373),
(289, 0, 'block_quiz_results', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626373),
(290, 0, 'block_quiz_results', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626373),
(291, 0, 'block_recent_activity', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626374),
(292, 0, 'block_recent_activity', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626374),
(293, 0, 'block_recent_activity', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626374),
(294, 0, 'block_rss_client', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626374),
(295, 0, 'block_rss_client', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626374),
(296, 0, 'block_rss_client', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626375),
(297, 0, 'block_search_forums', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626375),
(298, 0, 'block_search_forums', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626375),
(299, 0, 'block_search_forums', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626376),
(300, 0, 'block_section_links', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626376),
(301, 0, 'block_section_links', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626376),
(302, 0, 'block_section_links', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626376),
(303, 0, 'block_selfcompletion', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626376),
(304, 0, 'block_selfcompletion', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626376),
(305, 0, 'block_selfcompletion', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626377),
(306, 0, 'block_settings', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626377),
(307, 0, 'block_settings', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626377),
(308, 0, 'block_settings', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626377),
(309, 0, 'block_site_main_menu', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626377),
(310, 0, 'block_site_main_menu', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626377),
(311, 0, 'block_site_main_menu', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626378),
(312, 0, 'block_social_activities', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626378),
(313, 0, 'block_social_activities', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626378),
(314, 0, 'block_social_activities', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626378),
(315, 0, 'block_tag_flickr', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626378),
(316, 0, 'block_tag_flickr', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626379),
(317, 0, 'block_tag_flickr', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626379),
(318, 0, 'block_tag_youtube', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626379),
(319, 0, 'block_tag_youtube', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626379),
(320, 0, 'block_tag_youtube', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626379),
(321, 0, 'block_tags', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626379),
(322, 0, 'block_tags', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626380),
(323, 0, 'block_tags', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626380),
(324, 0, 'filter_activitynames', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626383),
(325, 0, 'filter_activitynames', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626383),
(326, 0, 'filter_activitynames', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626383),
(327, 0, 'filter_algebra', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626383),
(328, 0, 'filter_algebra', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626383),
(329, 0, 'filter_algebra', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626383),
(330, 0, 'filter_censor', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626383),
(331, 0, 'filter_censor', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626384),
(332, 0, 'filter_censor', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626384),
(333, 0, 'filter_data', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626384),
(334, 0, 'filter_data', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626384),
(335, 0, 'filter_data', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626384),
(336, 0, 'filter_emailprotect', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626384),
(337, 0, 'filter_emailprotect', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626384),
(338, 0, 'filter_emailprotect', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626384),
(339, 0, 'filter_emoticon', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626384),
(340, 0, 'filter_emoticon', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626384),
(341, 0, 'filter_emoticon', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626385),
(342, 0, 'filter_glossary', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626385),
(343, 0, 'filter_glossary', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626385),
(344, 0, 'filter_glossary', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626385),
(345, 0, 'filter_mediaplugin', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626385),
(346, 0, 'filter_mediaplugin', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626385),
(347, 0, 'filter_mediaplugin', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626385),
(348, 0, 'filter_multilang', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626385),
(349, 0, 'filter_multilang', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626386),
(350, 0, 'filter_multilang', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626386),
(351, 0, 'filter_tex', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626386),
(352, 0, 'filter_tex', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626386),
(353, 0, 'filter_tex', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626386),
(354, 0, 'filter_tidy', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626386),
(355, 0, 'filter_tidy', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626386),
(356, 0, 'filter_tidy', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626387),
(357, 0, 'filter_urltolink', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626387),
(358, 0, 'filter_urltolink', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626387),
(359, 0, 'filter_urltolink', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626387),
(360, 0, 'editor_textarea', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626387),
(361, 0, 'editor_textarea', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626387),
(362, 0, 'editor_textarea', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626387),
(363, 0, 'editor_tinymce', NULL, '2013110600', 'Starting plugin installation', NULL, '', 0, 1391626387),
(364, 0, 'editor_tinymce', '2013110600', '2013110600', 'Upgrade savepoint reached', NULL, '', 0, 1391626387),
(365, 0, 'editor_tinymce', '2013110600', '2013110600', 'Plugin installed', NULL, '', 0, 1391626387),
(366, 0, 'format_singleactivity', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626387),
(367, 0, 'format_singleactivity', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626387),
(368, 0, 'format_singleactivity', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626388),
(369, 0, 'format_social', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626388),
(370, 0, 'format_social', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626388),
(371, 0, 'format_social', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626388),
(372, 0, 'format_topics', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626388),
(373, 0, 'format_topics', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626389),
(374, 0, 'format_topics', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626389),
(375, 0, 'format_weeks', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626389),
(376, 0, 'format_weeks', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626389),
(377, 0, 'format_weeks', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626390),
(378, 0, 'profilefield_checkbox', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626390),
(379, 0, 'profilefield_checkbox', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626390),
(380, 0, 'profilefield_checkbox', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626390),
(381, 0, 'profilefield_datetime', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626390),
(382, 0, 'profilefield_datetime', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626391),
(383, 0, 'profilefield_datetime', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626391),
(384, 0, 'profilefield_menu', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626391),
(385, 0, 'profilefield_menu', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626391),
(386, 0, 'profilefield_menu', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626392),
(387, 0, 'profilefield_text', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626392),
(388, 0, 'profilefield_text', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626392),
(389, 0, 'profilefield_text', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626393),
(390, 0, 'profilefield_textarea', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626393),
(391, 0, 'profilefield_textarea', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626394),
(392, 0, 'profilefield_textarea', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626394),
(393, 0, 'report_backups', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626394),
(394, 0, 'report_backups', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626394),
(395, 0, 'report_backups', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626394),
(396, 0, 'report_completion', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626394),
(397, 0, 'report_completion', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626394),
(398, 0, 'report_completion', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626395),
(399, 0, 'report_configlog', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626395),
(400, 0, 'report_configlog', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626395),
(401, 0, 'report_configlog', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626395),
(402, 0, 'report_courseoverview', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626395),
(403, 0, 'report_courseoverview', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626395),
(404, 0, 'report_courseoverview', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626396),
(405, 0, 'report_log', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626396),
(406, 0, 'report_log', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626396),
(407, 0, 'report_log', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626397),
(408, 0, 'report_loglive', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626397),
(409, 0, 'report_loglive', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626397),
(410, 0, 'report_loglive', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626398),
(411, 0, 'report_outline', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626398),
(412, 0, 'report_outline', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626398),
(413, 0, 'report_outline', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626398),
(414, 0, 'report_participation', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626398),
(415, 0, 'report_participation', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626399),
(416, 0, 'report_participation', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626399),
(417, 0, 'report_performance', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626399),
(418, 0, 'report_performance', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626399),
(419, 0, 'report_performance', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626400),
(420, 0, 'report_progress', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626400),
(421, 0, 'report_progress', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626400),
(422, 0, 'report_progress', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626400),
(423, 0, 'report_questioninstances', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626400),
(424, 0, 'report_questioninstances', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626400),
(425, 0, 'report_questioninstances', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626401),
(426, 0, 'report_security', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626401),
(427, 0, 'report_security', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626401),
(428, 0, 'report_security', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626401),
(429, 0, 'report_stats', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626401),
(430, 0, 'report_stats', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626401),
(431, 0, 'report_stats', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626402),
(432, 0, 'gradeexport_ods', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626402),
(433, 0, 'gradeexport_ods', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626402),
(434, 0, 'gradeexport_ods', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626403),
(435, 0, 'gradeexport_txt', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626403),
(436, 0, 'gradeexport_txt', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626403),
(437, 0, 'gradeexport_txt', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626403),
(438, 0, 'gradeexport_xls', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626403),
(439, 0, 'gradeexport_xls', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626403),
(440, 0, 'gradeexport_xls', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626406),
(441, 0, 'gradeexport_xml', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626406),
(442, 0, 'gradeexport_xml', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626406),
(443, 0, 'gradeexport_xml', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626407),
(444, 0, 'gradeimport_csv', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626407),
(445, 0, 'gradeimport_csv', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626407),
(446, 0, 'gradeimport_csv', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626407),
(447, 0, 'gradeimport_xml', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626407),
(448, 0, 'gradeimport_xml', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626408),
(449, 0, 'gradeimport_xml', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626408),
(450, 0, 'gradereport_grader', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626408),
(451, 0, 'gradereport_grader', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626408),
(452, 0, 'gradereport_grader', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626409),
(453, 0, 'gradereport_outcomes', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626409),
(454, 0, 'gradereport_outcomes', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626409),
(455, 0, 'gradereport_outcomes', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626409),
(456, 0, 'gradereport_overview', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626409),
(457, 0, 'gradereport_overview', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626409),
(458, 0, 'gradereport_overview', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626410),
(459, 0, 'gradereport_user', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626410),
(460, 0, 'gradereport_user', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626411),
(461, 0, 'gradereport_user', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626411),
(462, 0, 'gradingform_guide', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626412),
(463, 0, 'gradingform_guide', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626415),
(464, 0, 'gradingform_guide', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626416),
(465, 0, 'gradingform_rubric', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626416),
(466, 0, 'gradingform_rubric', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626424),
(467, 0, 'gradingform_rubric', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626425),
(468, 0, 'mnetservice_enrol', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626425),
(469, 0, 'mnetservice_enrol', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626426),
(470, 0, 'mnetservice_enrol', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626426),
(471, 0, 'webservice_amf', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626426),
(472, 0, 'webservice_amf', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626426),
(473, 0, 'webservice_amf', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626426),
(474, 0, 'webservice_rest', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626427),
(475, 0, 'webservice_rest', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626427),
(476, 0, 'webservice_rest', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626427),
(477, 0, 'webservice_soap', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626428),
(478, 0, 'webservice_soap', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626429),
(479, 0, 'webservice_soap', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626430),
(480, 0, 'webservice_xmlrpc', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626430),
(481, 0, 'webservice_xmlrpc', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626431);
INSERT INTO `mdl_upgrade_log` (`id`, `type`, `plugin`, `version`, `targetversion`, `info`, `details`, `backtrace`, `userid`, `timemodified`) VALUES
(482, 0, 'webservice_xmlrpc', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626431),
(483, 0, 'repository_alfresco', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626432),
(484, 0, 'repository_alfresco', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626432),
(485, 0, 'repository_alfresco', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626434),
(486, 0, 'repository_areafiles', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626434),
(487, 0, 'repository_areafiles', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626435),
(488, 0, 'repository_boxnet', NULL, '2013110700', 'Starting plugin installation', NULL, '', 0, 1391626970),
(489, 0, 'repository_boxnet', '2013110700', '2013110700', 'Upgrade savepoint reached', NULL, '', 0, 1391626971),
(490, 0, 'repository_boxnet', '2013110700', '2013110700', 'Plugin installed', NULL, '', 0, 1391626971),
(491, 0, 'repository_coursefiles', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626971),
(492, 0, 'repository_coursefiles', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626972),
(493, 0, 'repository_coursefiles', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626972),
(494, 0, 'repository_dropbox', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626972),
(495, 0, 'repository_dropbox', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626972),
(496, 0, 'repository_dropbox', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626972),
(497, 0, 'repository_equella', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626973),
(498, 0, 'repository_equella', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626973),
(499, 0, 'repository_equella', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626973),
(500, 0, 'repository_filesystem', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626973),
(501, 0, 'repository_filesystem', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626973),
(502, 0, 'repository_filesystem', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626973),
(503, 0, 'repository_flickr', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626973),
(504, 0, 'repository_flickr', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626974),
(505, 0, 'repository_flickr', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626974),
(506, 0, 'repository_flickr_public', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626974),
(507, 0, 'repository_flickr_public', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626974),
(508, 0, 'repository_flickr_public', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626974),
(509, 0, 'repository_googledocs', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626974),
(510, 0, 'repository_googledocs', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626974),
(511, 0, 'repository_googledocs', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626975),
(512, 0, 'repository_local', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626975),
(513, 0, 'repository_local', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626975),
(514, 0, 'repository_local', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626976),
(515, 0, 'repository_merlot', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626976),
(516, 0, 'repository_merlot', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626976),
(517, 0, 'repository_merlot', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626976),
(518, 0, 'repository_picasa', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626976),
(519, 0, 'repository_picasa', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626976),
(520, 0, 'repository_picasa', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626976),
(521, 0, 'repository_recent', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626976),
(522, 0, 'repository_recent', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626976),
(523, 0, 'repository_recent', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626977),
(524, 0, 'repository_s3', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626977),
(525, 0, 'repository_s3', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626977),
(526, 0, 'repository_s3', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626977),
(527, 0, 'repository_skydrive', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626977),
(528, 0, 'repository_skydrive', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626978),
(529, 0, 'repository_skydrive', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626978),
(530, 0, 'repository_upload', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626978),
(531, 0, 'repository_upload', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626978),
(532, 0, 'repository_upload', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626980),
(533, 0, 'repository_url', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626980),
(534, 0, 'repository_url', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626980),
(535, 0, 'repository_url', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626981),
(536, 0, 'repository_user', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626981),
(537, 0, 'repository_user', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626981),
(538, 0, 'repository_user', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626982),
(539, 0, 'repository_webdav', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626982),
(540, 0, 'repository_webdav', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626982),
(541, 0, 'repository_webdav', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626982),
(542, 0, 'repository_wikimedia', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626982),
(543, 0, 'repository_wikimedia', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626982),
(544, 0, 'repository_wikimedia', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626983),
(545, 0, 'repository_youtube', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626983),
(546, 0, 'repository_youtube', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626983),
(547, 0, 'repository_youtube', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626983),
(548, 0, 'portfolio_boxnet', NULL, '2013110602', 'Starting plugin installation', NULL, '', 0, 1391626984),
(549, 0, 'portfolio_boxnet', '2013110602', '2013110602', 'Upgrade savepoint reached', NULL, '', 0, 1391626984),
(550, 0, 'portfolio_boxnet', '2013110602', '2013110602', 'Plugin installed', NULL, '', 0, 1391626984),
(551, 0, 'portfolio_download', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626984),
(552, 0, 'portfolio_download', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626984),
(553, 0, 'portfolio_download', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626984),
(554, 0, 'portfolio_flickr', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626984),
(555, 0, 'portfolio_flickr', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626984),
(556, 0, 'portfolio_flickr', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626984),
(557, 0, 'portfolio_googledocs', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626984),
(558, 0, 'portfolio_googledocs', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626985),
(559, 0, 'portfolio_googledocs', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626985),
(560, 0, 'portfolio_mahara', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626985),
(561, 0, 'portfolio_mahara', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626985),
(562, 0, 'portfolio_mahara', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626986),
(563, 0, 'portfolio_picasa', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626986),
(564, 0, 'portfolio_picasa', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626986),
(565, 0, 'portfolio_picasa', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626986),
(566, 0, 'qbehaviour_adaptive', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626986),
(567, 0, 'qbehaviour_adaptive', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626987),
(568, 0, 'qbehaviour_adaptive', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626987),
(569, 0, 'qbehaviour_adaptivenopenalty', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626987),
(570, 0, 'qbehaviour_adaptivenopenalty', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626987),
(571, 0, 'qbehaviour_adaptivenopenalty', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626987),
(572, 0, 'qbehaviour_deferredcbm', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626987),
(573, 0, 'qbehaviour_deferredcbm', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626987),
(574, 0, 'qbehaviour_deferredcbm', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626987),
(575, 0, 'qbehaviour_deferredfeedback', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626987),
(576, 0, 'qbehaviour_deferredfeedback', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626987),
(577, 0, 'qbehaviour_deferredfeedback', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626988),
(578, 0, 'qbehaviour_immediatecbm', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626988),
(579, 0, 'qbehaviour_immediatecbm', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626988),
(580, 0, 'qbehaviour_immediatecbm', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626988),
(581, 0, 'qbehaviour_immediatefeedback', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626988),
(582, 0, 'qbehaviour_immediatefeedback', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626988),
(583, 0, 'qbehaviour_immediatefeedback', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626988),
(584, 0, 'qbehaviour_informationitem', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626988),
(585, 0, 'qbehaviour_informationitem', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626988),
(586, 0, 'qbehaviour_informationitem', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626989),
(587, 0, 'qbehaviour_interactive', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626989),
(588, 0, 'qbehaviour_interactive', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626989),
(589, 0, 'qbehaviour_interactive', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626989),
(590, 0, 'qbehaviour_interactivecountback', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626989),
(591, 0, 'qbehaviour_interactivecountback', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626989),
(592, 0, 'qbehaviour_interactivecountback', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626989),
(593, 0, 'qbehaviour_manualgraded', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626989),
(594, 0, 'qbehaviour_manualgraded', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626989),
(595, 0, 'qbehaviour_manualgraded', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626990),
(596, 0, 'qbehaviour_missing', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626990),
(597, 0, 'qbehaviour_missing', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626991),
(598, 0, 'qbehaviour_missing', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626991),
(599, 0, 'qformat_aiken', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626991),
(600, 0, 'qformat_aiken', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626991),
(601, 0, 'qformat_aiken', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626992),
(602, 0, 'qformat_blackboard_six', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626992),
(603, 0, 'qformat_blackboard_six', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626992),
(604, 0, 'qformat_blackboard_six', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626992),
(605, 0, 'qformat_examview', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626992),
(606, 0, 'qformat_examview', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626992),
(607, 0, 'qformat_examview', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626992),
(608, 0, 'qformat_gift', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626992),
(609, 0, 'qformat_gift', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626992),
(610, 0, 'qformat_gift', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626992),
(611, 0, 'qformat_learnwise', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626993),
(612, 0, 'qformat_learnwise', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626993),
(613, 0, 'qformat_learnwise', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626993),
(614, 0, 'qformat_missingword', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626993),
(615, 0, 'qformat_missingword', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626993),
(616, 0, 'qformat_missingword', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626993),
(617, 0, 'qformat_multianswer', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626993),
(618, 0, 'qformat_multianswer', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626993),
(619, 0, 'qformat_multianswer', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626993),
(620, 0, 'qformat_webct', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626993),
(621, 0, 'qformat_webct', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626994),
(622, 0, 'qformat_webct', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626994),
(623, 0, 'qformat_xhtml', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626994),
(624, 0, 'qformat_xhtml', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626994),
(625, 0, 'qformat_xhtml', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626994),
(626, 0, 'qformat_xml', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626994),
(627, 0, 'qformat_xml', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626994),
(628, 0, 'qformat_xml', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626994),
(629, 0, 'tool_assignmentupgrade', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626994),
(630, 0, 'tool_assignmentupgrade', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626994),
(631, 0, 'tool_assignmentupgrade', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626995),
(632, 0, 'tool_behat', NULL, '2013110501', 'Starting plugin installation', NULL, '', 0, 1391626995),
(633, 0, 'tool_behat', '2013110501', '2013110501', 'Upgrade savepoint reached', NULL, '', 0, 1391626995),
(634, 0, 'tool_behat', '2013110501', '2013110501', 'Plugin installed', NULL, '', 0, 1391626995),
(635, 0, 'tool_capability', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626995),
(636, 0, 'tool_capability', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626995),
(637, 0, 'tool_capability', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626995),
(638, 0, 'tool_customlang', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626995),
(639, 0, 'tool_customlang', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626996),
(640, 0, 'tool_customlang', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626996),
(641, 0, 'tool_dbtransfer', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626996),
(642, 0, 'tool_dbtransfer', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626997),
(643, 0, 'tool_dbtransfer', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626997),
(644, 0, 'tool_generator', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626997),
(645, 0, 'tool_generator', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626997),
(646, 0, 'tool_generator', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626997),
(647, 0, 'tool_health', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626997),
(648, 0, 'tool_health', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626997),
(649, 0, 'tool_health', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626997),
(650, 0, 'tool_innodb', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626997),
(651, 0, 'tool_innodb', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626997),
(652, 0, 'tool_innodb', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626998),
(653, 0, 'tool_installaddon', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626998),
(654, 0, 'tool_installaddon', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626998),
(655, 0, 'tool_installaddon', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626998),
(656, 0, 'tool_langimport', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626998),
(657, 0, 'tool_langimport', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626998),
(658, 0, 'tool_langimport', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626998),
(659, 0, 'tool_multilangupgrade', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626998),
(660, 0, 'tool_multilangupgrade', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626998),
(661, 0, 'tool_multilangupgrade', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626998),
(662, 0, 'tool_phpunit', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626999),
(663, 0, 'tool_phpunit', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626999),
(664, 0, 'tool_phpunit', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626999),
(665, 0, 'tool_profiling', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626999),
(666, 0, 'tool_profiling', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626999),
(667, 0, 'tool_profiling', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626999),
(668, 0, 'tool_qeupgradehelper', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391626999),
(669, 0, 'tool_qeupgradehelper', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391626999),
(670, 0, 'tool_qeupgradehelper', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391626999),
(671, 0, 'tool_replace', NULL, '2013110501', 'Starting plugin installation', NULL, '', 0, 1391627000),
(672, 0, 'tool_replace', '2013110501', '2013110501', 'Upgrade savepoint reached', NULL, '', 0, 1391627000),
(673, 0, 'tool_replace', '2013110501', '2013110501', 'Plugin installed', NULL, '', 0, 1391627000),
(674, 0, 'tool_spamcleaner', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627000),
(675, 0, 'tool_spamcleaner', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627000),
(676, 0, 'tool_spamcleaner', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627000),
(677, 0, 'tool_timezoneimport', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627000),
(678, 0, 'tool_timezoneimport', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627000),
(679, 0, 'tool_timezoneimport', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627000),
(680, 0, 'tool_unsuproles', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627000),
(681, 0, 'tool_unsuproles', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627000),
(682, 0, 'tool_unsuproles', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627001),
(683, 0, 'tool_uploadcourse', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627001),
(684, 0, 'tool_uploadcourse', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627001),
(685, 0, 'tool_uploadcourse', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627001),
(686, 0, 'tool_uploaduser', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627001),
(687, 0, 'tool_uploaduser', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627001),
(688, 0, 'tool_uploaduser', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627002),
(689, 0, 'tool_xmldb', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627002),
(690, 0, 'tool_xmldb', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627003),
(691, 0, 'tool_xmldb', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627003),
(692, 0, 'cachestore_file', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627003),
(693, 0, 'cachestore_file', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627003),
(694, 0, 'cachestore_file', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627003),
(695, 0, 'cachestore_memcache', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627003),
(696, 0, 'cachestore_memcache', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627003),
(697, 0, 'cachestore_memcache', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627003),
(698, 0, 'cachestore_memcached', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627003),
(699, 0, 'cachestore_memcached', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627003),
(700, 0, 'cachestore_memcached', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627004),
(701, 0, 'cachestore_mongodb', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627004),
(702, 0, 'cachestore_mongodb', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627004),
(703, 0, 'cachestore_mongodb', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627004),
(704, 0, 'cachestore_session', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627004),
(705, 0, 'cachestore_session', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627004),
(706, 0, 'cachestore_session', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627004),
(707, 0, 'cachestore_static', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627004),
(708, 0, 'cachestore_static', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627004),
(709, 0, 'cachestore_static', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627004),
(710, 0, 'cachelock_file', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627004),
(711, 0, 'cachelock_file', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627005),
(712, 0, 'cachelock_file', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627005),
(713, 0, 'theme_afterburner', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627005),
(714, 0, 'theme_afterburner', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627005),
(715, 0, 'theme_afterburner', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627005),
(716, 0, 'theme_anomaly', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627005),
(717, 0, 'theme_anomaly', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627005),
(718, 0, 'theme_anomaly', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627005),
(719, 0, 'theme_arialist', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627005),
(720, 0, 'theme_arialist', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627005),
(721, 0, 'theme_arialist', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627006),
(722, 0, 'theme_base', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627006),
(723, 0, 'theme_base', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627006),
(724, 0, 'theme_base', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627006),
(725, 0, 'theme_binarius', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627006),
(726, 0, 'theme_binarius', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627006),
(727, 0, 'theme_binarius', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627006),
(728, 0, 'theme_bootstrapbase', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627006),
(729, 0, 'theme_bootstrapbase', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627006),
(730, 0, 'theme_bootstrapbase', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627006),
(731, 0, 'theme_boxxie', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627006),
(732, 0, 'theme_boxxie', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627007),
(733, 0, 'theme_boxxie', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627007),
(734, 0, 'theme_brick', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627007),
(735, 0, 'theme_brick', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627007),
(736, 0, 'theme_brick', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627007),
(737, 0, 'theme_canvas', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627007),
(738, 0, 'theme_canvas', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627007),
(739, 0, 'theme_canvas', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627007),
(740, 0, 'theme_clean', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627007),
(741, 0, 'theme_clean', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627007),
(742, 0, 'theme_clean', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627008),
(743, 0, 'theme_formal_white', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627008),
(744, 0, 'theme_formal_white', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627008),
(745, 0, 'theme_formal_white', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627008),
(746, 0, 'theme_formfactor', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627008),
(747, 0, 'theme_formfactor', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627008),
(748, 0, 'theme_formfactor', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627008),
(749, 0, 'theme_fusion', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627008),
(750, 0, 'theme_fusion', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627008),
(751, 0, 'theme_fusion', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627009),
(752, 0, 'theme_leatherbound', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627009),
(753, 0, 'theme_leatherbound', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627009),
(754, 0, 'theme_leatherbound', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627009),
(755, 0, 'theme_magazine', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627009),
(756, 0, 'theme_magazine', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627009),
(757, 0, 'theme_magazine', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627009),
(758, 0, 'theme_nimble', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627009),
(759, 0, 'theme_nimble', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627009),
(760, 0, 'theme_nimble', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627009),
(761, 0, 'theme_nonzero', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627009),
(762, 0, 'theme_nonzero', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627010),
(763, 0, 'theme_nonzero', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627010),
(764, 0, 'theme_overlay', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627010),
(765, 0, 'theme_overlay', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627010),
(766, 0, 'theme_overlay', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627010),
(767, 0, 'theme_serenity', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627010),
(768, 0, 'theme_serenity', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627010),
(769, 0, 'theme_serenity', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627010),
(770, 0, 'theme_sky_high', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627010),
(771, 0, 'theme_sky_high', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627010),
(772, 0, 'theme_sky_high', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627010),
(773, 0, 'theme_splash', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627011),
(774, 0, 'theme_splash', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627011),
(775, 0, 'theme_splash', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627011),
(776, 0, 'theme_standard', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627011),
(777, 0, 'theme_standard', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627011),
(778, 0, 'theme_standard', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627011),
(779, 0, 'theme_standardold', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627011),
(780, 0, 'theme_standardold', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627011),
(781, 0, 'theme_standardold', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627011),
(782, 0, 'assignsubmission_comments', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627011),
(783, 0, 'assignsubmission_comments', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627011),
(784, 0, 'assignsubmission_comments', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627012),
(785, 0, 'assignsubmission_file', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627012),
(786, 0, 'assignsubmission_file', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627014),
(787, 0, 'assignsubmission_file', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627014),
(788, 0, 'assignsubmission_onlinetext', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627014),
(789, 0, 'assignsubmission_onlinetext', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627015),
(790, 0, 'assignsubmission_onlinetext', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627015),
(791, 0, 'assignfeedback_comments', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627015),
(792, 0, 'assignfeedback_comments', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627016),
(793, 0, 'assignfeedback_comments', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627016),
(794, 0, 'assignfeedback_editpdf', NULL, '2013110800', 'Starting plugin installation', NULL, '', 0, 1391627017),
(795, 0, 'assignfeedback_editpdf', '2013110800', '2013110800', 'Upgrade savepoint reached', NULL, '', 0, 1391627018),
(796, 0, 'assignfeedback_editpdf', '2013110800', '2013110800', 'Plugin installed', NULL, '', 0, 1391627019),
(797, 0, 'assignfeedback_file', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627019),
(798, 0, 'assignfeedback_file', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627019),
(799, 0, 'assignfeedback_file', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627020),
(800, 0, 'assignfeedback_offline', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627020),
(801, 0, 'assignfeedback_offline', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627020),
(802, 0, 'assignfeedback_offline', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627020),
(803, 0, 'assignment_offline', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627020),
(804, 0, 'assignment_offline', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627020),
(805, 0, 'assignment_offline', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627020),
(806, 0, 'assignment_online', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627020),
(807, 0, 'assignment_online', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627021),
(808, 0, 'assignment_online', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627021),
(809, 0, 'assignment_upload', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627021),
(810, 0, 'assignment_upload', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627021),
(811, 0, 'assignment_upload', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627021),
(812, 0, 'assignment_uploadsingle', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627021),
(813, 0, 'assignment_uploadsingle', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627021),
(814, 0, 'assignment_uploadsingle', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627021),
(815, 0, 'booktool_exportimscp', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627021),
(816, 0, 'booktool_exportimscp', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627021),
(817, 0, 'booktool_exportimscp', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627022),
(818, 0, 'booktool_importhtml', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627022),
(819, 0, 'booktool_importhtml', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627022),
(820, 0, 'booktool_importhtml', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627022),
(821, 0, 'booktool_print', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627022),
(822, 0, 'booktool_print', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627022),
(823, 0, 'booktool_print', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627023),
(824, 0, 'datafield_checkbox', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627023),
(825, 0, 'datafield_checkbox', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627023),
(826, 0, 'datafield_checkbox', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627023),
(827, 0, 'datafield_date', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627023),
(828, 0, 'datafield_date', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627023),
(829, 0, 'datafield_date', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627023),
(830, 0, 'datafield_file', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627023),
(831, 0, 'datafield_file', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627024),
(832, 0, 'datafield_file', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627024),
(833, 0, 'datafield_latlong', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627024),
(834, 0, 'datafield_latlong', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627024),
(835, 0, 'datafield_latlong', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627024),
(836, 0, 'datafield_menu', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627024),
(837, 0, 'datafield_menu', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627024),
(838, 0, 'datafield_menu', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627024),
(839, 0, 'datafield_multimenu', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627024),
(840, 0, 'datafield_multimenu', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627024),
(841, 0, 'datafield_multimenu', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627025),
(842, 0, 'datafield_number', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627025),
(843, 0, 'datafield_number', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627025),
(844, 0, 'datafield_number', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627026),
(845, 0, 'datafield_picture', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627026),
(846, 0, 'datafield_picture', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627026),
(847, 0, 'datafield_picture', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627026),
(848, 0, 'datafield_radiobutton', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627026),
(849, 0, 'datafield_radiobutton', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627026),
(850, 0, 'datafield_radiobutton', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627026),
(851, 0, 'datafield_text', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627026),
(852, 0, 'datafield_text', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627026),
(853, 0, 'datafield_text', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627026),
(854, 0, 'datafield_textarea', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627027),
(855, 0, 'datafield_textarea', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627027),
(856, 0, 'datafield_textarea', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627027),
(857, 0, 'datafield_url', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627027),
(858, 0, 'datafield_url', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627027),
(859, 0, 'datafield_url', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627027),
(860, 0, 'datapreset_imagegallery', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627027),
(861, 0, 'datapreset_imagegallery', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627027),
(862, 0, 'datapreset_imagegallery', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627027),
(863, 0, 'quiz_grading', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627027),
(864, 0, 'quiz_grading', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627028),
(865, 0, 'quiz_grading', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627028),
(866, 0, 'quiz_overview', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627028),
(867, 0, 'quiz_overview', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627029),
(868, 0, 'quiz_overview', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627029),
(869, 0, 'quiz_responses', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627029),
(870, 0, 'quiz_responses', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627029),
(871, 0, 'quiz_responses', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627029),
(872, 0, 'quiz_statistics', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627029),
(873, 0, 'quiz_statistics', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627030),
(874, 0, 'quiz_statistics', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627030),
(875, 0, 'quizaccess_delaybetweenattempts', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627030),
(876, 0, 'quizaccess_delaybetweenattempts', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627030),
(877, 0, 'quizaccess_delaybetweenattempts', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627030),
(878, 0, 'quizaccess_ipaddress', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627030),
(879, 0, 'quizaccess_ipaddress', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627030),
(880, 0, 'quizaccess_ipaddress', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627031),
(881, 0, 'quizaccess_numattempts', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627031),
(882, 0, 'quizaccess_numattempts', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627031),
(883, 0, 'quizaccess_numattempts', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627031),
(884, 0, 'quizaccess_openclosedate', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627031),
(885, 0, 'quizaccess_openclosedate', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627031),
(886, 0, 'quizaccess_openclosedate', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627031),
(887, 0, 'quizaccess_password', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627031),
(888, 0, 'quizaccess_password', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627031),
(889, 0, 'quizaccess_password', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627031),
(890, 0, 'quizaccess_safebrowser', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627031),
(891, 0, 'quizaccess_safebrowser', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627032),
(892, 0, 'quizaccess_safebrowser', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627032),
(893, 0, 'quizaccess_securewindow', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627032),
(894, 0, 'quizaccess_securewindow', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627032),
(895, 0, 'quizaccess_securewindow', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627032),
(896, 0, 'quizaccess_timelimit', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627032),
(897, 0, 'quizaccess_timelimit', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627032),
(898, 0, 'quizaccess_timelimit', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627032),
(899, 0, 'scormreport_basic', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627032),
(900, 0, 'scormreport_basic', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627032),
(901, 0, 'scormreport_basic', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627033),
(902, 0, 'scormreport_graphs', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627033),
(903, 0, 'scormreport_graphs', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627033),
(904, 0, 'scormreport_graphs', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627033),
(905, 0, 'scormreport_interactions', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627033),
(906, 0, 'scormreport_interactions', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627033),
(907, 0, 'scormreport_interactions', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627033),
(908, 0, 'scormreport_objectives', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627033),
(909, 0, 'scormreport_objectives', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627033),
(910, 0, 'scormreport_objectives', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627033),
(911, 0, 'workshopform_accumulative', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627033),
(912, 0, 'workshopform_accumulative', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627034),
(913, 0, 'workshopform_accumulative', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627034),
(914, 0, 'workshopform_comments', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627034),
(915, 0, 'workshopform_comments', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627035),
(916, 0, 'workshopform_comments', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627035),
(917, 0, 'workshopform_numerrors', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627035),
(918, 0, 'workshopform_numerrors', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627037),
(919, 0, 'workshopform_numerrors', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627037),
(920, 0, 'workshopform_rubric', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627037),
(921, 0, 'workshopform_rubric', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627038),
(922, 0, 'workshopform_rubric', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627038),
(923, 0, 'workshopallocation_manual', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627038),
(924, 0, 'workshopallocation_manual', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627039),
(925, 0, 'workshopallocation_manual', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627039),
(926, 0, 'workshopallocation_random', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627039),
(927, 0, 'workshopallocation_random', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627039),
(928, 0, 'workshopallocation_random', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627039),
(929, 0, 'workshopallocation_scheduled', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627039),
(930, 0, 'workshopallocation_scheduled', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627040),
(931, 0, 'workshopallocation_scheduled', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627040),
(932, 0, 'workshopeval_best', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627040),
(933, 0, 'workshopeval_best', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627040),
(934, 0, 'workshopeval_best', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627040),
(935, 0, 'tinymce_ctrlhelp', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627040),
(936, 0, 'tinymce_ctrlhelp', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627040),
(937, 0, 'tinymce_ctrlhelp', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627041),
(938, 0, 'tinymce_dragmath', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627041),
(939, 0, 'tinymce_dragmath', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627041),
(940, 0, 'tinymce_dragmath', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627041),
(941, 0, 'tinymce_managefiles', NULL, '2014010800', 'Starting plugin installation', NULL, '', 0, 1391627041),
(942, 0, 'tinymce_managefiles', '2014010800', '2014010800', 'Upgrade savepoint reached', NULL, '', 0, 1391627041),
(943, 0, 'tinymce_managefiles', '2014010800', '2014010800', 'Plugin installed', NULL, '', 0, 1391627041),
(944, 0, 'tinymce_moodleemoticon', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627041),
(945, 0, 'tinymce_moodleemoticon', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627041),
(946, 0, 'tinymce_moodleemoticon', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627041);
INSERT INTO `mdl_upgrade_log` (`id`, `type`, `plugin`, `version`, `targetversion`, `info`, `details`, `backtrace`, `userid`, `timemodified`) VALUES
(947, 0, 'tinymce_moodleimage', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627042),
(948, 0, 'tinymce_moodleimage', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627042),
(949, 0, 'tinymce_moodleimage', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627042),
(950, 0, 'tinymce_moodlemedia', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627042),
(951, 0, 'tinymce_moodlemedia', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627042),
(952, 0, 'tinymce_moodlemedia', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627042),
(953, 0, 'tinymce_moodlenolink', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627042),
(954, 0, 'tinymce_moodlenolink', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627042),
(955, 0, 'tinymce_moodlenolink', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627042),
(956, 0, 'tinymce_pdw', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627042),
(957, 0, 'tinymce_pdw', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627042),
(958, 0, 'tinymce_pdw', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627043),
(959, 0, 'tinymce_spellchecker', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627043),
(960, 0, 'tinymce_spellchecker', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627043),
(961, 0, 'tinymce_spellchecker', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627043),
(962, 0, 'tinymce_wrap', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1391627043),
(963, 0, 'tinymce_wrap', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1391627043),
(964, 0, 'tinymce_wrap', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1391627043);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_url`
--

CREATE TABLE IF NOT EXISTS `mdl_url` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `externalurl` longtext COLLATE utf8_unicode_ci NOT NULL,
  `display` smallint(4) NOT NULL DEFAULT '0',
  `displayoptions` longtext COLLATE utf8_unicode_ci,
  `parameters` longtext COLLATE utf8_unicode_ci,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_url_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='each record is one url resource' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user`
--

CREATE TABLE IF NOT EXISTS `mdl_user` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `auth` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'manual',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `policyagreed` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `mnethostid` bigint(10) NOT NULL DEFAULT '0',
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `firstname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lastname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `emailstop` tinyint(1) NOT NULL DEFAULT '0',
  `icq` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `skype` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `yahoo` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `aim` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `msn` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `phone1` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `phone2` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `institution` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `department` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(120) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `country` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lang` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en',
  `calendartype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'gregorian',
  `theme` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timezone` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '99',
  `firstaccess` bigint(10) NOT NULL DEFAULT '0',
  `lastaccess` bigint(10) NOT NULL DEFAULT '0',
  `lastlogin` bigint(10) NOT NULL DEFAULT '0',
  `currentlogin` bigint(10) NOT NULL DEFAULT '0',
  `lastip` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `secret` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `picture` bigint(10) NOT NULL DEFAULT '0',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '1',
  `mailformat` tinyint(1) NOT NULL DEFAULT '1',
  `maildigest` tinyint(1) NOT NULL DEFAULT '0',
  `maildisplay` tinyint(2) NOT NULL DEFAULT '2',
  `autosubscribe` tinyint(1) NOT NULL DEFAULT '1',
  `trackforums` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `trustbitmask` bigint(10) NOT NULL DEFAULT '0',
  `imagealt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastnamephonetic` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstnamephonetic` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `middlename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alternatename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_user_mneuse_uix` (`mnethostid`,`username`),
  KEY `mdl_user_del_ix` (`deleted`),
  KEY `mdl_user_con_ix` (`confirmed`),
  KEY `mdl_user_fir_ix` (`firstname`),
  KEY `mdl_user_las_ix` (`lastname`),
  KEY `mdl_user_cit_ix` (`city`),
  KEY `mdl_user_cou_ix` (`country`),
  KEY `mdl_user_las2_ix` (`lastaccess`),
  KEY `mdl_user_ema_ix` (`email`),
  KEY `mdl_user_aut_ix` (`auth`),
  KEY `mdl_user_idn_ix` (`idnumber`),
  KEY `mdl_user_fir2_ix` (`firstnamephonetic`),
  KEY `mdl_user_las3_ix` (`lastnamephonetic`),
  KEY `mdl_user_mid_ix` (`middlename`),
  KEY `mdl_user_alt_ix` (`alternatename`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='One record for each person' AUTO_INCREMENT=7 ;

--
-- Dumping data for table `mdl_user`
--

INSERT INTO `mdl_user` (`id`, `auth`, `confirmed`, `policyagreed`, `deleted`, `suspended`, `mnethostid`, `username`, `password`, `idnumber`, `firstname`, `lastname`, `email`, `emailstop`, `icq`, `skype`, `yahoo`, `aim`, `msn`, `phone1`, `phone2`, `institution`, `department`, `address`, `city`, `country`, `lang`, `calendartype`, `theme`, `timezone`, `firstaccess`, `lastaccess`, `lastlogin`, `currentlogin`, `lastip`, `secret`, `picture`, `url`, `description`, `descriptionformat`, `mailformat`, `maildigest`, `maildisplay`, `autosubscribe`, `trackforums`, `timecreated`, `timemodified`, `trustbitmask`, `imagealt`, `lastnamephonetic`, `firstnamephonetic`, `middlename`, `alternatename`) VALUES
(1, 'manual', 1, 0, 0, 0, 1, 'guest', '$2y$10$xhsufAF7s4Pd2qQPk17k8.mzxm6B4zS04V7imczBc0whu/lgC2z3C', '', 'Guest user', ' ', 'root@localhost', 0, '', '', '', '', '', '', '', '', '', '', '', '', 'en', 'gregorian', '', '99', 0, 0, 0, 0, '', '', 0, '', 'This user is a special user that allows read-only access to some courses.', 1, 1, 0, 2, 1, 0, 0, 1391626053, 0, NULL, NULL, NULL, NULL, NULL),
(2, 'manual', 1, 0, 0, 0, 1, 'admin', '$2y$10$bMd95EetXySN2cvm9ZKxpeV8kgALWPK5jEI6zR5Y.vl9B9FyONZA2', '', 'Chitrank', 'Dixit', 'chitrankdixit@gmail.com', 0, '', '', '', '', '', '', '', '', '', '', '', '', 'en', 'gregorian', '', '99', 1391627050, 1392315761, 1392303637, 1392315467, '127.0.0.1', '', 0, '', '', 1, 1, 0, 1, 1, 0, 0, 1392315467, 0, NULL, '', '', '', ''),
(3, 'email', 1, 0, 0, 0, 1, 'ankit', '$2y$10$0Yeqdlxd6ncG817g8mFPVe0Q8Htgr.Ofwk1yOZOiGyAGKnIFN.Dau', '', 'Ankit ', 'Kulkarni', 'ankitkul.1890@gmail.com', 0, '', '', '', '', '', '', '', '', '', '', '', '', 'en', 'gregorian', '', '99', 1391674183, 1392184305, 1392022729, 1392183636, '127.0.0.1', 'pvbnCkljD2po8Ss', 0, '', NULL, 1, 1, 0, 2, 1, 0, 1391674183, 1392183636, 0, NULL, '', '', '', ''),
(4, 'email', 1, 0, 0, 0, 1, 'bedi', '$2y$10$AuNxhKWgoSPdQlhJLA1/gem5WVkIjs8L5zuaNniUOzR4fhOGFcjkK', '', 'Bedi', 'Yadav', 'bediyadav.iips@gmail.com', 0, '', '', '', '', '', '', '', '', '', '', 'Indore', 'IN', 'en', 'gregorian', '', '99', 1392018001, 1392020033, 1392018163, 1392018284, '127.0.0.1', '10SmUcEYGRf9xci', 0, '', NULL, 1, 1, 0, 2, 1, 0, 1392018001, 1392018284, 0, NULL, '', '', '', ''),
(6, 'email', 0, 0, 0, 0, 1, 'qwerty', '$2y$10$im6iqOQaVtO3NKaEaKXkteVZZKLxn5/ZrmruOEiiTUw0T.o5qhJ0.', '', 'qwerty', 'input', 'rraikwarsunny@live.com', 0, '', '', '', '', '', '', '', '', '', '', 'indore', 'IN', 'en', 'gregorian', '', '99', 1392288244, 0, 0, 0, '', 'XFnOWMULCtad0Qw', 0, '', NULL, 1, 1, 0, 2, 1, 0, 1392288244, 1392288244, 0, NULL, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_devices`
--

CREATE TABLE IF NOT EXISTS `mdl_user_devices` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `appid` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `model` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `platform` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pushid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uuid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userdevi_pususe_uix` (`pushid`,`userid`),
  UNIQUE KEY `mdl_userdevi_puspla_uix` (`pushid`,`platform`),
  KEY `mdl_userdevi_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table stores user''s mobile devices information in order' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_enrolments`
--

CREATE TABLE IF NOT EXISTS `mdl_user_enrolments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `enrolid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '2147483647',
  `modifierid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userenro_enruse_uix` (`enrolid`,`userid`),
  KEY `mdl_userenro_enr_ix` (`enrolid`),
  KEY `mdl_userenro_use_ix` (`userid`),
  KEY `mdl_userenro_mod_ix` (`modifierid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Users participating in courses (aka enrolled users) - everyb' AUTO_INCREMENT=13 ;

--
-- Dumping data for table `mdl_user_enrolments`
--

INSERT INTO `mdl_user_enrolments` (`id`, `status`, `enrolid`, `userid`, `timestart`, `timeend`, `modifierid`, `timecreated`, `timemodified`) VALUES
(8, 0, 7, 2, 1392057000, 0, 2, 1392057552, 1392057552),
(9, 0, 7, 3, 1392057000, 0, 2, 1392057553, 1392057553),
(10, 0, 7, 4, 1392057000, 0, 2, 1392057555, 1392057555),
(11, 0, 10, 2, 1392143400, 0, 2, 1392216726, 1392216726),
(12, 0, 10, 3, 1392143400, 0, 2, 1392216728, 1392216728);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_info_category`
--

CREATE TABLE IF NOT EXISTS `mdl_user_info_category` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Customisable fields categories' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `mdl_user_info_category`
--

INSERT INTO `mdl_user_info_category` (`id`, `name`, `sortorder`) VALUES
(1, 'User Information', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_info_data`
--

CREATE TABLE IF NOT EXISTS `mdl_user_info_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `fieldid` bigint(10) NOT NULL DEFAULT '0',
  `data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `dataformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_userinfodata_usefie_ix` (`userid`,`fieldid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Data for the customisable user fields' AUTO_INCREMENT=17 ;

--
-- Dumping data for table `mdl_user_info_data`
--

INSERT INTO `mdl_user_info_data` (`id`, `userid`, `fieldid`, `data`, `dataformat`) VALUES
(1, 5, 1, '666901800', 0),
(2, 5, 2, 'male', 0),
(3, 5, 4, '9926490045', 0),
(4, 5, 5, '<p>Bapat</p>', 1),
(5, 5, 6, 'Graduate', 0),
(6, 5, 7, 'IIPS', 0),
(7, 5, 8, '<p>Bhawarkua</p>', 1),
(8, 5, 9, 'General', 0),
(9, 6, 1, '666383400', 0),
(10, 6, 2, 'male', 0),
(11, 6, 4, '122334455667787888', 0),
(12, 6, 5, '<p>qwertyuiop[sdfghjklczxnjh,jkluutgfascxcbgftrjgfjt</p>', 1),
(13, 6, 6, '5th', 0),
(14, 6, 7, 'qwwerrtttyyyuuiiopp;;llkjuhgfd', 0),
(15, 6, 8, '<p>qweertrtyuiopp[[;plokjhgfdsazxcvvbbnmm,..</p>', 1),
(16, 6, 9, 'OBC', 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_info_field`
--

CREATE TABLE IF NOT EXISTS `mdl_user_info_field` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'shortname',
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `datatype` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `categoryid` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `required` tinyint(2) NOT NULL DEFAULT '0',
  `locked` tinyint(2) NOT NULL DEFAULT '0',
  `visible` smallint(4) NOT NULL DEFAULT '0',
  `forceunique` tinyint(2) NOT NULL DEFAULT '0',
  `signup` tinyint(2) NOT NULL DEFAULT '0',
  `defaultdata` longtext COLLATE utf8_unicode_ci,
  `defaultdataformat` tinyint(2) NOT NULL DEFAULT '0',
  `param1` longtext COLLATE utf8_unicode_ci,
  `param2` longtext COLLATE utf8_unicode_ci,
  `param3` longtext COLLATE utf8_unicode_ci,
  `param4` longtext COLLATE utf8_unicode_ci,
  `param5` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Customisable user profile fields' AUTO_INCREMENT=10 ;

--
-- Dumping data for table `mdl_user_info_field`
--

INSERT INTO `mdl_user_info_field` (`id`, `shortname`, `name`, `datatype`, `description`, `descriptionformat`, `categoryid`, `sortorder`, `required`, `locked`, `visible`, `forceunique`, `signup`, `defaultdata`, `defaultdataformat`, `param1`, `param2`, `param3`, `param4`, `param5`) VALUES
(1, 'DOB', 'Date of Birth', 'datetime', '', 1, 1, 1, 1, 0, 2, 0, 1, '0', 0, '1990', '2014', NULL, NULL, NULL),
(2, 'Gender', 'Gender', 'menu', '', 1, 1, 2, 1, 0, 2, 0, 1, '', 0, 'male\nfemale', NULL, NULL, NULL, NULL),
(4, 'ContactNo', 'Contact No', 'text', '', 1, 1, 3, 1, 0, 2, 1, 1, '', 0, '10', '2048', '0', '', ''),
(5, 'Address', 'Address', 'textarea', '', 1, 1, 4, 1, 0, 2, 0, 1, '', 1, NULL, NULL, NULL, NULL, NULL),
(6, 'Class', 'Class', 'menu', '', 1, 1, 5, 1, 0, 2, 0, 1, '', 0, '5th\n6th\n7th\n8th\n9th\n10th\n11th\n12th\nGraduate\nPost Graduate', NULL, NULL, NULL, NULL),
(7, 'NameofSchool', 'Name of School', 'text', '', 1, 1, 6, 1, 0, 2, 0, 1, '', 0, '30', '2048', '0', '', ''),
(8, 'AddressofSchool', 'Address of School', 'textarea', '', 1, 1, 7, 1, 0, 2, 0, 1, '', 1, NULL, NULL, NULL, NULL, NULL),
(9, 'Category', 'Category', 'menu', '', 1, 1, 8, 1, 0, 2, 0, 1, '', 0, 'General\nSC\nST\nOBC', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_lastaccess`
--

CREATE TABLE IF NOT EXISTS `mdl_user_lastaccess` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeaccess` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userlast_usecou_uix` (`userid`,`courseid`),
  KEY `mdl_userlast_use_ix` (`userid`),
  KEY `mdl_userlast_cou_ix` (`courseid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To keep track of course page access times, used in online pa' AUTO_INCREMENT=10 ;

--
-- Dumping data for table `mdl_user_lastaccess`
--

INSERT INTO `mdl_user_lastaccess` (`id`, `userid`, `courseid`, `timeaccess`) VALUES
(7, 2, 4, 1392303774),
(8, 3, 4, 1392184308),
(9, 2, 5, 1392315761);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_password_resets`
--

CREATE TABLE IF NOT EXISTS `mdl_user_password_resets` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `timerequested` bigint(10) NOT NULL,
  `timererequested` bigint(10) NOT NULL DEFAULT '0',
  `token` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_userpassrese_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='table tracking password reset confirmation tokens' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_preferences`
--

CREATE TABLE IF NOT EXISTS `mdl_user_preferences` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(1333) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userpref_usenam_uix` (`userid`,`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Allows modules to store arbitrary user preferences' AUTO_INCREMENT=14 ;

--
-- Dumping data for table `mdl_user_preferences`
--

INSERT INTO `mdl_user_preferences` (`id`, `userid`, `name`, `value`) VALUES
(1, 2, 'htmleditor', ''),
(2, 2, 'email_bounce_count', '1'),
(3, 2, 'email_send_count', '1'),
(4, 2, 'question_bank_recurse', '1'),
(5, 2, 'question_bank_showhidden', '1'),
(6, 2, 'question_bank_qbshowtext', '1'),
(7, 2, 'quiz_qbanktool_open', '1'),
(8, 2, 'docked_block_instance_16', '0'),
(9, 2, 'filepicker_recentrepository', '2'),
(10, 2, 'course_overview_course_order', 'a:3:{i:0;i:4;i:1;i:2;i:2;i:3;}'),
(11, 2, 'quiz_report_pagesize', '30'),
(12, 2, 'quiz_overview_slotmarks', '1'),
(13, 2, 'quiz_reordertab', '1');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_private_key`
--

CREATE TABLE IF NOT EXISTS `mdl_user_private_key` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `script` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL,
  `instance` bigint(10) DEFAULT NULL,
  `iprestriction` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `validuntil` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_userprivkey_scrval_ix` (`script`,`value`),
  KEY `mdl_userprivkey_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='access keys used in cookieless scripts - rss, etc.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_webdav_locks`
--

CREATE TABLE IF NOT EXISTS `mdl_webdav_locks` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expiry` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `recursive` tinyint(1) NOT NULL DEFAULT '0',
  `exclusivelock` tinyint(1) NOT NULL DEFAULT '0',
  `created` bigint(10) NOT NULL DEFAULT '0',
  `modified` bigint(10) NOT NULL DEFAULT '0',
  `owner` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_webdlock_tok_uix` (`token`),
  KEY `mdl_webdlock_pat_ix` (`path`),
  KEY `mdl_webdlock_exp_ix` (`expiry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Resource locks for WebDAV users' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Wiki',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `firstpagetitle` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'First Page',
  `wikimode` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'collaborative',
  `defaultformat` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'creole',
  `forceformat` tinyint(1) NOT NULL DEFAULT '1',
  `editbegin` bigint(10) NOT NULL DEFAULT '0',
  `editend` bigint(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_wiki_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores Wiki activity configuration' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_links`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_links` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint(10) NOT NULL DEFAULT '0',
  `frompageid` bigint(10) NOT NULL DEFAULT '0',
  `topageid` bigint(10) NOT NULL DEFAULT '0',
  `tomissingpage` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_wikilink_fro_ix` (`frompageid`),
  KEY `mdl_wikilink_sub_ix` (`subwikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Page wiki links' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_locks`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_locks` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `sectionname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `lockedat` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Manages page locks' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_pages`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_pages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'title',
  `cachedcontent` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `timerendered` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `pageviews` bigint(10) NOT NULL DEFAULT '0',
  `readonly` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_wikipage_subtituse_uix` (`subwikiid`,`title`,`userid`),
  KEY `mdl_wikipage_sub_ix` (`subwikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores wiki pages' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_subwikis`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_subwikis` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `wikiid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_wikisubw_wikgrouse_uix` (`wikiid`,`groupid`,`userid`),
  KEY `mdl_wikisubw_wik_ix` (`wikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores subwiki instances' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_synonyms`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_synonyms` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `pagesynonym` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Pagesynonym',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_wikisyno_pagpag_uix` (`pageid`,`pagesynonym`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores wiki pages synonyms' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_versions`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_versions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `contentformat` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'creole',
  `version` mediumint(5) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_wikivers_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores wiki page history' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(3) NOT NULL DEFAULT '0',
  `instructauthors` longtext COLLATE utf8_unicode_ci,
  `instructauthorsformat` smallint(3) NOT NULL DEFAULT '0',
  `instructreviewers` longtext COLLATE utf8_unicode_ci,
  `instructreviewersformat` smallint(3) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL,
  `phase` smallint(3) DEFAULT '0',
  `useexamples` tinyint(2) DEFAULT '0',
  `usepeerassessment` tinyint(2) DEFAULT '0',
  `useselfassessment` tinyint(2) DEFAULT '0',
  `grade` decimal(10,5) DEFAULT '80.00000',
  `gradinggrade` decimal(10,5) DEFAULT '20.00000',
  `strategy` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `evaluation` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gradedecimals` smallint(3) DEFAULT '0',
  `nattachments` smallint(3) DEFAULT '0',
  `latesubmissions` tinyint(2) DEFAULT '0',
  `maxbytes` bigint(10) DEFAULT '100000',
  `examplesmode` smallint(3) DEFAULT '0',
  `submissionstart` bigint(10) DEFAULT '0',
  `submissionend` bigint(10) DEFAULT '0',
  `assessmentstart` bigint(10) DEFAULT '0',
  `assessmentend` bigint(10) DEFAULT '0',
  `phaseswitchassessment` tinyint(2) NOT NULL DEFAULT '0',
  `conclusion` longtext COLLATE utf8_unicode_ci,
  `conclusionformat` smallint(3) NOT NULL DEFAULT '1',
  `overallfeedbackmode` smallint(3) DEFAULT '1',
  `overallfeedbackfiles` smallint(3) DEFAULT '0',
  `overallfeedbackmaxbytes` bigint(10) DEFAULT '100000',
  PRIMARY KEY (`id`),
  KEY `mdl_work_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table keeps information about the module instances and ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopallocation_scheduled`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopallocation_scheduled` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `enabled` tinyint(2) NOT NULL DEFAULT '0',
  `submissionend` bigint(10) NOT NULL,
  `timeallocated` bigint(10) DEFAULT NULL,
  `settings` longtext COLLATE utf8_unicode_ci,
  `resultstatus` bigint(10) DEFAULT NULL,
  `resultmessage` varchar(1333) COLLATE utf8_unicode_ci DEFAULT NULL,
  `resultlog` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_worksche_wor_uix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the allocation settings for the scheduled allocator' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopeval_best_settings`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopeval_best_settings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `comparison` smallint(3) DEFAULT '5',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workbestsett_wor_uix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Settings for the grading evaluation subplugin Comparison wit' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_accumulative`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_accumulative` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` smallint(3) DEFAULT '0',
  `grade` bigint(10) NOT NULL,
  `weight` mediumint(5) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_workaccu_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The assessment dimensions definitions of Accumulative gradin' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_comments`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workcomm_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The assessment dimensions definitions of Comments strategy f' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_numerrors`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_numerrors` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` smallint(3) DEFAULT '0',
  `descriptiontrust` bigint(10) DEFAULT NULL,
  `grade0` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `grade1` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weight` mediumint(5) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_worknume_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The assessment dimensions definitions of Number of errors gr' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_numerrors_map`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_numerrors_map` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `nonegative` bigint(10) NOT NULL,
  `grade` decimal(10,5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_worknumemap_wornon_uix` (`workshopid`,`nonegative`),
  KEY `mdl_worknumemap_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This maps the number of errors to a percentual grade for sub' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_rubric`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_rubric` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workrubr_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The assessment dimensions definitions of Rubric grading stra' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_rubric_config`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_rubric_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `layout` varchar(30) COLLATE utf8_unicode_ci DEFAULT 'list',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workrubrconf_wor_uix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Configuration table for the Rubric grading strategy' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_rubric_levels`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_rubric_levels` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `dimensionid` bigint(10) NOT NULL,
  `grade` decimal(10,5) NOT NULL,
  `definition` longtext COLLATE utf8_unicode_ci,
  `definitionformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workrubrleve_dim_ix` (`dimensionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The definition of rubric rating scales' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_aggregations`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_aggregations` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `gradinggrade` decimal(10,5) DEFAULT NULL,
  `timegraded` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workaggr_woruse_uix` (`workshopid`,`userid`),
  KEY `mdl_workaggr_wor_ix` (`workshopid`),
  KEY `mdl_workaggr_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Aggregated grades for assessment are stored here. The aggreg' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_assessments`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_assessments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `submissionid` bigint(10) NOT NULL,
  `reviewerid` bigint(10) NOT NULL,
  `weight` bigint(10) NOT NULL DEFAULT '1',
  `timecreated` bigint(10) DEFAULT '0',
  `timemodified` bigint(10) DEFAULT '0',
  `grade` decimal(10,5) DEFAULT NULL,
  `gradinggrade` decimal(10,5) DEFAULT NULL,
  `gradinggradeover` decimal(10,5) DEFAULT NULL,
  `gradinggradeoverby` bigint(10) DEFAULT NULL,
  `feedbackauthor` longtext COLLATE utf8_unicode_ci,
  `feedbackauthorformat` smallint(3) DEFAULT '0',
  `feedbackauthorattachment` smallint(3) DEFAULT '0',
  `feedbackreviewer` longtext COLLATE utf8_unicode_ci,
  `feedbackreviewerformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workasse_sub_ix` (`submissionid`),
  KEY `mdl_workasse_gra_ix` (`gradinggradeoverby`),
  KEY `mdl_workasse_rev_ix` (`reviewerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about the made assessment and automatically calculated ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_assessments_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_assessments_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `submissionid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timegraded` bigint(10) NOT NULL DEFAULT '0',
  `timeagreed` bigint(10) NOT NULL DEFAULT '0',
  `grade` double NOT NULL DEFAULT '0',
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `teachergraded` smallint(3) NOT NULL DEFAULT '0',
  `mailed` smallint(3) NOT NULL DEFAULT '0',
  `resubmission` smallint(3) NOT NULL DEFAULT '0',
  `donotuse` smallint(3) NOT NULL DEFAULT '0',
  `generalcomment` longtext COLLATE utf8_unicode_ci,
  `teachercomment` longtext COLLATE utf8_unicode_ci,
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workasseold_use_ix` (`userid`),
  KEY `mdl_workasseold_mai_ix` (`mailed`),
  KEY `mdl_workasseold_wor_ix` (`workshopid`),
  KEY `mdl_workasseold_sub_ix` (`submissionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_assessments table to be dropped later in Moo' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_comments_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_comments_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `assessmentid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(2) NOT NULL DEFAULT '0',
  `comments` longtext COLLATE utf8_unicode_ci NOT NULL,
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workcommold_use_ix` (`userid`),
  KEY `mdl_workcommold_mai_ix` (`mailed`),
  KEY `mdl_workcommold_wor_ix` (`workshopid`),
  KEY `mdl_workcommold_ass_ix` (`assessmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_comments table to be dropped later in Moodle' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_elements_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_elements_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` smallint(3) NOT NULL DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `scale` smallint(3) NOT NULL DEFAULT '0',
  `maxscore` smallint(3) NOT NULL DEFAULT '1',
  `weight` smallint(3) NOT NULL DEFAULT '11',
  `stddev` double NOT NULL DEFAULT '0',
  `totalassessments` bigint(10) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workelemold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_elements table to be dropped later in Moodle' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_grades`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assessmentid` bigint(10) NOT NULL,
  `strategy` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dimensionid` bigint(10) NOT NULL,
  `grade` decimal(10,5) NOT NULL,
  `peercomment` longtext COLLATE utf8_unicode_ci,
  `peercommentformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workgrad_assstrdim_uix` (`assessmentid`,`strategy`,`dimensionid`),
  KEY `mdl_workgrad_ass_ix` (`assessmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='How the reviewers filled-up the grading forms, given grades ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_grades_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_grades_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `assessmentid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workgradold_wor_ix` (`workshopid`),
  KEY `mdl_workgradold_ass_ix` (`assessmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_grades table to be dropped later in Moodle 2' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `wtype` smallint(3) NOT NULL DEFAULT '0',
  `nelements` smallint(3) NOT NULL DEFAULT '1',
  `nattachments` smallint(3) NOT NULL DEFAULT '0',
  `phase` tinyint(2) NOT NULL DEFAULT '0',
  `format` tinyint(2) NOT NULL DEFAULT '0',
  `gradingstrategy` tinyint(2) NOT NULL DEFAULT '1',
  `resubmit` tinyint(2) NOT NULL DEFAULT '0',
  `agreeassessments` tinyint(2) NOT NULL DEFAULT '0',
  `hidegrades` tinyint(2) NOT NULL DEFAULT '0',
  `anonymous` tinyint(2) NOT NULL DEFAULT '0',
  `includeself` tinyint(2) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '100000',
  `submissionstart` bigint(10) NOT NULL DEFAULT '0',
  `assessmentstart` bigint(10) NOT NULL DEFAULT '0',
  `submissionend` bigint(10) NOT NULL DEFAULT '0',
  `assessmentend` bigint(10) NOT NULL DEFAULT '0',
  `releasegrades` bigint(10) NOT NULL DEFAULT '0',
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `ntassessments` smallint(3) NOT NULL DEFAULT '0',
  `assessmentcomps` smallint(3) NOT NULL DEFAULT '2',
  `nsassessments` smallint(3) NOT NULL DEFAULT '0',
  `overallocation` smallint(3) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `teacherweight` smallint(3) NOT NULL DEFAULT '1',
  `showleaguetable` smallint(3) NOT NULL DEFAULT '0',
  `usepassword` smallint(3) NOT NULL DEFAULT '0',
  `password` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workold_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop table to be dropped later in Moodle 2.x' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_rubrics_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_rubrics_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` bigint(10) NOT NULL DEFAULT '0',
  `rubricno` smallint(3) NOT NULL DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workrubrold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_rubrics table to be dropped later in Moodle ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_stockcomments_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_stockcomments_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` bigint(10) NOT NULL DEFAULT '0',
  `comments` longtext COLLATE utf8_unicode_ci NOT NULL,
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workstocold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_stockcomments table to be dropped later in M' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_submissions`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_submissions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `example` tinyint(2) DEFAULT '0',
  `authorid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` longtext COLLATE utf8_unicode_ci,
  `contentformat` smallint(3) NOT NULL DEFAULT '0',
  `contenttrust` smallint(3) NOT NULL DEFAULT '0',
  `attachment` tinyint(2) DEFAULT '0',
  `grade` decimal(10,5) DEFAULT NULL,
  `gradeover` decimal(10,5) DEFAULT NULL,
  `gradeoverby` bigint(10) DEFAULT NULL,
  `feedbackauthor` longtext COLLATE utf8_unicode_ci,
  `feedbackauthorformat` smallint(3) DEFAULT '0',
  `timegraded` bigint(10) DEFAULT NULL,
  `published` tinyint(2) DEFAULT '0',
  `late` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_worksubm_wor_ix` (`workshopid`),
  KEY `mdl_worksubm_gra_ix` (`gradeoverby`),
  KEY `mdl_worksubm_aut_ix` (`authorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about the submission and the aggregation of the grade f' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_submissions_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_submissions_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(2) NOT NULL DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `finalgrade` smallint(3) NOT NULL DEFAULT '0',
  `late` smallint(3) NOT NULL DEFAULT '0',
  `nassessments` bigint(10) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_worksubmold_use_ix` (`userid`),
  KEY `mdl_worksubmold_mai_ix` (`mailed`),
  KEY `mdl_worksubmold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_submissions table to be dropped later in Moo' AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
