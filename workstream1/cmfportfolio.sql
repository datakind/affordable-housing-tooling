-- MySQL dump 10.13  Distrib 8.1.0, for Linux (x86_64)
--
-- Host: localhost    Database: CMFPortfolio
-- ------------------------------------------------------
-- Server version	8.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Metrics`
--

DROP TABLE IF EXISTS `Metrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Metrics` (
  `MetricID` int NOT NULL AUTO_INCREMENT,
  `MetricName` varchar(255) NOT NULL,
  PRIMARY KEY (`MetricID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Metrics`
--

LOCK TABLES `Metrics` WRITE;
/*!40000 ALTER TABLE `Metrics` DISABLE KEYS */;
INSERT INTO `Metrics` VALUES (1,'Units Below 30% AMI'),(2,'Units Below 50% AMI'),(3,'Units Below 60% AMI'),(4,'Units Below 80% AMI'),(5,'Units Below 120% AMI'),(6,'Units Above 120% AMI'),(7,'Total Number of Units'),(8,'Total Private Sources'),(9,'Total Public Sources'),(10,'CMF Loan Amount');
/*!40000 ALTER TABLE `Metrics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PortfolioMetrics`
--

DROP TABLE IF EXISTS `PortfolioMetrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PortfolioMetrics` (
  `PortfolioMetricID` int NOT NULL AUTO_INCREMENT,
  `PortfolioID` int DEFAULT NULL,
  `MetricID` int DEFAULT NULL,
  `MetricValue` decimal(20,2) NOT NULL,
  PRIMARY KEY (`PortfolioMetricID`),
  KEY `PortfolioID` (`PortfolioID`),
  KEY `MetricID` (`MetricID`),
  CONSTRAINT `PortfolioMetrics_ibfk_1` FOREIGN KEY (`PortfolioID`) REFERENCES `Portfolios` (`PortfolioID`),
  CONSTRAINT `PortfolioMetrics_ibfk_2` FOREIGN KEY (`MetricID`) REFERENCES `Metrics` (`MetricID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PortfolioMetrics`
--

LOCK TABLES `PortfolioMetrics` WRITE;
/*!40000 ALTER TABLE `PortfolioMetrics` DISABLE KEYS */;
/*!40000 ALTER TABLE `PortfolioMetrics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Portfolios`
--

DROP TABLE IF EXISTS `Portfolios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Portfolios` (
  `PortfolioID` int NOT NULL AUTO_INCREMENT,
  `PortfolioName` varchar(255) NOT NULL,
  `PortfolioYear` int DEFAULT NULL,
  PRIMARY KEY (`PortfolioID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Portfolios`
--

LOCK TABLES `Portfolios` WRITE;
/*!40000 ALTER TABLE `Portfolios` DISABLE KEYS */;
INSERT INTO `Portfolios` VALUES (1,'CMF',2023);
/*!40000 ALTER TABLE `Portfolios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProjectMetrics`
--

DROP TABLE IF EXISTS `ProjectMetrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ProjectMetrics` (
  `MetricID` int DEFAULT NULL,
  `MetricValue` decimal(20,2) NOT NULL,
  `ProjectName` varchar(255) DEFAULT NULL,
  KEY `MetricID` (`MetricID`),
  CONSTRAINT `ProjectMetrics_ibfk_2` FOREIGN KEY (`MetricID`) REFERENCES `Metrics` (`MetricID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProjectMetrics`
--

LOCK TABLES `ProjectMetrics` WRITE;
/*!40000 ALTER TABLE `ProjectMetrics` DISABLE KEYS */;
INSERT INTO `ProjectMetrics` VALUES (8,20100000.00,'SOS'),(9,7647015.00,'SOS'),(10,1000000.00,'SOS'),(7,72.00,'SOS'),(1,18.00,'SOS'),(2,0.00,'SOS'),(3,18.00,'SOS'),(4,36.00,'SOS'),(5,0.00,'SOS'),(6,0.00,'SOS'),(8,11793632.00,'SSW'),(9,0.00,'SSW'),(10,1000000.00,'SSW'),(7,40.00,'SSW'),(1,0.00,'SSW'),(2,40.00,'SSW'),(3,0.00,'SSW'),(4,0.00,'SSW'),(5,0.00,'SSW'),(6,0.00,'SSW');
/*!40000 ALTER TABLE `ProjectMetrics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Projects`
--

DROP TABLE IF EXISTS `Projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Projects` (
  `PortfolioID` int DEFAULT NULL,
  `ProjectName` varchar(255) NOT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `CensusTract` varchar(50) DEFAULT NULL,
  `AreaOfEconomicDistress` varchar(5) DEFAULT NULL,
  `TotalProjectCost` decimal(20,2) DEFAULT NULL,
  KEY `PortfolioID` (`PortfolioID`),
  CONSTRAINT `Projects_ibfk_1` FOREIGN KEY (`PortfolioID`) REFERENCES `Portfolios` (`PortfolioID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Projects`
--

LOCK TABLES `Projects` WRITE;
/*!40000 ALTER TABLE `Projects` DISABLE KEYS */;
INSERT INTO `Projects` VALUES (1,'SOS',NULL,'12011041700','Y',28747015.00),(1,'SSW',NULL,'12009064902','Y',12793632.00);
/*!40000 ALTER TABLE `Projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sources`
--

DROP TABLE IF EXISTS `Sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sources` (
  `SourceID` int NOT NULL AUTO_INCREMENT,
  `SourceName` varchar(255) NOT NULL,
  `SourceType` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SourceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sources`
--

LOCK TABLES `Sources` WRITE;
/*!40000 ALTER TABLE `Sources` DISABLE KEYS */;
/*!40000 ALTER TABLE `Sources` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-14 17:53:50
