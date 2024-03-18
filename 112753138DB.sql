CREATE DATABASE  IF NOT EXISTS `company2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `company2`;
-- MySQL dump 10.13  Distrib 8.0.36, for macos14 (arm64)
--
-- Host: localhost    Database: company2
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Department`
--

DROP TABLE IF EXISTS `Department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Department` (
  `Dname` varchar(15) NOT NULL,
  `Dnumber` int NOT NULL,
  `MgrSSN` char(9) NOT NULL,
  `MgrStarDate` date NOT NULL,
  PRIMARY KEY (`Dnumber`),
  UNIQUE KEY `Dname` (`Dname`),
  KEY `fk_child_parent` (`MgrSSN`),
  CONSTRAINT `fk_child_parent` FOREIGN KEY (`MgrSSN`) REFERENCES `Employee` (`Ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Department`
--

LOCK TABLES `Department` WRITE;
/*!40000 ALTER TABLE `Department` DISABLE KEYS */;
INSERT INTO `Department` VALUES ('Headquarters',1,'888665555','1981-06-19'),('Administration',4,'987654321','1995-01-01'),('Research',5,'333445555','1988-05-22');
/*!40000 ALTER TABLE `Department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Dependent`
--

DROP TABLE IF EXISTS `Dependent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Dependent` (
  `Essn` char(9) NOT NULL,
  `Dependent_name` varchar(50) NOT NULL,
  `Sex` char(1) DEFAULT NULL,
  `Bdate` date DEFAULT NULL,
  `Relationship` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Essn`,`Dependent_name`),
  CONSTRAINT `dependent_ibfk_1` FOREIGN KEY (`Essn`) REFERENCES `Employee` (`Ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Dependent`
--

LOCK TABLES `Dependent` WRITE;
/*!40000 ALTER TABLE `Dependent` DISABLE KEYS */;
INSERT INTO `Dependent` VALUES ('123456789','Alice','F','1988-12-30','Daughter'),('123456789','Elizabeth','F','1967-05-05','Spouse'),('123456789','Michael','M','1988-01-04','Son'),('333445555','Alice','F','1986-04-04','Daughter'),('333445555','John','M','1983-10-25','Son'),('333445555','Joy','F','1958-05-03','Spouse'),('987654321','Abner','M','1942-02-28','Spouse');
/*!40000 ALTER TABLE `Dependent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Dept_locations`
--

DROP TABLE IF EXISTS `Dept_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Dept_locations` (
  `Dnumber` int NOT NULL,
  `Dlocation` varchar(20) NOT NULL,
  PRIMARY KEY (`Dnumber`,`Dlocation`),
  CONSTRAINT `dept_locations_ibfk_1` FOREIGN KEY (`Dnumber`) REFERENCES `Department` (`Dnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Dept_locations`
--

LOCK TABLES `Dept_locations` WRITE;
/*!40000 ALTER TABLE `Dept_locations` DISABLE KEYS */;
INSERT INTO `Dept_locations` VALUES (1,'Houston'),(4,'Stafford'),(5,'Bellaire'),(5,'Houston'),(5,'Sugarland');
/*!40000 ALTER TABLE `Dept_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employee` (
  `Fname` varchar(15) NOT NULL,
  `Minit` varchar(15) DEFAULT NULL,
  `Lname` varchar(15) NOT NULL,
  `Ssn` char(9) NOT NULL,
  `Bdate` date DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Sex` char(1) DEFAULT NULL,
  `Salary` decimal(10,2) DEFAULT NULL,
  `Super_ssn` char(9) DEFAULT NULL,
  `Dno` int NOT NULL,
  PRIMARY KEY (`Ssn`),
  KEY `employee_sup_ssn` (`Super_ssn`),
  KEY `employee_dno_dnumber` (`Dno`),
  CONSTRAINT `employee_dno_dnumber` FOREIGN KEY (`Dno`) REFERENCES `Department` (`Dnumber`),
  CONSTRAINT `employee_sup_ssn` FOREIGN KEY (`Super_ssn`) REFERENCES `Employee` (`Ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES ('John',NULL,'Smith','123456789','1965-01-09','731 Fondren, Houston, TX','M',30000.00,'333445555',5),('Franklin',NULL,'Wong','333445555','1965-12-08','638 Voss, Houston TX','M',40000.00,'888665555',5),('Joyce',NULL,'English','453453453','1972-07-31','5631 Rice, Houston TX','F',25000.00,'333445555',5),('Ramesh',NULL,'Narayan','666884444','1962-09-15','975 Fire Oak, Humble TX','M',38000.00,'333445555',5),('James',NULL,'Borg','888665555','1937-11-10','450 Stone, Houston TX','M',55000.00,NULL,1),('Jennifer',NULL,'Wallace','987654321','1941-06-20','291 Berry, Bellaire TX','F',43000.00,'888665555',4),('Ahmad',NULL,'Jabbar','987987987','1969-03-29','980 Dallas, Houston TX','M',25000.00,'987654321',4),('Alicia',NULL,'Zelaya','999887777','1968-01-19','3321 Castle, Spring TX','F',25000.00,'987654321',4);
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Project`
--

DROP TABLE IF EXISTS `Project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Project` (
  `Pname` varchar(20) DEFAULT NULL,
  `Pnumber` int NOT NULL,
  `Plocation` varchar(20) DEFAULT NULL,
  `Dnum` int DEFAULT NULL,
  PRIMARY KEY (`Pnumber`),
  KEY `Dnum` (`Dnum`),
  CONSTRAINT `project_ibfk_1` FOREIGN KEY (`Dnum`) REFERENCES `Department` (`Dnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Project`
--

LOCK TABLES `Project` WRITE;
/*!40000 ALTER TABLE `Project` DISABLE KEYS */;
INSERT INTO `Project` VALUES ('ProductX',1,'Bellaire',5),('ProductY',2,'Sugarland',5),('ProductZ',3,'Houston',5),('Computerization',10,'Stafford',4),('Reorganization',20,'Houston',1),('Newbenefits',30,'Stafford',4);
/*!40000 ALTER TABLE `Project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Work_on`
--

DROP TABLE IF EXISTS `Work_on`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Work_on` (
  `Essn` char(9) NOT NULL,
  `Pno` int NOT NULL,
  `Hours` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Essn`,`Pno`),
  KEY `Pno` (`Pno`),
  CONSTRAINT `work_on_ibfk_1` FOREIGN KEY (`Essn`) REFERENCES `Employee` (`Ssn`),
  CONSTRAINT `work_on_ibfk_2` FOREIGN KEY (`Pno`) REFERENCES `Project` (`Pnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Work_on`
--

LOCK TABLES `Work_on` WRITE;
/*!40000 ALTER TABLE `Work_on` DISABLE KEYS */;
INSERT INTO `Work_on` VALUES ('123456789',1,32.50),('123456789',2,7.50),('333445555',2,10.00),('333445555',3,10.00),('333445555',10,10.00),('333445555',20,10.00),('453453453',1,20.00),('453453453',2,20.00),('666884444',3,40.00),('888665555',20,NULL),('987654321',20,15.00),('987654321',30,20.00),('987987987',10,35.00),('987987987',30,5.00),('999887777',10,10.00),('999887777',30,30.00);
/*!40000 ALTER TABLE `Work_on` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-14 21:30:41
