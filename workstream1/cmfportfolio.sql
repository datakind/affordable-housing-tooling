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
  `MetricName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`MetricID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Metrics`
--

LOCK TABLES `Metrics` WRITE;
/*!40000 ALTER TABLE `Metrics` DISABLE KEYS */;
INSERT INTO `Metrics` VALUES (1,'txtUnder30'),(2,'txtUnder50'),(3,'txtUnder60'),(4,'txtUnder80'),(5,'txtUnder120'),(6,'txtAbove120'),(7,'txtNoCmfClf'),(8,'txtPrivCash'),(9,'txtGovCash'),(10,'txtCMFLoan');
/*!40000 ALTER TABLE `Metrics` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `txtPPN` varchar(255) DEFAULT NULL,
  KEY `MetricID` (`MetricID`),
  CONSTRAINT `ProjectMetrics_ibfk_2` FOREIGN KEY (`MetricID`) REFERENCES `Metrics` (`MetricID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProjectMetrics`
--

LOCK TABLES `ProjectMetrics` WRITE;
/*!40000 ALTER TABLE `ProjectMetrics` DISABLE KEYS */;
INSERT INTO `ProjectMetrics` VALUES (1,5.00,'ABC'),(2,5.00,'ABC'),(3,5.00,'ABC'),(4,5.00,'ABC'),(5,5.00,'ABC'),(6,5.00,'ABC'),(7,5.00,'ABC'),(8,5.00,'ABC'),(9,5.00,'ABC'),(10,5.00,'ABC'),(1,5.00,'ABC'),(2,5.00,'ABC'),(3,5.00,'ABC'),(4,5.00,'ABC'),(5,5.00,'ABC'),(6,5.00,'ABC'),(7,5.00,'ABC'),(8,5.00,'ABC'),(9,5.00,'ABC'),(10,5.00,'ABC'),(1,5.00,'ABC'),(2,5.00,'ABC'),(3,5.00,'ABC'),(4,5.00,'ABC'),(5,5.00,'ABC'),(6,5.00,'ABC'),(7,5.00,'ABC'),(8,5.00,'ABC'),(9,5.00,'ABC'),(10,5.00,'ABC'),(1,5.00,'ABC'),(2,5.00,'ABC'),(3,5.00,'ABC'),(4,5.00,'ABC'),(5,5.00,'ABC'),(6,5.00,'ABC'),(7,5.00,'ABC'),(8,5.00,'ABC'),(9,5.00,'ABC'),(10,5.00,'ABC'),(1,5.00,'ABC'),(2,5.00,'ABC'),(3,5.00,'ABC'),(4,5.00,'ABC'),(5,5.00,'ABC'),(6,5.00,'ABC'),(7,5.00,'ABC'),(8,5.00,'ABC'),(9,5.00,'ABC'),(10,5.00,'ABC'),(1,5.00,'ABC'),(2,5.00,'ABC'),(3,5.00,'ABC'),(4,5.00,'ABC'),(5,5.00,'ABC'),(6,5.00,'ABC'),(7,5.00,'ABC'),(8,5.00,'ABC'),(9,5.00,'ABC'),(10,5.00,'ABC'),(1,5.00,'ABC'),(2,5.00,'ABC'),(3,5.00,'ABC'),(4,5.00,'ABC'),(5,5.00,'ABC'),(6,5.00,'ABC'),(7,5.00,'ABC'),(8,5.00,'ABC'),(9,5.00,'ABC'),(10,5.00,'ABC'),(1,5.00,'IHOP'),(2,5.00,'IHOP'),(3,5.00,'IHOP'),(4,5.00,'IHOP'),(5,5.00,'IHOP'),(6,5.00,'IHOP'),(7,5.00,'IHOP'),(8,5.00,'IHOP'),(9,5.00,'IHOP'),(10,5.00,'IHOP'),(1,5.00,'IHOP'),(2,5.00,'IHOP'),(3,5.00,'IHOP'),(4,5.00,'IHOP'),(5,5.00,'IHOP'),(6,5.00,'IHOP'),(7,5.00,'IHOP'),(8,5.00,'IHOP'),(9,5.00,'IHOP'),(10,5.00,'IHOP'),(1,5.00,'IHOP'),(2,5.00,'IHOP'),(3,5.00,'IHOP'),(4,5.00,'IHOP'),(5,5.00,'IHOP'),(6,5.00,'IHOP'),(7,5.00,'IHOP'),(8,5.00,'IHOP'),(9,5.00,'IHOP'),(10,5.00,'IHOP'),(1,5.00,'IHOP'),(2,5.00,'IHOP'),(3,5.00,'IHOP'),(4,5.00,'IHOP'),(5,5.00,'IHOP'),(6,5.00,'IHOP'),(7,5.00,'IHOP'),(8,5.00,'IHOP'),(9,5.00,'IHOP'),(10,5.00,'IHOP'),(1,5.00,'IHOP'),(2,5.00,'IHOP'),(3,5.00,'IHOP'),(4,5.00,'IHOP'),(5,5.00,'IHOP'),(6,5.00,'IHOP'),(7,5.00,'IHOP'),(8,5.00,'IHOP'),(9,5.00,'IHOP'),(10,5.00,'IHOP'),(1,5.00,'IHOP'),(2,5.00,'IHOP'),(3,5.00,'IHOP'),(4,5.00,'IHOP'),(5,5.00,'IHOP'),(6,5.00,'IHOP'),(7,5.00,'IHOP'),(8,5.00,'IHOP'),(9,5.00,'IHOP'),(10,5.00,'IHOP'),(1,5.00,'IHOP'),(2,5.00,'IHOP'),(3,5.00,'IHOP'),(4,5.00,'IHOP'),(5,5.00,'IHOP'),(6,5.00,'IHOP'),(7,5.00,'IHOP'),(8,5.00,'IHOP'),(9,5.00,'IHOP'),(10,5.00,'IHOP'),(1,5.00,'IHOP'),(2,5.00,'IHOP'),(3,5.00,'IHOP'),(4,5.00,'IHOP'),(5,5.00,'IHOP'),(6,5.00,'IHOP'),(7,5.00,'IHOP'),(8,5.00,'IHOP'),(9,5.00,'IHOP'),(10,5.00,'IHOP'),(1,5.00,'IHOP'),(2,5.00,'IHOP'),(3,5.00,'IHOP'),(4,5.00,'IHOP'),(5,5.00,'IHOP'),(6,5.00,'IHOP'),(7,5.00,'IHOP'),(8,5.00,'IHOP'),(9,5.00,'IHOP'),(10,5.00,'IHOP');
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
  `txtPPN` varchar(255) NOT NULL,
  `txtStreet` varchar(255) DEFAULT NULL,
  `txtCity` varchar(255) NOT NULL,
  `txtState` char(2) NOT NULL,
  `txtZIP` int(5) unsigned zerofill NOT NULL,
  KEY `PortfolioID` (`PortfolioID`),
  CONSTRAINT `Projects_ibfk_1` FOREIGN KEY (`PortfolioID`) REFERENCES `Portfolios` (`PortfolioID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Projects`
--

LOCK TABLES `Projects` WRITE;
/*!40000 ALTER TABLE `Projects` DISABLE KEYS */;
INSERT INTO `Projects` VALUES (1,'ABC','123 Street','Orlando','FL',32751),(1,'ABC','123 Street','Orlando','FL',32751),(1,'ABC','123 Street','Orlando','FL',32751),(1,'ABC','123 Street','Orlando','FL',32751),(1,'ABC','123 Street','Orlando','FL',32751),(1,'ABC','123 Street','Orlando','FL',32751),(1,'ABC','123 Street','Orlando','FL',32751),(1,'IHOP','647 E Colonial Dr','Orlando','FL',32803),(1,'IHOP','647 E Colonial Dr','Orlando','FL',32803),(1,'IHOP','647 E Colonial Dr','Orlando','FL',32803),(1,'IHOP','647 E Colonial Dr','Orlando','FL',32803),(1,'IHOP','647 E Colonial Dr','Orlando','FL',32803),(1,'IHOP','647 E Colonial Dr','Orlando','FL',32803),(1,'IHOP','647 E Colonial Dr','Orlando','FL',32803),(1,'IHOP','647 E Colonial Dr','Orlando','FL',32803),(1,'IHOP','647 E Colonial Dr','Orlando','FL',32803);
/*!40000 ALTER TABLE `Projects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-15 17:20:25
