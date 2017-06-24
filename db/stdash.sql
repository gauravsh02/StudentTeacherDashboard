-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 04, 2017 at 05:05 PM
-- Server version: 5.1.41
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `stdash`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `uid` varchar(15) NOT NULL,
  `logname` varchar(60) NOT NULL,
  `pwd` varchar(20) NOT NULL,
  `type` varchar(15) NOT NULL,
  `status` varchar(15) NOT NULL,
  `secques` varchar(100) NOT NULL COMMENT 'Security Question',
  `secans` varchar(100) NOT NULL COMMENT 'Securithy Answer',
  `lstlog` datetime NOT NULL COMMENT 'last login date time',
  `name` varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`uid`, `logname`, `pwd`, `type`, `status`, `secques`, `secans`, `lstlog`, `name`) VALUES
('A00001', 'gaurav@gmail.com', 'gaurav', 'Admin', 'Y', 'What is your pet name', 'John', '2015-11-01 02:22:02', 'Garav');

-- --------------------------------------------------------

--
-- Table structure for table `calevent`
--

CREATE TABLE IF NOT EXISTS `calevent` (
  `ceid` int(11) NOT NULL AUTO_INCREMENT,
  `yr` int(11) NOT NULL,
  `mon` int(11) NOT NULL,
  `dt` int(11) NOT NULL,
  `event` varchar(200) NOT NULL,
  PRIMARY KEY (`ceid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `calevent`
--

INSERT INTO `calevent` (`ceid`, `yr`, `mon`, `dt`, `event`) VALUES
(6, 2017, 3, 19, 'Annual Day Celebration.'),
(7, 2017, 3, 21, 'project');

-- --------------------------------------------------------

--
-- Table structure for table `fqueans`
--

CREATE TABLE IF NOT EXISTS `fqueans` (
  `ansid` int(11) NOT NULL,
  `slno` int(5) NOT NULL,
  `fid` varchar(10) NOT NULL,
  `qanswer` varchar(400) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fqueans`
--

INSERT INTO `fqueans` (`ansid`, `slno`, `fid`, `qanswer`) VALUES
(2, 2, 'Rajesh', 'It is the process of eliminating the redundant data of a table, by breaking 1 table into 2.'),
(1, 1, 'Rajesh', 'Restricting the value of a data member to be written in a fileis called serialization'),
(3, 2, 'Tamal', 'Separating repeated values of rows of a able into two different table is called ormalization. There are diffent kinds of normalization : 1NF, 2NF, 3NF, etc'),
(4, 1, 'Tamal', 'The process of writing the state of an object with extra info lyk name of class & data member from the java prog to the external source is called serialization'),
(5, 5, 'Sangita', 'Answer'),
(6, 5, 'Malatari', 'Answer\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `fquery`
--

CREATE TABLE IF NOT EXISTS `fquery` (
  `slno` int(5) NOT NULL,
  `quserid` varchar(10) NOT NULL,
  `query` varchar(400) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fquery`
--

INSERT INTO `fquery` (`slno`, `quserid`, `query`) VALUES
(2, 'Samidha', 'What is normalization ?'),
(1, 'Samidha', 'What is Serialization in Java ?'),
(3, 'Samidha', 'What is a dangling pointer in C ?'),
(4, 'Samidha', 'What is association and aggregation ?'),
(5, 'Samidha', 'tesrt');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `uid` varchar(15) NOT NULL,
  `logname` varchar(60) NOT NULL,
  `pwd` varchar(20) NOT NULL,
  `type` varchar(15) NOT NULL,
  `status` varchar(15) NOT NULL,
  `secques` varchar(100) NOT NULL COMMENT 'Security Question',
  `secans` varchar(100) NOT NULL COMMENT 'Securithy Answer',
  `lstlog` datetime NOT NULL COMMENT 'last login date time',
  `dispname` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`uid`, `logname`, `pwd`, `type`, `status`, `secques`, `secans`, `lstlog`, `dispname`) VALUES
('A00001', 'gaurav@gmail.com', 'gaurav', 'Admin', 'Y', 'What is your pet name', 'John', '2017-04-21 12:11:49', 'Gaurav'),
('T00002', 'malatari@gmail.com', 'malatari', 'Teacher', 'Y', 'What is your 1st school name ?', 'Saraswati Sishu Mandir', '2017-04-21 11:56:48', 'Malatari'),
('S00001', 'samidha@gmail.com', 'samidha', 'Student', 'Y', 'Who is your best friend ?', 'Mom', '2017-04-21 12:00:41', 'Samidha'),
('T00003', 'sangita@gmail.com', 'sangita', 'Teacher', 'Y', 'What is your pet name', 'john', '2017-04-21 09:17:47', 'Sangita');

-- --------------------------------------------------------

--
-- Table structure for table `material`
--

CREATE TABLE IF NOT EXISTS `material` (
  `matid` varchar(10) NOT NULL,
  `uid` varchar(10) NOT NULL,
  `subid` varchar(10) NOT NULL,
  `type` varchar(20) NOT NULL,
  `category` varchar(20) NOT NULL,
  `descrip` varchar(300) NOT NULL,
  `content` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `material`
--

INSERT INTO `material` (`matid`, `uid`, `subid`, `type`, `category`, `descrip`, `content`) VALUES
('M0001', 'T00002', 'S002', 'Pdf', 'Assignment', 'bn', 'M0001.jpg'),
('M0002', 'T00002', 'S002', 'Video', 'Notes', 'wwwwercgrcwer rwe', 'M0002.wmv'),
('M0003', 'T00002', 'S002', 'Doc', 'Notes', 'fffff', 'M0003.docx'),
('M0004', 'T00002', 'S002', 'Pdf', 'Assignment', 'test', 'M0004.html');

-- --------------------------------------------------------

--
-- Table structure for table `notice`
--

CREATE TABLE IF NOT EXISTS `notice` (
  `nid` varchar(30) NOT NULL,
  `uid` varchar(30) NOT NULL COMMENT 'who has  generated notice',
  `ndate` date NOT NULL,
  `subject` varchar(100) NOT NULL,
  `matter` varchar(500) NOT NULL,
  `contprsn` varchar(30) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `status` varchar(30) NOT NULL,
  `image` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notice`
--

INSERT INTO `notice` (`nid`, `uid`, `ndate`, `subject`, `matter`, `contprsn`, `phone`, `status`, `image`) VALUES
('N1-2017', 'A00001', '2017-04-02', '4th Yr Internal Exam', 'The internal examination of 4th year student will be held from 11th Apr 2017  to 17th Apr 2017. Timing will be from 09:00 AM to 11:00 AM.', 'Mr. Tamal Khan', '9512364780', 'A', 'N1-2017.jpg'),
('N2-2017', 'A00001', '2017-04-03', 'Hanuman Jayajnti', 'The College will remain closed on 14th April 2017 on the occasion of Pana Sankranti. ', 'Mr. Tamal Khan', '9512364780', 'A', 'N2-2017.jpg'),
('N3-2017', 'T00003', '2017-04-21', 'asd', 'asd', 'asdas', 'sad', 'A', 'N3-2017.PNG');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `sid` varchar(15) NOT NULL,
  `name` varchar(50) NOT NULL,
  `regdno` varchar(15) NOT NULL,
  `brnch` varchar(20) NOT NULL,
  `phno` varchar(15) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `dob` date NOT NULL COMMENT 'date of birth',
  `gender` varchar(15) NOT NULL,
  `mstatus` varchar(15) NOT NULL,
  `doj` date NOT NULL COMMENT 'date of joining',
  `cadd` varchar(200) NOT NULL,
  `clg` varchar(60) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`sid`, `name`, `regdno`, `brnch`, `phno`, `mail`, `dob`, `gender`, `mstatus`, `doj`, `cadd`, `clg`) VALUES
('S00001', 'Samidha Kumari', '01122345678', 'CSE', '7879554433', 'samidha@gmail.com', '1993-08-31', 'Female', 'Single', '2017-04-13', 'LH -2, Synergy College, Dhenkanal, Odisha', 'Synergy');

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE IF NOT EXISTS `subject` (
  `subid` varchar(7) NOT NULL,
  `sname` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`subid`, `sname`) VALUES
('S002', 'C++'),
('S001', 'Java'),
('S003', 'Oracle'),
('S004', 'DBMS'),
('S006', ' ADV JAVA'),
('S008', 'C');

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE IF NOT EXISTS `teacher` (
  `tid` varchar(45) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `name` varchar(45) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `dob` varchar(45) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `gender` varchar(45) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `mstatus` varchar(45) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `phone` varchar(45) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `mail` varchar(45) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `qual` varchar(45) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `desig` varchar(45) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `orga` varchar(45) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL COMMENT 'organization address',
  `cadd` varchar(45) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `dor` varchar(45) NOT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`tid`, `name`, `dob`, `gender`, `mstatus`, `phone`, `mail`, `qual`, `desig`, `orga`, `cadd`, `dor`) VALUES
('T00002', 'Malatri', '1972-11-23', 'Male', 'Married', '7897890001', 'malatari@gmail.com', 'M Tech', 'Project Leader', 'NIT, Rourkela', 'Bada Bazar, PURI, ODISHA', '2017-04-13'),
('T00003', 'Sangita', '1993-06-29', 'Female', 'Single', '7766123456', 'sangita@gmail.com', 'PHD', 'Asst. Prof.', 'CET', 'Khandagiri Square, Bhubaneswar', '2017-04-13');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
