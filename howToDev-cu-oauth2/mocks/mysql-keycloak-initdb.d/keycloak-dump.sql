CREATE DATABASE  IF NOT EXISTS `auth_service` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `auth_service`;
-- MySQL dump 10.13  Distrib 8.0.31, for macos12 (x86_64)
--
-- Host: 127.0.0.1    Database: auth_service
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `ADMIN_EVENT_ENTITY`
--

DROP TABLE IF EXISTS `ADMIN_EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ADMIN_EVENT_ENTITY` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ADMIN_EVENT_TIME` bigint DEFAULT NULL,
  `REALM_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OPERATION_TYPE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AUTH_REALM_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AUTH_CLIENT_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AUTH_USER_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IP_ADDRESS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESOURCE_PATH` text COLLATE utf8mb4_unicode_ci,
  `REPRESENTATION` text COLLATE utf8mb4_unicode_ci,
  `ERROR` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESOURCE_TYPE` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ADMIN_EVENT_TIME` (`REALM_ID`,`ADMIN_EVENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMIN_EVENT_ENTITY`
--

LOCK TABLES `ADMIN_EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ASSOCIATED_POLICY`
--

DROP TABLE IF EXISTS `ASSOCIATED_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ASSOCIATED_POLICY` (
  `POLICY_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ASSOCIATED_POLICY_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`POLICY_ID`,`ASSOCIATED_POLICY_ID`),
  KEY `IDX_ASSOC_POL_ASSOC_POL_ID` (`ASSOCIATED_POLICY_ID`),
  CONSTRAINT `FK_FRSR5S213XCX4WNKOG82SSRFY` FOREIGN KEY (`ASSOCIATED_POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPAS14XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASSOCIATED_POLICY`
--

LOCK TABLES `ASSOCIATED_POLICY` WRITE;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_EXECUTION`
--

DROP TABLE IF EXISTS `AUTHENTICATION_EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATION_EXECUTION` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ALIAS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AUTHENTICATOR` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FLOW_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REQUIREMENT` int DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `AUTHENTICATOR_FLOW` bit(1) NOT NULL DEFAULT b'0',
  `AUTH_FLOW_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AUTH_CONFIG` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_EXEC_REALM_FLOW` (`REALM_ID`,`FLOW_ID`),
  KEY `IDX_AUTH_EXEC_FLOW` (`FLOW_ID`),
  CONSTRAINT `FK_AUTH_EXEC_FLOW` FOREIGN KEY (`FLOW_ID`) REFERENCES `AUTHENTICATION_FLOW` (`ID`),
  CONSTRAINT `FK_AUTH_EXEC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_EXECUTION`
--

LOCK TABLES `AUTHENTICATION_EXECUTION` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('052268aa-ac7b-4f83-ba4d-c081f98d6d3f',NULL,'registration-recaptcha-action','myRealm','9e5ca16f-6a71-4b68-902a-f759233fe801',3,60,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('08606c73-ef15-433e-b600-90051b61f2c1',NULL,NULL,'e810ef94-3763-43cb-b70b-f5229124accb','cb2afee6-45ee-442c-a9ba-5599c8622c9b',1,20,_binary '','3807709b-9040-453b-a098-920ad558176d',NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('09776775-70e0-4c19-acad-997a7a90fdca',NULL,'docker-http-basic-authenticator','myRealm','10ae087b-49ce-40ff-a056-cab195e94928',0,10,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('099bfd2c-c47c-4386-9cf6-7c3241017259',NULL,'registration-user-creation','myRealm','9e5ca16f-6a71-4b68-902a-f759233fe801',0,20,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('09f11b59-5520-44bb-ab9d-9e72ab52cb67',NULL,NULL,'e810ef94-3763-43cb-b70b-f5229124accb','baab0087-dcc1-4819-baed-4472103f8c40',1,20,_binary '','0c8fdf63-8a19-43e1-89fa-de67b164d6ce',NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('0bebefc0-4070-4c7b-9718-d1b0f2266504',NULL,NULL,'myRealm','c096b463-7bec-47c9-b85b-547cdaab9b8d',2,30,_binary '','7189ced0-1e4c-4c60-b0c5-baea43a0e3b9',NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('0c7ea9d3-81df-45d8-a599-c39f420ab70e',NULL,'registration-user-creation','e810ef94-3763-43cb-b70b-f5229124accb','fe30e942-5e8d-4cc6-859a-987e47104c31',0,20,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('0f302836-8ee2-4ade-95ec-b3989e399e2c',NULL,'idp-confirm-link','e810ef94-3763-43cb-b70b-f5229124accb','cde1d4ee-774d-4749-baa6-4ffb5a516dbc',0,10,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('12f944d3-5c02-44a7-be38-95a6f8e40d15',NULL,'direct-grant-validate-username','myRealm','39e2626c-a20a-4ab3-bb13-522ba1aec27e',0,10,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('1345df20-c793-43d2-926b-34be2b9c27a5',NULL,'auth-spnego','myRealm','cd8bd0d3-7088-4fd3-80b3-17d08b0c99d3',3,30,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('16cafa26-7172-4659-850a-2eb0ecd5acd9',NULL,'direct-grant-validate-username','e810ef94-3763-43cb-b70b-f5229124accb','a0f9b1b0-a840-4588-9b4c-8b21c7edb70d',0,10,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('1a49616d-d730-4452-b4df-a0063cf0285d',NULL,'reset-otp','e810ef94-3763-43cb-b70b-f5229124accb','ad93ba6c-35fd-4b65-b223-35a0311c517e',0,20,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('1a6bab11-ce4b-43b5-88cb-00a4d6b8dfa5',NULL,'auth-cookie','myRealm','c096b463-7bec-47c9-b85b-547cdaab9b8d',2,10,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('1b310801-d3b1-4a11-b8fa-48edc5768aaa',NULL,'direct-grant-validate-otp','myRealm','8ffe0417-4fda-42b1-84a3-6da9e109303e',0,20,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('2081d1c1-f1cf-4ebf-ba11-97f36aa67762',NULL,'http-basic-authenticator','e810ef94-3763-43cb-b70b-f5229124accb','fd80f0df-6fed-4ec9-b014-f223d1104aa6',0,10,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('223bd8b2-8f21-43a6-9e59-11bcfdc444b0',NULL,'reset-credential-email','myRealm','59ad7d35-e871-4b11-8e67-f426caab8589',0,20,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('2482e839-d9ad-48d0-a223-c0ce9e91bc70',NULL,'idp-create-user-if-unique','e810ef94-3763-43cb-b70b-f5229124accb','5508c6be-05ff-4b09-9295-f332d7362926',2,10,_binary '\0',NULL,'6ac45a5f-b761-4b9f-a7fa-756088dc3aea');
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('2eeb49c1-ab82-402f-a0a2-f943d8bfd821',NULL,NULL,'e810ef94-3763-43cb-b70b-f5229124accb','689ab60b-ecf9-4cf4-8638-f3392b1b8585',0,20,_binary '','5508c6be-05ff-4b09-9295-f332d7362926',NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('2fb76862-1b76-4945-a82e-5cce9af83791',NULL,'auth-otp-form','myRealm','0d04193f-2945-498f-bc2d-3cf0e8c9c168',0,20,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('33cebccb-50ed-4a60-88be-e2abcbc77bd3',NULL,NULL,'myRealm','38ffd25e-24ac-4d71-aab3-d4e46e0efda9',0,20,_binary '','cd8bd0d3-7088-4fd3-80b3-17d08b0c99d3',NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('3459283a-43d3-42dc-a635-6dc340aaf1f3',NULL,NULL,'e810ef94-3763-43cb-b70b-f5229124accb','5508c6be-05ff-4b09-9295-f332d7362926',2,20,_binary '','cde1d4ee-774d-4749-baa6-4ffb5a516dbc',NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('35c0e9b2-cf8d-4fe2-8d2a-db5297d166ca',NULL,NULL,'myRealm','7189ced0-1e4c-4c60-b0c5-baea43a0e3b9',1,20,_binary '','0d04193f-2945-498f-bc2d-3cf0e8c9c168',NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('39278235-4b45-4bdc-a7e7-8a682e496965',NULL,'registration-profile-action','myRealm','9e5ca16f-6a71-4b68-902a-f759233fe801',0,40,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('40bea332-d245-4450-83c3-648a815ca03a',NULL,'identity-provider-redirector','e810ef94-3763-43cb-b70b-f5229124accb','f48b53dc-10d1-433d-b836-ecea1e708437',2,25,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('42693d60-df93-49c8-80dd-236bdd3170b2',NULL,NULL,'myRealm','8e7c9362-d87f-4154-a9f4-53128b54ee2c',2,20,_binary '','fb178798-f38a-489e-8b2f-d58f20127f60',NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('43312cef-134e-431f-bdfa-6c002953a822',NULL,'registration-password-action','e810ef94-3763-43cb-b70b-f5229124accb','fe30e942-5e8d-4cc6-859a-987e47104c31',0,50,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('43f53c56-4d40-45b2-bb07-573416a7dde0',NULL,NULL,'e810ef94-3763-43cb-b70b-f5229124accb','cde1d4ee-774d-4749-baa6-4ffb5a516dbc',0,20,_binary '','9275e494-c61f-4562-8c5b-9b634cdbfc1a',NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('45a9a2da-4df4-40ac-b022-269e36b70641',NULL,'http-basic-authenticator','myRealm','22ba2482-3494-4638-bf0c-bb73c4d007ab',0,10,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('4b039f6b-758f-43a1-81e8-a19c5652750e',NULL,'client-x509','e810ef94-3763-43cb-b70b-f5229124accb','ff776c3c-6fb1-4265-9380-4b2d19ca4856',2,40,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('4b531571-0b2c-449b-8efa-c691412ada8d',NULL,NULL,'myRealm','39b89b72-c36d-4306-96b7-11bbc69fb19d',0,20,_binary '','3661284e-b092-4561-8599-61e5e5acd0b5',NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('4c734202-8a2c-421b-9ea4-b19345cfb543',NULL,'auth-username-password-form','myRealm','7189ced0-1e4c-4c60-b0c5-baea43a0e3b9',0,10,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('4c8936ed-8aac-4569-9f30-27d07469bd5e',NULL,'no-cookie-redirect','e810ef94-3763-43cb-b70b-f5229124accb','a3ed19b5-defc-4705-8eb3-7c6d4834d76d',0,10,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('50faed20-5871-4d81-8b78-1c0aaee89eee',NULL,'registration-page-form','myRealm','579938b5-fbd5-4b0a-872c-e1b345f22481',0,10,_binary '','9e5ca16f-6a71-4b68-902a-f759233fe801',NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('51c2b527-d60d-42ff-b38c-4429d0255f4a',NULL,NULL,'e810ef94-3763-43cb-b70b-f5229124accb','f48b53dc-10d1-433d-b836-ecea1e708437',2,30,_binary '','baab0087-dcc1-4819-baed-4472103f8c40',NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('534493c9-e7bf-45e8-bea5-25daee7b0197',NULL,'no-cookie-redirect','myRealm','38ffd25e-24ac-4d71-aab3-d4e46e0efda9',0,10,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('5671fd92-cf5c-4800-8c29-ded85551aa8b',NULL,'auth-username-password-form','e810ef94-3763-43cb-b70b-f5229124accb','baab0087-dcc1-4819-baed-4472103f8c40',0,10,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('56d687da-733f-4819-bd65-b852ba3dafe7',NULL,'registration-profile-action','e810ef94-3763-43cb-b70b-f5229124accb','fe30e942-5e8d-4cc6-859a-987e47104c31',0,40,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('5b45df6c-51e6-43a3-bcc5-cf6c26293541',NULL,'idp-username-password-form','e810ef94-3763-43cb-b70b-f5229124accb','cb2afee6-45ee-442c-a9ba-5599c8622c9b',0,10,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('60d390c0-339a-4b57-9a64-c23d940c52cb',NULL,'reset-credentials-choose-user','myRealm','59ad7d35-e871-4b11-8e67-f426caab8589',0,10,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('63f5ac00-8fa6-4dd4-83f0-12bfabc98ddb',NULL,'conditional-user-configured','e810ef94-3763-43cb-b70b-f5229124accb','0c8fdf63-8a19-43e1-89fa-de67b164d6ce',0,10,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('646a12f8-d43d-4ec5-bc3d-c187916c22e4',NULL,'client-x509','myRealm','e25cbe9f-08f2-4722-9bc7-7aa34a6f0629',2,40,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('677ba366-c900-4ff8-a622-6fae5865a875',NULL,'direct-grant-validate-password','e810ef94-3763-43cb-b70b-f5229124accb','a0f9b1b0-a840-4588-9b4c-8b21c7edb70d',0,20,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('684d17bb-ad61-48ee-a051-8161200971d8',NULL,'client-secret','e810ef94-3763-43cb-b70b-f5229124accb','ff776c3c-6fb1-4265-9380-4b2d19ca4856',2,10,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('6b8824fe-3162-46cb-8d50-2f32a12ce96a',NULL,'registration-password-action','myRealm','9e5ca16f-6a71-4b68-902a-f759233fe801',0,50,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('70e9b642-1431-4f94-8eb0-442b0b43e47c',NULL,'conditional-user-configured','e810ef94-3763-43cb-b70b-f5229124accb','ad93ba6c-35fd-4b65-b223-35a0311c517e',0,10,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('7189cbaa-8180-4690-8af7-afd19d334444',NULL,'docker-http-basic-authenticator','e810ef94-3763-43cb-b70b-f5229124accb','ace75054-1595-47c4-ad52-cb67ea6639b6',0,10,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('76b50065-b1c8-493b-8992-6553f58a0459',NULL,NULL,'myRealm','fb178798-f38a-489e-8b2f-d58f20127f60',1,20,_binary '','629f8d1b-d145-496f-8551-ec59f1f7e5a4',NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('76f05c39-f9da-4f40-95a6-7cf878ad7568',NULL,'reset-credentials-choose-user','e810ef94-3763-43cb-b70b-f5229124accb','56bfc10c-e527-430c-a6ba-b3a68620b553',0,10,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('78c54a10-80a3-4037-a538-7797a36a0d4d',NULL,'conditional-user-configured','e810ef94-3763-43cb-b70b-f5229124accb','b5394f3c-c1e7-4e67-8443-ede8186c4b46',0,10,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('7b020015-3341-4eab-ae71-b977207bdfd6',NULL,'conditional-user-configured','e810ef94-3763-43cb-b70b-f5229124accb','3807709b-9040-453b-a098-920ad558176d',0,10,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('7f554549-f9ad-425e-8571-f0ab4a7c611b',NULL,'auth-otp-form','myRealm','629f8d1b-d145-496f-8551-ec59f1f7e5a4',0,20,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('852a079a-1f73-48fb-ada9-1c137d033dbf',NULL,'idp-create-user-if-unique','myRealm','3661284e-b092-4561-8599-61e5e5acd0b5',2,10,_binary '\0',NULL,'ed5f1635-6fa6-46b5-a728-b76ee6fb2594');
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('8816c958-7d75-4cfc-a1f4-eaa5505e8615',NULL,'client-jwt','myRealm','e25cbe9f-08f2-4722-9bc7-7aa34a6f0629',2,20,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('887d2ec5-6697-4112-a7c5-a73b11ea9ad2',NULL,'reset-otp','myRealm','19214082-5af7-4a17-b42b-1a17ee030666',0,20,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('8bf03a02-8faa-425b-8969-573cb7ddaf4d',NULL,'conditional-user-configured','myRealm','19214082-5af7-4a17-b42b-1a17ee030666',0,10,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('8e411aa0-6bea-4d13-9b54-f099b8e94185',NULL,'direct-grant-validate-otp','e810ef94-3763-43cb-b70b-f5229124accb','b5394f3c-c1e7-4e67-8443-ede8186c4b46',0,20,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('8ea53f91-a5db-4d21-86bc-2f9d6bf4dbb9',NULL,'client-secret-jwt','myRealm','e25cbe9f-08f2-4722-9bc7-7aa34a6f0629',2,30,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('9150a694-7f01-40e9-b34a-577c324852f3',NULL,'basic-auth-otp','myRealm','cd8bd0d3-7088-4fd3-80b3-17d08b0c99d3',3,20,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('996b6c4b-7979-4b37-90aa-aef17589cdcf',NULL,'registration-recaptcha-action','e810ef94-3763-43cb-b70b-f5229124accb','fe30e942-5e8d-4cc6-859a-987e47104c31',3,60,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('a3b49b8f-3556-40cc-8760-34ac7f6aaade',NULL,NULL,'myRealm','59ad7d35-e871-4b11-8e67-f426caab8589',1,40,_binary '','19214082-5af7-4a17-b42b-1a17ee030666',NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('ac162023-e379-4b39-b7dd-f7a35bbb1c6e',NULL,'auth-spnego','e810ef94-3763-43cb-b70b-f5229124accb','a952b5d4-8044-43e3-9ed4-9a7b601d4b2a',3,30,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('ad78c495-ce3b-47fb-919e-18b041ec157b',NULL,'idp-review-profile','myRealm','39b89b72-c36d-4306-96b7-11bbc69fb19d',0,10,_binary '\0',NULL,'3df06604-fa31-47d0-acb8-57f8f70905b9');
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('b0ca5749-b33d-43ce-8a11-b5a32ee06115',NULL,'auth-otp-form','e810ef94-3763-43cb-b70b-f5229124accb','3807709b-9040-453b-a098-920ad558176d',0,20,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('b4c738a6-7b9b-4777-9198-58803fbbd24d',NULL,'idp-review-profile','e810ef94-3763-43cb-b70b-f5229124accb','689ab60b-ecf9-4cf4-8638-f3392b1b8585',0,10,_binary '\0',NULL,'d5546f77-2e5c-4d68-a885-fab4f1220302');
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('b6088983-703f-4500-8f7d-7e8a655f29c8',NULL,'idp-username-password-form','myRealm','fb178798-f38a-489e-8b2f-d58f20127f60',0,10,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('bc8b5d70-5411-4f61-9bc4-6415b342b9ca',NULL,'reset-password','myRealm','59ad7d35-e871-4b11-8e67-f426caab8589',0,30,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('bd1f9e8d-c83f-4501-8ae8-65ef485918c4',NULL,'conditional-user-configured','myRealm','0d04193f-2945-498f-bc2d-3cf0e8c9c168',0,10,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('bd62c184-9424-4a42-87b1-552afe701a35',NULL,'conditional-user-configured','myRealm','8ffe0417-4fda-42b1-84a3-6da9e109303e',0,10,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('c3f18683-24e0-442b-a2db-320126283fa8',NULL,'idp-email-verification','e810ef94-3763-43cb-b70b-f5229124accb','9275e494-c61f-4562-8c5b-9b634cdbfc1a',2,10,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('c61da760-65f0-490f-944b-d00175299b9d',NULL,'client-jwt','e810ef94-3763-43cb-b70b-f5229124accb','ff776c3c-6fb1-4265-9380-4b2d19ca4856',2,20,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('c6506e73-7b8e-4968-a6c2-4699c24da6e2',NULL,'auth-spnego','e810ef94-3763-43cb-b70b-f5229124accb','f48b53dc-10d1-433d-b836-ecea1e708437',3,20,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('c699275b-2b22-4e66-8d24-ecbb4aba0f07',NULL,'basic-auth-otp','e810ef94-3763-43cb-b70b-f5229124accb','a952b5d4-8044-43e3-9ed4-9a7b601d4b2a',3,20,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('cae6249c-b824-4a84-8b55-c14bd6abf7fa',NULL,'client-secret-jwt','e810ef94-3763-43cb-b70b-f5229124accb','ff776c3c-6fb1-4265-9380-4b2d19ca4856',2,30,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('cb1d65c1-fc6c-47cc-ae26-7de63700a074',NULL,'reset-password','e810ef94-3763-43cb-b70b-f5229124accb','56bfc10c-e527-430c-a6ba-b3a68620b553',0,30,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('cb48c3fc-ce26-4e99-b762-43cc997f46f7',NULL,NULL,'e810ef94-3763-43cb-b70b-f5229124accb','56bfc10c-e527-430c-a6ba-b3a68620b553',1,40,_binary '','ad93ba6c-35fd-4b65-b223-35a0311c517e',NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('cef04064-da94-4b2b-a360-f5467a5437ad',NULL,NULL,'e810ef94-3763-43cb-b70b-f5229124accb','a3ed19b5-defc-4705-8eb3-7c6d4834d76d',0,20,_binary '','a952b5d4-8044-43e3-9ed4-9a7b601d4b2a',NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('d0df55bc-9b8b-4954-ad72-327a8ef67c64',NULL,'conditional-user-configured','myRealm','629f8d1b-d145-496f-8551-ec59f1f7e5a4',0,10,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('d1bbaa8b-c5c5-4da9-b2c7-51bd6c5b4cd0',NULL,NULL,'e810ef94-3763-43cb-b70b-f5229124accb','a0f9b1b0-a840-4588-9b4c-8b21c7edb70d',1,30,_binary '','b5394f3c-c1e7-4e67-8443-ede8186c4b46',NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('d593d6c1-133d-4cc4-b9d0-59924a1dbd52',NULL,'identity-provider-redirector','myRealm','c096b463-7bec-47c9-b85b-547cdaab9b8d',2,25,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('d740a9cf-8f5a-4201-b149-415a6d6e9028',NULL,'idp-email-verification','myRealm','8e7c9362-d87f-4154-a9f4-53128b54ee2c',2,10,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('ddd8ec44-fb21-4c41-b39b-422ad3b0cd8d',NULL,NULL,'myRealm','39e2626c-a20a-4ab3-bb13-522ba1aec27e',1,30,_binary '','8ffe0417-4fda-42b1-84a3-6da9e109303e',NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('e30017b1-f5fe-4bea-9897-7afebd67cee6',NULL,'basic-auth','e810ef94-3763-43cb-b70b-f5229124accb','a952b5d4-8044-43e3-9ed4-9a7b601d4b2a',0,10,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('e5031673-29ce-49e7-9e42-a3e873c2d532',NULL,'client-secret','myRealm','e25cbe9f-08f2-4722-9bc7-7aa34a6f0629',2,10,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('e9360d65-c4fd-4406-a204-26ca949d1ee3',NULL,NULL,'e810ef94-3763-43cb-b70b-f5229124accb','9275e494-c61f-4562-8c5b-9b634cdbfc1a',2,20,_binary '','cb2afee6-45ee-442c-a9ba-5599c8622c9b',NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('ebd58999-b81c-4bf2-82f8-bd496bdfcdde',NULL,'auth-cookie','e810ef94-3763-43cb-b70b-f5229124accb','f48b53dc-10d1-433d-b836-ecea1e708437',2,10,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('f2e8149b-030c-4d09-b7a2-765226cbf90f',NULL,NULL,'myRealm','3661284e-b092-4561-8599-61e5e5acd0b5',2,20,_binary '','681ad9cd-6898-4c0c-8b13-a8ebb9c6a3ee',NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('f313eb6a-623e-42fe-8948-4066db317d94',NULL,'basic-auth','myRealm','cd8bd0d3-7088-4fd3-80b3-17d08b0c99d3',0,10,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('f6d2c41e-43e5-43c5-8aaa-2fdceaad919a',NULL,'idp-confirm-link','myRealm','681ad9cd-6898-4c0c-8b13-a8ebb9c6a3ee',0,10,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('f73ab66c-e672-4a2e-be04-b1e7b5dfd22c',NULL,'direct-grant-validate-password','myRealm','39e2626c-a20a-4ab3-bb13-522ba1aec27e',0,20,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('fa11bbc4-a450-4697-93c3-c2496dc16f0a',NULL,'reset-credential-email','e810ef94-3763-43cb-b70b-f5229124accb','56bfc10c-e527-430c-a6ba-b3a68620b553',0,20,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('fcbb1b29-cc50-4f54-82a8-2e3c866c0735',NULL,NULL,'myRealm','681ad9cd-6898-4c0c-8b13-a8ebb9c6a3ee',0,20,_binary '','8e7c9362-d87f-4154-a9f4-53128b54ee2c',NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('fcc24bba-221e-40dc-aa7d-6fc8d750b2b9',NULL,'registration-page-form','e810ef94-3763-43cb-b70b-f5229124accb','4de58572-3d33-4dc5-bea0-6f8d96c603b3',0,10,_binary '','fe30e942-5e8d-4cc6-859a-987e47104c31',NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('fe0cfe55-1890-42a8-87ca-d5f5da46af94',NULL,'auth-spnego','myRealm','c096b463-7bec-47c9-b85b-547cdaab9b8d',3,20,_binary '\0',NULL,NULL);
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('ffe51e4a-2d1f-49d9-9072-196795bdb7bb',NULL,'auth-otp-form','e810ef94-3763-43cb-b70b-f5229124accb','0c8fdf63-8a19-43e1-89fa-de67b164d6ce',0,20,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_FLOW`
--

DROP TABLE IF EXISTS `AUTHENTICATION_FLOW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATION_FLOW` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ALIAS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROVIDER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'basic-flow',
  `TOP_LEVEL` bit(1) NOT NULL DEFAULT b'0',
  `BUILT_IN` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_FLOW_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_FLOW_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_FLOW`
--

LOCK TABLES `AUTHENTICATION_FLOW` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('0c8fdf63-8a19-43e1-89fa-de67b164d6ce','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','e810ef94-3763-43cb-b70b-f5229124accb','basic-flow',_binary '\0',_binary '');
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('0d04193f-2945-498f-bc2d-3cf0e8c9c168','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','myRealm','basic-flow',_binary '\0',_binary '');
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('10ae087b-49ce-40ff-a056-cab195e94928','docker auth','Used by Docker clients to authenticate against the IDP','myRealm','basic-flow',_binary '',_binary '');
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('19214082-5af7-4a17-b42b-1a17ee030666','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','myRealm','basic-flow',_binary '\0',_binary '');
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('22ba2482-3494-4638-bf0c-bb73c4d007ab','saml ecp','SAML ECP Profile Authentication Flow','myRealm','basic-flow',_binary '',_binary '');
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('3661284e-b092-4561-8599-61e5e5acd0b5','User creation or linking','Flow for the existing/non-existing user alternatives','myRealm','basic-flow',_binary '\0',_binary '');
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('3807709b-9040-453b-a098-920ad558176d','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','e810ef94-3763-43cb-b70b-f5229124accb','basic-flow',_binary '\0',_binary '');
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('38ffd25e-24ac-4d71-aab3-d4e46e0efda9','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','myRealm','basic-flow',_binary '',_binary '');
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('39b89b72-c36d-4306-96b7-11bbc69fb19d','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','myRealm','basic-flow',_binary '',_binary '');
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('39e2626c-a20a-4ab3-bb13-522ba1aec27e','direct grant','OpenID Connect Resource Owner Grant','myRealm','basic-flow',_binary '',_binary '');
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('4de58572-3d33-4dc5-bea0-6f8d96c603b3','registration','registration flow','e810ef94-3763-43cb-b70b-f5229124accb','basic-flow',_binary '',_binary '');
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('5508c6be-05ff-4b09-9295-f332d7362926','User creation or linking','Flow for the existing/non-existing user alternatives','e810ef94-3763-43cb-b70b-f5229124accb','basic-flow',_binary '\0',_binary '');
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('56bfc10c-e527-430c-a6ba-b3a68620b553','reset credentials','Reset credentials for a user if they forgot their password or something','e810ef94-3763-43cb-b70b-f5229124accb','basic-flow',_binary '',_binary '');
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('579938b5-fbd5-4b0a-872c-e1b345f22481','registration','registration flow','myRealm','basic-flow',_binary '',_binary '');
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('59ad7d35-e871-4b11-8e67-f426caab8589','reset credentials','Reset credentials for a user if they forgot their password or something','myRealm','basic-flow',_binary '',_binary '');
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('629f8d1b-d145-496f-8551-ec59f1f7e5a4','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','myRealm','basic-flow',_binary '\0',_binary '');
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('681ad9cd-6898-4c0c-8b13-a8ebb9c6a3ee','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','myRealm','basic-flow',_binary '\0',_binary '');
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('689ab60b-ecf9-4cf4-8638-f3392b1b8585','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','e810ef94-3763-43cb-b70b-f5229124accb','basic-flow',_binary '',_binary '');
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('7189ced0-1e4c-4c60-b0c5-baea43a0e3b9','forms','Username, password, otp and other auth forms.','myRealm','basic-flow',_binary '\0',_binary '');
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('8e7c9362-d87f-4154-a9f4-53128b54ee2c','Account verification options','Method with which to verity the existing account','myRealm','basic-flow',_binary '\0',_binary '');
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('8ffe0417-4fda-42b1-84a3-6da9e109303e','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','myRealm','basic-flow',_binary '\0',_binary '');
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('9275e494-c61f-4562-8c5b-9b634cdbfc1a','Account verification options','Method with which to verity the existing account','e810ef94-3763-43cb-b70b-f5229124accb','basic-flow',_binary '\0',_binary '');
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('9e5ca16f-6a71-4b68-902a-f759233fe801','registration form','registration form','myRealm','form-flow',_binary '\0',_binary '');
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('a0f9b1b0-a840-4588-9b4c-8b21c7edb70d','direct grant','OpenID Connect Resource Owner Grant','e810ef94-3763-43cb-b70b-f5229124accb','basic-flow',_binary '',_binary '');
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('a3ed19b5-defc-4705-8eb3-7c6d4834d76d','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','e810ef94-3763-43cb-b70b-f5229124accb','basic-flow',_binary '',_binary '');
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('a952b5d4-8044-43e3-9ed4-9a7b601d4b2a','Authentication Options','Authentication options.','e810ef94-3763-43cb-b70b-f5229124accb','basic-flow',_binary '\0',_binary '');
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('ace75054-1595-47c4-ad52-cb67ea6639b6','docker auth','Used by Docker clients to authenticate against the IDP','e810ef94-3763-43cb-b70b-f5229124accb','basic-flow',_binary '',_binary '');
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('ad93ba6c-35fd-4b65-b223-35a0311c517e','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','e810ef94-3763-43cb-b70b-f5229124accb','basic-flow',_binary '\0',_binary '');
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('b5394f3c-c1e7-4e67-8443-ede8186c4b46','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','e810ef94-3763-43cb-b70b-f5229124accb','basic-flow',_binary '\0',_binary '');
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('baab0087-dcc1-4819-baed-4472103f8c40','forms','Username, password, otp and other auth forms.','e810ef94-3763-43cb-b70b-f5229124accb','basic-flow',_binary '\0',_binary '');
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('c096b463-7bec-47c9-b85b-547cdaab9b8d','browser','browser based authentication','myRealm','basic-flow',_binary '',_binary '');
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('cb2afee6-45ee-442c-a9ba-5599c8622c9b','Verify Existing Account by Re-authentication','Reauthentication of existing account','e810ef94-3763-43cb-b70b-f5229124accb','basic-flow',_binary '\0',_binary '');
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('cd8bd0d3-7088-4fd3-80b3-17d08b0c99d3','Authentication Options','Authentication options.','myRealm','basic-flow',_binary '\0',_binary '');
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('cde1d4ee-774d-4749-baa6-4ffb5a516dbc','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','e810ef94-3763-43cb-b70b-f5229124accb','basic-flow',_binary '\0',_binary '');
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('e25cbe9f-08f2-4722-9bc7-7aa34a6f0629','clients','Base authentication for clients','myRealm','client-flow',_binary '',_binary '');
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('f48b53dc-10d1-433d-b836-ecea1e708437','browser','browser based authentication','e810ef94-3763-43cb-b70b-f5229124accb','basic-flow',_binary '',_binary '');
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('fb178798-f38a-489e-8b2f-d58f20127f60','Verify Existing Account by Re-authentication','Reauthentication of existing account','myRealm','basic-flow',_binary '\0',_binary '');
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('fd80f0df-6fed-4ec9-b014-f223d1104aa6','saml ecp','SAML ECP Profile Authentication Flow','e810ef94-3763-43cb-b70b-f5229124accb','basic-flow',_binary '',_binary '');
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('fe30e942-5e8d-4cc6-859a-987e47104c31','registration form','registration form','e810ef94-3763-43cb-b70b-f5229124accb','form-flow',_binary '\0',_binary '');
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('ff776c3c-6fb1-4265-9380-4b2d19ca4856','clients','Base authentication for clients','e810ef94-3763-43cb-b70b-f5229124accb','client-flow',_binary '',_binary '');
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATOR_CONFIG` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ALIAS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_CONFIG_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG`
--

LOCK TABLES `AUTHENTICATOR_CONFIG` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG` VALUES ('3df06604-fa31-47d0-acb8-57f8f70905b9','review profile config','myRealm');
INSERT INTO `AUTHENTICATOR_CONFIG` VALUES ('6ac45a5f-b761-4b9f-a7fa-756088dc3aea','create unique user config','e810ef94-3763-43cb-b70b-f5229124accb');
INSERT INTO `AUTHENTICATOR_CONFIG` VALUES ('d5546f77-2e5c-4d68-a885-fab4f1220302','review profile config','e810ef94-3763-43cb-b70b-f5229124accb');
INSERT INTO `AUTHENTICATOR_CONFIG` VALUES ('ed5f1635-6fa6-46b5-a728-b76ee6fb2594','create unique user config','myRealm');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG_ENTRY`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG_ENTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATOR_CONFIG_ENTRY` (
  `AUTHENTICATOR_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` longtext COLLATE utf8mb4_unicode_ci,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`AUTHENTICATOR_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG_ENTRY`
--

LOCK TABLES `AUTHENTICATOR_CONFIG_ENTRY` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG_ENTRY` VALUES ('3df06604-fa31-47d0-acb8-57f8f70905b9','missing','update.profile.on.first.login');
INSERT INTO `AUTHENTICATOR_CONFIG_ENTRY` VALUES ('6ac45a5f-b761-4b9f-a7fa-756088dc3aea','false','require.password.update.after.registration');
INSERT INTO `AUTHENTICATOR_CONFIG_ENTRY` VALUES ('d5546f77-2e5c-4d68-a885-fab4f1220302','missing','update.profile.on.first.login');
INSERT INTO `AUTHENTICATOR_CONFIG_ENTRY` VALUES ('ed5f1635-6fa6-46b5-a728-b76ee6fb2594','false','require.password.update.after.registration');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BROKER_LINK`
--

DROP TABLE IF EXISTS `BROKER_LINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BROKER_LINK` (
  `IDENTITY_PROVIDER` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `BROKER_USER_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BROKER_USERNAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TOKEN` text COLLATE utf8mb4_unicode_ci,
  `USER_ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BROKER_LINK`
--

LOCK TABLES `BROKER_LINK` WRITE;
/*!40000 ALTER TABLE `BROKER_LINK` DISABLE KEYS */;
/*!40000 ALTER TABLE `BROKER_LINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT`
--

DROP TABLE IF EXISTS `CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FULL_SCOPE_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NOT_BEFORE` int DEFAULT NULL,
  `PUBLIC_CLIENT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BASE_URL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BEARER_ONLY` bit(1) NOT NULL DEFAULT b'0',
  `MANAGEMENT_URL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SURROGATE_AUTH_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROTOCOL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NODE_REREG_TIMEOUT` int DEFAULT '0',
  `FRONTCHANNEL_LOGOUT` bit(1) NOT NULL DEFAULT b'0',
  `CONSENT_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `SERVICE_ACCOUNTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_AUTHENTICATOR_TYPE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ROOT_URL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REGISTRATION_TOKEN` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `STANDARD_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'1',
  `IMPLICIT_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DIRECT_ACCESS_GRANTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ALWAYS_DISPLAY_IN_CONSOLE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_B71CJLBENV945RB6GCON438AT` (`REALM_ID`,`CLIENT_ID`),
  KEY `IDX_CLIENT_ID` (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT`
--

LOCK TABLES `CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT` VALUES ('215f0e81-2f4a-4af0-a1f8-dacb16123d21',_binary '',_binary '\0','admin-cli',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','myRealm','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0');
INSERT INTO `CLIENT` VALUES ('65276c8e-b3a5-4376-a32a-af9612b26fe7',_binary '',_binary '\0','security-admin-console',0,_binary '',NULL,'/admin/myRealm/console/',_binary '\0',NULL,_binary '\0','myRealm','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0');
INSERT INTO `CLIENT` VALUES ('7d76f094-a7b6-4acb-9c54-dbb45857d8de',_binary '',_binary '\0','account',0,_binary '',NULL,'/realms/master/account/',_binary '\0',NULL,_binary '\0','e810ef94-3763-43cb-b70b-f5229124accb','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0');
INSERT INTO `CLIENT` VALUES ('91dbffbb-cafd-40eb-a312-8dbc536d10e3',_binary '',_binary '\0','myRealm-realm',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','e810ef94-3763-43cb-b70b-f5229124accb',NULL,0,_binary '\0',_binary '\0','myRealm Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0');
INSERT INTO `CLIENT` VALUES ('9ebdb3bc-347f-4bb9-b642-8cbeb42342bc',_binary '',_binary '\0','master-realm',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','e810ef94-3763-43cb-b70b-f5229124accb',NULL,0,_binary '\0',_binary '\0','master Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0');
INSERT INTO `CLIENT` VALUES ('abe573fb-c472-4075-b7a3-78b6d82bc51d',_binary '',_binary '\0','admin-cli',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','e810ef94-3763-43cb-b70b-f5229124accb','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0');
INSERT INTO `CLIENT` VALUES ('b1340e05-4d92-478a-b49b-5820af128eca',_binary '',_binary '\0','account',0,_binary '',NULL,'/realms/myRealm/account/',_binary '\0',NULL,_binary '\0','myRealm','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0');
INSERT INTO `CLIENT` VALUES ('ba72da23-8ec5-4150-8de8-22b7e39be868',_binary '',_binary '\0','account-console',0,_binary '',NULL,'/realms/myRealm/account/',_binary '\0',NULL,_binary '\0','myRealm','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0');
INSERT INTO `CLIENT` VALUES ('bad387fc-627c-4369-ab9a-fdb5f7ce588c',_binary '',_binary '\0','account-console',0,_binary '',NULL,'/realms/master/account/',_binary '\0',NULL,_binary '\0','e810ef94-3763-43cb-b70b-f5229124accb','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0');
INSERT INTO `CLIENT` VALUES ('cdf9904a-f867-46de-8f2a-34b701b9ba32',_binary '',_binary '\0','security-admin-console',0,_binary '',NULL,'/admin/master/console/',_binary '\0',NULL,_binary '\0','e810ef94-3763-43cb-b70b-f5229124accb','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0');
INSERT INTO `CLIENT` VALUES ('df002117-07e7-4bcc-a8b8-05970dee31f4',_binary '',_binary '\0','broker',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','e810ef94-3763-43cb-b70b-f5229124accb','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0');
INSERT INTO `CLIENT` VALUES ('ea0b71d2-663b-42b2-ada3-f3547ac7ba9c',_binary '',_binary '\0','broker',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','myRealm','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0');
INSERT INTO `CLIENT` VALUES ('f0348189-2c48-4e29-a817-28d4e432703d',_binary '',_binary '\0','realm-management',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','myRealm','openid-connect',0,_binary '\0',_binary '\0','${client_realm-management}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0');
/*!40000 ALTER TABLE `CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_ATTRIBUTES` (
  `CLIENT_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` text COLLATE utf8mb4_unicode_ci,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  KEY `IDX_CLIENT_ATT_BY_NAME_VALUE` (`NAME`,`VALUE`(255)),
  CONSTRAINT `FK3C47C64BEACCA966` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_ATTRIBUTES`
--

LOCK TABLES `CLIENT_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_ATTRIBUTES` VALUES ('65276c8e-b3a5-4376-a32a-af9612b26fe7','S256','pkce.code.challenge.method');
INSERT INTO `CLIENT_ATTRIBUTES` VALUES ('ba72da23-8ec5-4150-8de8-22b7e39be868','S256','pkce.code.challenge.method');
INSERT INTO `CLIENT_ATTRIBUTES` VALUES ('bad387fc-627c-4369-ab9a-fdb5f7ce588c','S256','pkce.code.challenge.method');
INSERT INTO `CLIENT_ATTRIBUTES` VALUES ('cdf9904a-f867-46de-8f2a-34b701b9ba32','S256','pkce.code.challenge.method');
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_AUTH_FLOW_BINDINGS`
--

DROP TABLE IF EXISTS `CLIENT_AUTH_FLOW_BINDINGS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_AUTH_FLOW_BINDINGS` (
  `CLIENT_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FLOW_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BINDING_NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`BINDING_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_AUTH_FLOW_BINDINGS`
--

LOCK TABLES `CLIENT_AUTH_FLOW_BINDINGS` WRITE;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_INITIAL_ACCESS`
--

DROP TABLE IF EXISTS `CLIENT_INITIAL_ACCESS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_INITIAL_ACCESS` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `EXPIRATION` int DEFAULT NULL,
  `COUNT` int DEFAULT NULL,
  `REMAINING_COUNT` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_INIT_ACC_REALM` (`REALM_ID`),
  CONSTRAINT `FK_CLIENT_INIT_ACC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_INITIAL_ACCESS`
--

LOCK TABLES `CLIENT_INITIAL_ACCESS` WRITE;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_NODE_REGISTRATIONS`
--

DROP TABLE IF EXISTS `CLIENT_NODE_REGISTRATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_NODE_REGISTRATIONS` (
  `CLIENT_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` int DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK4129723BA992F594` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_NODE_REGISTRATIONS`
--

LOCK TABLES `CLIENT_NODE_REGISTRATIONS` WRITE;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PROTOCOL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_CLI_SCOPE` (`REALM_ID`,`NAME`),
  KEY `IDX_REALM_CLSCOPE` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE`
--

LOCK TABLES `CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE` VALUES ('065158f3-390f-42b3-8666-852906e538fa','offline_access','myRealm','OpenID Connect built-in scope: offline_access','openid-connect');
INSERT INTO `CLIENT_SCOPE` VALUES ('0a0b84ad-2758-407c-8acc-49fb64d4578e','email','e810ef94-3763-43cb-b70b-f5229124accb','OpenID Connect built-in scope: email','openid-connect');
INSERT INTO `CLIENT_SCOPE` VALUES ('0b8672d9-a343-409a-8d03-2fc8f8b314aa','web-origins','myRealm','OpenID Connect scope for add allowed web origins to the access token','openid-connect');
INSERT INTO `CLIENT_SCOPE` VALUES ('179593fa-2506-499a-944e-77ffe4b6fdd1','roles','myRealm','OpenID Connect scope for add user roles to the access token','openid-connect');
INSERT INTO `CLIENT_SCOPE` VALUES ('2b958474-6d3d-44f0-838f-e353223692f5','microprofile-jwt','myRealm','Microprofile - JWT built-in scope','openid-connect');
INSERT INTO `CLIENT_SCOPE` VALUES ('45c4948d-82c7-49c5-ad37-9b290995a96d','role_list','e810ef94-3763-43cb-b70b-f5229124accb','SAML role list','saml');
INSERT INTO `CLIENT_SCOPE` VALUES ('4fa058aa-5d90-41f3-816d-3b97b15cee0f','acr','myRealm','OpenID Connect scope for add acr (authentication context class reference) to the token','openid-connect');
INSERT INTO `CLIENT_SCOPE` VALUES ('52dbc43c-d0bd-461e-bc9f-941f7f551435','phone','e810ef94-3763-43cb-b70b-f5229124accb','OpenID Connect built-in scope: phone','openid-connect');
INSERT INTO `CLIENT_SCOPE` VALUES ('56804cff-2c5f-4c70-8822-dc9a87c9f997','address','myRealm','OpenID Connect built-in scope: address','openid-connect');
INSERT INTO `CLIENT_SCOPE` VALUES ('57b42671-20c2-4579-9cf5-4c3431917edb','profile','e810ef94-3763-43cb-b70b-f5229124accb','OpenID Connect built-in scope: profile','openid-connect');
INSERT INTO `CLIENT_SCOPE` VALUES ('58622285-f578-46f3-bbd0-2793b89ec84a','roles','e810ef94-3763-43cb-b70b-f5229124accb','OpenID Connect scope for add user roles to the access token','openid-connect');
INSERT INTO `CLIENT_SCOPE` VALUES ('5da6968d-da8c-4e80-b281-7b52e81116a4','web-origins','e810ef94-3763-43cb-b70b-f5229124accb','OpenID Connect scope for add allowed web origins to the access token','openid-connect');
INSERT INTO `CLIENT_SCOPE` VALUES ('7d729fa4-5aaf-434c-90f5-d9cd129cad37','address','e810ef94-3763-43cb-b70b-f5229124accb','OpenID Connect built-in scope: address','openid-connect');
INSERT INTO `CLIENT_SCOPE` VALUES ('7f889b0d-8944-4c65-814c-af0a676675d0','offline_access','e810ef94-3763-43cb-b70b-f5229124accb','OpenID Connect built-in scope: offline_access','openid-connect');
INSERT INTO `CLIENT_SCOPE` VALUES ('8a7e233a-0064-427d-b873-1e0eca4e45d2','acr','e810ef94-3763-43cb-b70b-f5229124accb','OpenID Connect scope for add acr (authentication context class reference) to the token','openid-connect');
INSERT INTO `CLIENT_SCOPE` VALUES ('92de7d0c-41b5-46fe-99bb-1f137fca7778','role_list','myRealm','SAML role list','saml');
INSERT INTO `CLIENT_SCOPE` VALUES ('bc2f9339-ed10-4060-b0ce-cf30d11fcc53','email','myRealm','OpenID Connect built-in scope: email','openid-connect');
INSERT INTO `CLIENT_SCOPE` VALUES ('ccbef8af-20f1-474d-98b5-aa0a30340b70','profile','myRealm','OpenID Connect built-in scope: profile','openid-connect');
INSERT INTO `CLIENT_SCOPE` VALUES ('e1828105-24e0-4627-9827-0734c1296f99','phone','myRealm','OpenID Connect built-in scope: phone','openid-connect');
INSERT INTO `CLIENT_SCOPE` VALUES ('fdd0aabb-00d5-49b6-8afe-19c52d3ca168','microprofile-jwt','e810ef94-3763-43cb-b70b-f5229124accb','Microprofile - JWT built-in scope','openid-connect');
/*!40000 ALTER TABLE `CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_ATTRIBUTES` (
  `SCOPE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` text COLLATE utf8mb4_unicode_ci,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`NAME`),
  KEY `IDX_CLSCOPE_ATTRS` (`SCOPE_ID`),
  CONSTRAINT `FK_CL_SCOPE_ATTR_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ATTRIBUTES`
--

LOCK TABLES `CLIENT_SCOPE_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('065158f3-390f-42b3-8666-852906e538fa','${offlineAccessScopeConsentText}','consent.screen.text');
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('065158f3-390f-42b3-8666-852906e538fa','true','display.on.consent.screen');
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('0a0b84ad-2758-407c-8acc-49fb64d4578e','${emailScopeConsentText}','consent.screen.text');
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('0a0b84ad-2758-407c-8acc-49fb64d4578e','true','display.on.consent.screen');
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('0a0b84ad-2758-407c-8acc-49fb64d4578e','true','include.in.token.scope');
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('0b8672d9-a343-409a-8d03-2fc8f8b314aa','','consent.screen.text');
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('0b8672d9-a343-409a-8d03-2fc8f8b314aa','false','display.on.consent.screen');
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('0b8672d9-a343-409a-8d03-2fc8f8b314aa','false','include.in.token.scope');
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('179593fa-2506-499a-944e-77ffe4b6fdd1','${rolesScopeConsentText}','consent.screen.text');
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('179593fa-2506-499a-944e-77ffe4b6fdd1','true','display.on.consent.screen');
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('179593fa-2506-499a-944e-77ffe4b6fdd1','false','include.in.token.scope');
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('2b958474-6d3d-44f0-838f-e353223692f5','false','display.on.consent.screen');
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('2b958474-6d3d-44f0-838f-e353223692f5','true','include.in.token.scope');
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('45c4948d-82c7-49c5-ad37-9b290995a96d','${samlRoleListScopeConsentText}','consent.screen.text');
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('45c4948d-82c7-49c5-ad37-9b290995a96d','true','display.on.consent.screen');
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('4fa058aa-5d90-41f3-816d-3b97b15cee0f','false','display.on.consent.screen');
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('4fa058aa-5d90-41f3-816d-3b97b15cee0f','false','include.in.token.scope');
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('52dbc43c-d0bd-461e-bc9f-941f7f551435','${phoneScopeConsentText}','consent.screen.text');
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('52dbc43c-d0bd-461e-bc9f-941f7f551435','true','display.on.consent.screen');
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('52dbc43c-d0bd-461e-bc9f-941f7f551435','true','include.in.token.scope');
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('56804cff-2c5f-4c70-8822-dc9a87c9f997','${addressScopeConsentText}','consent.screen.text');
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('56804cff-2c5f-4c70-8822-dc9a87c9f997','true','display.on.consent.screen');
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('56804cff-2c5f-4c70-8822-dc9a87c9f997','true','include.in.token.scope');
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('57b42671-20c2-4579-9cf5-4c3431917edb','${profileScopeConsentText}','consent.screen.text');
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('57b42671-20c2-4579-9cf5-4c3431917edb','true','display.on.consent.screen');
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('57b42671-20c2-4579-9cf5-4c3431917edb','true','include.in.token.scope');
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('58622285-f578-46f3-bbd0-2793b89ec84a','${rolesScopeConsentText}','consent.screen.text');
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('58622285-f578-46f3-bbd0-2793b89ec84a','true','display.on.consent.screen');
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('58622285-f578-46f3-bbd0-2793b89ec84a','false','include.in.token.scope');
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('5da6968d-da8c-4e80-b281-7b52e81116a4','','consent.screen.text');
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('5da6968d-da8c-4e80-b281-7b52e81116a4','false','display.on.consent.screen');
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('5da6968d-da8c-4e80-b281-7b52e81116a4','false','include.in.token.scope');
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('7d729fa4-5aaf-434c-90f5-d9cd129cad37','${addressScopeConsentText}','consent.screen.text');
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('7d729fa4-5aaf-434c-90f5-d9cd129cad37','true','display.on.consent.screen');
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('7d729fa4-5aaf-434c-90f5-d9cd129cad37','true','include.in.token.scope');
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('7f889b0d-8944-4c65-814c-af0a676675d0','${offlineAccessScopeConsentText}','consent.screen.text');
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('7f889b0d-8944-4c65-814c-af0a676675d0','true','display.on.consent.screen');
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('8a7e233a-0064-427d-b873-1e0eca4e45d2','false','display.on.consent.screen');
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('8a7e233a-0064-427d-b873-1e0eca4e45d2','false','include.in.token.scope');
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('92de7d0c-41b5-46fe-99bb-1f137fca7778','${samlRoleListScopeConsentText}','consent.screen.text');
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('92de7d0c-41b5-46fe-99bb-1f137fca7778','true','display.on.consent.screen');
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('bc2f9339-ed10-4060-b0ce-cf30d11fcc53','${emailScopeConsentText}','consent.screen.text');
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('bc2f9339-ed10-4060-b0ce-cf30d11fcc53','true','display.on.consent.screen');
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('bc2f9339-ed10-4060-b0ce-cf30d11fcc53','true','include.in.token.scope');
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('ccbef8af-20f1-474d-98b5-aa0a30340b70','${profileScopeConsentText}','consent.screen.text');
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('ccbef8af-20f1-474d-98b5-aa0a30340b70','true','display.on.consent.screen');
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('ccbef8af-20f1-474d-98b5-aa0a30340b70','true','include.in.token.scope');
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('e1828105-24e0-4627-9827-0734c1296f99','${phoneScopeConsentText}','consent.screen.text');
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('e1828105-24e0-4627-9827-0734c1296f99','true','display.on.consent.screen');
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('e1828105-24e0-4627-9827-0734c1296f99','true','include.in.token.scope');
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('fdd0aabb-00d5-49b6-8afe-19c52d3ca168','false','display.on.consent.screen');
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('fdd0aabb-00d5-49b6-8afe-19c52d3ca168','true','include.in.token.scope');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_CLIENT`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_CLIENT` (
  `CLIENT_ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SCOPE_ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`CLIENT_ID`,`SCOPE_ID`),
  KEY `IDX_CLSCOPE_CL` (`CLIENT_ID`),
  KEY `IDX_CL_CLSCOPE` (`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_CLIENT`
--

LOCK TABLES `CLIENT_SCOPE_CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('215f0e81-2f4a-4af0-a1f8-dacb16123d21','065158f3-390f-42b3-8666-852906e538fa',_binary '\0');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('215f0e81-2f4a-4af0-a1f8-dacb16123d21','0b8672d9-a343-409a-8d03-2fc8f8b314aa',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('215f0e81-2f4a-4af0-a1f8-dacb16123d21','179593fa-2506-499a-944e-77ffe4b6fdd1',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('215f0e81-2f4a-4af0-a1f8-dacb16123d21','2b958474-6d3d-44f0-838f-e353223692f5',_binary '\0');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('215f0e81-2f4a-4af0-a1f8-dacb16123d21','4fa058aa-5d90-41f3-816d-3b97b15cee0f',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('215f0e81-2f4a-4af0-a1f8-dacb16123d21','56804cff-2c5f-4c70-8822-dc9a87c9f997',_binary '\0');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('215f0e81-2f4a-4af0-a1f8-dacb16123d21','bc2f9339-ed10-4060-b0ce-cf30d11fcc53',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('215f0e81-2f4a-4af0-a1f8-dacb16123d21','ccbef8af-20f1-474d-98b5-aa0a30340b70',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('215f0e81-2f4a-4af0-a1f8-dacb16123d21','e1828105-24e0-4627-9827-0734c1296f99',_binary '\0');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('65276c8e-b3a5-4376-a32a-af9612b26fe7','065158f3-390f-42b3-8666-852906e538fa',_binary '\0');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('65276c8e-b3a5-4376-a32a-af9612b26fe7','0b8672d9-a343-409a-8d03-2fc8f8b314aa',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('65276c8e-b3a5-4376-a32a-af9612b26fe7','179593fa-2506-499a-944e-77ffe4b6fdd1',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('65276c8e-b3a5-4376-a32a-af9612b26fe7','2b958474-6d3d-44f0-838f-e353223692f5',_binary '\0');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('65276c8e-b3a5-4376-a32a-af9612b26fe7','4fa058aa-5d90-41f3-816d-3b97b15cee0f',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('65276c8e-b3a5-4376-a32a-af9612b26fe7','56804cff-2c5f-4c70-8822-dc9a87c9f997',_binary '\0');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('65276c8e-b3a5-4376-a32a-af9612b26fe7','bc2f9339-ed10-4060-b0ce-cf30d11fcc53',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('65276c8e-b3a5-4376-a32a-af9612b26fe7','ccbef8af-20f1-474d-98b5-aa0a30340b70',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('65276c8e-b3a5-4376-a32a-af9612b26fe7','e1828105-24e0-4627-9827-0734c1296f99',_binary '\0');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('7d76f094-a7b6-4acb-9c54-dbb45857d8de','0a0b84ad-2758-407c-8acc-49fb64d4578e',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('7d76f094-a7b6-4acb-9c54-dbb45857d8de','52dbc43c-d0bd-461e-bc9f-941f7f551435',_binary '\0');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('7d76f094-a7b6-4acb-9c54-dbb45857d8de','57b42671-20c2-4579-9cf5-4c3431917edb',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('7d76f094-a7b6-4acb-9c54-dbb45857d8de','58622285-f578-46f3-bbd0-2793b89ec84a',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('7d76f094-a7b6-4acb-9c54-dbb45857d8de','5da6968d-da8c-4e80-b281-7b52e81116a4',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('7d76f094-a7b6-4acb-9c54-dbb45857d8de','7d729fa4-5aaf-434c-90f5-d9cd129cad37',_binary '\0');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('7d76f094-a7b6-4acb-9c54-dbb45857d8de','7f889b0d-8944-4c65-814c-af0a676675d0',_binary '\0');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('7d76f094-a7b6-4acb-9c54-dbb45857d8de','8a7e233a-0064-427d-b873-1e0eca4e45d2',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('7d76f094-a7b6-4acb-9c54-dbb45857d8de','fdd0aabb-00d5-49b6-8afe-19c52d3ca168',_binary '\0');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('9ebdb3bc-347f-4bb9-b642-8cbeb42342bc','0a0b84ad-2758-407c-8acc-49fb64d4578e',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('9ebdb3bc-347f-4bb9-b642-8cbeb42342bc','52dbc43c-d0bd-461e-bc9f-941f7f551435',_binary '\0');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('9ebdb3bc-347f-4bb9-b642-8cbeb42342bc','57b42671-20c2-4579-9cf5-4c3431917edb',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('9ebdb3bc-347f-4bb9-b642-8cbeb42342bc','58622285-f578-46f3-bbd0-2793b89ec84a',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('9ebdb3bc-347f-4bb9-b642-8cbeb42342bc','5da6968d-da8c-4e80-b281-7b52e81116a4',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('9ebdb3bc-347f-4bb9-b642-8cbeb42342bc','7d729fa4-5aaf-434c-90f5-d9cd129cad37',_binary '\0');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('9ebdb3bc-347f-4bb9-b642-8cbeb42342bc','7f889b0d-8944-4c65-814c-af0a676675d0',_binary '\0');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('9ebdb3bc-347f-4bb9-b642-8cbeb42342bc','8a7e233a-0064-427d-b873-1e0eca4e45d2',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('9ebdb3bc-347f-4bb9-b642-8cbeb42342bc','fdd0aabb-00d5-49b6-8afe-19c52d3ca168',_binary '\0');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('abe573fb-c472-4075-b7a3-78b6d82bc51d','0a0b84ad-2758-407c-8acc-49fb64d4578e',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('abe573fb-c472-4075-b7a3-78b6d82bc51d','52dbc43c-d0bd-461e-bc9f-941f7f551435',_binary '\0');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('abe573fb-c472-4075-b7a3-78b6d82bc51d','57b42671-20c2-4579-9cf5-4c3431917edb',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('abe573fb-c472-4075-b7a3-78b6d82bc51d','58622285-f578-46f3-bbd0-2793b89ec84a',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('abe573fb-c472-4075-b7a3-78b6d82bc51d','5da6968d-da8c-4e80-b281-7b52e81116a4',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('abe573fb-c472-4075-b7a3-78b6d82bc51d','7d729fa4-5aaf-434c-90f5-d9cd129cad37',_binary '\0');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('abe573fb-c472-4075-b7a3-78b6d82bc51d','7f889b0d-8944-4c65-814c-af0a676675d0',_binary '\0');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('abe573fb-c472-4075-b7a3-78b6d82bc51d','8a7e233a-0064-427d-b873-1e0eca4e45d2',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('abe573fb-c472-4075-b7a3-78b6d82bc51d','fdd0aabb-00d5-49b6-8afe-19c52d3ca168',_binary '\0');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('b1340e05-4d92-478a-b49b-5820af128eca','065158f3-390f-42b3-8666-852906e538fa',_binary '\0');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('b1340e05-4d92-478a-b49b-5820af128eca','0b8672d9-a343-409a-8d03-2fc8f8b314aa',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('b1340e05-4d92-478a-b49b-5820af128eca','179593fa-2506-499a-944e-77ffe4b6fdd1',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('b1340e05-4d92-478a-b49b-5820af128eca','2b958474-6d3d-44f0-838f-e353223692f5',_binary '\0');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('b1340e05-4d92-478a-b49b-5820af128eca','4fa058aa-5d90-41f3-816d-3b97b15cee0f',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('b1340e05-4d92-478a-b49b-5820af128eca','56804cff-2c5f-4c70-8822-dc9a87c9f997',_binary '\0');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('b1340e05-4d92-478a-b49b-5820af128eca','bc2f9339-ed10-4060-b0ce-cf30d11fcc53',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('b1340e05-4d92-478a-b49b-5820af128eca','ccbef8af-20f1-474d-98b5-aa0a30340b70',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('b1340e05-4d92-478a-b49b-5820af128eca','e1828105-24e0-4627-9827-0734c1296f99',_binary '\0');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('ba72da23-8ec5-4150-8de8-22b7e39be868','065158f3-390f-42b3-8666-852906e538fa',_binary '\0');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('ba72da23-8ec5-4150-8de8-22b7e39be868','0b8672d9-a343-409a-8d03-2fc8f8b314aa',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('ba72da23-8ec5-4150-8de8-22b7e39be868','179593fa-2506-499a-944e-77ffe4b6fdd1',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('ba72da23-8ec5-4150-8de8-22b7e39be868','2b958474-6d3d-44f0-838f-e353223692f5',_binary '\0');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('ba72da23-8ec5-4150-8de8-22b7e39be868','4fa058aa-5d90-41f3-816d-3b97b15cee0f',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('ba72da23-8ec5-4150-8de8-22b7e39be868','56804cff-2c5f-4c70-8822-dc9a87c9f997',_binary '\0');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('ba72da23-8ec5-4150-8de8-22b7e39be868','bc2f9339-ed10-4060-b0ce-cf30d11fcc53',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('ba72da23-8ec5-4150-8de8-22b7e39be868','ccbef8af-20f1-474d-98b5-aa0a30340b70',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('ba72da23-8ec5-4150-8de8-22b7e39be868','e1828105-24e0-4627-9827-0734c1296f99',_binary '\0');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('bad387fc-627c-4369-ab9a-fdb5f7ce588c','0a0b84ad-2758-407c-8acc-49fb64d4578e',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('bad387fc-627c-4369-ab9a-fdb5f7ce588c','52dbc43c-d0bd-461e-bc9f-941f7f551435',_binary '\0');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('bad387fc-627c-4369-ab9a-fdb5f7ce588c','57b42671-20c2-4579-9cf5-4c3431917edb',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('bad387fc-627c-4369-ab9a-fdb5f7ce588c','58622285-f578-46f3-bbd0-2793b89ec84a',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('bad387fc-627c-4369-ab9a-fdb5f7ce588c','5da6968d-da8c-4e80-b281-7b52e81116a4',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('bad387fc-627c-4369-ab9a-fdb5f7ce588c','7d729fa4-5aaf-434c-90f5-d9cd129cad37',_binary '\0');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('bad387fc-627c-4369-ab9a-fdb5f7ce588c','7f889b0d-8944-4c65-814c-af0a676675d0',_binary '\0');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('bad387fc-627c-4369-ab9a-fdb5f7ce588c','8a7e233a-0064-427d-b873-1e0eca4e45d2',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('bad387fc-627c-4369-ab9a-fdb5f7ce588c','fdd0aabb-00d5-49b6-8afe-19c52d3ca168',_binary '\0');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('cdf9904a-f867-46de-8f2a-34b701b9ba32','0a0b84ad-2758-407c-8acc-49fb64d4578e',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('cdf9904a-f867-46de-8f2a-34b701b9ba32','52dbc43c-d0bd-461e-bc9f-941f7f551435',_binary '\0');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('cdf9904a-f867-46de-8f2a-34b701b9ba32','57b42671-20c2-4579-9cf5-4c3431917edb',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('cdf9904a-f867-46de-8f2a-34b701b9ba32','58622285-f578-46f3-bbd0-2793b89ec84a',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('cdf9904a-f867-46de-8f2a-34b701b9ba32','5da6968d-da8c-4e80-b281-7b52e81116a4',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('cdf9904a-f867-46de-8f2a-34b701b9ba32','7d729fa4-5aaf-434c-90f5-d9cd129cad37',_binary '\0');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('cdf9904a-f867-46de-8f2a-34b701b9ba32','7f889b0d-8944-4c65-814c-af0a676675d0',_binary '\0');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('cdf9904a-f867-46de-8f2a-34b701b9ba32','8a7e233a-0064-427d-b873-1e0eca4e45d2',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('cdf9904a-f867-46de-8f2a-34b701b9ba32','fdd0aabb-00d5-49b6-8afe-19c52d3ca168',_binary '\0');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('df002117-07e7-4bcc-a8b8-05970dee31f4','0a0b84ad-2758-407c-8acc-49fb64d4578e',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('df002117-07e7-4bcc-a8b8-05970dee31f4','52dbc43c-d0bd-461e-bc9f-941f7f551435',_binary '\0');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('df002117-07e7-4bcc-a8b8-05970dee31f4','57b42671-20c2-4579-9cf5-4c3431917edb',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('df002117-07e7-4bcc-a8b8-05970dee31f4','58622285-f578-46f3-bbd0-2793b89ec84a',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('df002117-07e7-4bcc-a8b8-05970dee31f4','5da6968d-da8c-4e80-b281-7b52e81116a4',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('df002117-07e7-4bcc-a8b8-05970dee31f4','7d729fa4-5aaf-434c-90f5-d9cd129cad37',_binary '\0');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('df002117-07e7-4bcc-a8b8-05970dee31f4','7f889b0d-8944-4c65-814c-af0a676675d0',_binary '\0');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('df002117-07e7-4bcc-a8b8-05970dee31f4','8a7e233a-0064-427d-b873-1e0eca4e45d2',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('df002117-07e7-4bcc-a8b8-05970dee31f4','fdd0aabb-00d5-49b6-8afe-19c52d3ca168',_binary '\0');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('ea0b71d2-663b-42b2-ada3-f3547ac7ba9c','065158f3-390f-42b3-8666-852906e538fa',_binary '\0');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('ea0b71d2-663b-42b2-ada3-f3547ac7ba9c','0b8672d9-a343-409a-8d03-2fc8f8b314aa',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('ea0b71d2-663b-42b2-ada3-f3547ac7ba9c','179593fa-2506-499a-944e-77ffe4b6fdd1',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('ea0b71d2-663b-42b2-ada3-f3547ac7ba9c','2b958474-6d3d-44f0-838f-e353223692f5',_binary '\0');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('ea0b71d2-663b-42b2-ada3-f3547ac7ba9c','4fa058aa-5d90-41f3-816d-3b97b15cee0f',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('ea0b71d2-663b-42b2-ada3-f3547ac7ba9c','56804cff-2c5f-4c70-8822-dc9a87c9f997',_binary '\0');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('ea0b71d2-663b-42b2-ada3-f3547ac7ba9c','bc2f9339-ed10-4060-b0ce-cf30d11fcc53',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('ea0b71d2-663b-42b2-ada3-f3547ac7ba9c','ccbef8af-20f1-474d-98b5-aa0a30340b70',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('ea0b71d2-663b-42b2-ada3-f3547ac7ba9c','e1828105-24e0-4627-9827-0734c1296f99',_binary '\0');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('f0348189-2c48-4e29-a817-28d4e432703d','065158f3-390f-42b3-8666-852906e538fa',_binary '\0');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('f0348189-2c48-4e29-a817-28d4e432703d','0b8672d9-a343-409a-8d03-2fc8f8b314aa',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('f0348189-2c48-4e29-a817-28d4e432703d','179593fa-2506-499a-944e-77ffe4b6fdd1',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('f0348189-2c48-4e29-a817-28d4e432703d','2b958474-6d3d-44f0-838f-e353223692f5',_binary '\0');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('f0348189-2c48-4e29-a817-28d4e432703d','4fa058aa-5d90-41f3-816d-3b97b15cee0f',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('f0348189-2c48-4e29-a817-28d4e432703d','56804cff-2c5f-4c70-8822-dc9a87c9f997',_binary '\0');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('f0348189-2c48-4e29-a817-28d4e432703d','bc2f9339-ed10-4060-b0ce-cf30d11fcc53',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('f0348189-2c48-4e29-a817-28d4e432703d','ccbef8af-20f1-474d-98b5-aa0a30340b70',_binary '');
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('f0348189-2c48-4e29-a817-28d4e432703d','e1828105-24e0-4627-9827-0734c1296f99',_binary '\0');
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_ROLE_MAPPING` (
  `SCOPE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ROLE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`ROLE_ID`),
  KEY `IDX_CLSCOPE_ROLE` (`SCOPE_ID`),
  KEY `IDX_ROLE_CLSCOPE` (`ROLE_ID`),
  CONSTRAINT `FK_CL_SCOPE_RM_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ROLE_MAPPING`
--

LOCK TABLES `CLIENT_SCOPE_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ROLE_MAPPING` VALUES ('065158f3-390f-42b3-8666-852906e538fa','59ae7d2b-3517-417e-b3e4-b33b0b97788f');
INSERT INTO `CLIENT_SCOPE_ROLE_MAPPING` VALUES ('7f889b0d-8944-4c65-814c-af0a676675d0','29132a7a-a4bc-4e9d-abd9-d6d063428483');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION`
--

DROP TABLE IF EXISTS `CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REDIRECT_URI` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `STATE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `SESSION_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AUTH_METHOD` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AUTH_USER_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CURRENT_ACTION` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_SESSION_SESSION` (`SESSION_ID`),
  CONSTRAINT `FK_B4AO2VCVAT6UKAU74WBWTFQO1` FOREIGN KEY (`SESSION_ID`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION`
--

LOCK TABLES `CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_AUTH_STATUS`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_AUTH_STATUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_AUTH_STATUS` (
  `AUTHENTICATOR` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `STATUS` int DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`AUTHENTICATOR`),
  CONSTRAINT `AUTH_STATUS_CONSTRAINT` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_AUTH_STATUS`
--

LOCK TABLES `CLIENT_SESSION_AUTH_STATUS` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_NOTE` (
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51C2736` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_NOTE`
--

LOCK TABLES `CLIENT_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_PROT_MAPPER`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_PROT_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_PROT_MAPPER` (
  `PROTOCOL_MAPPER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CLIENT_SESSION` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`PROTOCOL_MAPPER_ID`),
  CONSTRAINT `FK_33A8SGQW18I532811V7O2DK89` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_PROT_MAPPER`
--

LOCK TABLES `CLIENT_SESSION_PROT_MAPPER` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_ROLE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_ROLE` (
  `ROLE_ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CLIENT_SESSION` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`ROLE_ID`),
  CONSTRAINT `FK_11B7SGQW18I532811V7O2DV76` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_ROLE`
--

LOCK TABLES `CLIENT_SESSION_ROLE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_USER_SESSION_NOTE` (
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` text COLLATE utf8mb4_unicode_ci,
  `CLIENT_SESSION` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK_CL_USR_SES_NOTE` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_USER_SESSION_NOTE`
--

LOCK TABLES `CLIENT_USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT`
--

DROP TABLE IF EXISTS `COMPONENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPONENT` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PARENT_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROVIDER_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROVIDER_TYPE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SUB_TYPE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPONENT_REALM` (`REALM_ID`),
  KEY `IDX_COMPONENT_PROVIDER_TYPE` (`PROVIDER_TYPE`),
  CONSTRAINT `FK_COMPONENT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT`
--

LOCK TABLES `COMPONENT` WRITE;
/*!40000 ALTER TABLE `COMPONENT` DISABLE KEYS */;
INSERT INTO `COMPONENT` VALUES ('015660b5-cf8d-43dd-bcb0-2bc57ab0c089','Allowed Protocol Mapper Types','myRealm','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','myRealm','anonymous');
INSERT INTO `COMPONENT` VALUES ('02397c7b-2ddb-4e13-910b-80d4f52cb4d3','rsa-enc-generated','myRealm','rsa-enc-generated','org.keycloak.keys.KeyProvider','myRealm',NULL);
INSERT INTO `COMPONENT` VALUES ('027c4496-efd8-46d1-9e71-d261547a4c92','Allowed Client Scopes','myRealm','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','myRealm','authenticated');
INSERT INTO `COMPONENT` VALUES ('02a69e7b-7638-4c83-8c26-a46bc600fe66','Allowed Protocol Mapper Types','e810ef94-3763-43cb-b70b-f5229124accb','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','e810ef94-3763-43cb-b70b-f5229124accb','anonymous');
INSERT INTO `COMPONENT` VALUES ('0a05aa0f-e791-43dc-bde5-0498960325dc','Trusted Hosts','e810ef94-3763-43cb-b70b-f5229124accb','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','e810ef94-3763-43cb-b70b-f5229124accb','anonymous');
INSERT INTO `COMPONENT` VALUES ('0cce2683-d6ba-4c2c-8e6a-6001ed244a9b','aes-generated','myRealm','aes-generated','org.keycloak.keys.KeyProvider','myRealm',NULL);
INSERT INTO `COMPONENT` VALUES ('1565623a-6f53-412e-a4ce-9f0f784e495b','hmac-generated','myRealm','hmac-generated','org.keycloak.keys.KeyProvider','myRealm',NULL);
INSERT INTO `COMPONENT` VALUES ('220369c9-7321-46b6-bc36-00e9a1a77900','rsa-generated','e810ef94-3763-43cb-b70b-f5229124accb','rsa-generated','org.keycloak.keys.KeyProvider','e810ef94-3763-43cb-b70b-f5229124accb',NULL);
INSERT INTO `COMPONENT` VALUES ('2502427f-ec59-4c5b-a33f-27e7f90b3da5','aes-generated','e810ef94-3763-43cb-b70b-f5229124accb','aes-generated','org.keycloak.keys.KeyProvider','e810ef94-3763-43cb-b70b-f5229124accb',NULL);
INSERT INTO `COMPONENT` VALUES ('2af49cfb-1325-4632-935c-6925ad8a0f0d','Max Clients Limit','e810ef94-3763-43cb-b70b-f5229124accb','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','e810ef94-3763-43cb-b70b-f5229124accb','anonymous');
INSERT INTO `COMPONENT` VALUES ('4b21354a-ec60-4fa1-81e3-99abefc7d8c2','Allowed Client Scopes','myRealm','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','myRealm','anonymous');
INSERT INTO `COMPONENT` VALUES ('4d8398b0-8f2b-4888-b2f4-c6b76ea9d1bc','Max Clients Limit','myRealm','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','myRealm','anonymous');
INSERT INTO `COMPONENT` VALUES ('5d8f3840-e1ad-4e84-a62e-39940ec55814','Allowed Protocol Mapper Types','myRealm','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','myRealm','authenticated');
INSERT INTO `COMPONENT` VALUES ('6cbdd90d-b466-4f66-a66c-2ba64eab9fa6','Full Scope Disabled','e810ef94-3763-43cb-b70b-f5229124accb','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','e810ef94-3763-43cb-b70b-f5229124accb','anonymous');
INSERT INTO `COMPONENT` VALUES ('7680ae87-6e20-4243-8d26-ace95e822cda','Allowed Client Scopes','e810ef94-3763-43cb-b70b-f5229124accb','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','e810ef94-3763-43cb-b70b-f5229124accb','authenticated');
INSERT INTO `COMPONENT` VALUES ('84304b85-1cf8-45ff-9215-6043cac8dff4','Consent Required','e810ef94-3763-43cb-b70b-f5229124accb','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','e810ef94-3763-43cb-b70b-f5229124accb','anonymous');
INSERT INTO `COMPONENT` VALUES ('a3555ce0-a6e7-4e96-a33e-7069dd199c97','Trusted Hosts','myRealm','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','myRealm','anonymous');
INSERT INTO `COMPONENT` VALUES ('b6728850-1a1d-451d-bf26-d7458158aeb4','Consent Required','myRealm','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','myRealm','anonymous');
INSERT INTO `COMPONENT` VALUES ('b8189a5f-7b88-4039-81da-4cab3184c9fe','rsa-enc-generated','e810ef94-3763-43cb-b70b-f5229124accb','rsa-enc-generated','org.keycloak.keys.KeyProvider','e810ef94-3763-43cb-b70b-f5229124accb',NULL);
INSERT INTO `COMPONENT` VALUES ('c8cc3844-6221-430f-adc1-e94a78eb4ce5','hmac-generated','e810ef94-3763-43cb-b70b-f5229124accb','hmac-generated','org.keycloak.keys.KeyProvider','e810ef94-3763-43cb-b70b-f5229124accb',NULL);
INSERT INTO `COMPONENT` VALUES ('cfc06b36-73dc-43f2-a590-30ab7c2c97c2','Allowed Client Scopes','e810ef94-3763-43cb-b70b-f5229124accb','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','e810ef94-3763-43cb-b70b-f5229124accb','anonymous');
INSERT INTO `COMPONENT` VALUES ('d80fe9d6-e3f6-4991-ac08-8f196dbfccaa','rsa-generated','myRealm','rsa-generated','org.keycloak.keys.KeyProvider','myRealm',NULL);
INSERT INTO `COMPONENT` VALUES ('e503f035-b770-418f-b6ea-2f9ae61c01a8','Allowed Protocol Mapper Types','e810ef94-3763-43cb-b70b-f5229124accb','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','e810ef94-3763-43cb-b70b-f5229124accb','authenticated');
INSERT INTO `COMPONENT` VALUES ('ec342775-8df3-47dc-88c5-aaba5236afb6','Full Scope Disabled','myRealm','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','myRealm','anonymous');
/*!40000 ALTER TABLE `COMPONENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT_CONFIG`
--

DROP TABLE IF EXISTS `COMPONENT_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPONENT_CONFIG` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `COMPONENT_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPO_CONFIG_COMPO` (`COMPONENT_ID`),
  CONSTRAINT `FK_COMPONENT_CONFIG` FOREIGN KEY (`COMPONENT_ID`) REFERENCES `COMPONENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT_CONFIG`
--

LOCK TABLES `COMPONENT_CONFIG` WRITE;
/*!40000 ALTER TABLE `COMPONENT_CONFIG` DISABLE KEYS */;
INSERT INTO `COMPONENT_CONFIG` VALUES ('03c1d157-1566-4be9-90cb-9b4bde67485f','b8189a5f-7b88-4039-81da-4cab3184c9fe','algorithm','RSA-OAEP');
INSERT INTO `COMPONENT_CONFIG` VALUES ('05ee0bce-c76b-4ab2-a4e8-0d74a67a5c05','02397c7b-2ddb-4e13-910b-80d4f52cb4d3','keyUse','ENC');
INSERT INTO `COMPONENT_CONFIG` VALUES ('196a37d8-9c12-46af-82bd-81020991dd8f','015660b5-cf8d-43dd-bcb0-2bc57ab0c089','allowed-protocol-mapper-types','saml-role-list-mapper');
INSERT INTO `COMPONENT_CONFIG` VALUES ('1e0f4e45-efec-4de5-8dfe-da833b785c82','0cce2683-d6ba-4c2c-8e6a-6001ed244a9b','kid','3b14a9eb-02dc-49b8-b479-0768faf5ed6f');
INSERT INTO `COMPONENT_CONFIG` VALUES ('25c4740c-6a8c-4cec-ab75-96592a0ca833','015660b5-cf8d-43dd-bcb0-2bc57ab0c089','allowed-protocol-mapper-types','oidc-address-mapper');
INSERT INTO `COMPONENT_CONFIG` VALUES ('26db1bee-4b82-4b30-94d2-ebd99931a6b7','015660b5-cf8d-43dd-bcb0-2bc57ab0c089','allowed-protocol-mapper-types','oidc-usermodel-property-mapper');
INSERT INTO `COMPONENT_CONFIG` VALUES ('27832809-50a9-42e4-9f9b-4386f217310c','015660b5-cf8d-43dd-bcb0-2bc57ab0c089','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper');
INSERT INTO `COMPONENT_CONFIG` VALUES ('2adc5d4c-b0fe-4459-9dc8-a94997ecb32e','5d8f3840-e1ad-4e84-a62e-39940ec55814','allowed-protocol-mapper-types','oidc-full-name-mapper');
INSERT INTO `COMPONENT_CONFIG` VALUES ('2b4f7f6c-52ce-4e21-951d-48ace8371909','015660b5-cf8d-43dd-bcb0-2bc57ab0c089','allowed-protocol-mapper-types','saml-user-property-mapper');
INSERT INTO `COMPONENT_CONFIG` VALUES ('31b4d795-66d0-43a5-9aed-fc57fda240f2','c8cc3844-6221-430f-adc1-e94a78eb4ce5','priority','100');
INSERT INTO `COMPONENT_CONFIG` VALUES ('3917520b-e453-4822-8309-8a860de28ef7','0cce2683-d6ba-4c2c-8e6a-6001ed244a9b','priority','100');
INSERT INTO `COMPONENT_CONFIG` VALUES ('3eea416c-9ed8-46c1-8888-54af503cfd0b','5d8f3840-e1ad-4e84-a62e-39940ec55814','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper');
INSERT INTO `COMPONENT_CONFIG` VALUES ('43beaed0-cee4-4f54-87d1-6d707545478c','02a69e7b-7638-4c83-8c26-a46bc600fe66','allowed-protocol-mapper-types','saml-user-attribute-mapper');
INSERT INTO `COMPONENT_CONFIG` VALUES ('45ead03a-1d45-4044-be8c-099e62d08a6b','02a69e7b-7638-4c83-8c26-a46bc600fe66','allowed-protocol-mapper-types','oidc-usermodel-property-mapper');
INSERT INTO `COMPONENT_CONFIG` VALUES ('46ee33d9-123e-4b05-9400-40692103c41a','5d8f3840-e1ad-4e84-a62e-39940ec55814','allowed-protocol-mapper-types','oidc-usermodel-property-mapper');
INSERT INTO `COMPONENT_CONFIG` VALUES ('4f7064e6-765a-48ea-8d94-48bf69e13381','e503f035-b770-418f-b6ea-2f9ae61c01a8','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper');
INSERT INTO `COMPONENT_CONFIG` VALUES ('528fe7d9-4ab7-4391-9d7a-757ccf35e98e','b8189a5f-7b88-4039-81da-4cab3184c9fe','keyUse','ENC');
INSERT INTO `COMPONENT_CONFIG` VALUES ('549b75c3-31b5-4f52-aad6-69ec5f380d32','015660b5-cf8d-43dd-bcb0-2bc57ab0c089','allowed-protocol-mapper-types','saml-user-attribute-mapper');
INSERT INTO `COMPONENT_CONFIG` VALUES ('56ac821f-6bd1-4467-8ad9-3e75d10545e0','b8189a5f-7b88-4039-81da-4cab3184c9fe','privateKey','MIIEowIBAAKCAQEAu2gRDJUmArITG8ApKxma3UB1SJkvtqTAdUqEc/MnZDcdZMxD9AYo2JOYguIKmPxsF+HWvrTSZIpB+1LjLhF/l/l4TVTaooyAlydl00eGXY0J6P6zEK8oCbqARtivWUd7ujmk6kUzXOeS2CT1833/dXhNM2fB86e32sjp7JN+gJyILqbYReZ5KSfKDwXvwlLixJpJaNV8l0Fxr3Ue0eOz2PF/4Fx8j+Al1YpEtKbl2V9zOS4xdDG63+HCpT0sY1jTTtgCfydLgvL+9DCsTcJiI/lTNLKuAgXHQhxunf35LWGGwP7uckOzIPnff6hTGdnJZ4bbSoZjIUptctBEJzPFXwIDAQABAoIBAFe+FZ1qh21jqoanpZ7EUjmc4EypTCmbYXCI/xK6mYrWMzDqYjZyW9Vq5VECPCv8oy9bUYvgZVElWlctK6h6EN86shSi0eqhFeOvUoFlT4elbSpldbkuCPTlGQISmaaXTVqXepsk4zNwSNRiGbVzHJQHSz3yKmDF+dK5lqxpMiVMV0zQZ6oaB4ZO+8i/Vesk6JcB7b0u5QG8Aaf4oIW2MUN13aJuCF2soXIsF6t4YyBMkWhgtvAu+ywuauPjdBedekwjWX0JUFGdoNrWGWRPTg9db0rWTy6eZinkS5lJ2Yoh3qFde15k4SW33J8ez9h2dc7fMyKzzKxQkd48eeHmoWECgYEA4q4j0YJ68pIibhW0tGxtNeBBOEIBOLCoqct2xRhlfcddnFFzMkKr20GMiOgpy6i5MAAnRtY+PrBkXstlingngi503Qa9XcwIuqwFccTIbBN3ZM6T1OQdEursxpoVgU5BcsF4BkyUpf6h7UtpqOTjGT+wxCdtbZ/aJ4MYfYPDbbUCgYEA06V9rs5aIAiZjH/qbCODur4D7Xvj5g1d+9F8dfi2DUYUbi9V3GANJxz44RRWzW19bxD2XpQoL4Cr88zoWiz9cK7wzH8IEbt4i9QbtWRtgptf3oLoVYWEaernywJ+jcwkLTNjBnvZcClxhfPOrPMRM0PLQs5GDOYUWObjU3NHM0MCgYAtZ2IHShJkWf8Je9GJPhqV6whFQ3tJJqFx+S4eBmf1zKQkdnAThiU0Mqn6lj4g6/fD9JPpbWpkViKUljsNhEmtmq6PwxTVH9Qzx9cDVb4rX67Pg007HEHykxnAIgbispELclMfN+GiaiF3DV7plIckfIxkjd0uUxF4TpruMSFI7QKBgQDKRX1qlVhZCR8GwjGejAqXbIaAb0kNUnUh98HFVZ9X7EQWUjLy3PF1EiFhq3iR+DRK86EiHuKRE55C8PCXTiwhh3AnYLiricnZiSu6HnLywd/L3ryBD4vPVmuU/5tHlXR1pojbZ34VzeXrKWm6rMshfYdDH7SfGz0TAgb8eE3x1QKBgB5ft95MrHV5b2vcOxZkXdNvVdQLB0ilpdRa2XcBNkuRZqEM7Rru0tWwvAmoNHuV1TdolT2ydW25BWOd91JukV+8xKxAwYwKAM+wVzy60LuCzYeM2MYBdUEtkWbok9eJ1c9tmFQA3QSTm44B6iRNjW5klPCCa+91HfU/hZB639sK');
INSERT INTO `COMPONENT_CONFIG` VALUES ('598c8cde-b26c-4735-9e8c-f88e07697e7f','a3555ce0-a6e7-4e96-a33e-7069dd199c97','host-sending-registration-request-must-match','true');
INSERT INTO `COMPONENT_CONFIG` VALUES ('5ec5eafa-c0c8-4fa2-ae2a-dcd8b6af1bca','e503f035-b770-418f-b6ea-2f9ae61c01a8','allowed-protocol-mapper-types','oidc-usermodel-property-mapper');
INSERT INTO `COMPONENT_CONFIG` VALUES ('60642df1-9544-4593-8bba-3b0595f69ef5','0a05aa0f-e791-43dc-bde5-0498960325dc','client-uris-must-match','true');
INSERT INTO `COMPONENT_CONFIG` VALUES ('60bd0114-55d6-4f8b-99ae-715af1ca2217','e503f035-b770-418f-b6ea-2f9ae61c01a8','allowed-protocol-mapper-types','saml-user-attribute-mapper');
INSERT INTO `COMPONENT_CONFIG` VALUES ('61bbb3e6-180d-42f0-b443-8216b943cad7','2af49cfb-1325-4632-935c-6925ad8a0f0d','max-clients','200');
INSERT INTO `COMPONENT_CONFIG` VALUES ('64ebed15-4534-4be9-81f7-7090ea909fd4','d80fe9d6-e3f6-4991-ac08-8f196dbfccaa','keyUse','SIG');
INSERT INTO `COMPONENT_CONFIG` VALUES ('660e50ea-b745-4584-9fdf-d8572a7e2cc7','02a69e7b-7638-4c83-8c26-a46bc600fe66','allowed-protocol-mapper-types','oidc-full-name-mapper');
INSERT INTO `COMPONENT_CONFIG` VALUES ('6855a8fa-68f2-4b3b-ad33-e20f9b27fac4','5d8f3840-e1ad-4e84-a62e-39940ec55814','allowed-protocol-mapper-types','oidc-address-mapper');
INSERT INTO `COMPONENT_CONFIG` VALUES ('692a203c-6917-47e0-af1b-e82482c47167','e503f035-b770-418f-b6ea-2f9ae61c01a8','allowed-protocol-mapper-types','saml-user-property-mapper');
INSERT INTO `COMPONENT_CONFIG` VALUES ('6a3aeb8f-45a7-4492-8852-216f7e927e9e','d80fe9d6-e3f6-4991-ac08-8f196dbfccaa','privateKey','MIIEoAIBAAKCAQEAia3Q8miyesY9caaZTWAfKA+7rKCZKuIabl7X5BI2VEKbHDQ1WQTCE7JElrvA71n4Q9ipgeSmXRrCUBquGMx/WKFJZREbApolzPu4Zrlv8nd4QGHzNdOd4QQrvb3nEcUHjh0TK6Z//hYGr8+i1E9yBGfetDuHsmCEkKsm9UaAe5eDuRTn53BG09lCWl+RKeyFSnEQIGk6eNT3XPCUQ16hF/x1N6Xu55XymjnLWvSVlT5sSubB9XVrjn7PUtuE3V2FUg0mD/pbFRNv+lgpbxvhvyEqwh1Zu5aO4vPnBRRlHM4gjAbqszC38c0Q9epnSuFuLKAHmK8Ib8MxsSeNq6owYQIDAQABAoIBADnDWy7ZDkjEc3MDWr5D3c6JC0xZ9OkxA7XaxOlDWtfvOfSTUu6OOH7bBDvZehDxxl9wv21n6QSW/X9uMizlX2hoAssMajClS8a8tZkjo/wuc51PeyLSLiMCBPgOfKvP5mORf0GJEZog051fmAlLa6K9kYo8j6ofJH8tz6KIec9gHJiz5sSD3lrtrDScwMDt5u3IPAPPLchZdzTeORyq9taKU8pWfL6qVEDgZBwPTrAwgritTOUZsstXhjZd/J4YCYzK6esv4HbCXngTRsD3jemSePWj3QEgESzgI0W0BouULJ/x9BHCF3SKjSq4WTtZvlYklXMONkF5qZ6aZzxzXgECgYEAwqkxGKDWbeAmW3iyVWy/lxNeMl/L2IAf6RoZzZUQJ88bdMrBfIr/RONhLosN3Qwydk5PkWFJbnYrWX5U9X6qaNrkwNA2OmEKwKtRtPslx2+VeOEIBXE42Ygj6YzhTDCs7N6Pp5UZ32hZvQoEiU28Mb9140zjbjJT3fegfgxI2vkCgYEAtRAIwimtQs3l7mIT0l3GSyLlfS8eX5epg8/JKhbrAW03TnDRnGWcFrTKtlGLmhOE5SRwaAv0WbSlOo+W2Bo0t0WVrMVfd2oxwESn3yX+KE2bA89ixH2jVEGzA78KPaV+dBFJfezMWdplPAmj1oGMrZFpMidDqGUPljxupol1MqkCgYAfc7DgFtSuqiHoc6b00H5gTZvRrdLE52bAhhwXMHeMxxTbmQsMMXUvT0HbgFI8HgVlQh/vEHYJ6AP3EMdvZwjnqj59vOaWJinTmZq5ED85axkOj+V446NY2nta+A1K/y5hk1BItnmYtEaTmbPD75BxxUqp8DlrC6yrV6BR3XBEGQKBgHeMxrus2QGrAY6Mo5na4PrrZ6toWR20/fBSWfi4eSLQAhyA0WX6kT1M0ivfW9W33Z+Ol8mbWxN/+zjXZjn506TPBSy2hXpLW94fdtgYNeBWnWu+mvAyJI2Vc6Wdlh1uEDiC0YubtrH9SaqCkvMnRsOzp0m+MyYU1F3WORks2X1BAn9dyH4uuy52udtoikQIFKT51CyDMOx8NFFCDEL7OYhVHWsefgtoTI/lw1kSP+YmN1/v6Rgd5rtPQPRav0i5lpKw4MPf6NujYSO/a4RdUanTtRaaIBKHIee/+ECpqXzgHUrCEaPXBfo1FtobnX2twBMG7YZjvFIBMOQz6VpeMpa9');
INSERT INTO `COMPONENT_CONFIG` VALUES ('7044e4a8-564b-44ed-8b3d-423c01cff404','cfc06b36-73dc-43f2-a590-30ab7c2c97c2','allow-default-scopes','true');
INSERT INTO `COMPONENT_CONFIG` VALUES ('726563e4-a627-4d8b-9de4-9afe813fb26f','220369c9-7321-46b6-bc36-00e9a1a77900','keyUse','SIG');
INSERT INTO `COMPONENT_CONFIG` VALUES ('735aa0b9-173c-43a0-9eb4-b6a55a36b10c','e503f035-b770-418f-b6ea-2f9ae61c01a8','allowed-protocol-mapper-types','oidc-full-name-mapper');
INSERT INTO `COMPONENT_CONFIG` VALUES ('77c0a9f7-9eed-4a1f-911f-ad9c0abfa478','1565623a-6f53-412e-a4ce-9f0f784e495b','priority','100');
INSERT INTO `COMPONENT_CONFIG` VALUES ('7943e8af-b1af-4d8c-ad26-e7794ec97a3f','015660b5-cf8d-43dd-bcb0-2bc57ab0c089','allowed-protocol-mapper-types','oidc-full-name-mapper');
INSERT INTO `COMPONENT_CONFIG` VALUES ('79f308ab-7fae-422a-9ecf-791e23cd9c26','a3555ce0-a6e7-4e96-a33e-7069dd199c97','client-uris-must-match','true');
INSERT INTO `COMPONENT_CONFIG` VALUES ('7af48247-3638-46b0-b849-20ed1d9d026c','5d8f3840-e1ad-4e84-a62e-39940ec55814','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper');
INSERT INTO `COMPONENT_CONFIG` VALUES ('7f392408-8a36-419d-a088-5ac3671f9ff9','d80fe9d6-e3f6-4991-ac08-8f196dbfccaa','certificate','MIICnTCCAYUCBgGGvWrL/TANBgkqhkiG9w0BAQsFADASMRAwDgYDVQQDDAdteVJlYWxtMB4XDTIzMDMwNzE4NTAzOFoXDTMzMDMwNzE4NTIxOFowEjEQMA4GA1UEAwwHbXlSZWFsbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAImt0PJosnrGPXGmmU1gHygPu6ygmSriGm5e1+QSNlRCmxw0NVkEwhOyRJa7wO9Z+EPYqYHkpl0awlAarhjMf1ihSWURGwKaJcz7uGa5b/J3eEBh8zXTneEEK7295xHFB44dEyumf/4WBq/PotRPcgRn3rQ7h7JghJCrJvVGgHuXg7kU5+dwRtPZQlpfkSnshUpxECBpOnjU91zwlENeoRf8dTel7ueV8po5y1r0lZU+bErmwfV1a45+z1LbhN1dhVINJg/6WxUTb/pYKW8b4b8hKsIdWbuWjuLz5wUUZRzOIIwG6rMwt/HNEPXqZ0rhbiygB5ivCG/DMbEnjauqMGECAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAKDVog5flmvFSkPfcKQV3SgNb8P0Pb6BpPEzLwNQtamgPJWOxmEBkQa7tqYoNG8cf/PlJeMRmjSjNz+wHq6NJDg0dKgUEE5+SlriCbQ2CRt6Tn8LO5+CMFg/zF/4cdqfxoLvuDCSruOpL6ahtBZ6Fn6FdjD7uO1x+mLBnJu1ad+XdlZR3W/AE++V8FVjSS4X1qO4Ycv8AmiREkPjaM/6Z7H6MRCLmy6mCXp+SFFeIhb5DvyYeqhCcnnP2ubbbehM9lVDraCGSw7llQSgzXxwLt9Yt4jnP89tZImUKAPBcxSmKwyra0p+jjy2PWnrOT+HhXjtKQes3CxNcadMXnJzmhQ==');
INSERT INTO `COMPONENT_CONFIG` VALUES ('85b37b4d-2997-406f-9445-5415f4ba24d9','220369c9-7321-46b6-bc36-00e9a1a77900','priority','100');
INSERT INTO `COMPONENT_CONFIG` VALUES ('89d24111-75f5-41da-84be-1d1a66d62c4c','c8cc3844-6221-430f-adc1-e94a78eb4ce5','secret','21hrDPsk7NZeWvDYum1VtoaQPt865eQc0odZbF2KN3wiTSdW5P86gV2cktPEG3kAm0vkarCz-rID8lAUaZ6edg');
INSERT INTO `COMPONENT_CONFIG` VALUES ('8b22e4d4-998b-4b1b-a16d-0723832643ae','4d8398b0-8f2b-4888-b2f4-c6b76ea9d1bc','max-clients','200');
INSERT INTO `COMPONENT_CONFIG` VALUES ('937aa146-1026-452e-ad1a-a72d86aeff6c','2502427f-ec59-4c5b-a33f-27e7f90b3da5','secret','1od-yGuc0YaULh-zp1Aygw');
INSERT INTO `COMPONENT_CONFIG` VALUES ('939fdf2c-8306-4d12-9d8c-b43c99958de8','4b21354a-ec60-4fa1-81e3-99abefc7d8c2','allow-default-scopes','true');
INSERT INTO `COMPONENT_CONFIG` VALUES ('9494c542-8767-40ee-a70b-3cf12aa9fc6a','e503f035-b770-418f-b6ea-2f9ae61c01a8','allowed-protocol-mapper-types','saml-role-list-mapper');
INSERT INTO `COMPONENT_CONFIG` VALUES ('9f41bef5-4233-4289-a7de-8ce1a5ddaccb','e503f035-b770-418f-b6ea-2f9ae61c01a8','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper');
INSERT INTO `COMPONENT_CONFIG` VALUES ('a21acb88-b913-427d-934f-09157893f850','220369c9-7321-46b6-bc36-00e9a1a77900','certificate','MIICmzCCAYMCBgGGvWYrrDANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjMwMzA3MTg0NTM1WhcNMzMwMzA3MTg0NzE1WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCHSgbwKSoSO1q1Qyukkdv0HC9R8txChxfYC/CYHutfG4MME4n6iEhQXIwXOTv2uy+NokTEF1z/JtBoIJx4Hgy3V7Os2vdZcn/LYkWKGx+yohoOQemDy68Vc4GpGZKRcOmAlB9OiypMG7RpiDNfuA7963ZlBASEF9S/ztxgbHA+E2VgGcQK9jaJ1b9yhRgXSn/DonYhKo817GiFP+epdPlRwgoNkaYZQ2AXtHyn9cbAkvz9jXh4wx/uqiiNhyUau6sbt83p5dDqNmHtbSePKiMtaUh3VOk14WK6iXXbG+6SiqHaTlcrENGTLxJKm6lG5gsSM3DgllKnetciMLGrvptdAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAGQu8dDRLu6LaRPWrCtwYq+R+sAdGm58vT0f8NaKLdBzre1FHT8+2Nlw7QGGNZXqXJ2n+BT+D2Ya/1+qmkQWZxEKXGXTLQ/ToH07K1GfJ3Gm8ucfCX8Zl2OIKlSg7GX3rDmNxei8cGPCFJ/0rLsZXxsWn2KxRT3Lv64yvgUc5/p+k4XYx1wHaR3k+xq0fp8JE0y9WZgq1icOTMgBKULscBOgwtsxJOBk1+BoDpIcNT4dDQUBp02x6FMh9VzbmRfcjuNz+1do3B/1rxOi69cwFna3WA8BvUCdigGM77orw+tLsYSrK5vuEBH0a+zCT2z7UCCX8cQ7BjOh5rWRYH0EBsg=');
INSERT INTO `COMPONENT_CONFIG` VALUES ('a3a19e08-5076-45bc-9934-78c3c6d183df','02397c7b-2ddb-4e13-910b-80d4f52cb4d3','privateKey','MIIEogIBAAKCAQEAohKk3TUXlXmaZyiyIrLBwI+EFPwTkgUTUJpTZ/uuy14XRQf/fBW/18scGbEYz7MnAAP+nyerUmaIY19aMkm38DO0QJN78CqrIOfT8m3DnxiCxcy4IiiwOqfMq3qpwcGIgoRW0dsQ0wYKhd4XeeRALOtxuzcg8HdadC7BohO6EqOJEt52Gbx+/rs3uwBH/EpPNr3L1CTMSAQoaL2KwvYNJe6m5/fPk9NElPW5HL/HbaS1v9eWwhAo0YV6LMzRp9KXeVWQottHMzmMmEve+OIOGxUx7RFihmT3FHP2cToFlLdrM1JF/34CuGQNaKGywylbq8Z54PedkYCoJKSWoRrJBwIDAQABAoIBAFFWPfrt/Cn93ylKWSvkvivfWpAVedTcSzc2XAlhW/WgANmaC/PADolD25RhNmx2Imp1lsFU7TvrTSNh5Sg7qt4XdKy714VORJe9ALc3sucTK/4MoZQzC05EjAi7BJrCf7nQpKmo4Samb32DWhDIJhTlDCzCm/tSSsjn9jFa6RUUxBHJZOSSeoZHItfZ2V4l7rSPklLNCjBTnGZF2eREfYE3H6DiDkhkq5azIJtYusqeQc+9YXLfLh5HCw320UtBPSJz11HoSADOYwOSogtjN5mC5g7TT46K6xvf/LQRBGrjQvy+7fevbFiEss0gpqM5WDv0KWT2r6hfcEgenXII9EECgYEA31+CMr3HV+XKz2aBOl40uGJNgoJ5xiyYat7eAeiF24Yf3G2d3+P7VGIty907YwgsSHQQHDYHpqCOOOJo2mRj4Y+B4NgYB1AIlIb6wzkaviCvWB0F1C0fKksr2mp6HzFzSQRhPzKcbDecdZ+E152w7eNCgKYdbTkJmxXxe9MA8ncCgYEAub72RzRcJrvF4p33pD6GEeojDSpB3Fx6Il4A2MYG4nPbbL+sfqqq9xl2oCATr4smappaNFJ2H7vkhHxUn18PUA+FznoFAWSU3Tb959E8JqRW4PHMpYt1BHqc5g4Vd9zM8Aq3t/7DQ1goOQvCbc3v5QBKBcSmsDB+9DdCpttQcfECgYAFok4RY5IEmIouAwLdawTfZbNYyFuz8OoDQA3PdILzz4U8NROXUxPCxBstmi3mSI19YlgJrh8xR7lum99TKtcOGGWJO0oX3R/qRyFKDUWsZ/ykN08vU9gGZBD+GFNuN/wVamPdiTRC0oBCwzxBh/uvdFz4C7iQSbEBVWNa4S6T7wKBgHDDF2v+w3rYP7flwnM5adbyVzkk0DrhAVxfyQ/QmFldkHYinqt/HK9KDBQFpS3KwhWxgtWEwiVdwcsUV6Mw6HDoG4lP1j4UO7NYMShMg8HJvtxsrppJYU7IyPt4zVuo9dk8CHBw/0Wg/To0g2J5xQs287kwuyj3J/tGmPYG6n1hAoGARAVtkscoUCEzgmPvBl73qPteQtr6e50efc4CosDXInt82AVyjEvDS3D44mA+1kPa9OkbtSNAgSzTB3jXEOnEXsBcTtjuRgIwg16nWUt4BWui1j6PPjq0YtCM9rNa8Kx3o4osH0Sj55w15CLQgeugHth0bol59r13iZHqKVgTJ6Q=');
INSERT INTO `COMPONENT_CONFIG` VALUES ('ad98e599-8a14-462c-80b0-979caba4b85f','c8cc3844-6221-430f-adc1-e94a78eb4ce5','kid','c0b6840d-19d9-40da-9de6-f397508b4ce6');
INSERT INTO `COMPONENT_CONFIG` VALUES ('b2036e59-824f-4b91-ba3c-1e7ed2c6af12','5d8f3840-e1ad-4e84-a62e-39940ec55814','allowed-protocol-mapper-types','saml-user-property-mapper');
INSERT INTO `COMPONENT_CONFIG` VALUES ('b604670c-be93-4f8d-b768-b78baa16cf07','1565623a-6f53-412e-a4ce-9f0f784e495b','secret','fm4w7nEwvEW3g8zcgDOEaGatlFYelDvXbCTdkClG9PG-xKrisSjugOKE5AvBpLcm9dWOChaDyne0ipKl40tZ2Q');
INSERT INTO `COMPONENT_CONFIG` VALUES ('b68d5798-ccb7-4ebc-ab57-1911d62da353','0a05aa0f-e791-43dc-bde5-0498960325dc','host-sending-registration-request-must-match','true');
INSERT INTO `COMPONENT_CONFIG` VALUES ('bb6ff991-3b9b-4f20-81ec-1e31a4e7c2e1','220369c9-7321-46b6-bc36-00e9a1a77900','privateKey','MIIEpQIBAAKCAQEAh0oG8CkqEjtatUMrpJHb9BwvUfLcQocX2AvwmB7rXxuDDBOJ+ohIUFyMFzk79rsvjaJExBdc/ybQaCCceB4Mt1ezrNr3WXJ/y2JFihsfsqIaDkHpg8uvFXOBqRmSkXDpgJQfTosqTBu0aYgzX7gO/et2ZQQEhBfUv87cYGxwPhNlYBnECvY2idW/coUYF0p/w6J2ISqPNexohT/nqXT5UcIKDZGmGUNgF7R8p/XGwJL8/Y14eMMf7qoojYclGrurG7fN6eXQ6jZh7W0njyojLWlId1TpNeFiuol12xvukoqh2k5XKxDRky8SSpupRuYLEjNw4JZSp3rXIjCxq76bXQIDAQABAoIBAEFtLXnLjosOpUlv2JVX7LVbRA8vkhGiX4eeDpairVVraq7WbC365m3ms+EvTq59y/uE9BiY6+KBFNymmMUGU0P/Z+c6ZdCeLOtg9RxbDbNH7a3jdljEkkGfgJ8UvOsVXfdOqu1DJAt2goNe2Ol7i9SEoNctYDm5hKvWEIGZL5b0+WmVRa6eyiKv4C/ZWqHvmFp2GbsuqUAgfw7sMtWLgiO36ZS4H8PDIYTcQZmHq8Dws72CHhvtU4GRp2g967eoZvv1NiCskC23YbCH0eS1AmjKfv28ZTv7voQymryv2gcKjmxgvODs6O5JxRqC9jbpoMqrJsgdvWsy8NkJUUfchMkCgYEAzihPY2jbyExpj51bl1IVsrLZuBpJXsnPIyBWQyFWpz4jUML3uQW4S5NeOOCxETHQ9SFoAaA+K/NEIShAmSspB1le/QsznNQHLa8EtUr9c3B919HtKao6Cv59EVM+RfBEtDvdqTVbVxb2OSReeHBDBBPsRAEFRaeS/Cs2J0jS1e8CgYEAp/94cqmYWUJuLtVTzsUXYaNJEmhR/gvaEzT44NrHM7qHFEz2U2ZT5vpAFLjdT2hvkqANhsHwoJG5BdA1HcQE9bEXpeZhS4Il9/CYiOke4axOOfYaEdVXrlKyLbVJmOBE8nUsF/fb8YSVnLaUKR4bAk5bMfOkdMCTxVmqQBD4j3MCgYEAyOnkJN/GgjhmED6tSpYG63b+VDvaEXTgWD1llFrjVm5qgITiZAE9EPp4MzpXlohUOvHpqNwAe1jDpwTRn/S+MZlZx4apMEg7Dryo+/4vb9fL7Q978MUjeB94x++2mvaEHprRddy4PfH02M+m+f1+cnTwJ35PIwkjaHq8diC0ySUCgYEAj1sc+RtneaOKSkSXw3XDwfmIPUDv1o1ehc1KIvYNzkJ5SgVynTBQoGUjkYs+rqg7rS8O29Na9mnjLObCrKe8Y7u+pj60/64LoEuanhnv1DsodaVgEZ+vtn2ytfZg2ydlLlB2U+2ZrbqpwJS8UWnzOkCK6VEzIL3EWz9sXEcfE6kCgYEAleYmUx+BDUJTYe8czMHjRsRDbOpuqgI/ajJueHVCBt+FobdmmyzLkQH9dO5bcW5oEi9LOngZ0edBp0t3s6yDG46/bIWz8ATdYpyNqaVr6XiQKd6HQrivUnNefMKeSHI+Ub7RPn5QofA3o2arPrXPYJg7A6O1O028AJEKRE5VkE0=');
INSERT INTO `COMPONENT_CONFIG` VALUES ('bb8ee839-32fd-40eb-865c-5c9acfae6170','027c4496-efd8-46d1-9e71-d261547a4c92','allow-default-scopes','true');
INSERT INTO `COMPONENT_CONFIG` VALUES ('d0c89c8b-c633-468e-a8ab-4e094710bd19','02397c7b-2ddb-4e13-910b-80d4f52cb4d3','algorithm','RSA-OAEP');
INSERT INTO `COMPONENT_CONFIG` VALUES ('d0dc7827-39aa-4e55-b154-bfd340f4ba94','015660b5-cf8d-43dd-bcb0-2bc57ab0c089','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper');
INSERT INTO `COMPONENT_CONFIG` VALUES ('d4c2f892-b330-49ed-8b43-749676a1d5dc','7680ae87-6e20-4243-8d26-ace95e822cda','allow-default-scopes','true');
INSERT INTO `COMPONENT_CONFIG` VALUES ('d51ff102-69c2-4cf6-892c-c560c167ed59','d80fe9d6-e3f6-4991-ac08-8f196dbfccaa','priority','100');
INSERT INTO `COMPONENT_CONFIG` VALUES ('d762cf6b-3369-4d51-a870-342b71419366','e503f035-b770-418f-b6ea-2f9ae61c01a8','allowed-protocol-mapper-types','oidc-address-mapper');
INSERT INTO `COMPONENT_CONFIG` VALUES ('d8d52079-dd64-4d97-8102-77f1fb8b3f03','0cce2683-d6ba-4c2c-8e6a-6001ed244a9b','secret','0aDNEPQot0Vyh4wUJSkugg');
INSERT INTO `COMPONENT_CONFIG` VALUES ('da3c1843-8706-4295-bf66-0d5885c3a01a','1565623a-6f53-412e-a4ce-9f0f784e495b','algorithm','HS256');
INSERT INTO `COMPONENT_CONFIG` VALUES ('dd86f0bc-2a69-45fd-8f8d-0d5b9ac04cf4','02a69e7b-7638-4c83-8c26-a46bc600fe66','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper');
INSERT INTO `COMPONENT_CONFIG` VALUES ('df71c4da-2852-42da-a1d1-f88b935e562c','02397c7b-2ddb-4e13-910b-80d4f52cb4d3','priority','100');
INSERT INTO `COMPONENT_CONFIG` VALUES ('dfda5aa2-b4e2-494a-a573-a734da452704','2502427f-ec59-4c5b-a33f-27e7f90b3da5','priority','100');
INSERT INTO `COMPONENT_CONFIG` VALUES ('e17b1994-7f1a-4484-a1ff-2426d002debf','b8189a5f-7b88-4039-81da-4cab3184c9fe','priority','100');
INSERT INTO `COMPONENT_CONFIG` VALUES ('e49ca842-2a3a-47c6-9f8f-78e89dc58cb8','02a69e7b-7638-4c83-8c26-a46bc600fe66','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper');
INSERT INTO `COMPONENT_CONFIG` VALUES ('e82e4a05-241c-4002-9830-b06d7807bcd1','02a69e7b-7638-4c83-8c26-a46bc600fe66','allowed-protocol-mapper-types','saml-user-property-mapper');
INSERT INTO `COMPONENT_CONFIG` VALUES ('e9d3d3b1-f1d0-4f27-af31-481279fa2a4a','02a69e7b-7638-4c83-8c26-a46bc600fe66','allowed-protocol-mapper-types','oidc-address-mapper');
INSERT INTO `COMPONENT_CONFIG` VALUES ('eaddc93d-9231-440f-b1d2-c2eb1aa430b3','02397c7b-2ddb-4e13-910b-80d4f52cb4d3','certificate','MIICnTCCAYUCBgGGvWrMQzANBgkqhkiG9w0BAQsFADASMRAwDgYDVQQDDAdteVJlYWxtMB4XDTIzMDMwNzE4NTAzOFoXDTMzMDMwNzE4NTIxOFowEjEQMA4GA1UEAwwHbXlSZWFsbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAKISpN01F5V5mmcosiKywcCPhBT8E5IFE1CaU2f7rsteF0UH/3wVv9fLHBmxGM+zJwAD/p8nq1JmiGNfWjJJt/AztECTe/AqqyDn0/Jtw58YgsXMuCIosDqnzKt6qcHBiIKEVtHbENMGCoXeF3nkQCzrcbs3IPB3WnQuwaITuhKjiRLedhm8fv67N7sAR/xKTza9y9QkzEgEKGi9isL2DSXupuf3z5PTRJT1uRy/x22ktb/XlsIQKNGFeizM0afSl3lVkKLbRzM5jJhL3vjiDhsVMe0RYoZk9xRz9nE6BZS3azNSRf9+ArhkDWihssMpW6vGeeD3nZGAqCSklqEayQcCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAYQQWe5KGV/xo4iZYHXvLOisnFZ/OY4nfW80uZjrIENP7PlJTF3WVZ195AjurnR+wYHfxepcpe5zFwl5mmN4dSrgvLYLccpUHkHzCIX4oTWr2+ToZLnEosaniuHdG3L0py4mClpWvh4PMNXaxxv9W6qmnwviBqZ4//TWcdF7h6w8TunmmBqorooAg/qrTzmGjed+evJIEIrk2eoHvsY8F4Fn225XqciN7wVV9TmLy83sLr3q9iGLEAzE/Ht7jLKP6KaygB3NKgRYn0IGcOskETVVCTbqdRKHINugclrgZ/Q/xXbvY2rLOQa07S3cWggjCN6lFnqSB0pjayD7B9ppHSg==');
INSERT INTO `COMPONENT_CONFIG` VALUES ('eeda0738-9536-413b-b99b-d40123c3c10b','c8cc3844-6221-430f-adc1-e94a78eb4ce5','algorithm','HS256');
INSERT INTO `COMPONENT_CONFIG` VALUES ('f07414e6-94a8-4f10-af77-e9ab6fefc1ee','5d8f3840-e1ad-4e84-a62e-39940ec55814','allowed-protocol-mapper-types','saml-role-list-mapper');
INSERT INTO `COMPONENT_CONFIG` VALUES ('f2f0fcd8-ae62-44fa-8a67-37e993f836a5','1565623a-6f53-412e-a4ce-9f0f784e495b','kid','0e18a5d9-e3a5-47f7-8433-fbd8d13f35be');
INSERT INTO `COMPONENT_CONFIG` VALUES ('f4938fe1-d982-45ae-83cd-aa001b294b91','2502427f-ec59-4c5b-a33f-27e7f90b3da5','kid','f2a749fe-8dd4-4589-8d54-a7ae8dc7dd35');
INSERT INTO `COMPONENT_CONFIG` VALUES ('f496a72c-1b17-424a-9bb7-43870181fbfa','02a69e7b-7638-4c83-8c26-a46bc600fe66','allowed-protocol-mapper-types','saml-role-list-mapper');
INSERT INTO `COMPONENT_CONFIG` VALUES ('f61ecb60-a726-47e2-bb1c-8a1cd17922ea','5d8f3840-e1ad-4e84-a62e-39940ec55814','allowed-protocol-mapper-types','saml-user-attribute-mapper');
INSERT INTO `COMPONENT_CONFIG` VALUES ('fedba556-1305-43fb-b4ad-52ad05805242','b8189a5f-7b88-4039-81da-4cab3184c9fe','certificate','MIICmzCCAYMCBgGGvWYshzANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjMwMzA3MTg0NTM1WhcNMzMwMzA3MTg0NzE1WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC7aBEMlSYCshMbwCkrGZrdQHVImS+2pMB1SoRz8ydkNx1kzEP0BijYk5iC4gqY/GwX4da+tNJkikH7UuMuEX+X+XhNVNqijICXJ2XTR4ZdjQno/rMQrygJuoBG2K9ZR3u6OaTqRTNc55LYJPXzff91eE0zZ8Hzp7fayOnsk36AnIgupthF5nkpJ8oPBe/CUuLEmklo1XyXQXGvdR7R47PY8X/gXHyP4CXVikS0puXZX3M5LjF0Mbrf4cKlPSxjWNNO2AJ/J0uC8v70MKxNwmIj+VM0sq4CBcdCHG6d/fktYYbA/u5yQ7Mg+d9/qFMZ2clnhttKhmMhSm1y0EQnM8VfAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAHZhkgEsFIK2RmNov1N9Qwe2WQ76E2VRIjO5A4hjEsgO1p+aVwfFHnMa7J0S6TAIpRNFpxckzXCJryj93AdqKBv0jWhLS9M25f0K1vbkfyomjKjLQUeSQOV+dL/jiw+kXOFlCLc8WDdOcuOVtMahANg2cVyLijNYOGmnv2zTXtQbvowgqe8Ivi+m2sCsctmheytqgA70WEPko5kQcAPykk52U0wu8metMBetYVbgFvO5rTW+GTTTea7F7BaGct6HcxtszledGUBNQbZV2k1Aus89rT5xCW7CEtYQmc5jt3bobWA1HZ3G7G+PYKEgckFOgrpG1unhIt6tdwBrXf3RWaA=');
/*!40000 ALTER TABLE `COMPONENT_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPOSITE_ROLE`
--

DROP TABLE IF EXISTS `COMPOSITE_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPOSITE_ROLE` (
  `COMPOSITE` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CHILD_ROLE` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`COMPOSITE`,`CHILD_ROLE`),
  KEY `IDX_COMPOSITE` (`COMPOSITE`),
  KEY `IDX_COMPOSITE_CHILD` (`CHILD_ROLE`),
  CONSTRAINT `FK_A63WVEKFTU8JO1PNJ81E7MCE2` FOREIGN KEY (`COMPOSITE`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  CONSTRAINT `FK_GR7THLLB9LU8Q4VQA4524JJY8` FOREIGN KEY (`CHILD_ROLE`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPOSITE_ROLE`
--

LOCK TABLES `COMPOSITE_ROLE` WRITE;
/*!40000 ALTER TABLE `COMPOSITE_ROLE` DISABLE KEYS */;
INSERT INTO `COMPOSITE_ROLE` VALUES ('004b3d93-0738-4b1c-a9b7-759fab0abe7f','00c0f282-35b6-429a-bd99-ec37426c9781');
INSERT INTO `COMPOSITE_ROLE` VALUES ('004b3d93-0738-4b1c-a9b7-759fab0abe7f','0b959937-70ee-4a7f-8fa8-90f36857f22b');
INSERT INTO `COMPOSITE_ROLE` VALUES ('004b3d93-0738-4b1c-a9b7-759fab0abe7f','0ee5efd0-77ba-4df3-8f0e-ca3553f76637');
INSERT INTO `COMPOSITE_ROLE` VALUES ('004b3d93-0738-4b1c-a9b7-759fab0abe7f','11e51fed-7bb4-43b8-b981-aabfa9b69c03');
INSERT INTO `COMPOSITE_ROLE` VALUES ('004b3d93-0738-4b1c-a9b7-759fab0abe7f','1e9b7b11-2ce4-4f49-8366-02b8da7fa888');
INSERT INTO `COMPOSITE_ROLE` VALUES ('004b3d93-0738-4b1c-a9b7-759fab0abe7f','20e46304-fb70-4192-a075-44aa404a39ef');
INSERT INTO `COMPOSITE_ROLE` VALUES ('004b3d93-0738-4b1c-a9b7-759fab0abe7f','245c54d8-0e48-4e70-84e1-53a567541fec');
INSERT INTO `COMPOSITE_ROLE` VALUES ('004b3d93-0738-4b1c-a9b7-759fab0abe7f','285925ba-421d-481a-bfc3-e40672b9250b');
INSERT INTO `COMPOSITE_ROLE` VALUES ('004b3d93-0738-4b1c-a9b7-759fab0abe7f','2db91bb2-7c86-444f-92ed-d47580825ed1');
INSERT INTO `COMPOSITE_ROLE` VALUES ('004b3d93-0738-4b1c-a9b7-759fab0abe7f','2ee75d6b-acd4-4684-a230-502e64ec2c8a');
INSERT INTO `COMPOSITE_ROLE` VALUES ('004b3d93-0738-4b1c-a9b7-759fab0abe7f','33f3ed40-baa9-408e-9e0b-ede6a6f4b003');
INSERT INTO `COMPOSITE_ROLE` VALUES ('004b3d93-0738-4b1c-a9b7-759fab0abe7f','36063e18-482f-4662-95ad-fa62d8e2481d');
INSERT INTO `COMPOSITE_ROLE` VALUES ('004b3d93-0738-4b1c-a9b7-759fab0abe7f','3e591288-0827-4f65-aceb-58f50938198e');
INSERT INTO `COMPOSITE_ROLE` VALUES ('004b3d93-0738-4b1c-a9b7-759fab0abe7f','49c1f0ea-eaa0-4bfd-a047-ee8fc12622d3');
INSERT INTO `COMPOSITE_ROLE` VALUES ('004b3d93-0738-4b1c-a9b7-759fab0abe7f','4f99cbe4-29e7-4ca5-81da-1c71c96d26bf');
INSERT INTO `COMPOSITE_ROLE` VALUES ('004b3d93-0738-4b1c-a9b7-759fab0abe7f','5a1ea634-52f7-41d3-b935-77788fd235a6');
INSERT INTO `COMPOSITE_ROLE` VALUES ('004b3d93-0738-4b1c-a9b7-759fab0abe7f','5a65a79d-e1db-4847-8000-31604aa260cb');
INSERT INTO `COMPOSITE_ROLE` VALUES ('004b3d93-0738-4b1c-a9b7-759fab0abe7f','5a744996-cf20-41f9-a707-b8ebf05e8584');
INSERT INTO `COMPOSITE_ROLE` VALUES ('004b3d93-0738-4b1c-a9b7-759fab0abe7f','6032f0d7-3d30-4f91-a0aa-e42ab0b82396');
INSERT INTO `COMPOSITE_ROLE` VALUES ('004b3d93-0738-4b1c-a9b7-759fab0abe7f','7565775d-f8a0-40c4-8592-1abf38ae8fec');
INSERT INTO `COMPOSITE_ROLE` VALUES ('004b3d93-0738-4b1c-a9b7-759fab0abe7f','77bb922f-17a2-44e3-a60a-fa8d0bc79551');
INSERT INTO `COMPOSITE_ROLE` VALUES ('004b3d93-0738-4b1c-a9b7-759fab0abe7f','78b7dfbb-2fc1-41a2-9827-4e921e3c68a3');
INSERT INTO `COMPOSITE_ROLE` VALUES ('004b3d93-0738-4b1c-a9b7-759fab0abe7f','7ad69e0d-eeba-4b51-87f9-7cc74b9d8fa0');
INSERT INTO `COMPOSITE_ROLE` VALUES ('004b3d93-0738-4b1c-a9b7-759fab0abe7f','8157eb70-b8c0-406d-821d-f670f277f120');
INSERT INTO `COMPOSITE_ROLE` VALUES ('004b3d93-0738-4b1c-a9b7-759fab0abe7f','9584a1c2-aed2-4a83-a4e6-bd1fb2051d60');
INSERT INTO `COMPOSITE_ROLE` VALUES ('004b3d93-0738-4b1c-a9b7-759fab0abe7f','a03da7dc-5350-4be1-a122-6d798288ed10');
INSERT INTO `COMPOSITE_ROLE` VALUES ('004b3d93-0738-4b1c-a9b7-759fab0abe7f','aa246bd6-b953-4386-92a2-ea671c949e05');
INSERT INTO `COMPOSITE_ROLE` VALUES ('004b3d93-0738-4b1c-a9b7-759fab0abe7f','ace6eb7f-f7fe-43bd-a16f-766334f53a0e');
INSERT INTO `COMPOSITE_ROLE` VALUES ('004b3d93-0738-4b1c-a9b7-759fab0abe7f','bfbe7947-4d0d-426a-a3ca-8b447c8a3e5d');
INSERT INTO `COMPOSITE_ROLE` VALUES ('004b3d93-0738-4b1c-a9b7-759fab0abe7f','d0c10bdd-4d85-491c-8cc5-7132b5a88a38');
INSERT INTO `COMPOSITE_ROLE` VALUES ('004b3d93-0738-4b1c-a9b7-759fab0abe7f','d8ce34a6-26d7-4358-bb83-72afe7b34a6b');
INSERT INTO `COMPOSITE_ROLE` VALUES ('004b3d93-0738-4b1c-a9b7-759fab0abe7f','e15ed03f-3659-4e2d-89f1-01808971b7c5');
INSERT INTO `COMPOSITE_ROLE` VALUES ('004b3d93-0738-4b1c-a9b7-759fab0abe7f','e1b11564-0bc1-4137-8224-705b3ef3b5c5');
INSERT INTO `COMPOSITE_ROLE` VALUES ('004b3d93-0738-4b1c-a9b7-759fab0abe7f','e21ebc8a-78be-4864-bc9f-77528b736f39');
INSERT INTO `COMPOSITE_ROLE` VALUES ('004b3d93-0738-4b1c-a9b7-759fab0abe7f','e7d0e0eb-b512-4cc1-9fe8-fcf9596805a4');
INSERT INTO `COMPOSITE_ROLE` VALUES ('004b3d93-0738-4b1c-a9b7-759fab0abe7f','eaf8ad90-a132-43d4-a29b-e54b1c8f77cf');
INSERT INTO `COMPOSITE_ROLE` VALUES ('004b3d93-0738-4b1c-a9b7-759fab0abe7f','fd416d17-8b32-435c-9e81-c9a3f7b98939');
INSERT INTO `COMPOSITE_ROLE` VALUES ('02e1cd55-cd03-4138-a4e1-12630aae1e80','00485215-c5c3-4be3-801f-0d7c3711b23a');
INSERT INTO `COMPOSITE_ROLE` VALUES ('02e1cd55-cd03-4138-a4e1-12630aae1e80','f608f294-8895-4b5f-9680-ac268ffc09fc');
INSERT INTO `COMPOSITE_ROLE` VALUES ('0b959937-70ee-4a7f-8fa8-90f36857f22b','36063e18-482f-4662-95ad-fa62d8e2481d');
INSERT INTO `COMPOSITE_ROLE` VALUES ('0b959937-70ee-4a7f-8fa8-90f36857f22b','78b7dfbb-2fc1-41a2-9827-4e921e3c68a3');
INSERT INTO `COMPOSITE_ROLE` VALUES ('181c7f81-84da-471d-9311-cabab1b56887','0a281fa2-a129-4fd8-831a-8e4736cb2e58');
INSERT INTO `COMPOSITE_ROLE` VALUES ('20e46304-fb70-4192-a075-44aa404a39ef','33f3ed40-baa9-408e-9e0b-ede6a6f4b003');
INSERT INTO `COMPOSITE_ROLE` VALUES ('20e46304-fb70-4192-a075-44aa404a39ef','e1b11564-0bc1-4137-8224-705b3ef3b5c5');
INSERT INTO `COMPOSITE_ROLE` VALUES ('4b92d023-8967-4482-bd8d-6c89db2f7bcd','27b37535-18b2-4339-99a2-8894d0a301a1');
INSERT INTO `COMPOSITE_ROLE` VALUES ('4b92d023-8967-4482-bd8d-6c89db2f7bcd','59ae7d2b-3517-417e-b3e4-b33b0b97788f');
INSERT INTO `COMPOSITE_ROLE` VALUES ('4b92d023-8967-4482-bd8d-6c89db2f7bcd','59b23256-629b-4588-840f-68f31342c5da');
INSERT INTO `COMPOSITE_ROLE` VALUES ('4b92d023-8967-4482-bd8d-6c89db2f7bcd','eaec2d34-c91b-4bcf-aa89-f14f4667be47');
INSERT INTO `COMPOSITE_ROLE` VALUES ('59b23256-629b-4588-840f-68f31342c5da','d77f6700-8aa5-4264-8f24-93e6def651d9');
INSERT INTO `COMPOSITE_ROLE` VALUES ('5a65a79d-e1db-4847-8000-31604aa260cb','4f99cbe4-29e7-4ca5-81da-1c71c96d26bf');
INSERT INTO `COMPOSITE_ROLE` VALUES ('9584a1c2-aed2-4a83-a4e6-bd1fb2051d60','7ad69e0d-eeba-4b51-87f9-7cc74b9d8fa0');
INSERT INTO `COMPOSITE_ROLE` VALUES ('a09dd1c0-8657-472d-9f75-5ce5d8262c91','5ba2ced3-5343-45a4-a1da-49c937e032aa');
INSERT INTO `COMPOSITE_ROLE` VALUES ('aa5fb218-d1e2-4e79-810e-c79f6f1f564a','00485215-c5c3-4be3-801f-0d7c3711b23a');
INSERT INTO `COMPOSITE_ROLE` VALUES ('aa5fb218-d1e2-4e79-810e-c79f6f1f564a','02e1cd55-cd03-4138-a4e1-12630aae1e80');
INSERT INTO `COMPOSITE_ROLE` VALUES ('aa5fb218-d1e2-4e79-810e-c79f6f1f564a','1a8d13c3-ecc7-444d-a9d3-636275963e10');
INSERT INTO `COMPOSITE_ROLE` VALUES ('aa5fb218-d1e2-4e79-810e-c79f6f1f564a','308d693b-f75d-4863-886a-b5447b9a9268');
INSERT INTO `COMPOSITE_ROLE` VALUES ('aa5fb218-d1e2-4e79-810e-c79f6f1f564a','47d17d96-5978-4d9b-bc5d-b2d28273fbf9');
INSERT INTO `COMPOSITE_ROLE` VALUES ('aa5fb218-d1e2-4e79-810e-c79f6f1f564a','4a60c4ce-cbce-419e-97b1-3e8a88164cd0');
INSERT INTO `COMPOSITE_ROLE` VALUES ('aa5fb218-d1e2-4e79-810e-c79f6f1f564a','5ba2ced3-5343-45a4-a1da-49c937e032aa');
INSERT INTO `COMPOSITE_ROLE` VALUES ('aa5fb218-d1e2-4e79-810e-c79f6f1f564a','8aa86b3c-3c61-49ca-a54a-522ffbc4a88c');
INSERT INTO `COMPOSITE_ROLE` VALUES ('aa5fb218-d1e2-4e79-810e-c79f6f1f564a','91a58085-a139-445f-8f09-cfb83db5b449');
INSERT INTO `COMPOSITE_ROLE` VALUES ('aa5fb218-d1e2-4e79-810e-c79f6f1f564a','9f03f794-52b1-4f70-906a-c07291633320');
INSERT INTO `COMPOSITE_ROLE` VALUES ('aa5fb218-d1e2-4e79-810e-c79f6f1f564a','a031b6a0-aaf7-4d2c-b0e6-7d015eaa2295');
INSERT INTO `COMPOSITE_ROLE` VALUES ('aa5fb218-d1e2-4e79-810e-c79f6f1f564a','a09dd1c0-8657-472d-9f75-5ce5d8262c91');
INSERT INTO `COMPOSITE_ROLE` VALUES ('aa5fb218-d1e2-4e79-810e-c79f6f1f564a','bd41ac97-c51c-4b1f-bfd8-c53431506494');
INSERT INTO `COMPOSITE_ROLE` VALUES ('aa5fb218-d1e2-4e79-810e-c79f6f1f564a','d120187d-8423-4233-90a5-9931118dd94b');
INSERT INTO `COMPOSITE_ROLE` VALUES ('aa5fb218-d1e2-4e79-810e-c79f6f1f564a','e726dda3-ba62-48f6-a39e-046cae207d81');
INSERT INTO `COMPOSITE_ROLE` VALUES ('aa5fb218-d1e2-4e79-810e-c79f6f1f564a','f0805d97-d7c2-498b-8c32-54ddc73a8ac5');
INSERT INTO `COMPOSITE_ROLE` VALUES ('aa5fb218-d1e2-4e79-810e-c79f6f1f564a','f608f294-8895-4b5f-9680-ac268ffc09fc');
INSERT INTO `COMPOSITE_ROLE` VALUES ('aa5fb218-d1e2-4e79-810e-c79f6f1f564a','fa7c7b96-b076-405f-b4c5-10a2eb67d7b6');
INSERT INTO `COMPOSITE_ROLE` VALUES ('ecaa4248-4d27-43f4-9554-71c40d8f8087','3f8ca1ab-7a0c-4b9d-a8cd-df51a8cc2f3d');
INSERT INTO `COMPOSITE_ROLE` VALUES ('eeaf3eb7-af5b-4390-a203-4f611e629fdb','02fa82f5-96a8-4f78-aae9-d9d45d56e98e');
INSERT INTO `COMPOSITE_ROLE` VALUES ('eeaf3eb7-af5b-4390-a203-4f611e629fdb','29132a7a-a4bc-4e9d-abd9-d6d063428483');
INSERT INTO `COMPOSITE_ROLE` VALUES ('eeaf3eb7-af5b-4390-a203-4f611e629fdb','bb060fa5-d3b4-493c-8f62-ac1fc6a36275');
INSERT INTO `COMPOSITE_ROLE` VALUES ('eeaf3eb7-af5b-4390-a203-4f611e629fdb','fc9adbda-1fa2-4165-80f2-56f496e47c76');
INSERT INTO `COMPOSITE_ROLE` VALUES ('fc9adbda-1fa2-4165-80f2-56f496e47c76','fa021078-c5f6-4f43-8b12-8b7330d5f2a3');
/*!40000 ALTER TABLE `COMPOSITE_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CREDENTIAL`
--

DROP TABLE IF EXISTS `CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CREDENTIAL` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USER_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `USER_LABEL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SECRET_DATA` longtext COLLATE utf8mb4_unicode_ci,
  `CREDENTIAL_DATA` longtext COLLATE utf8mb4_unicode_ci,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_CREDENTIAL` (`USER_ID`),
  CONSTRAINT `FK_PFYR0GLASQYL0DEI3KL69R6V0` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CREDENTIAL`
--

LOCK TABLES `CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `CREDENTIAL` DISABLE KEYS */;
INSERT INTO `CREDENTIAL` VALUES ('ddf0d76e-929a-4e15-99fc-a0aac14861f9',NULL,'password','a3c5d817-69f1-4f5f-8071-890bc3f40f44',1678214836168,NULL,'{\"value\":\"U/wHyl5OSvTXWV7wqjHa8wC1jaNf3gjwbja5TLcMFr1XQeT4+HBqT0dNRkz4tGboq6LZfjXC1UgeUq/kUkwX6g==\",\"salt\":\"rwW4Nw1I3ZYXmkNE5lx2Bg==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10);
/*!40000 ALTER TABLE `CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `AUTHOR` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FILENAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MD5SUM` varchar(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `COMMENTS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LIQUIBASE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CONTEXTS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LABELS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOG`
--

LOCK TABLES `DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOG` VALUES ('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/jpa-changelog-1.0.0.Final.xml','2023-03-07 18:46:46',1,'EXECUTED','8:bda77d94bf90182a1e30c24f1c155ec7','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/db2-jpa-changelog-1.0.0.Final.xml','2023-03-07 18:46:46',2,'MARK_RAN','8:1ecb330f30986693d1cba9ab579fa219','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('1.1.0.Beta1','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Beta1.xml','2023-03-07 18:46:47',3,'EXECUTED','8:cb7ace19bc6d959f305605d255d4c843','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('1.1.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Final.xml','2023-03-07 18:46:47',4,'EXECUTED','8:80230013e961310e6872e871be424a63','renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('1.2.0.Beta1','psilva@redhat.com','META-INF/jpa-changelog-1.2.0.Beta1.xml','2023-03-07 18:46:48',5,'EXECUTED','8:67f4c20929126adc0c8e9bf48279d244','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('1.2.0.Beta1','psilva@redhat.com','META-INF/db2-jpa-changelog-1.2.0.Beta1.xml','2023-03-07 18:46:48',6,'MARK_RAN','8:7311018b0b8179ce14628ab412bb6783','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('1.2.0.RC1','bburke@redhat.com','META-INF/jpa-changelog-1.2.0.CR1.xml','2023-03-07 18:46:50',7,'EXECUTED','8:037ba1216c3640f8785ee6b8e7c8e3c1','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('1.2.0.RC1','bburke@redhat.com','META-INF/db2-jpa-changelog-1.2.0.CR1.xml','2023-03-07 18:46:50',8,'MARK_RAN','8:7fe6ffe4af4df289b3157de32c624263','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('1.2.0.Final','keycloak','META-INF/jpa-changelog-1.2.0.Final.xml','2023-03-07 18:46:50',9,'EXECUTED','8:9c136bc3187083a98745c7d03bc8a303','update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('1.3.0','bburke@redhat.com','META-INF/jpa-changelog-1.3.0.xml','2023-03-07 18:46:51',10,'EXECUTED','8:b5f09474dca81fb56a97cf5b6553d331','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('1.4.0','bburke@redhat.com','META-INF/jpa-changelog-1.4.0.xml','2023-03-07 18:46:52',11,'EXECUTED','8:ca924f31bd2a3b219fdcfe78c82dacf4','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('1.4.0','bburke@redhat.com','META-INF/db2-jpa-changelog-1.4.0.xml','2023-03-07 18:46:52',12,'MARK_RAN','8:8acad7483e106416bcfa6f3b824a16cd','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('1.5.0','bburke@redhat.com','META-INF/jpa-changelog-1.5.0.xml','2023-03-07 18:46:52',13,'EXECUTED','8:9b1266d17f4f87c78226f5055408fd5e','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('1.6.1_from15','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2023-03-07 18:46:53',14,'EXECUTED','8:d80ec4ab6dbfe573550ff72396c7e910','addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('1.6.1_from16-pre','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2023-03-07 18:46:53',15,'MARK_RAN','8:d86eb172171e7c20b9c849b584d147b2','delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('1.6.1_from16','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2023-03-07 18:46:53',16,'MARK_RAN','8:5735f46f0fa60689deb0ecdc2a0dea22','dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('1.6.1','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2023-03-07 18:46:53',17,'EXECUTED','8:d41d8cd98f00b204e9800998ecf8427e','empty','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('1.7.0','bburke@redhat.com','META-INF/jpa-changelog-1.7.0.xml','2023-03-07 18:46:54',18,'EXECUTED','8:5c1a8fd2014ac7fc43b90a700f117b23','createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('1.8.0','mposolda@redhat.com','META-INF/jpa-changelog-1.8.0.xml','2023-03-07 18:46:55',19,'EXECUTED','8:1f6c2c2dfc362aff4ed75b3f0ef6b331','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('1.8.0-2','keycloak','META-INF/jpa-changelog-1.8.0.xml','2023-03-07 18:46:55',20,'EXECUTED','8:dee9246280915712591f83a127665107','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('1.8.0','mposolda@redhat.com','META-INF/db2-jpa-changelog-1.8.0.xml','2023-03-07 18:46:55',21,'MARK_RAN','8:9eb2ee1fa8ad1c5e426421a6f8fdfa6a','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('1.8.0-2','keycloak','META-INF/db2-jpa-changelog-1.8.0.xml','2023-03-07 18:46:55',22,'MARK_RAN','8:dee9246280915712591f83a127665107','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('1.9.0','mposolda@redhat.com','META-INF/jpa-changelog-1.9.0.xml','2023-03-07 18:46:55',23,'EXECUTED','8:d9fa18ffa355320395b86270680dd4fe','update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('1.9.1','keycloak','META-INF/jpa-changelog-1.9.1.xml','2023-03-07 18:46:55',24,'EXECUTED','8:90cff506fedb06141ffc1c71c4a1214c','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('1.9.1','keycloak','META-INF/db2-jpa-changelog-1.9.1.xml','2023-03-07 18:46:55',25,'MARK_RAN','8:11a788aed4961d6d29c427c063af828c','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('1.9.2','keycloak','META-INF/jpa-changelog-1.9.2.xml','2023-03-07 18:46:56',26,'EXECUTED','8:a4218e51e1faf380518cce2af5d39b43','createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('authz-2.0.0','psilva@redhat.com','META-INF/jpa-changelog-authz-2.0.0.xml','2023-03-07 18:46:57',27,'EXECUTED','8:d9e9a1bfaa644da9952456050f07bbdc','createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('authz-2.5.1','psilva@redhat.com','META-INF/jpa-changelog-authz-2.5.1.xml','2023-03-07 18:46:57',28,'EXECUTED','8:d1bf991a6163c0acbfe664b615314505','update tableName=RESOURCE_SERVER_POLICY','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('2.1.0-KEYCLOAK-5461','bburke@redhat.com','META-INF/jpa-changelog-2.1.0.xml','2023-03-07 18:46:58',29,'EXECUTED','8:88a743a1e87ec5e30bf603da68058a8c','createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('2.2.0','bburke@redhat.com','META-INF/jpa-changelog-2.2.0.xml','2023-03-07 18:46:58',30,'EXECUTED','8:c5517863c875d325dea463d00ec26d7a','addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('2.3.0','bburke@redhat.com','META-INF/jpa-changelog-2.3.0.xml','2023-03-07 18:46:58',31,'EXECUTED','8:ada8b4833b74a498f376d7136bc7d327','createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('2.4.0','bburke@redhat.com','META-INF/jpa-changelog-2.4.0.xml','2023-03-07 18:46:58',32,'EXECUTED','8:b9b73c8ea7299457f99fcbb825c263ba','customChange','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('2.5.0','bburke@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2023-03-07 18:46:58',33,'EXECUTED','8:07724333e625ccfcfc5adc63d57314f3','customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('2.5.0-unicode-oracle','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2023-03-07 18:46:58',34,'MARK_RAN','8:8b6fd445958882efe55deb26fc541a7b','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('2.5.0-unicode-other-dbs','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2023-03-07 18:47:00',35,'EXECUTED','8:29b29cfebfd12600897680147277a9d7','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('2.5.0-duplicate-email-support','slawomir@dabek.name','META-INF/jpa-changelog-2.5.0.xml','2023-03-07 18:47:00',36,'EXECUTED','8:73ad77ca8fd0410c7f9f15a471fa52bc','addColumn tableName=REALM','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('2.5.0-unique-group-names','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2023-03-07 18:47:00',37,'EXECUTED','8:64f27a6fdcad57f6f9153210f2ec1bdb','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('2.5.1','bburke@redhat.com','META-INF/jpa-changelog-2.5.1.xml','2023-03-07 18:47:00',38,'EXECUTED','8:27180251182e6c31846c2ddab4bc5781','addColumn tableName=FED_USER_CONSENT','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('3.0.0','bburke@redhat.com','META-INF/jpa-changelog-3.0.0.xml','2023-03-07 18:47:00',39,'EXECUTED','8:d56f201bfcfa7a1413eb3e9bc02978f9','addColumn tableName=IDENTITY_PROVIDER','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('3.2.0-fix','keycloak','META-INF/jpa-changelog-3.2.0.xml','2023-03-07 18:47:00',40,'MARK_RAN','8:91f5522bf6afdc2077dfab57fbd3455c','addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('3.2.0-fix-with-keycloak-5416','keycloak','META-INF/jpa-changelog-3.2.0.xml','2023-03-07 18:47:00',41,'MARK_RAN','8:0f01b554f256c22caeb7d8aee3a1cdc8','dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('3.2.0-fix-offline-sessions','hmlnarik','META-INF/jpa-changelog-3.2.0.xml','2023-03-07 18:47:00',42,'EXECUTED','8:ab91cf9cee415867ade0e2df9651a947','customChange','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('3.2.0-fixed','keycloak','META-INF/jpa-changelog-3.2.0.xml','2023-03-07 18:47:02',43,'EXECUTED','8:ceac9b1889e97d602caf373eadb0d4b7','addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('3.3.0','keycloak','META-INF/jpa-changelog-3.3.0.xml','2023-03-07 18:47:02',44,'EXECUTED','8:84b986e628fe8f7fd8fd3c275c5259f2','addColumn tableName=USER_ENTITY','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('authz-3.4.0.CR1-resource-server-pk-change-part1','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-03-07 18:47:02',45,'EXECUTED','8:a164ae073c56ffdbc98a615493609a52','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-03-07 18:47:02',46,'EXECUTED','8:70a2b4f1f4bd4dbf487114bdb1810e64','customChange','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-03-07 18:47:02',47,'MARK_RAN','8:7be68b71d2f5b94b8df2e824f2860fa2','dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-03-07 18:47:03',48,'EXECUTED','8:bab7c631093c3861d6cf6144cd944982','addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('authn-3.4.0.CR1-refresh-token-max-reuse','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-03-07 18:47:03',49,'EXECUTED','8:fa809ac11877d74d76fe40869916daad','addColumn tableName=REALM','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('3.4.0','keycloak','META-INF/jpa-changelog-3.4.0.xml','2023-03-07 18:47:04',50,'EXECUTED','8:fac23540a40208f5f5e326f6ceb4d291','addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('3.4.0-KEYCLOAK-5230','hmlnarik@redhat.com','META-INF/jpa-changelog-3.4.0.xml','2023-03-07 18:47:04',51,'EXECUTED','8:2612d1b8a97e2b5588c346e817307593','createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('3.4.1','psilva@redhat.com','META-INF/jpa-changelog-3.4.1.xml','2023-03-07 18:47:04',52,'EXECUTED','8:9842f155c5db2206c88bcb5d1046e941','modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('3.4.2','keycloak','META-INF/jpa-changelog-3.4.2.xml','2023-03-07 18:47:04',53,'EXECUTED','8:2e12e06e45498406db72d5b3da5bbc76','update tableName=REALM','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('3.4.2-KEYCLOAK-5172','mkanis@redhat.com','META-INF/jpa-changelog-3.4.2.xml','2023-03-07 18:47:04',54,'EXECUTED','8:33560e7c7989250c40da3abdabdc75a4','update tableName=CLIENT','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('4.0.0-KEYCLOAK-6335','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2023-03-07 18:47:04',55,'EXECUTED','8:87a8d8542046817a9107c7eb9cbad1cd','createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('4.0.0-CLEANUP-UNUSED-TABLE','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2023-03-07 18:47:04',56,'EXECUTED','8:3ea08490a70215ed0088c273d776311e','dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('4.0.0-KEYCLOAK-6228','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2023-03-07 18:47:04',57,'EXECUTED','8:2d56697c8723d4592ab608ce14b6ed68','dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('4.0.0-KEYCLOAK-5579-fixed','mposolda@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2023-03-07 18:47:07',58,'EXECUTED','8:3e423e249f6068ea2bbe48bf907f9d86','dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('authz-4.0.0.CR1','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.CR1.xml','2023-03-07 18:47:07',59,'EXECUTED','8:15cabee5e5df0ff099510a0fc03e4103','createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('authz-4.0.0.Beta3','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.Beta3.xml','2023-03-07 18:47:07',60,'EXECUTED','8:4b80200af916ac54d2ffbfc47918ab0e','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('authz-4.2.0.Final','mhajas@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2023-03-07 18:47:07',61,'EXECUTED','8:66564cd5e168045d52252c5027485bbb','createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('authz-4.2.0.Final-KEYCLOAK-9944','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2023-03-07 18:47:08',62,'EXECUTED','8:1c7064fafb030222be2bd16ccf690f6f','addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('4.2.0-KEYCLOAK-6313','wadahiro@gmail.com','META-INF/jpa-changelog-4.2.0.xml','2023-03-07 18:47:08',63,'EXECUTED','8:2de18a0dce10cdda5c7e65c9b719b6e5','addColumn tableName=REQUIRED_ACTION_PROVIDER','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('4.3.0-KEYCLOAK-7984','wadahiro@gmail.com','META-INF/jpa-changelog-4.3.0.xml','2023-03-07 18:47:08',64,'EXECUTED','8:03e413dd182dcbd5c57e41c34d0ef682','update tableName=REQUIRED_ACTION_PROVIDER','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('4.6.0-KEYCLOAK-7950','psilva@redhat.com','META-INF/jpa-changelog-4.6.0.xml','2023-03-07 18:47:08',65,'EXECUTED','8:d27b42bb2571c18fbe3fe4e4fb7582a7','update tableName=RESOURCE_SERVER_RESOURCE','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('4.6.0-KEYCLOAK-8377','keycloak','META-INF/jpa-changelog-4.6.0.xml','2023-03-07 18:47:08',66,'EXECUTED','8:698baf84d9fd0027e9192717c2154fb8','createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('4.6.0-KEYCLOAK-8555','gideonray@gmail.com','META-INF/jpa-changelog-4.6.0.xml','2023-03-07 18:47:08',67,'EXECUTED','8:ced8822edf0f75ef26eb51582f9a821a','createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('4.7.0-KEYCLOAK-1267','sguilhen@redhat.com','META-INF/jpa-changelog-4.7.0.xml','2023-03-07 18:47:08',68,'EXECUTED','8:f0abba004cf429e8afc43056df06487d','addColumn tableName=REALM','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('4.7.0-KEYCLOAK-7275','keycloak','META-INF/jpa-changelog-4.7.0.xml','2023-03-07 18:47:08',69,'EXECUTED','8:6662f8b0b611caa359fcf13bf63b4e24','renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('4.8.0-KEYCLOAK-8835','sguilhen@redhat.com','META-INF/jpa-changelog-4.8.0.xml','2023-03-07 18:47:08',70,'EXECUTED','8:9e6b8009560f684250bdbdf97670d39e','addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('authz-7.0.0-KEYCLOAK-10443','psilva@redhat.com','META-INF/jpa-changelog-authz-7.0.0.xml','2023-03-07 18:47:08',71,'EXECUTED','8:4223f561f3b8dc655846562b57bb502e','addColumn tableName=RESOURCE_SERVER','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('8.0.0-adding-credential-columns','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-03-07 18:47:08',72,'EXECUTED','8:215a31c398b363ce383a2b301202f29e','addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('8.0.0-updating-credential-data-not-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-03-07 18:47:08',73,'EXECUTED','8:83f7a671792ca98b3cbd3a1a34862d3d','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('8.0.0-updating-credential-data-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-03-07 18:47:08',74,'MARK_RAN','8:f58ad148698cf30707a6efbdf8061aa7','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('8.0.0-credential-cleanup-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-03-07 18:47:09',75,'EXECUTED','8:79e4fd6c6442980e58d52ffc3ee7b19c','dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('8.0.0-resource-tag-support','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-03-07 18:47:09',76,'EXECUTED','8:87af6a1e6d241ca4b15801d1f86a297d','addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('9.0.0-always-display-client','keycloak','META-INF/jpa-changelog-9.0.0.xml','2023-03-07 18:47:09',77,'EXECUTED','8:b44f8d9b7b6ea455305a6d72a200ed15','addColumn tableName=CLIENT','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('9.0.0-drop-constraints-for-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2023-03-07 18:47:09',78,'MARK_RAN','8:2d8ed5aaaeffd0cb004c046b4a903ac5','dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('9.0.0-increase-column-size-federated-fk','keycloak','META-INF/jpa-changelog-9.0.0.xml','2023-03-07 18:47:10',79,'EXECUTED','8:e290c01fcbc275326c511633f6e2acde','modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('9.0.0-recreate-constraints-after-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2023-03-07 18:47:10',80,'MARK_RAN','8:c9db8784c33cea210872ac2d805439f8','addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('9.0.1-add-index-to-client.client_id','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-03-07 18:47:10',81,'EXECUTED','8:95b676ce8fc546a1fcfb4c92fae4add5','createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('9.0.1-KEYCLOAK-12579-drop-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-03-07 18:47:10',82,'MARK_RAN','8:38a6b2a41f5651018b1aca93a41401e5','dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('9.0.1-KEYCLOAK-12579-add-not-null-constraint','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-03-07 18:47:10',83,'EXECUTED','8:3fb99bcad86a0229783123ac52f7609c','addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('9.0.1-KEYCLOAK-12579-recreate-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-03-07 18:47:10',84,'MARK_RAN','8:64f27a6fdcad57f6f9153210f2ec1bdb','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('9.0.1-add-index-to-events','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-03-07 18:47:10',85,'EXECUTED','8:ab4f863f39adafd4c862f7ec01890abc','createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('map-remove-ri','keycloak','META-INF/jpa-changelog-11.0.0.xml','2023-03-07 18:47:10',86,'EXECUTED','8:13c419a0eb336e91ee3a3bf8fda6e2a7','dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('map-remove-ri','keycloak','META-INF/jpa-changelog-12.0.0.xml','2023-03-07 18:47:10',87,'EXECUTED','8:e3fb1e698e0471487f51af1ed80fe3ac','dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('12.1.0-add-realm-localization-table','keycloak','META-INF/jpa-changelog-12.0.0.xml','2023-03-07 18:47:10',88,'EXECUTED','8:babadb686aab7b56562817e60bf0abd0','createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('default-roles','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-03-07 18:47:10',89,'EXECUTED','8:72d03345fda8e2f17093d08801947773','addColumn tableName=REALM; customChange','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('default-roles-cleanup','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-03-07 18:47:10',90,'EXECUTED','8:61c9233951bd96ffecd9ba75f7d978a4','dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('13.0.0-KEYCLOAK-16844','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-03-07 18:47:10',91,'EXECUTED','8:ea82e6ad945cec250af6372767b25525','createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('map-remove-ri-13.0.0','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-03-07 18:47:10',92,'EXECUTED','8:d3f4a33f41d960ddacd7e2ef30d126b3','dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('13.0.0-KEYCLOAK-17992-drop-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-03-07 18:47:10',93,'MARK_RAN','8:1284a27fbd049d65831cb6fc07c8a783','dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('13.0.0-increase-column-size-federated','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-03-07 18:47:11',94,'EXECUTED','8:9d11b619db2ae27c25853b8a37cd0dea','modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('13.0.0-KEYCLOAK-17992-recreate-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-03-07 18:47:11',95,'MARK_RAN','8:3002bb3997451bb9e8bac5c5cd8d6327','addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('json-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-03-07 18:47:11',96,'EXECUTED','8:dfbee0d6237a23ef4ccbb7a4e063c163','addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('14.0.0-KEYCLOAK-11019','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-03-07 18:47:11',97,'EXECUTED','8:75f3e372df18d38c62734eebb986b960','createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('14.0.0-KEYCLOAK-18286','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-03-07 18:47:11',98,'MARK_RAN','8:7fee73eddf84a6035691512c85637eef','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('14.0.0-KEYCLOAK-18286-revert','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-03-07 18:47:11',99,'MARK_RAN','8:7a11134ab12820f999fbf3bb13c3adc8','dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('14.0.0-KEYCLOAK-18286-supported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-03-07 18:47:11',100,'EXECUTED','8:f43dfba07ba249d5d932dc489fd2b886','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('14.0.0-KEYCLOAK-18286-unsupported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-03-07 18:47:11',101,'MARK_RAN','8:18186f0008b86e0f0f49b0c4d0e842ac','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('KEYCLOAK-17267-add-index-to-user-attributes','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-03-07 18:47:11',102,'EXECUTED','8:09c2780bcb23b310a7019d217dc7b433','createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('KEYCLOAK-18146-add-saml-art-binding-identifier','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-03-07 18:47:11',103,'EXECUTED','8:276a44955eab693c970a42880197fff2','customChange','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('15.0.0-KEYCLOAK-18467','keycloak','META-INF/jpa-changelog-15.0.0.xml','2023-03-07 18:47:11',104,'EXECUTED','8:ba8ee3b694d043f2bfc1a1079d0760d7','addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('17.0.0-9562','keycloak','META-INF/jpa-changelog-17.0.0.xml','2023-03-07 18:47:11',105,'EXECUTED','8:5e06b1d75f5d17685485e610c2851b17','createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY','',NULL,'4.8.0',NULL,NULL,'8214802347');
INSERT INTO `DATABASECHANGELOG` VALUES ('18.0.0-10625-IDX_ADMIN_EVENT_TIME','keycloak','META-INF/jpa-changelog-18.0.0.xml','2023-03-07 18:47:11',106,'EXECUTED','8:4b80546c1dc550ac552ee7b24a4ab7c0','createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY','',NULL,'4.8.0',NULL,NULL,'8214802347');
/*!40000 ALTER TABLE `DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOGLOCK`
--

LOCK TABLES `DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOGLOCK` VALUES (1,_binary '\0',NULL,NULL);
INSERT INTO `DATABASECHANGELOGLOCK` VALUES (1000,_binary '\0',NULL,NULL);
INSERT INTO `DATABASECHANGELOGLOCK` VALUES (1001,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEFAULT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `DEFAULT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DEFAULT_CLIENT_SCOPE` (
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SCOPE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`REALM_ID`,`SCOPE_ID`),
  KEY `IDX_DEFCLS_REALM` (`REALM_ID`),
  KEY `IDX_DEFCLS_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_R_DEF_CLI_SCOPE_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEFAULT_CLIENT_SCOPE`
--

LOCK TABLES `DEFAULT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('e810ef94-3763-43cb-b70b-f5229124accb','0a0b84ad-2758-407c-8acc-49fb64d4578e',_binary '');
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('e810ef94-3763-43cb-b70b-f5229124accb','45c4948d-82c7-49c5-ad37-9b290995a96d',_binary '');
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('e810ef94-3763-43cb-b70b-f5229124accb','52dbc43c-d0bd-461e-bc9f-941f7f551435',_binary '\0');
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('e810ef94-3763-43cb-b70b-f5229124accb','57b42671-20c2-4579-9cf5-4c3431917edb',_binary '');
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('e810ef94-3763-43cb-b70b-f5229124accb','58622285-f578-46f3-bbd0-2793b89ec84a',_binary '');
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('e810ef94-3763-43cb-b70b-f5229124accb','5da6968d-da8c-4e80-b281-7b52e81116a4',_binary '');
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('e810ef94-3763-43cb-b70b-f5229124accb','7d729fa4-5aaf-434c-90f5-d9cd129cad37',_binary '\0');
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('e810ef94-3763-43cb-b70b-f5229124accb','7f889b0d-8944-4c65-814c-af0a676675d0',_binary '\0');
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('e810ef94-3763-43cb-b70b-f5229124accb','8a7e233a-0064-427d-b873-1e0eca4e45d2',_binary '');
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('e810ef94-3763-43cb-b70b-f5229124accb','fdd0aabb-00d5-49b6-8afe-19c52d3ca168',_binary '\0');
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('myRealm','065158f3-390f-42b3-8666-852906e538fa',_binary '\0');
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('myRealm','0b8672d9-a343-409a-8d03-2fc8f8b314aa',_binary '');
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('myRealm','179593fa-2506-499a-944e-77ffe4b6fdd1',_binary '');
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('myRealm','2b958474-6d3d-44f0-838f-e353223692f5',_binary '\0');
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('myRealm','4fa058aa-5d90-41f3-816d-3b97b15cee0f',_binary '');
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('myRealm','56804cff-2c5f-4c70-8822-dc9a87c9f997',_binary '\0');
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('myRealm','92de7d0c-41b5-46fe-99bb-1f137fca7778',_binary '');
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('myRealm','bc2f9339-ed10-4060-b0ce-cf30d11fcc53',_binary '');
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('myRealm','ccbef8af-20f1-474d-98b5-aa0a30340b70',_binary '');
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('myRealm','e1828105-24e0-4627-9827-0734c1296f99',_binary '\0');
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EVENT_ENTITY`
--

DROP TABLE IF EXISTS `EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EVENT_ENTITY` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DETAILS_JSON` text COLLATE utf8mb4_unicode_ci,
  `ERROR` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IP_ADDRESS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SESSION_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EVENT_TIME` bigint DEFAULT NULL,
  `TYPE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USER_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_EVENT_TIME` (`REALM_ID`,`EVENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EVENT_ENTITY`
--

LOCK TABLES `EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_IDENTITY`
--

DROP TABLE IF EXISTS `FEDERATED_IDENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FEDERATED_IDENTITY` (
  `IDENTITY_PROVIDER` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FEDERATED_USER_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FEDERATED_USERNAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TOKEN` text COLLATE utf8mb4_unicode_ci,
  `USER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`),
  KEY `IDX_FEDIDENTITY_USER` (`USER_ID`),
  KEY `IDX_FEDIDENTITY_FEDUSER` (`FEDERATED_USER_ID`),
  CONSTRAINT `FK404288B92EF007A6` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_IDENTITY`
--

LOCK TABLES `FEDERATED_IDENTITY` WRITE;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_USER`
--

DROP TABLE IF EXISTS `FEDERATED_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FEDERATED_USER` (
  `ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_USER`
--

LOCK TABLES `FEDERATED_USER` WRITE;
/*!40000 ALTER TABLE `FEDERATED_USER` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `FED_USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_ATTRIBUTE` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `USER_ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VALUE` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_ATTRIBUTE` (`USER_ID`,`REALM_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ATTRIBUTE`
--

LOCK TABLES `FED_USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CONSENT` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USER_ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CONSENT` (`USER_ID`,`CLIENT_ID`),
  KEY `IDX_FU_CONSENT_RU` (`REALM_ID`,`USER_ID`),
  KEY `IDX_FU_CNSNT_EXT` (`USER_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT`
--

LOCK TABLES `FED_USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT_CL_SCOPE`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT_CL_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CONSENT_CL_SCOPE` (
  `USER_CONSENT_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SCOPE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT_CL_SCOPE`
--

LOCK TABLES `FED_USER_CONSENT_CL_SCOPE` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CREDENTIAL`
--

DROP TABLE IF EXISTS `FED_USER_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CREDENTIAL` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `USER_ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USER_LABEL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SECRET_DATA` longtext COLLATE utf8mb4_unicode_ci,
  `CREDENTIAL_DATA` longtext COLLATE utf8mb4_unicode_ci,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CREDENTIAL` (`USER_ID`,`TYPE`),
  KEY `IDX_FU_CREDENTIAL_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CREDENTIAL`
--

LOCK TABLES `FED_USER_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `FED_USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `USER_ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP` (`USER_ID`,`GROUP_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `FED_USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `FED_USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_REQUIRED_ACTION` (
  `REQUIRED_ACTION` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ' ',
  `USER_ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_FU_REQUIRED_ACTION` (`USER_ID`,`REQUIRED_ACTION`),
  KEY `IDX_FU_REQUIRED_ACTION_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_REQUIRED_ACTION`
--

LOCK TABLES `FED_USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `FED_USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `USER_ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_FU_ROLE_MAPPING` (`USER_ID`,`ROLE_ID`),
  KEY `IDX_FU_ROLE_MAPPING_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ROLE_MAPPING`
--

LOCK TABLES `FED_USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ATTRIBUTE`
--

DROP TABLE IF EXISTS `GROUP_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_ATTRIBUTE` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `GROUP_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GROUP_ATTR_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ATTRIBUTE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ATTRIBUTE`
--

LOCK TABLES `GROUP_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `GROUP_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `GROUP_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`GROUP_ID`),
  KEY `IDX_GROUP_ROLE_MAPP_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ROLE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ROLE_MAPPING`
--

LOCK TABLES `GROUP_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER` (
  `INTERNAL_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ALIAS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROVIDER_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `STORE_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `AUTHENTICATE_BY_DEFAULT` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ADD_TOKEN_ROLE` bit(1) NOT NULL DEFAULT b'1',
  `TRUST_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `FIRST_BROKER_LOGIN_FLOW_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `POST_BROKER_LOGIN_FLOW_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROVIDER_DISPLAY_NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LINK_ONLY` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`INTERNAL_ID`),
  UNIQUE KEY `UK_2DAELWNIBJI49AVXSRTUF6XJ33` (`PROVIDER_ALIAS`,`REALM_ID`),
  KEY `IDX_IDENT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK2B4EBC52AE5C3B34` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER`
--

LOCK TABLES `IDENTITY_PROVIDER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_CONFIG`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER_CONFIG` (
  `IDENTITY_PROVIDER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` longtext COLLATE utf8mb4_unicode_ci,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FKDC4897CF864C4E43` FOREIGN KEY (`IDENTITY_PROVIDER_ID`) REFERENCES `IDENTITY_PROVIDER` (`INTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_CONFIG`
--

LOCK TABLES `IDENTITY_PROVIDER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_MAPPER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER_MAPPER` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IDP_ALIAS` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IDP_MAPPER_NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ID_PROV_MAPP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_IDPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_MAPPER`
--

LOCK TABLES `IDENTITY_PROVIDER_MAPPER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `IDP_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDP_MAPPER_CONFIG` (
  `IDP_MAPPER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` longtext COLLATE utf8mb4_unicode_ci,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`IDP_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_IDPMCONFIG` FOREIGN KEY (`IDP_MAPPER_ID`) REFERENCES `IDENTITY_PROVIDER_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_MAPPER_CONFIG`
--

LOCK TABLES `IDP_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_GROUP`
--

DROP TABLE IF EXISTS `KEYCLOAK_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KEYCLOAK_GROUP` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PARENT_GROUP` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SIBLING_NAMES` (`REALM_ID`,`PARENT_GROUP`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_GROUP`
--

LOCK TABLES `KEYCLOAK_GROUP` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_ROLE`
--

DROP TABLE IF EXISTS `KEYCLOAK_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KEYCLOAK_ROLE` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CLIENT_REALM_CONSTRAINT` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CLIENT_ROLE` bit(1) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CLIENT` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_J3RWUVD56ONTGSUHOGM184WW2-2` (`NAME`,`CLIENT_REALM_CONSTRAINT`),
  KEY `IDX_KEYCLOAK_ROLE_CLIENT` (`CLIENT`),
  KEY `IDX_KEYCLOAK_ROLE_REALM` (`REALM`),
  CONSTRAINT `FK_6VYQFE4CN4WLQ8R6KT5VDSJ5C` FOREIGN KEY (`REALM`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_ROLE`
--

LOCK TABLES `KEYCLOAK_ROLE` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` DISABLE KEYS */;
INSERT INTO `KEYCLOAK_ROLE` VALUES ('00485215-c5c3-4be3-801f-0d7c3711b23a','f0348189-2c48-4e29-a817-28d4e432703d',_binary '','${role_query-groups}','query-groups','myRealm','f0348189-2c48-4e29-a817-28d4e432703d',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('004b3d93-0738-4b1c-a9b7-759fab0abe7f','e810ef94-3763-43cb-b70b-f5229124accb',_binary '\0','${role_admin}','admin','e810ef94-3763-43cb-b70b-f5229124accb',NULL,NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('00c0f282-35b6-429a-bd99-ec37426c9781','91dbffbb-cafd-40eb-a312-8dbc536d10e3',_binary '','${role_view-identity-providers}','view-identity-providers','e810ef94-3763-43cb-b70b-f5229124accb','91dbffbb-cafd-40eb-a312-8dbc536d10e3',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('02e1cd55-cd03-4138-a4e1-12630aae1e80','f0348189-2c48-4e29-a817-28d4e432703d',_binary '','${role_view-users}','view-users','myRealm','f0348189-2c48-4e29-a817-28d4e432703d',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('02fa82f5-96a8-4f78-aae9-d9d45d56e98e','e810ef94-3763-43cb-b70b-f5229124accb',_binary '\0','${role_uma_authorization}','uma_authorization','e810ef94-3763-43cb-b70b-f5229124accb',NULL,NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('0a281fa2-a129-4fd8-831a-8e4736cb2e58','7d76f094-a7b6-4acb-9c54-dbb45857d8de',_binary '','${role_view-consent}','view-consent','e810ef94-3763-43cb-b70b-f5229124accb','7d76f094-a7b6-4acb-9c54-dbb45857d8de',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('0b959937-70ee-4a7f-8fa8-90f36857f22b','91dbffbb-cafd-40eb-a312-8dbc536d10e3',_binary '','${role_view-users}','view-users','e810ef94-3763-43cb-b70b-f5229124accb','91dbffbb-cafd-40eb-a312-8dbc536d10e3',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('0ee5efd0-77ba-4df3-8f0e-ca3553f76637','9ebdb3bc-347f-4bb9-b642-8cbeb42342bc',_binary '','${role_manage-identity-providers}','manage-identity-providers','e810ef94-3763-43cb-b70b-f5229124accb','9ebdb3bc-347f-4bb9-b642-8cbeb42342bc',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('11e51fed-7bb4-43b8-b981-aabfa9b69c03','91dbffbb-cafd-40eb-a312-8dbc536d10e3',_binary '','${role_impersonation}','impersonation','e810ef94-3763-43cb-b70b-f5229124accb','91dbffbb-cafd-40eb-a312-8dbc536d10e3',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('181c7f81-84da-471d-9311-cabab1b56887','7d76f094-a7b6-4acb-9c54-dbb45857d8de',_binary '','${role_manage-consent}','manage-consent','e810ef94-3763-43cb-b70b-f5229124accb','7d76f094-a7b6-4acb-9c54-dbb45857d8de',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('1a8d13c3-ecc7-444d-a9d3-636275963e10','f0348189-2c48-4e29-a817-28d4e432703d',_binary '','${role_manage-users}','manage-users','myRealm','f0348189-2c48-4e29-a817-28d4e432703d',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('1e9b7b11-2ce4-4f49-8366-02b8da7fa888','91dbffbb-cafd-40eb-a312-8dbc536d10e3',_binary '','${role_manage-identity-providers}','manage-identity-providers','e810ef94-3763-43cb-b70b-f5229124accb','91dbffbb-cafd-40eb-a312-8dbc536d10e3',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('20e46304-fb70-4192-a075-44aa404a39ef','9ebdb3bc-347f-4bb9-b642-8cbeb42342bc',_binary '','${role_view-users}','view-users','e810ef94-3763-43cb-b70b-f5229124accb','9ebdb3bc-347f-4bb9-b642-8cbeb42342bc',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('245c54d8-0e48-4e70-84e1-53a567541fec','9ebdb3bc-347f-4bb9-b642-8cbeb42342bc',_binary '','${role_manage-authorization}','manage-authorization','e810ef94-3763-43cb-b70b-f5229124accb','9ebdb3bc-347f-4bb9-b642-8cbeb42342bc',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('27b37535-18b2-4339-99a2-8894d0a301a1','b1340e05-4d92-478a-b49b-5820af128eca',_binary '','${role_view-profile}','view-profile','myRealm','b1340e05-4d92-478a-b49b-5820af128eca',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('285925ba-421d-481a-bfc3-e40672b9250b','9ebdb3bc-347f-4bb9-b642-8cbeb42342bc',_binary '','${role_view-realm}','view-realm','e810ef94-3763-43cb-b70b-f5229124accb','9ebdb3bc-347f-4bb9-b642-8cbeb42342bc',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('29132a7a-a4bc-4e9d-abd9-d6d063428483','e810ef94-3763-43cb-b70b-f5229124accb',_binary '\0','${role_offline-access}','offline_access','e810ef94-3763-43cb-b70b-f5229124accb',NULL,NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('2db91bb2-7c86-444f-92ed-d47580825ed1','91dbffbb-cafd-40eb-a312-8dbc536d10e3',_binary '','${role_manage-authorization}','manage-authorization','e810ef94-3763-43cb-b70b-f5229124accb','91dbffbb-cafd-40eb-a312-8dbc536d10e3',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('2ee75d6b-acd4-4684-a230-502e64ec2c8a','91dbffbb-cafd-40eb-a312-8dbc536d10e3',_binary '','${role_query-realms}','query-realms','e810ef94-3763-43cb-b70b-f5229124accb','91dbffbb-cafd-40eb-a312-8dbc536d10e3',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('308d693b-f75d-4863-886a-b5447b9a9268','f0348189-2c48-4e29-a817-28d4e432703d',_binary '','${role_impersonation}','impersonation','myRealm','f0348189-2c48-4e29-a817-28d4e432703d',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('33f3ed40-baa9-408e-9e0b-ede6a6f4b003','9ebdb3bc-347f-4bb9-b642-8cbeb42342bc',_binary '','${role_query-groups}','query-groups','e810ef94-3763-43cb-b70b-f5229124accb','9ebdb3bc-347f-4bb9-b642-8cbeb42342bc',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('36063e18-482f-4662-95ad-fa62d8e2481d','91dbffbb-cafd-40eb-a312-8dbc536d10e3',_binary '','${role_query-users}','query-users','e810ef94-3763-43cb-b70b-f5229124accb','91dbffbb-cafd-40eb-a312-8dbc536d10e3',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('3e591288-0827-4f65-aceb-58f50938198e','9ebdb3bc-347f-4bb9-b642-8cbeb42342bc',_binary '','${role_view-events}','view-events','e810ef94-3763-43cb-b70b-f5229124accb','9ebdb3bc-347f-4bb9-b642-8cbeb42342bc',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('3f8ca1ab-7a0c-4b9d-a8cd-df51a8cc2f3d','b1340e05-4d92-478a-b49b-5820af128eca',_binary '','${role_view-consent}','view-consent','myRealm','b1340e05-4d92-478a-b49b-5820af128eca',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('47d17d96-5978-4d9b-bc5d-b2d28273fbf9','f0348189-2c48-4e29-a817-28d4e432703d',_binary '','${role_view-events}','view-events','myRealm','f0348189-2c48-4e29-a817-28d4e432703d',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('49c1f0ea-eaa0-4bfd-a047-ee8fc12622d3','91dbffbb-cafd-40eb-a312-8dbc536d10e3',_binary '','${role_view-authorization}','view-authorization','e810ef94-3763-43cb-b70b-f5229124accb','91dbffbb-cafd-40eb-a312-8dbc536d10e3',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('4a60c4ce-cbce-419e-97b1-3e8a88164cd0','f0348189-2c48-4e29-a817-28d4e432703d',_binary '','${role_view-authorization}','view-authorization','myRealm','f0348189-2c48-4e29-a817-28d4e432703d',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('4b92d023-8967-4482-bd8d-6c89db2f7bcd','myRealm',_binary '\0','${role_default-roles}','default-roles-myrealm','myRealm',NULL,NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('4f99cbe4-29e7-4ca5-81da-1c71c96d26bf','9ebdb3bc-347f-4bb9-b642-8cbeb42342bc',_binary '','${role_query-clients}','query-clients','e810ef94-3763-43cb-b70b-f5229124accb','9ebdb3bc-347f-4bb9-b642-8cbeb42342bc',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('59ae7d2b-3517-417e-b3e4-b33b0b97788f','myRealm',_binary '\0','${role_offline-access}','offline_access','myRealm',NULL,NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('59b23256-629b-4588-840f-68f31342c5da','b1340e05-4d92-478a-b49b-5820af128eca',_binary '','${role_manage-account}','manage-account','myRealm','b1340e05-4d92-478a-b49b-5820af128eca',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('5a1ea634-52f7-41d3-b935-77788fd235a6','9ebdb3bc-347f-4bb9-b642-8cbeb42342bc',_binary '','${role_manage-realm}','manage-realm','e810ef94-3763-43cb-b70b-f5229124accb','9ebdb3bc-347f-4bb9-b642-8cbeb42342bc',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('5a65a79d-e1db-4847-8000-31604aa260cb','9ebdb3bc-347f-4bb9-b642-8cbeb42342bc',_binary '','${role_view-clients}','view-clients','e810ef94-3763-43cb-b70b-f5229124accb','9ebdb3bc-347f-4bb9-b642-8cbeb42342bc',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('5a744996-cf20-41f9-a707-b8ebf05e8584','9ebdb3bc-347f-4bb9-b642-8cbeb42342bc',_binary '','${role_manage-clients}','manage-clients','e810ef94-3763-43cb-b70b-f5229124accb','9ebdb3bc-347f-4bb9-b642-8cbeb42342bc',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('5ba2ced3-5343-45a4-a1da-49c937e032aa','f0348189-2c48-4e29-a817-28d4e432703d',_binary '','${role_query-clients}','query-clients','myRealm','f0348189-2c48-4e29-a817-28d4e432703d',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('6032f0d7-3d30-4f91-a0aa-e42ab0b82396','91dbffbb-cafd-40eb-a312-8dbc536d10e3',_binary '','${role_manage-users}','manage-users','e810ef94-3763-43cb-b70b-f5229124accb','91dbffbb-cafd-40eb-a312-8dbc536d10e3',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('7565775d-f8a0-40c4-8592-1abf38ae8fec','9ebdb3bc-347f-4bb9-b642-8cbeb42342bc',_binary '','${role_query-realms}','query-realms','e810ef94-3763-43cb-b70b-f5229124accb','9ebdb3bc-347f-4bb9-b642-8cbeb42342bc',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('77bb922f-17a2-44e3-a60a-fa8d0bc79551','91dbffbb-cafd-40eb-a312-8dbc536d10e3',_binary '','${role_create-client}','create-client','e810ef94-3763-43cb-b70b-f5229124accb','91dbffbb-cafd-40eb-a312-8dbc536d10e3',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('78b7dfbb-2fc1-41a2-9827-4e921e3c68a3','91dbffbb-cafd-40eb-a312-8dbc536d10e3',_binary '','${role_query-groups}','query-groups','e810ef94-3763-43cb-b70b-f5229124accb','91dbffbb-cafd-40eb-a312-8dbc536d10e3',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('7ad69e0d-eeba-4b51-87f9-7cc74b9d8fa0','91dbffbb-cafd-40eb-a312-8dbc536d10e3',_binary '','${role_query-clients}','query-clients','e810ef94-3763-43cb-b70b-f5229124accb','91dbffbb-cafd-40eb-a312-8dbc536d10e3',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('7e7e8dee-2608-4b03-993f-301184c095a8','ea0b71d2-663b-42b2-ada3-f3547ac7ba9c',_binary '','${role_read-token}','read-token','myRealm','ea0b71d2-663b-42b2-ada3-f3547ac7ba9c',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('8157eb70-b8c0-406d-821d-f670f277f120','9ebdb3bc-347f-4bb9-b642-8cbeb42342bc',_binary '','${role_manage-users}','manage-users','e810ef94-3763-43cb-b70b-f5229124accb','9ebdb3bc-347f-4bb9-b642-8cbeb42342bc',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('8aa86b3c-3c61-49ca-a54a-522ffbc4a88c','f0348189-2c48-4e29-a817-28d4e432703d',_binary '','${role_manage-authorization}','manage-authorization','myRealm','f0348189-2c48-4e29-a817-28d4e432703d',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('91a58085-a139-445f-8f09-cfb83db5b449','f0348189-2c48-4e29-a817-28d4e432703d',_binary '','${role_manage-realm}','manage-realm','myRealm','f0348189-2c48-4e29-a817-28d4e432703d',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('9584a1c2-aed2-4a83-a4e6-bd1fb2051d60','91dbffbb-cafd-40eb-a312-8dbc536d10e3',_binary '','${role_view-clients}','view-clients','e810ef94-3763-43cb-b70b-f5229124accb','91dbffbb-cafd-40eb-a312-8dbc536d10e3',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('9f03f794-52b1-4f70-906a-c07291633320','f0348189-2c48-4e29-a817-28d4e432703d',_binary '','${role_manage-identity-providers}','manage-identity-providers','myRealm','f0348189-2c48-4e29-a817-28d4e432703d',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('a031b6a0-aaf7-4d2c-b0e6-7d015eaa2295','f0348189-2c48-4e29-a817-28d4e432703d',_binary '','${role_view-identity-providers}','view-identity-providers','myRealm','f0348189-2c48-4e29-a817-28d4e432703d',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('a03da7dc-5350-4be1-a122-6d798288ed10','91dbffbb-cafd-40eb-a312-8dbc536d10e3',_binary '','${role_manage-events}','manage-events','e810ef94-3763-43cb-b70b-f5229124accb','91dbffbb-cafd-40eb-a312-8dbc536d10e3',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('a09dd1c0-8657-472d-9f75-5ce5d8262c91','f0348189-2c48-4e29-a817-28d4e432703d',_binary '','${role_view-clients}','view-clients','myRealm','f0348189-2c48-4e29-a817-28d4e432703d',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('aa246bd6-b953-4386-92a2-ea671c949e05','9ebdb3bc-347f-4bb9-b642-8cbeb42342bc',_binary '','${role_view-authorization}','view-authorization','e810ef94-3763-43cb-b70b-f5229124accb','9ebdb3bc-347f-4bb9-b642-8cbeb42342bc',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('aa5fb218-d1e2-4e79-810e-c79f6f1f564a','f0348189-2c48-4e29-a817-28d4e432703d',_binary '','${role_realm-admin}','realm-admin','myRealm','f0348189-2c48-4e29-a817-28d4e432703d',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('ace6eb7f-f7fe-43bd-a16f-766334f53a0e','9ebdb3bc-347f-4bb9-b642-8cbeb42342bc',_binary '','${role_create-client}','create-client','e810ef94-3763-43cb-b70b-f5229124accb','9ebdb3bc-347f-4bb9-b642-8cbeb42342bc',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('b65f6c75-e6b9-40ab-a3df-a1a34894dc0c','7d76f094-a7b6-4acb-9c54-dbb45857d8de',_binary '','${role_view-applications}','view-applications','e810ef94-3763-43cb-b70b-f5229124accb','7d76f094-a7b6-4acb-9c54-dbb45857d8de',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('bb060fa5-d3b4-493c-8f62-ac1fc6a36275','7d76f094-a7b6-4acb-9c54-dbb45857d8de',_binary '','${role_view-profile}','view-profile','e810ef94-3763-43cb-b70b-f5229124accb','7d76f094-a7b6-4acb-9c54-dbb45857d8de',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('bd41ac97-c51c-4b1f-bfd8-c53431506494','f0348189-2c48-4e29-a817-28d4e432703d',_binary '','${role_create-client}','create-client','myRealm','f0348189-2c48-4e29-a817-28d4e432703d',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('be7d318e-a62c-40db-976f-7f105288ae4c','7d76f094-a7b6-4acb-9c54-dbb45857d8de',_binary '','${role_delete-account}','delete-account','e810ef94-3763-43cb-b70b-f5229124accb','7d76f094-a7b6-4acb-9c54-dbb45857d8de',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('bfbe7947-4d0d-426a-a3ca-8b447c8a3e5d','91dbffbb-cafd-40eb-a312-8dbc536d10e3',_binary '','${role_manage-realm}','manage-realm','e810ef94-3763-43cb-b70b-f5229124accb','91dbffbb-cafd-40eb-a312-8dbc536d10e3',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('d0c10bdd-4d85-491c-8cc5-7132b5a88a38','91dbffbb-cafd-40eb-a312-8dbc536d10e3',_binary '','${role_view-realm}','view-realm','e810ef94-3763-43cb-b70b-f5229124accb','91dbffbb-cafd-40eb-a312-8dbc536d10e3',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('d120187d-8423-4233-90a5-9931118dd94b','f0348189-2c48-4e29-a817-28d4e432703d',_binary '','${role_view-realm}','view-realm','myRealm','f0348189-2c48-4e29-a817-28d4e432703d',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('d77f6700-8aa5-4264-8f24-93e6def651d9','b1340e05-4d92-478a-b49b-5820af128eca',_binary '','${role_manage-account-links}','manage-account-links','myRealm','b1340e05-4d92-478a-b49b-5820af128eca',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('d8ce34a6-26d7-4358-bb83-72afe7b34a6b','9ebdb3bc-347f-4bb9-b642-8cbeb42342bc',_binary '','${role_impersonation}','impersonation','e810ef94-3763-43cb-b70b-f5229124accb','9ebdb3bc-347f-4bb9-b642-8cbeb42342bc',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('e15ed03f-3659-4e2d-89f1-01808971b7c5','91dbffbb-cafd-40eb-a312-8dbc536d10e3',_binary '','${role_view-events}','view-events','e810ef94-3763-43cb-b70b-f5229124accb','91dbffbb-cafd-40eb-a312-8dbc536d10e3',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('e1b11564-0bc1-4137-8224-705b3ef3b5c5','9ebdb3bc-347f-4bb9-b642-8cbeb42342bc',_binary '','${role_query-users}','query-users','e810ef94-3763-43cb-b70b-f5229124accb','9ebdb3bc-347f-4bb9-b642-8cbeb42342bc',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('e21ebc8a-78be-4864-bc9f-77528b736f39','9ebdb3bc-347f-4bb9-b642-8cbeb42342bc',_binary '','${role_manage-events}','manage-events','e810ef94-3763-43cb-b70b-f5229124accb','9ebdb3bc-347f-4bb9-b642-8cbeb42342bc',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('e726dda3-ba62-48f6-a39e-046cae207d81','f0348189-2c48-4e29-a817-28d4e432703d',_binary '','${role_manage-events}','manage-events','myRealm','f0348189-2c48-4e29-a817-28d4e432703d',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('e7d0e0eb-b512-4cc1-9fe8-fcf9596805a4','91dbffbb-cafd-40eb-a312-8dbc536d10e3',_binary '','${role_manage-clients}','manage-clients','e810ef94-3763-43cb-b70b-f5229124accb','91dbffbb-cafd-40eb-a312-8dbc536d10e3',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('e93f4a2d-baf3-4a58-9552-70a3bad7ceb6','df002117-07e7-4bcc-a8b8-05970dee31f4',_binary '','${role_read-token}','read-token','e810ef94-3763-43cb-b70b-f5229124accb','df002117-07e7-4bcc-a8b8-05970dee31f4',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('eaec2d34-c91b-4bcf-aa89-f14f4667be47','myRealm',_binary '\0','${role_uma_authorization}','uma_authorization','myRealm',NULL,NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('eaf8ad90-a132-43d4-a29b-e54b1c8f77cf','e810ef94-3763-43cb-b70b-f5229124accb',_binary '\0','${role_create-realm}','create-realm','e810ef94-3763-43cb-b70b-f5229124accb',NULL,NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('ecaa4248-4d27-43f4-9554-71c40d8f8087','b1340e05-4d92-478a-b49b-5820af128eca',_binary '','${role_manage-consent}','manage-consent','myRealm','b1340e05-4d92-478a-b49b-5820af128eca',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('eeaf3eb7-af5b-4390-a203-4f611e629fdb','e810ef94-3763-43cb-b70b-f5229124accb',_binary '\0','${role_default-roles}','default-roles-master','e810ef94-3763-43cb-b70b-f5229124accb',NULL,NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('f0805d97-d7c2-498b-8c32-54ddc73a8ac5','f0348189-2c48-4e29-a817-28d4e432703d',_binary '','${role_manage-clients}','manage-clients','myRealm','f0348189-2c48-4e29-a817-28d4e432703d',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('f586ca52-202a-4368-a294-2261ba929693','b1340e05-4d92-478a-b49b-5820af128eca',_binary '','${role_view-applications}','view-applications','myRealm','b1340e05-4d92-478a-b49b-5820af128eca',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('f608f294-8895-4b5f-9680-ac268ffc09fc','f0348189-2c48-4e29-a817-28d4e432703d',_binary '','${role_query-users}','query-users','myRealm','f0348189-2c48-4e29-a817-28d4e432703d',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('f6f4c743-ebf9-419d-97c1-4b387640c42e','b1340e05-4d92-478a-b49b-5820af128eca',_binary '','${role_delete-account}','delete-account','myRealm','b1340e05-4d92-478a-b49b-5820af128eca',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('fa021078-c5f6-4f43-8b12-8b7330d5f2a3','7d76f094-a7b6-4acb-9c54-dbb45857d8de',_binary '','${role_manage-account-links}','manage-account-links','e810ef94-3763-43cb-b70b-f5229124accb','7d76f094-a7b6-4acb-9c54-dbb45857d8de',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('fa7c7b96-b076-405f-b4c5-10a2eb67d7b6','f0348189-2c48-4e29-a817-28d4e432703d',_binary '','${role_query-realms}','query-realms','myRealm','f0348189-2c48-4e29-a817-28d4e432703d',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('fc9adbda-1fa2-4165-80f2-56f496e47c76','7d76f094-a7b6-4acb-9c54-dbb45857d8de',_binary '','${role_manage-account}','manage-account','e810ef94-3763-43cb-b70b-f5229124accb','7d76f094-a7b6-4acb-9c54-dbb45857d8de',NULL);
INSERT INTO `KEYCLOAK_ROLE` VALUES ('fd416d17-8b32-435c-9e81-c9a3f7b98939','9ebdb3bc-347f-4bb9-b642-8cbeb42342bc',_binary '','${role_view-identity-providers}','view-identity-providers','e810ef94-3763-43cb-b70b-f5229124accb','9ebdb3bc-347f-4bb9-b642-8cbeb42342bc',NULL);
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MIGRATION_MODEL`
--

DROP TABLE IF EXISTS `MIGRATION_MODEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MIGRATION_MODEL` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VERSION` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UPDATE_TIME` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IDX_UPDATE_TIME` (`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MIGRATION_MODEL`
--

LOCK TABLES `MIGRATION_MODEL` WRITE;
/*!40000 ALTER TABLE `MIGRATION_MODEL` DISABLE KEYS */;
INSERT INTO `MIGRATION_MODEL` VALUES ('adop9','18.0.0',1678214831);
/*!40000 ALTER TABLE `MIGRATION_MODEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_CLIENT_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OFFLINE_CLIENT_SESSION` (
  `USER_SESSION_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `OFFLINE_FLAG` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `DATA` longtext COLLATE utf8mb4_unicode_ci,
  `CLIENT_STORAGE_PROVIDER` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'local',
  `EXTERNAL_CLIENT_ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'local',
  PRIMARY KEY (`USER_SESSION_ID`,`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`OFFLINE_FLAG`),
  KEY `IDX_US_SESS_ID_ON_CL_SESS` (`USER_SESSION_ID`),
  KEY `IDX_OFFLINE_CSS_PRELOAD` (`CLIENT_ID`,`OFFLINE_FLAG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_CLIENT_SESSION`
--

LOCK TABLES `OFFLINE_CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_USER_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OFFLINE_USER_SESSION` (
  `USER_SESSION_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `USER_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CREATED_ON` int NOT NULL,
  `OFFLINE_FLAG` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DATA` longtext COLLATE utf8mb4_unicode_ci,
  `LAST_SESSION_REFRESH` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`USER_SESSION_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_CREATEDON` (`CREATED_ON`),
  KEY `IDX_OFFLINE_USS_PRELOAD` (`OFFLINE_FLAG`,`CREATED_ON`,`USER_SESSION_ID`),
  KEY `IDX_OFFLINE_USS_BY_USER` (`USER_ID`,`REALM_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_BY_USERSESS` (`REALM_ID`,`OFFLINE_FLAG`,`USER_SESSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_USER_SESSION`
--

LOCK TABLES `OFFLINE_USER_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POLICY_CONFIG`
--

DROP TABLE IF EXISTS `POLICY_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `POLICY_CONFIG` (
  `POLICY_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`POLICY_ID`,`NAME`),
  CONSTRAINT `FKDC34197CF864C4E43` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POLICY_CONFIG`
--

LOCK TABLES `POLICY_CONFIG` WRITE;
/*!40000 ALTER TABLE `POLICY_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `POLICY_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROTOCOL_MAPPER` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PROTOCOL` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PROTOCOL_MAPPER_NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CLIENT_SCOPE_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_PROTOCOL_MAPPER_CLIENT` (`CLIENT_ID`),
  KEY `IDX_CLSCOPE_PROTMAP` (`CLIENT_SCOPE_ID`),
  CONSTRAINT `FK_CLI_SCOPE_MAPPER` FOREIGN KEY (`CLIENT_SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`),
  CONSTRAINT `FK_PCM_REALM` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER`
--

LOCK TABLES `PROTOCOL_MAPPER` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER` VALUES ('01bc7db6-30af-4aa1-9e25-4fb6b20f3ea2','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'fdd0aabb-00d5-49b6-8afe-19c52d3ca168');
INSERT INTO `PROTOCOL_MAPPER` VALUES ('088aca22-eb57-4182-a584-58285d417950','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ccbef8af-20f1-474d-98b5-aa0a30340b70');
INSERT INTO `PROTOCOL_MAPPER` VALUES ('09709b1b-0303-4584-b134-64e3b0a80049','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'52dbc43c-d0bd-461e-bc9f-941f7f551435');
INSERT INTO `PROTOCOL_MAPPER` VALUES ('17f95fce-f5dc-406e-870c-eecb1d69128e','audience resolve','openid-connect','oidc-audience-resolve-mapper','ba72da23-8ec5-4150-8de8-22b7e39be868',NULL);
INSERT INTO `PROTOCOL_MAPPER` VALUES ('21f51e15-ea55-4f8f-a45c-e69d9198c603','full name','openid-connect','oidc-full-name-mapper',NULL,'57b42671-20c2-4579-9cf5-4c3431917edb');
INSERT INTO `PROTOCOL_MAPPER` VALUES ('25e6f3c3-7904-4804-a7f9-a0d5ce5dd8b9','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'5da6968d-da8c-4e80-b281-7b52e81116a4');
INSERT INTO `PROTOCOL_MAPPER` VALUES ('281d2b05-5710-4060-8a3c-6b7ad80e781d','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ccbef8af-20f1-474d-98b5-aa0a30340b70');
INSERT INTO `PROTOCOL_MAPPER` VALUES ('29d7cb59-db90-45ef-a1b3-abb3cff803fe','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ccbef8af-20f1-474d-98b5-aa0a30340b70');
INSERT INTO `PROTOCOL_MAPPER` VALUES ('2fd1e27a-f90a-43eb-ba3f-abbc59e78f71','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'57b42671-20c2-4579-9cf5-4c3431917edb');
INSERT INTO `PROTOCOL_MAPPER` VALUES ('3864a914-beb6-45b2-91ea-d52081e1f9e5','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'ccbef8af-20f1-474d-98b5-aa0a30340b70');
INSERT INTO `PROTOCOL_MAPPER` VALUES ('3dfd0d79-776c-4270-87a0-f15f1315a36f','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ccbef8af-20f1-474d-98b5-aa0a30340b70');
INSERT INTO `PROTOCOL_MAPPER` VALUES ('3e14f439-af69-4b9b-8590-21dc718716ba','address','openid-connect','oidc-address-mapper',NULL,'7d729fa4-5aaf-434c-90f5-d9cd129cad37');
INSERT INTO `PROTOCOL_MAPPER` VALUES ('4398781c-c792-4568-9430-e6805ce8a470','acr loa level','openid-connect','oidc-acr-mapper',NULL,'8a7e233a-0064-427d-b873-1e0eca4e45d2');
INSERT INTO `PROTOCOL_MAPPER` VALUES ('5353fa75-8f05-46d2-9249-a1cde001b849','locale','openid-connect','oidc-usermodel-attribute-mapper','cdf9904a-f867-46de-8f2a-34b701b9ba32',NULL);
INSERT INTO `PROTOCOL_MAPPER` VALUES ('59137676-7529-42cf-b6c1-82f449653bcd','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'57b42671-20c2-4579-9cf5-4c3431917edb');
INSERT INTO `PROTOCOL_MAPPER` VALUES ('5b0db8cd-2c41-445a-926e-bac819c1a558','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ccbef8af-20f1-474d-98b5-aa0a30340b70');
INSERT INTO `PROTOCOL_MAPPER` VALUES ('6bd0c504-53d5-4611-ac26-a036557a3dae','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'e1828105-24e0-4627-9827-0734c1296f99');
INSERT INTO `PROTOCOL_MAPPER` VALUES ('70116fbb-1599-4a23-be66-0bfe66d76c58','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'57b42671-20c2-4579-9cf5-4c3431917edb');
INSERT INTO `PROTOCOL_MAPPER` VALUES ('712901ba-dfc9-46d2-8265-09475bfba249','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ccbef8af-20f1-474d-98b5-aa0a30340b70');
INSERT INTO `PROTOCOL_MAPPER` VALUES ('725234cb-8aff-422a-b6ef-4f880fa52a5a','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ccbef8af-20f1-474d-98b5-aa0a30340b70');
INSERT INTO `PROTOCOL_MAPPER` VALUES ('754e198e-c3cb-48ef-88d3-2a12aa59926e','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'57b42671-20c2-4579-9cf5-4c3431917edb');
INSERT INTO `PROTOCOL_MAPPER` VALUES ('7667d404-db42-415d-992b-e08195713f47','role list','saml','saml-role-list-mapper',NULL,'92de7d0c-41b5-46fe-99bb-1f137fca7778');
INSERT INTO `PROTOCOL_MAPPER` VALUES ('768ec4d8-d695-4abe-b56c-e1456cabfef8','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'57b42671-20c2-4579-9cf5-4c3431917edb');
INSERT INTO `PROTOCOL_MAPPER` VALUES ('7731d5bc-efb2-4d66-992b-1a64a3d42b6d','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'58622285-f578-46f3-bbd0-2793b89ec84a');
INSERT INTO `PROTOCOL_MAPPER` VALUES ('7b3df31d-effb-498d-8dc3-75e09745992c','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'179593fa-2506-499a-944e-77ffe4b6fdd1');
INSERT INTO `PROTOCOL_MAPPER` VALUES ('7b7ac01d-cb1b-4e88-b42d-cc68c4a37464','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'179593fa-2506-499a-944e-77ffe4b6fdd1');
INSERT INTO `PROTOCOL_MAPPER` VALUES ('7bd7e0fe-1b56-417e-b96e-85e31e044f02','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'2b958474-6d3d-44f0-838f-e353223692f5');
INSERT INTO `PROTOCOL_MAPPER` VALUES ('7c836f9a-f7d3-4dca-a530-7b9bc26b3469','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'57b42671-20c2-4579-9cf5-4c3431917edb');
INSERT INTO `PROTOCOL_MAPPER` VALUES ('7d6fa468-3431-4596-88bd-53be996cea6e','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ccbef8af-20f1-474d-98b5-aa0a30340b70');
INSERT INTO `PROTOCOL_MAPPER` VALUES ('7fe623b9-861f-4418-808d-aeea11a54bb2','address','openid-connect','oidc-address-mapper',NULL,'56804cff-2c5f-4c70-8822-dc9a87c9f997');
INSERT INTO `PROTOCOL_MAPPER` VALUES ('88a9c72f-4b94-4c98-a5b5-58aaa3d462cd','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'57b42671-20c2-4579-9cf5-4c3431917edb');
INSERT INTO `PROTOCOL_MAPPER` VALUES ('8a43aad4-e170-4f1e-8ed1-d8bcc6fcb2d2','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'0a0b84ad-2758-407c-8acc-49fb64d4578e');
INSERT INTO `PROTOCOL_MAPPER` VALUES ('8ba99c62-c2bb-4040-b3f9-057459ef2b15','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'57b42671-20c2-4579-9cf5-4c3431917edb');
INSERT INTO `PROTOCOL_MAPPER` VALUES ('8de32a5d-65fb-4b16-bc27-55dfe0656193','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'e1828105-24e0-4627-9827-0734c1296f99');
INSERT INTO `PROTOCOL_MAPPER` VALUES ('8e1e31c0-9975-43a3-9f1a-f69948167ec3','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'58622285-f578-46f3-bbd0-2793b89ec84a');
INSERT INTO `PROTOCOL_MAPPER` VALUES ('910ab85f-8e3b-4247-88f1-6ba5040824e0','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'fdd0aabb-00d5-49b6-8afe-19c52d3ca168');
INSERT INTO `PROTOCOL_MAPPER` VALUES ('972e597e-dda1-49ae-9f43-a69991f5146e','role list','saml','saml-role-list-mapper',NULL,'45c4948d-82c7-49c5-ad37-9b290995a96d');
INSERT INTO `PROTOCOL_MAPPER` VALUES ('9839e4f6-bc76-4533-9447-f061678972a4','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'57b42671-20c2-4579-9cf5-4c3431917edb');
INSERT INTO `PROTOCOL_MAPPER` VALUES ('9876f095-3288-4978-a509-287a3c16f3bd','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ccbef8af-20f1-474d-98b5-aa0a30340b70');
INSERT INTO `PROTOCOL_MAPPER` VALUES ('9d96c6ad-2491-455d-9e37-0f1de15461a4','email','openid-connect','oidc-usermodel-property-mapper',NULL,'0a0b84ad-2758-407c-8acc-49fb64d4578e');
INSERT INTO `PROTOCOL_MAPPER` VALUES ('9e985a51-034a-409c-9dc2-728947ece561','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'58622285-f578-46f3-bbd0-2793b89ec84a');
INSERT INTO `PROTOCOL_MAPPER` VALUES ('a95dd8b2-783c-4986-ade1-ab778f192ce6','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'bc2f9339-ed10-4060-b0ce-cf30d11fcc53');
INSERT INTO `PROTOCOL_MAPPER` VALUES ('aa18b5a3-e6b1-4b49-934c-bb4a1620dfd8','full name','openid-connect','oidc-full-name-mapper',NULL,'ccbef8af-20f1-474d-98b5-aa0a30340b70');
INSERT INTO `PROTOCOL_MAPPER` VALUES ('b1d8ed3c-23b7-48a0-ab24-9427d2b525fb','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'57b42671-20c2-4579-9cf5-4c3431917edb');
INSERT INTO `PROTOCOL_MAPPER` VALUES ('b478a27e-4355-413f-bc23-53beef9428f0','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'57b42671-20c2-4579-9cf5-4c3431917edb');
INSERT INTO `PROTOCOL_MAPPER` VALUES ('b6f05249-79d3-4051-adf2-63a30da81c9f','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ccbef8af-20f1-474d-98b5-aa0a30340b70');
INSERT INTO `PROTOCOL_MAPPER` VALUES ('bee101d1-fee8-47df-b8ab-734533d31d25','email','openid-connect','oidc-usermodel-property-mapper',NULL,'bc2f9339-ed10-4060-b0ce-cf30d11fcc53');
INSERT INTO `PROTOCOL_MAPPER` VALUES ('ce4b3b59-9171-4660-a026-8356ab528eba','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'ccbef8af-20f1-474d-98b5-aa0a30340b70');
INSERT INTO `PROTOCOL_MAPPER` VALUES ('ceff5d21-ba17-47d0-8c2c-df5aa8bb8ba7','locale','openid-connect','oidc-usermodel-attribute-mapper','65276c8e-b3a5-4376-a32a-af9612b26fe7',NULL);
INSERT INTO `PROTOCOL_MAPPER` VALUES ('d2216960-f2d0-4bf3-ac9b-14c1e7b21528','acr loa level','openid-connect','oidc-acr-mapper',NULL,'4fa058aa-5d90-41f3-816d-3b97b15cee0f');
INSERT INTO `PROTOCOL_MAPPER` VALUES ('d5c95de2-58ad-4fcf-89da-5e2a4d918236','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'179593fa-2506-499a-944e-77ffe4b6fdd1');
INSERT INTO `PROTOCOL_MAPPER` VALUES ('d82f5d6c-5864-4a4d-9f85-ddbc4d1e9ea9','username','openid-connect','oidc-usermodel-property-mapper',NULL,'ccbef8af-20f1-474d-98b5-aa0a30340b70');
INSERT INTO `PROTOCOL_MAPPER` VALUES ('dde21a71-ba35-496f-a303-705aead3abcd','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'2b958474-6d3d-44f0-838f-e353223692f5');
INSERT INTO `PROTOCOL_MAPPER` VALUES ('def07d71-7312-4ab2-af62-446fb7469547','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'52dbc43c-d0bd-461e-bc9f-941f7f551435');
INSERT INTO `PROTOCOL_MAPPER` VALUES ('ed33221a-2b70-47fb-997b-ffff118469e2','audience resolve','openid-connect','oidc-audience-resolve-mapper','bad387fc-627c-4369-ab9a-fdb5f7ce588c',NULL);
INSERT INTO `PROTOCOL_MAPPER` VALUES ('f48b8823-047d-4e33-93a7-d4010e6ad497','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'0b8672d9-a343-409a-8d03-2fc8f8b314aa');
INSERT INTO `PROTOCOL_MAPPER` VALUES ('fc8eada2-afc9-4324-b469-60728c85f53a','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'57b42671-20c2-4579-9cf5-4c3431917edb');
INSERT INTO `PROTOCOL_MAPPER` VALUES ('fdc29e63-1d90-49fd-a5b2-4944cce4739c','username','openid-connect','oidc-usermodel-property-mapper',NULL,'57b42671-20c2-4579-9cf5-4c3431917edb');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROTOCOL_MAPPER_CONFIG` (
  `PROTOCOL_MAPPER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` longtext COLLATE utf8mb4_unicode_ci,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`PROTOCOL_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_PMCONFIG` FOREIGN KEY (`PROTOCOL_MAPPER_ID`) REFERENCES `PROTOCOL_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER_CONFIG`
--

LOCK TABLES `PROTOCOL_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('01bc7db6-30af-4aa1-9e25-4fb6b20f3ea2','true','access.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('01bc7db6-30af-4aa1-9e25-4fb6b20f3ea2','groups','claim.name');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('01bc7db6-30af-4aa1-9e25-4fb6b20f3ea2','true','id.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('01bc7db6-30af-4aa1-9e25-4fb6b20f3ea2','String','jsonType.label');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('01bc7db6-30af-4aa1-9e25-4fb6b20f3ea2','true','multivalued');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('01bc7db6-30af-4aa1-9e25-4fb6b20f3ea2','foo','user.attribute');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('088aca22-eb57-4182-a584-58285d417950','true','access.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('088aca22-eb57-4182-a584-58285d417950','zoneinfo','claim.name');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('088aca22-eb57-4182-a584-58285d417950','true','id.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('088aca22-eb57-4182-a584-58285d417950','String','jsonType.label');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('088aca22-eb57-4182-a584-58285d417950','zoneinfo','user.attribute');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('088aca22-eb57-4182-a584-58285d417950','true','userinfo.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('09709b1b-0303-4584-b134-64e3b0a80049','true','access.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('09709b1b-0303-4584-b134-64e3b0a80049','phone_number','claim.name');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('09709b1b-0303-4584-b134-64e3b0a80049','true','id.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('09709b1b-0303-4584-b134-64e3b0a80049','String','jsonType.label');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('09709b1b-0303-4584-b134-64e3b0a80049','phoneNumber','user.attribute');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('09709b1b-0303-4584-b134-64e3b0a80049','true','userinfo.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('21f51e15-ea55-4f8f-a45c-e69d9198c603','true','access.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('21f51e15-ea55-4f8f-a45c-e69d9198c603','true','id.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('21f51e15-ea55-4f8f-a45c-e69d9198c603','true','userinfo.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('281d2b05-5710-4060-8a3c-6b7ad80e781d','true','access.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('281d2b05-5710-4060-8a3c-6b7ad80e781d','middle_name','claim.name');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('281d2b05-5710-4060-8a3c-6b7ad80e781d','true','id.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('281d2b05-5710-4060-8a3c-6b7ad80e781d','String','jsonType.label');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('281d2b05-5710-4060-8a3c-6b7ad80e781d','middleName','user.attribute');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('281d2b05-5710-4060-8a3c-6b7ad80e781d','true','userinfo.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('29d7cb59-db90-45ef-a1b3-abb3cff803fe','true','access.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('29d7cb59-db90-45ef-a1b3-abb3cff803fe','locale','claim.name');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('29d7cb59-db90-45ef-a1b3-abb3cff803fe','true','id.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('29d7cb59-db90-45ef-a1b3-abb3cff803fe','String','jsonType.label');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('29d7cb59-db90-45ef-a1b3-abb3cff803fe','locale','user.attribute');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('29d7cb59-db90-45ef-a1b3-abb3cff803fe','true','userinfo.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('2fd1e27a-f90a-43eb-ba3f-abbc59e78f71','true','access.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('2fd1e27a-f90a-43eb-ba3f-abbc59e78f71','birthdate','claim.name');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('2fd1e27a-f90a-43eb-ba3f-abbc59e78f71','true','id.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('2fd1e27a-f90a-43eb-ba3f-abbc59e78f71','String','jsonType.label');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('2fd1e27a-f90a-43eb-ba3f-abbc59e78f71','birthdate','user.attribute');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('2fd1e27a-f90a-43eb-ba3f-abbc59e78f71','true','userinfo.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('3864a914-beb6-45b2-91ea-d52081e1f9e5','true','access.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('3864a914-beb6-45b2-91ea-d52081e1f9e5','given_name','claim.name');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('3864a914-beb6-45b2-91ea-d52081e1f9e5','true','id.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('3864a914-beb6-45b2-91ea-d52081e1f9e5','String','jsonType.label');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('3864a914-beb6-45b2-91ea-d52081e1f9e5','firstName','user.attribute');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('3864a914-beb6-45b2-91ea-d52081e1f9e5','true','userinfo.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('3dfd0d79-776c-4270-87a0-f15f1315a36f','true','access.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('3dfd0d79-776c-4270-87a0-f15f1315a36f','birthdate','claim.name');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('3dfd0d79-776c-4270-87a0-f15f1315a36f','true','id.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('3dfd0d79-776c-4270-87a0-f15f1315a36f','String','jsonType.label');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('3dfd0d79-776c-4270-87a0-f15f1315a36f','birthdate','user.attribute');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('3dfd0d79-776c-4270-87a0-f15f1315a36f','true','userinfo.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('3e14f439-af69-4b9b-8590-21dc718716ba','true','access.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('3e14f439-af69-4b9b-8590-21dc718716ba','true','id.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('3e14f439-af69-4b9b-8590-21dc718716ba','country','user.attribute.country');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('3e14f439-af69-4b9b-8590-21dc718716ba','formatted','user.attribute.formatted');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('3e14f439-af69-4b9b-8590-21dc718716ba','locality','user.attribute.locality');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('3e14f439-af69-4b9b-8590-21dc718716ba','postal_code','user.attribute.postal_code');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('3e14f439-af69-4b9b-8590-21dc718716ba','region','user.attribute.region');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('3e14f439-af69-4b9b-8590-21dc718716ba','street','user.attribute.street');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('3e14f439-af69-4b9b-8590-21dc718716ba','true','userinfo.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('4398781c-c792-4568-9430-e6805ce8a470','true','access.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('4398781c-c792-4568-9430-e6805ce8a470','true','id.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('5353fa75-8f05-46d2-9249-a1cde001b849','true','access.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('5353fa75-8f05-46d2-9249-a1cde001b849','locale','claim.name');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('5353fa75-8f05-46d2-9249-a1cde001b849','true','id.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('5353fa75-8f05-46d2-9249-a1cde001b849','String','jsonType.label');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('5353fa75-8f05-46d2-9249-a1cde001b849','locale','user.attribute');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('5353fa75-8f05-46d2-9249-a1cde001b849','true','userinfo.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('59137676-7529-42cf-b6c1-82f449653bcd','true','access.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('59137676-7529-42cf-b6c1-82f449653bcd','updated_at','claim.name');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('59137676-7529-42cf-b6c1-82f449653bcd','true','id.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('59137676-7529-42cf-b6c1-82f449653bcd','long','jsonType.label');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('59137676-7529-42cf-b6c1-82f449653bcd','updatedAt','user.attribute');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('59137676-7529-42cf-b6c1-82f449653bcd','true','userinfo.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('5b0db8cd-2c41-445a-926e-bac819c1a558','true','access.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('5b0db8cd-2c41-445a-926e-bac819c1a558','gender','claim.name');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('5b0db8cd-2c41-445a-926e-bac819c1a558','true','id.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('5b0db8cd-2c41-445a-926e-bac819c1a558','String','jsonType.label');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('5b0db8cd-2c41-445a-926e-bac819c1a558','gender','user.attribute');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('5b0db8cd-2c41-445a-926e-bac819c1a558','true','userinfo.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('6bd0c504-53d5-4611-ac26-a036557a3dae','true','access.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('6bd0c504-53d5-4611-ac26-a036557a3dae','phone_number_verified','claim.name');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('6bd0c504-53d5-4611-ac26-a036557a3dae','true','id.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('6bd0c504-53d5-4611-ac26-a036557a3dae','boolean','jsonType.label');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('6bd0c504-53d5-4611-ac26-a036557a3dae','phoneNumberVerified','user.attribute');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('6bd0c504-53d5-4611-ac26-a036557a3dae','true','userinfo.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('70116fbb-1599-4a23-be66-0bfe66d76c58','true','access.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('70116fbb-1599-4a23-be66-0bfe66d76c58','locale','claim.name');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('70116fbb-1599-4a23-be66-0bfe66d76c58','true','id.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('70116fbb-1599-4a23-be66-0bfe66d76c58','String','jsonType.label');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('70116fbb-1599-4a23-be66-0bfe66d76c58','locale','user.attribute');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('70116fbb-1599-4a23-be66-0bfe66d76c58','true','userinfo.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('712901ba-dfc9-46d2-8265-09475bfba249','true','access.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('712901ba-dfc9-46d2-8265-09475bfba249','website','claim.name');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('712901ba-dfc9-46d2-8265-09475bfba249','true','id.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('712901ba-dfc9-46d2-8265-09475bfba249','String','jsonType.label');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('712901ba-dfc9-46d2-8265-09475bfba249','website','user.attribute');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('712901ba-dfc9-46d2-8265-09475bfba249','true','userinfo.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('725234cb-8aff-422a-b6ef-4f880fa52a5a','true','access.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('725234cb-8aff-422a-b6ef-4f880fa52a5a','updated_at','claim.name');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('725234cb-8aff-422a-b6ef-4f880fa52a5a','true','id.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('725234cb-8aff-422a-b6ef-4f880fa52a5a','long','jsonType.label');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('725234cb-8aff-422a-b6ef-4f880fa52a5a','updatedAt','user.attribute');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('725234cb-8aff-422a-b6ef-4f880fa52a5a','true','userinfo.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('754e198e-c3cb-48ef-88d3-2a12aa59926e','true','access.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('754e198e-c3cb-48ef-88d3-2a12aa59926e','gender','claim.name');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('754e198e-c3cb-48ef-88d3-2a12aa59926e','true','id.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('754e198e-c3cb-48ef-88d3-2a12aa59926e','String','jsonType.label');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('754e198e-c3cb-48ef-88d3-2a12aa59926e','gender','user.attribute');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('754e198e-c3cb-48ef-88d3-2a12aa59926e','true','userinfo.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('7667d404-db42-415d-992b-e08195713f47','Role','attribute.name');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('7667d404-db42-415d-992b-e08195713f47','Basic','attribute.nameformat');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('7667d404-db42-415d-992b-e08195713f47','false','single');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('768ec4d8-d695-4abe-b56c-e1456cabfef8','true','access.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('768ec4d8-d695-4abe-b56c-e1456cabfef8','middle_name','claim.name');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('768ec4d8-d695-4abe-b56c-e1456cabfef8','true','id.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('768ec4d8-d695-4abe-b56c-e1456cabfef8','String','jsonType.label');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('768ec4d8-d695-4abe-b56c-e1456cabfef8','middleName','user.attribute');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('768ec4d8-d695-4abe-b56c-e1456cabfef8','true','userinfo.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('7731d5bc-efb2-4d66-992b-1a64a3d42b6d','true','access.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('7731d5bc-efb2-4d66-992b-1a64a3d42b6d','resource_access.${client_id}.roles','claim.name');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('7731d5bc-efb2-4d66-992b-1a64a3d42b6d','String','jsonType.label');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('7731d5bc-efb2-4d66-992b-1a64a3d42b6d','true','multivalued');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('7731d5bc-efb2-4d66-992b-1a64a3d42b6d','foo','user.attribute');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('7b7ac01d-cb1b-4e88-b42d-cc68c4a37464','true','access.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('7b7ac01d-cb1b-4e88-b42d-cc68c4a37464','resource_access.${client_id}.roles','claim.name');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('7b7ac01d-cb1b-4e88-b42d-cc68c4a37464','String','jsonType.label');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('7b7ac01d-cb1b-4e88-b42d-cc68c4a37464','true','multivalued');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('7b7ac01d-cb1b-4e88-b42d-cc68c4a37464','foo','user.attribute');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('7bd7e0fe-1b56-417e-b96e-85e31e044f02','true','access.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('7bd7e0fe-1b56-417e-b96e-85e31e044f02','upn','claim.name');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('7bd7e0fe-1b56-417e-b96e-85e31e044f02','true','id.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('7bd7e0fe-1b56-417e-b96e-85e31e044f02','String','jsonType.label');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('7bd7e0fe-1b56-417e-b96e-85e31e044f02','username','user.attribute');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('7bd7e0fe-1b56-417e-b96e-85e31e044f02','true','userinfo.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('7c836f9a-f7d3-4dca-a530-7b9bc26b3469','true','access.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('7c836f9a-f7d3-4dca-a530-7b9bc26b3469','nickname','claim.name');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('7c836f9a-f7d3-4dca-a530-7b9bc26b3469','true','id.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('7c836f9a-f7d3-4dca-a530-7b9bc26b3469','String','jsonType.label');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('7c836f9a-f7d3-4dca-a530-7b9bc26b3469','nickname','user.attribute');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('7c836f9a-f7d3-4dca-a530-7b9bc26b3469','true','userinfo.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('7d6fa468-3431-4596-88bd-53be996cea6e','true','access.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('7d6fa468-3431-4596-88bd-53be996cea6e','picture','claim.name');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('7d6fa468-3431-4596-88bd-53be996cea6e','true','id.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('7d6fa468-3431-4596-88bd-53be996cea6e','String','jsonType.label');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('7d6fa468-3431-4596-88bd-53be996cea6e','picture','user.attribute');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('7d6fa468-3431-4596-88bd-53be996cea6e','true','userinfo.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('7fe623b9-861f-4418-808d-aeea11a54bb2','true','access.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('7fe623b9-861f-4418-808d-aeea11a54bb2','true','id.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('7fe623b9-861f-4418-808d-aeea11a54bb2','country','user.attribute.country');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('7fe623b9-861f-4418-808d-aeea11a54bb2','formatted','user.attribute.formatted');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('7fe623b9-861f-4418-808d-aeea11a54bb2','locality','user.attribute.locality');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('7fe623b9-861f-4418-808d-aeea11a54bb2','postal_code','user.attribute.postal_code');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('7fe623b9-861f-4418-808d-aeea11a54bb2','region','user.attribute.region');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('7fe623b9-861f-4418-808d-aeea11a54bb2','street','user.attribute.street');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('7fe623b9-861f-4418-808d-aeea11a54bb2','true','userinfo.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('88a9c72f-4b94-4c98-a5b5-58aaa3d462cd','true','access.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('88a9c72f-4b94-4c98-a5b5-58aaa3d462cd','website','claim.name');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('88a9c72f-4b94-4c98-a5b5-58aaa3d462cd','true','id.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('88a9c72f-4b94-4c98-a5b5-58aaa3d462cd','String','jsonType.label');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('88a9c72f-4b94-4c98-a5b5-58aaa3d462cd','website','user.attribute');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('88a9c72f-4b94-4c98-a5b5-58aaa3d462cd','true','userinfo.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('8a43aad4-e170-4f1e-8ed1-d8bcc6fcb2d2','true','access.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('8a43aad4-e170-4f1e-8ed1-d8bcc6fcb2d2','email_verified','claim.name');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('8a43aad4-e170-4f1e-8ed1-d8bcc6fcb2d2','true','id.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('8a43aad4-e170-4f1e-8ed1-d8bcc6fcb2d2','boolean','jsonType.label');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('8a43aad4-e170-4f1e-8ed1-d8bcc6fcb2d2','emailVerified','user.attribute');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('8a43aad4-e170-4f1e-8ed1-d8bcc6fcb2d2','true','userinfo.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('8ba99c62-c2bb-4040-b3f9-057459ef2b15','true','access.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('8ba99c62-c2bb-4040-b3f9-057459ef2b15','picture','claim.name');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('8ba99c62-c2bb-4040-b3f9-057459ef2b15','true','id.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('8ba99c62-c2bb-4040-b3f9-057459ef2b15','String','jsonType.label');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('8ba99c62-c2bb-4040-b3f9-057459ef2b15','picture','user.attribute');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('8ba99c62-c2bb-4040-b3f9-057459ef2b15','true','userinfo.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('8de32a5d-65fb-4b16-bc27-55dfe0656193','true','access.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('8de32a5d-65fb-4b16-bc27-55dfe0656193','phone_number','claim.name');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('8de32a5d-65fb-4b16-bc27-55dfe0656193','true','id.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('8de32a5d-65fb-4b16-bc27-55dfe0656193','String','jsonType.label');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('8de32a5d-65fb-4b16-bc27-55dfe0656193','phoneNumber','user.attribute');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('8de32a5d-65fb-4b16-bc27-55dfe0656193','true','userinfo.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('910ab85f-8e3b-4247-88f1-6ba5040824e0','true','access.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('910ab85f-8e3b-4247-88f1-6ba5040824e0','upn','claim.name');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('910ab85f-8e3b-4247-88f1-6ba5040824e0','true','id.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('910ab85f-8e3b-4247-88f1-6ba5040824e0','String','jsonType.label');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('910ab85f-8e3b-4247-88f1-6ba5040824e0','username','user.attribute');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('910ab85f-8e3b-4247-88f1-6ba5040824e0','true','userinfo.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('972e597e-dda1-49ae-9f43-a69991f5146e','Role','attribute.name');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('972e597e-dda1-49ae-9f43-a69991f5146e','Basic','attribute.nameformat');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('972e597e-dda1-49ae-9f43-a69991f5146e','false','single');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('9839e4f6-bc76-4533-9447-f061678972a4','true','access.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('9839e4f6-bc76-4533-9447-f061678972a4','profile','claim.name');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('9839e4f6-bc76-4533-9447-f061678972a4','true','id.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('9839e4f6-bc76-4533-9447-f061678972a4','String','jsonType.label');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('9839e4f6-bc76-4533-9447-f061678972a4','profile','user.attribute');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('9839e4f6-bc76-4533-9447-f061678972a4','true','userinfo.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('9876f095-3288-4978-a509-287a3c16f3bd','true','access.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('9876f095-3288-4978-a509-287a3c16f3bd','profile','claim.name');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('9876f095-3288-4978-a509-287a3c16f3bd','true','id.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('9876f095-3288-4978-a509-287a3c16f3bd','String','jsonType.label');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('9876f095-3288-4978-a509-287a3c16f3bd','profile','user.attribute');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('9876f095-3288-4978-a509-287a3c16f3bd','true','userinfo.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('9d96c6ad-2491-455d-9e37-0f1de15461a4','true','access.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('9d96c6ad-2491-455d-9e37-0f1de15461a4','email','claim.name');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('9d96c6ad-2491-455d-9e37-0f1de15461a4','true','id.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('9d96c6ad-2491-455d-9e37-0f1de15461a4','String','jsonType.label');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('9d96c6ad-2491-455d-9e37-0f1de15461a4','email','user.attribute');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('9d96c6ad-2491-455d-9e37-0f1de15461a4','true','userinfo.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('9e985a51-034a-409c-9dc2-728947ece561','true','access.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('9e985a51-034a-409c-9dc2-728947ece561','realm_access.roles','claim.name');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('9e985a51-034a-409c-9dc2-728947ece561','String','jsonType.label');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('9e985a51-034a-409c-9dc2-728947ece561','true','multivalued');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('9e985a51-034a-409c-9dc2-728947ece561','foo','user.attribute');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('a95dd8b2-783c-4986-ade1-ab778f192ce6','true','access.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('a95dd8b2-783c-4986-ade1-ab778f192ce6','email_verified','claim.name');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('a95dd8b2-783c-4986-ade1-ab778f192ce6','true','id.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('a95dd8b2-783c-4986-ade1-ab778f192ce6','boolean','jsonType.label');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('a95dd8b2-783c-4986-ade1-ab778f192ce6','emailVerified','user.attribute');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('a95dd8b2-783c-4986-ade1-ab778f192ce6','true','userinfo.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('aa18b5a3-e6b1-4b49-934c-bb4a1620dfd8','true','access.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('aa18b5a3-e6b1-4b49-934c-bb4a1620dfd8','true','id.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('aa18b5a3-e6b1-4b49-934c-bb4a1620dfd8','true','userinfo.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('b1d8ed3c-23b7-48a0-ab24-9427d2b525fb','true','access.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('b1d8ed3c-23b7-48a0-ab24-9427d2b525fb','family_name','claim.name');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('b1d8ed3c-23b7-48a0-ab24-9427d2b525fb','true','id.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('b1d8ed3c-23b7-48a0-ab24-9427d2b525fb','String','jsonType.label');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('b1d8ed3c-23b7-48a0-ab24-9427d2b525fb','lastName','user.attribute');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('b1d8ed3c-23b7-48a0-ab24-9427d2b525fb','true','userinfo.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('b478a27e-4355-413f-bc23-53beef9428f0','true','access.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('b478a27e-4355-413f-bc23-53beef9428f0','given_name','claim.name');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('b478a27e-4355-413f-bc23-53beef9428f0','true','id.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('b478a27e-4355-413f-bc23-53beef9428f0','String','jsonType.label');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('b478a27e-4355-413f-bc23-53beef9428f0','firstName','user.attribute');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('b478a27e-4355-413f-bc23-53beef9428f0','true','userinfo.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('b6f05249-79d3-4051-adf2-63a30da81c9f','true','access.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('b6f05249-79d3-4051-adf2-63a30da81c9f','nickname','claim.name');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('b6f05249-79d3-4051-adf2-63a30da81c9f','true','id.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('b6f05249-79d3-4051-adf2-63a30da81c9f','String','jsonType.label');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('b6f05249-79d3-4051-adf2-63a30da81c9f','nickname','user.attribute');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('b6f05249-79d3-4051-adf2-63a30da81c9f','true','userinfo.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('bee101d1-fee8-47df-b8ab-734533d31d25','true','access.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('bee101d1-fee8-47df-b8ab-734533d31d25','email','claim.name');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('bee101d1-fee8-47df-b8ab-734533d31d25','true','id.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('bee101d1-fee8-47df-b8ab-734533d31d25','String','jsonType.label');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('bee101d1-fee8-47df-b8ab-734533d31d25','email','user.attribute');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('bee101d1-fee8-47df-b8ab-734533d31d25','true','userinfo.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('ce4b3b59-9171-4660-a026-8356ab528eba','true','access.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('ce4b3b59-9171-4660-a026-8356ab528eba','family_name','claim.name');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('ce4b3b59-9171-4660-a026-8356ab528eba','true','id.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('ce4b3b59-9171-4660-a026-8356ab528eba','String','jsonType.label');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('ce4b3b59-9171-4660-a026-8356ab528eba','lastName','user.attribute');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('ce4b3b59-9171-4660-a026-8356ab528eba','true','userinfo.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('ceff5d21-ba17-47d0-8c2c-df5aa8bb8ba7','true','access.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('ceff5d21-ba17-47d0-8c2c-df5aa8bb8ba7','locale','claim.name');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('ceff5d21-ba17-47d0-8c2c-df5aa8bb8ba7','true','id.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('ceff5d21-ba17-47d0-8c2c-df5aa8bb8ba7','String','jsonType.label');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('ceff5d21-ba17-47d0-8c2c-df5aa8bb8ba7','locale','user.attribute');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('ceff5d21-ba17-47d0-8c2c-df5aa8bb8ba7','true','userinfo.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('d2216960-f2d0-4bf3-ac9b-14c1e7b21528','true','access.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('d2216960-f2d0-4bf3-ac9b-14c1e7b21528','true','id.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('d5c95de2-58ad-4fcf-89da-5e2a4d918236','true','access.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('d5c95de2-58ad-4fcf-89da-5e2a4d918236','realm_access.roles','claim.name');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('d5c95de2-58ad-4fcf-89da-5e2a4d918236','String','jsonType.label');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('d5c95de2-58ad-4fcf-89da-5e2a4d918236','true','multivalued');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('d5c95de2-58ad-4fcf-89da-5e2a4d918236','foo','user.attribute');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('d82f5d6c-5864-4a4d-9f85-ddbc4d1e9ea9','true','access.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('d82f5d6c-5864-4a4d-9f85-ddbc4d1e9ea9','preferred_username','claim.name');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('d82f5d6c-5864-4a4d-9f85-ddbc4d1e9ea9','true','id.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('d82f5d6c-5864-4a4d-9f85-ddbc4d1e9ea9','String','jsonType.label');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('d82f5d6c-5864-4a4d-9f85-ddbc4d1e9ea9','username','user.attribute');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('d82f5d6c-5864-4a4d-9f85-ddbc4d1e9ea9','true','userinfo.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('dde21a71-ba35-496f-a303-705aead3abcd','true','access.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('dde21a71-ba35-496f-a303-705aead3abcd','groups','claim.name');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('dde21a71-ba35-496f-a303-705aead3abcd','true','id.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('dde21a71-ba35-496f-a303-705aead3abcd','String','jsonType.label');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('dde21a71-ba35-496f-a303-705aead3abcd','true','multivalued');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('dde21a71-ba35-496f-a303-705aead3abcd','foo','user.attribute');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('def07d71-7312-4ab2-af62-446fb7469547','true','access.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('def07d71-7312-4ab2-af62-446fb7469547','phone_number_verified','claim.name');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('def07d71-7312-4ab2-af62-446fb7469547','true','id.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('def07d71-7312-4ab2-af62-446fb7469547','boolean','jsonType.label');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('def07d71-7312-4ab2-af62-446fb7469547','phoneNumberVerified','user.attribute');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('def07d71-7312-4ab2-af62-446fb7469547','true','userinfo.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('fc8eada2-afc9-4324-b469-60728c85f53a','true','access.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('fc8eada2-afc9-4324-b469-60728c85f53a','zoneinfo','claim.name');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('fc8eada2-afc9-4324-b469-60728c85f53a','true','id.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('fc8eada2-afc9-4324-b469-60728c85f53a','String','jsonType.label');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('fc8eada2-afc9-4324-b469-60728c85f53a','zoneinfo','user.attribute');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('fc8eada2-afc9-4324-b469-60728c85f53a','true','userinfo.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('fdc29e63-1d90-49fd-a5b2-4944cce4739c','true','access.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('fdc29e63-1d90-49fd-a5b2-4944cce4739c','preferred_username','claim.name');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('fdc29e63-1d90-49fd-a5b2-4944cce4739c','true','id.token.claim');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('fdc29e63-1d90-49fd-a5b2-4944cce4739c','String','jsonType.label');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('fdc29e63-1d90-49fd-a5b2-4944cce4739c','username','user.attribute');
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('fdc29e63-1d90-49fd-a5b2-4944cce4739c','true','userinfo.token.claim');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM`
--

DROP TABLE IF EXISTS `REALM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ACCESS_CODE_LIFESPAN` int DEFAULT NULL,
  `USER_ACTION_LIFESPAN` int DEFAULT NULL,
  `ACCESS_TOKEN_LIFESPAN` int DEFAULT NULL,
  `ACCOUNT_THEME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ADMIN_THEME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EMAIL_THEME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_EXPIRATION` bigint DEFAULT NULL,
  `LOGIN_THEME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NOT_BEFORE` int DEFAULT NULL,
  `PASSWORD_POLICY` text COLLATE utf8mb4_unicode_ci,
  `REGISTRATION_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `RESET_PASSWORD_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `SOCIAL` bit(1) NOT NULL DEFAULT b'0',
  `SSL_REQUIRED` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SSO_IDLE_TIMEOUT` int DEFAULT NULL,
  `SSO_MAX_LIFESPAN` int DEFAULT NULL,
  `UPDATE_PROFILE_ON_SOC_LOGIN` bit(1) NOT NULL DEFAULT b'0',
  `VERIFY_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `MASTER_ADMIN_CLIENT` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LOGIN_LIFESPAN` int DEFAULT NULL,
  `INTERNATIONALIZATION_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_LOCALE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REG_EMAIL_AS_USERNAME` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_DETAILS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EDIT_USERNAME_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `OTP_POLICY_COUNTER` int DEFAULT '0',
  `OTP_POLICY_WINDOW` int DEFAULT '1',
  `OTP_POLICY_PERIOD` int DEFAULT '30',
  `OTP_POLICY_DIGITS` int DEFAULT '6',
  `OTP_POLICY_ALG` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT 'HmacSHA1',
  `OTP_POLICY_TYPE` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT 'totp',
  `BROWSER_FLOW` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REGISTRATION_FLOW` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DIRECT_GRANT_FLOW` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESET_CREDENTIALS_FLOW` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CLIENT_AUTH_FLOW` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OFFLINE_SESSION_IDLE_TIMEOUT` int DEFAULT '0',
  `REVOKE_REFRESH_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `ACCESS_TOKEN_LIFE_IMPLICIT` int DEFAULT '0',
  `LOGIN_WITH_EMAIL_ALLOWED` bit(1) NOT NULL DEFAULT b'1',
  `DUPLICATE_EMAILS_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `DOCKER_AUTH_FLOW` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REFRESH_TOKEN_MAX_REUSE` int DEFAULT '0',
  `ALLOW_USER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `SSO_MAX_LIFESPAN_REMEMBER_ME` int NOT NULL,
  `SSO_IDLE_TIMEOUT_REMEMBER_ME` int NOT NULL,
  `DEFAULT_ROLE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_ORVSDMLA56612EAEFIQ6WL5OI` (`NAME`),
  KEY `IDX_REALM_MASTER_ADM_CLI` (`MASTER_ADMIN_CLIENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM`
--

LOCK TABLES `REALM` WRITE;
/*!40000 ALTER TABLE `REALM` DISABLE KEYS */;
INSERT INTO `REALM` VALUES ('e810ef94-3763-43cb-b70b-f5229124accb',60,300,60,NULL,NULL,NULL,_binary '',_binary '\0',0,NULL,'master',0,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '\0','9ebdb3bc-347f-4bb9-b642-8cbeb42342bc',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','f48b53dc-10d1-433d-b836-ecea1e708437','4de58572-3d33-4dc5-bea0-6f8d96c603b3','a0f9b1b0-a840-4588-9b4c-8b21c7edb70d','56bfc10c-e527-430c-a6ba-b3a68620b553','ff776c3c-6fb1-4265-9380-4b2d19ca4856',2592000,_binary '\0',900,_binary '',_binary '\0','ace75054-1595-47c4-ad52-cb67ea6639b6',0,_binary '\0',0,0,'eeaf3eb7-af5b-4390-a203-4f611e629fdb');
INSERT INTO `REALM` VALUES ('myRealm',60,300,300,NULL,NULL,NULL,_binary '',_binary '\0',0,NULL,'myRealm',0,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '\0','91dbffbb-cafd-40eb-a312-8dbc536d10e3',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','c096b463-7bec-47c9-b85b-547cdaab9b8d','579938b5-fbd5-4b0a-872c-e1b345f22481','39e2626c-a20a-4ab3-bb13-522ba1aec27e','59ad7d35-e871-4b11-8e67-f426caab8589','e25cbe9f-08f2-4722-9bc7-7aa34a6f0629',2592000,_binary '\0',900,_binary '',_binary '\0','10ae087b-49ce-40ff-a056-cab195e94928',0,_binary '\0',0,0,'4b92d023-8967-4482-bd8d-6c89db2f7bcd');
/*!40000 ALTER TABLE `REALM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ATTRIBUTE`
--

DROP TABLE IF EXISTS `REALM_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_ATTRIBUTE` (
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`NAME`,`REALM_ID`),
  KEY `IDX_REALM_ATTR_REALM` (`REALM_ID`),
  CONSTRAINT `FK_8SHXD6L3E9ATQUKACXGPFFPTW` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ATTRIBUTE`
--

LOCK TABLES `REALM_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `REALM_ATTRIBUTE` VALUES ('_browser_header.contentSecurityPolicy','e810ef94-3763-43cb-b70b-f5229124accb','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('_browser_header.contentSecurityPolicy','myRealm','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('_browser_header.contentSecurityPolicyReportOnly','e810ef94-3763-43cb-b70b-f5229124accb','');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('_browser_header.contentSecurityPolicyReportOnly','myRealm','');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('_browser_header.strictTransportSecurity','e810ef94-3763-43cb-b70b-f5229124accb','max-age=31536000; includeSubDomains');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('_browser_header.strictTransportSecurity','myRealm','max-age=31536000; includeSubDomains');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('_browser_header.xContentTypeOptions','e810ef94-3763-43cb-b70b-f5229124accb','nosniff');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('_browser_header.xContentTypeOptions','myRealm','nosniff');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('_browser_header.xFrameOptions','e810ef94-3763-43cb-b70b-f5229124accb','SAMEORIGIN');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('_browser_header.xFrameOptions','myRealm','SAMEORIGIN');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('_browser_header.xRobotsTag','e810ef94-3763-43cb-b70b-f5229124accb','none');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('_browser_header.xRobotsTag','myRealm','none');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('_browser_header.xXSSProtection','e810ef94-3763-43cb-b70b-f5229124accb','1; mode=block');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('_browser_header.xXSSProtection','myRealm','1; mode=block');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('actionTokenGeneratedByAdminLifespan','myRealm','43200');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('actionTokenGeneratedByUserLifespan','myRealm','300');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('bruteForceProtected','e810ef94-3763-43cb-b70b-f5229124accb','false');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('bruteForceProtected','myRealm','false');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('cibaAuthRequestedUserHint','myRealm','login_hint');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('cibaBackchannelTokenDeliveryMode','myRealm','poll');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('cibaExpiresIn','myRealm','120');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('cibaInterval','myRealm','5');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('defaultSignatureAlgorithm','e810ef94-3763-43cb-b70b-f5229124accb','RS256');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('defaultSignatureAlgorithm','myRealm','RS256');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('displayName','e810ef94-3763-43cb-b70b-f5229124accb','Keycloak');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('displayNameHtml','e810ef94-3763-43cb-b70b-f5229124accb','<div class=\"kc-logo-text\"><span>Keycloak</span></div>');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('failureFactor','e810ef94-3763-43cb-b70b-f5229124accb','30');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('failureFactor','myRealm','30');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('maxDeltaTimeSeconds','e810ef94-3763-43cb-b70b-f5229124accb','43200');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('maxDeltaTimeSeconds','myRealm','43200');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('maxFailureWaitSeconds','e810ef94-3763-43cb-b70b-f5229124accb','900');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('maxFailureWaitSeconds','myRealm','900');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('minimumQuickLoginWaitSeconds','e810ef94-3763-43cb-b70b-f5229124accb','60');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('minimumQuickLoginWaitSeconds','myRealm','60');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('oauth2DeviceCodeLifespan','myRealm','600');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('oauth2DevicePollingInterval','myRealm','5');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('offlineSessionMaxLifespan','e810ef94-3763-43cb-b70b-f5229124accb','5184000');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('offlineSessionMaxLifespan','myRealm','5184000');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('offlineSessionMaxLifespanEnabled','e810ef94-3763-43cb-b70b-f5229124accb','false');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('offlineSessionMaxLifespanEnabled','myRealm','false');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('parRequestUriLifespan','myRealm','60');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('permanentLockout','e810ef94-3763-43cb-b70b-f5229124accb','false');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('permanentLockout','myRealm','false');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('quickLoginCheckMilliSeconds','e810ef94-3763-43cb-b70b-f5229124accb','1000');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('quickLoginCheckMilliSeconds','myRealm','1000');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('waitIncrementSeconds','e810ef94-3763-43cb-b70b-f5229124accb','60');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('waitIncrementSeconds','myRealm','60');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('webAuthnPolicyAttestationConveyancePreference','myRealm','not specified');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('webAuthnPolicyAttestationConveyancePreferencePasswordless','myRealm','not specified');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('webAuthnPolicyAuthenticatorAttachment','myRealm','not specified');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('webAuthnPolicyAuthenticatorAttachmentPasswordless','myRealm','not specified');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('webAuthnPolicyAvoidSameAuthenticatorRegister','myRealm','false');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless','myRealm','false');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('webAuthnPolicyCreateTimeout','myRealm','0');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('webAuthnPolicyCreateTimeoutPasswordless','myRealm','0');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('webAuthnPolicyRequireResidentKey','myRealm','not specified');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('webAuthnPolicyRequireResidentKeyPasswordless','myRealm','not specified');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('webAuthnPolicyRpEntityName','myRealm','keycloak');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('webAuthnPolicyRpEntityNamePasswordless','myRealm','keycloak');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('webAuthnPolicyRpId','myRealm','');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('webAuthnPolicyRpIdPasswordless','myRealm','');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('webAuthnPolicySignatureAlgorithms','myRealm','ES256');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('webAuthnPolicySignatureAlgorithmsPasswordless','myRealm','ES256');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('webAuthnPolicyUserVerificationRequirement','myRealm','not specified');
INSERT INTO `REALM_ATTRIBUTE` VALUES ('webAuthnPolicyUserVerificationRequirementPasswordless','myRealm','not specified');
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_DEFAULT_GROUPS`
--

DROP TABLE IF EXISTS `REALM_DEFAULT_GROUPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_DEFAULT_GROUPS` (
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `GROUP_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`GROUP_ID`),
  UNIQUE KEY `CON_GROUP_ID_DEF_GROUPS` (`GROUP_ID`),
  KEY `IDX_REALM_DEF_GRP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_DEF_GROUPS_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_DEFAULT_GROUPS`
--

LOCK TABLES `REALM_DEFAULT_GROUPS` WRITE;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ENABLED_EVENT_TYPES`
--

DROP TABLE IF EXISTS `REALM_ENABLED_EVENT_TYPES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_ENABLED_EVENT_TYPES` (
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_TYPES_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NWEDRF5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ENABLED_EVENT_TYPES`
--

LOCK TABLES `REALM_ENABLED_EVENT_TYPES` WRITE;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_EVENTS_LISTENERS`
--

DROP TABLE IF EXISTS `REALM_EVENTS_LISTENERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_EVENTS_LISTENERS` (
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_LIST_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NXEV9F5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_EVENTS_LISTENERS`
--

LOCK TABLES `REALM_EVENTS_LISTENERS` WRITE;
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` DISABLE KEYS */;
INSERT INTO `REALM_EVENTS_LISTENERS` VALUES ('e810ef94-3763-43cb-b70b-f5229124accb','jboss-logging');
INSERT INTO `REALM_EVENTS_LISTENERS` VALUES ('myRealm','jboss-logging');
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_LOCALIZATIONS`
--

DROP TABLE IF EXISTS `REALM_LOCALIZATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_LOCALIZATIONS` (
  `REALM_ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LOCALE` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TEXTS` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`LOCALE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_LOCALIZATIONS`
--

LOCK TABLES `REALM_LOCALIZATIONS` WRITE;
/*!40000 ALTER TABLE `REALM_LOCALIZATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_LOCALIZATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_REQUIRED_CREDENTIAL`
--

DROP TABLE IF EXISTS `REALM_REQUIRED_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_REQUIRED_CREDENTIAL` (
  `TYPE` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FORM_LABEL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `INPUT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`TYPE`),
  CONSTRAINT `FK_5HG65LYBEVAVKQFKI3KPONH9V` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_REQUIRED_CREDENTIAL`
--

LOCK TABLES `REALM_REQUIRED_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` DISABLE KEYS */;
INSERT INTO `REALM_REQUIRED_CREDENTIAL` VALUES ('password','password',_binary '',_binary '','e810ef94-3763-43cb-b70b-f5229124accb');
INSERT INTO `REALM_REQUIRED_CREDENTIAL` VALUES ('password','password',_binary '',_binary '','myRealm');
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SMTP_CONFIG`
--

DROP TABLE IF EXISTS `REALM_SMTP_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_SMTP_CONFIG` (
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`NAME`),
  CONSTRAINT `FK_70EJ8XDXGXD0B9HH6180IRR0O` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SMTP_CONFIG`
--

LOCK TABLES `REALM_SMTP_CONFIG` WRITE;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SUPPORTED_LOCALES`
--

DROP TABLE IF EXISTS `REALM_SUPPORTED_LOCALES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_SUPPORTED_LOCALES` (
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_SUPP_LOCAL_REALM` (`REALM_ID`),
  CONSTRAINT `FK_SUPPORTED_LOCALES_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SUPPORTED_LOCALES`
--

LOCK TABLES `REALM_SUPPORTED_LOCALES` WRITE;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REDIRECT_URIS`
--

DROP TABLE IF EXISTS `REDIRECT_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REDIRECT_URIS` (
  `CLIENT_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_REDIR_URI_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_1BURS8PB4OUJ97H5WUPPAHV9F` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REDIRECT_URIS`
--

LOCK TABLES `REDIRECT_URIS` WRITE;
/*!40000 ALTER TABLE `REDIRECT_URIS` DISABLE KEYS */;
INSERT INTO `REDIRECT_URIS` VALUES ('65276c8e-b3a5-4376-a32a-af9612b26fe7','/admin/myRealm/console/*');
INSERT INTO `REDIRECT_URIS` VALUES ('7d76f094-a7b6-4acb-9c54-dbb45857d8de','/realms/master/account/*');
INSERT INTO `REDIRECT_URIS` VALUES ('b1340e05-4d92-478a-b49b-5820af128eca','/realms/myRealm/account/*');
INSERT INTO `REDIRECT_URIS` VALUES ('ba72da23-8ec5-4150-8de8-22b7e39be868','/realms/myRealm/account/*');
INSERT INTO `REDIRECT_URIS` VALUES ('bad387fc-627c-4369-ab9a-fdb5f7ce588c','/realms/master/account/*');
INSERT INTO `REDIRECT_URIS` VALUES ('cdf9904a-f867-46de-8f2a-34b701b9ba32','/admin/master/console/*');
/*!40000 ALTER TABLE `REDIRECT_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_CONFIG`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIRED_ACTION_CONFIG` (
  `REQUIRED_ACTION_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` longtext COLLATE utf8mb4_unicode_ci,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`REQUIRED_ACTION_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_CONFIG`
--

LOCK TABLES `REQUIRED_ACTION_CONFIG` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_PROVIDER`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIRED_ACTION_PROVIDER` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ALIAS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_ACTION` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_REQ_ACT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_REQ_ACT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_PROVIDER`
--

LOCK TABLES `REQUIRED_ACTION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` DISABLE KEYS */;
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('1e0c751b-4535-4d3b-9c7e-8f9a5c105ef2','VERIFY_EMAIL','Verify Email','e810ef94-3763-43cb-b70b-f5229124accb',_binary '',_binary '\0','VERIFY_EMAIL',50);
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('61ccfb64-6d61-4e65-9152-d0ee403ef96e','UPDATE_PROFILE','Update Profile','e810ef94-3763-43cb-b70b-f5229124accb',_binary '',_binary '\0','UPDATE_PROFILE',40);
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('6e6bb6ed-26a9-4246-af25-85d7293cade0','terms_and_conditions','Terms and Conditions','myRealm',_binary '\0',_binary '\0','terms_and_conditions',20);
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('71250fb0-fc27-4577-96bc-aeda41d3fd76','UPDATE_PASSWORD','Update Password','e810ef94-3763-43cb-b70b-f5229124accb',_binary '',_binary '\0','UPDATE_PASSWORD',30);
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('721f9894-d8fc-488a-a16f-466a678daa6e','CONFIGURE_TOTP','Configure OTP','myRealm',_binary '',_binary '\0','CONFIGURE_TOTP',10);
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('7e0139ad-d188-44bd-ad5e-14289a3d7471','CONFIGURE_TOTP','Configure OTP','e810ef94-3763-43cb-b70b-f5229124accb',_binary '',_binary '\0','CONFIGURE_TOTP',10);
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('a0148f74-f022-4473-80b9-8d3e2e35493d','terms_and_conditions','Terms and Conditions','e810ef94-3763-43cb-b70b-f5229124accb',_binary '\0',_binary '\0','terms_and_conditions',20);
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('b16c7c45-602f-4d5d-8cdd-7a4c47bad994','VERIFY_EMAIL','Verify Email','myRealm',_binary '',_binary '\0','VERIFY_EMAIL',50);
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('b62f4012-31e7-4a19-a11d-f8397bb04d52','delete_account','Delete Account','myRealm',_binary '\0',_binary '\0','delete_account',60);
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('c414e18e-d44a-4caa-a497-c2a129407db8','update_user_locale','Update User Locale','myRealm',_binary '',_binary '\0','update_user_locale',1000);
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('d6a1d6d1-1bdc-4dc1-af2a-4a759d84a70b','UPDATE_PASSWORD','Update Password','myRealm',_binary '',_binary '\0','UPDATE_PASSWORD',30);
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('de512885-f472-4441-869c-40c6623a73e6','update_user_locale','Update User Locale','e810ef94-3763-43cb-b70b-f5229124accb',_binary '',_binary '\0','update_user_locale',1000);
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('fb68d5e4-80b7-404b-9cad-81240e6754fc','delete_account','Delete Account','e810ef94-3763-43cb-b70b-f5229124accb',_binary '\0',_binary '\0','delete_account',60);
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('ffd69dad-bbc0-42db-b7a0-d6157ed024e8','UPDATE_PROFILE','Update Profile','myRealm',_binary '',_binary '\0','UPDATE_PROFILE',40);
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `RESOURCE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_ATTRIBUTE` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESOURCE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_5HRM2VLF9QL5FU022KQEPOVBR` (`RESOURCE_ID`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU022KQEPOVBR` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_ATTRIBUTE`
--

LOCK TABLES `RESOURCE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_POLICY` (
  `RESOURCE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `POLICY_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`POLICY_ID`),
  KEY `IDX_RES_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRPOS53XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPP213XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_POLICY`
--

LOCK TABLES `RESOURCE_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SCOPE` (
  `RESOURCE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SCOPE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`SCOPE_ID`),
  KEY `IDX_RES_SCOPE_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_FRSRPOS13XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPS213XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SCOPE`
--

LOCK TABLES `RESOURCE_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ALLOW_RS_REMOTE_MGMT` bit(1) NOT NULL DEFAULT b'0',
  `POLICY_ENFORCE_MODE` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DECISION_STRATEGY` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER`
--

LOCK TABLES `RESOURCE_SERVER` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_PERM_TICKET`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_PERM_TICKET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_PERM_TICKET` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `OWNER` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REQUESTER` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint NOT NULL,
  `GRANTED_TIMESTAMP` bigint DEFAULT NULL,
  `RESOURCE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SCOPE_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `POLICY_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5PMT` (`OWNER`,`REQUESTER`,`RESOURCE_SERVER_ID`,`RESOURCE_ID`,`SCOPE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG82SSPMT` (`RESOURCE_SERVER_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG83SSPMT` (`RESOURCE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG84SSPMT` (`SCOPE_ID`),
  KEY `FK_FRSRPO2128CX4WNKOG82SSRFY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSPMT` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG83SSPMT` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG84SSPMT` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`),
  CONSTRAINT `FK_FRSRPO2128CX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_PERM_TICKET`
--

LOCK TABLES `RESOURCE_SERVER_PERM_TICKET` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_POLICY` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `TYPE` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DECISION_STRATEGY` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LOGIC` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OWNER` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRPT700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SERV_POL_RES_SERV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRPO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_POLICY`
--

LOCK TABLES `RESOURCE_SERVER_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_RESOURCE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_RESOURCE` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TYPE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ICON_URI` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OWNER` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OWNER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `DISPLAY_NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5HA6` (`NAME`,`OWNER`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_RES_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_RESOURCE`
--

LOCK TABLES `RESOURCE_SERVER_RESOURCE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_SCOPE` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ICON_URI` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRST700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_SCOPE_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRSO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_SCOPE`
--

LOCK TABLES `RESOURCE_SERVER_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_URIS`
--

DROP TABLE IF EXISTS `RESOURCE_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_URIS` (
  `RESOURCE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`VALUE`),
  CONSTRAINT `FK_RESOURCE_SERVER_URIS` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_URIS`
--

LOCK TABLES `RESOURCE_URIS` WRITE;
/*!40000 ALTER TABLE `RESOURCE_URIS` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROLE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `ROLE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ROLE_ATTRIBUTE` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ROLE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ROLE_ATTRIBUTE` (`ROLE_ID`),
  CONSTRAINT `FK_ROLE_ATTRIBUTE_ID` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLE_ATTRIBUTE`
--

LOCK TABLES `ROLE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_MAPPING`
--

DROP TABLE IF EXISTS `SCOPE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCOPE_MAPPING` (
  `CLIENT_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ROLE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
  KEY `IDX_SCOPE_MAPPING_ROLE` (`ROLE_ID`),
  CONSTRAINT `FK_OUSE064PLMLR732LXJCN1Q5F1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_MAPPING`
--

LOCK TABLES `SCOPE_MAPPING` WRITE;
/*!40000 ALTER TABLE `SCOPE_MAPPING` DISABLE KEYS */;
INSERT INTO `SCOPE_MAPPING` VALUES ('ba72da23-8ec5-4150-8de8-22b7e39be868','59b23256-629b-4588-840f-68f31342c5da');
INSERT INTO `SCOPE_MAPPING` VALUES ('bad387fc-627c-4369-ab9a-fdb5f7ce588c','fc9adbda-1fa2-4165-80f2-56f496e47c76');
/*!40000 ALTER TABLE `SCOPE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_POLICY`
--

DROP TABLE IF EXISTS `SCOPE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCOPE_POLICY` (
  `SCOPE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `POLICY_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`POLICY_ID`),
  KEY `IDX_SCOPE_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRASP13XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPASS3XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_POLICY`
--

LOCK TABLES `SCOPE_POLICY` WRITE;
/*!40000 ALTER TABLE `SCOPE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `SCOPE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERNAME_LOGIN_FAILURE`
--

DROP TABLE IF EXISTS `USERNAME_LOGIN_FAILURE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USERNAME_LOGIN_FAILURE` (
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `FAILED_LOGIN_NOT_BEFORE` int DEFAULT NULL,
  `LAST_FAILURE` bigint DEFAULT NULL,
  `LAST_IP_FAILURE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NUM_FAILURES` int DEFAULT NULL,
  PRIMARY KEY (`REALM_ID`,`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERNAME_LOGIN_FAILURE`
--

LOCK TABLES `USERNAME_LOGIN_FAILURE` WRITE;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ATTRIBUTE` (
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `USER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sybase-needs-something-here',
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_ATTRIBUTE` (`USER_ID`),
  KEY `IDX_USER_ATTRIBUTE_NAME` (`NAME`,`VALUE`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU043KQEPOVBR` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ATTRIBUTE`
--

LOCK TABLES `USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT`
--

DROP TABLE IF EXISTS `USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_CONSENT` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_JKUWUVD56ONTGSUHOGM8UEWRT` (`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`USER_ID`),
  KEY `IDX_USER_CONSENT` (`USER_ID`),
  CONSTRAINT `FK_GRNTCSNT_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT`
--

LOCK TABLES `USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `USER_CONSENT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_CONSENT_CLIENT_SCOPE` (
  `USER_CONSENT_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SCOPE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`),
  KEY `IDX_USCONSENT_CLSCOPE` (`USER_CONSENT_ID`),
  CONSTRAINT `FK_GRNTCSNT_CLSC_USC` FOREIGN KEY (`USER_CONSENT_ID`) REFERENCES `USER_CONSENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT_CLIENT_SCOPE`
--

LOCK TABLES `USER_CONSENT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ENTITY`
--

DROP TABLE IF EXISTS `USER_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ENTITY` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `EMAIL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EMAIL_CONSTRAINT` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EMAIL_VERIFIED` bit(1) NOT NULL DEFAULT b'0',
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FEDERATION_LINK` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FIRST_NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `LAST_NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint DEFAULT NULL,
  `SERVICE_ACCOUNT_CLIENT_LINK` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NOT_BEFORE` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_DYKN684SL8UP1CRFEI6ECKHD7` (`REALM_ID`,`EMAIL_CONSTRAINT`),
  UNIQUE KEY `UK_RU8TT6T700S9V50BU18WS5HA6` (`REALM_ID`,`USERNAME`),
  KEY `IDX_USER_EMAIL` (`EMAIL`),
  KEY `IDX_USER_SERVICE_ACCOUNT` (`REALM_ID`,`SERVICE_ACCOUNT_CLIENT_LINK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ENTITY`
--

LOCK TABLES `USER_ENTITY` WRITE;
/*!40000 ALTER TABLE `USER_ENTITY` DISABLE KEYS */;
INSERT INTO `USER_ENTITY` VALUES ('a3c5d817-69f1-4f5f-8071-890bc3f40f44',NULL,'49ef3896-1fd9-4184-be60-0e9619f173d7',_binary '\0',_binary '',NULL,NULL,NULL,'e810ef94-3763-43cb-b70b-f5229124accb','admin',1678214835965,NULL,0);
/*!40000 ALTER TABLE `USER_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_CONFIG` (
  `USER_FEDERATION_PROVIDER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FK_T13HPU1J94R2EBPEKR39X5EU5` FOREIGN KEY (`USER_FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_CONFIG`
--

LOCK TABLES `USER_FEDERATION_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_MAPPER` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FEDERATION_PROVIDER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FEDERATION_MAPPER_TYPE` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_MAP_FED_PRV` (`FEDERATION_PROVIDER_ID`),
  KEY `IDX_USR_FED_MAP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_FEDMAPPERPM_FEDPRV` FOREIGN KEY (`FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`),
  CONSTRAINT `FK_FEDMAPPERPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER`
--

LOCK TABLES `USER_FEDERATION_MAPPER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_MAPPER_CONFIG` (
  `USER_FEDERATION_MAPPER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_FEDMAPPER_CFG` FOREIGN KEY (`USER_FEDERATION_MAPPER_ID`) REFERENCES `USER_FEDERATION_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER_CONFIG`
--

LOCK TABLES `USER_FEDERATION_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_PROVIDER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_PROVIDER` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CHANGED_SYNC_PERIOD` int DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FULL_SYNC_PERIOD` int DEFAULT NULL,
  `LAST_SYNC` int DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `PROVIDER_NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_PRV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_1FJ32F6PTOLW2QY60CD8N01E8` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_PROVIDER`
--

LOCK TABLES `USER_FEDERATION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `USER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_USER_GROUP_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_USER_GROUP_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_REQUIRED_ACTION` (
  `USER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REQUIRED_ACTION` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ' ',
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_USER_REQACTIONS` (`USER_ID`),
  CONSTRAINT `FK_6QJ3W1JW9CVAFHE19BWSIUVMD` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_REQUIRED_ACTION`
--

LOCK TABLES `USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `USER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_USER_ROLE_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_C4FQV34P1MBYLLOXANG7B1Q3L` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ROLE_MAPPING`
--

LOCK TABLES `USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `USER_ROLE_MAPPING` VALUES ('004b3d93-0738-4b1c-a9b7-759fab0abe7f','a3c5d817-69f1-4f5f-8071-890bc3f40f44');
INSERT INTO `USER_ROLE_MAPPING` VALUES ('00c0f282-35b6-429a-bd99-ec37426c9781','a3c5d817-69f1-4f5f-8071-890bc3f40f44');
INSERT INTO `USER_ROLE_MAPPING` VALUES ('0b959937-70ee-4a7f-8fa8-90f36857f22b','a3c5d817-69f1-4f5f-8071-890bc3f40f44');
INSERT INTO `USER_ROLE_MAPPING` VALUES ('1e9b7b11-2ce4-4f49-8366-02b8da7fa888','a3c5d817-69f1-4f5f-8071-890bc3f40f44');
INSERT INTO `USER_ROLE_MAPPING` VALUES ('2db91bb2-7c86-444f-92ed-d47580825ed1','a3c5d817-69f1-4f5f-8071-890bc3f40f44');
INSERT INTO `USER_ROLE_MAPPING` VALUES ('2ee75d6b-acd4-4684-a230-502e64ec2c8a','a3c5d817-69f1-4f5f-8071-890bc3f40f44');
INSERT INTO `USER_ROLE_MAPPING` VALUES ('36063e18-482f-4662-95ad-fa62d8e2481d','a3c5d817-69f1-4f5f-8071-890bc3f40f44');
INSERT INTO `USER_ROLE_MAPPING` VALUES ('49c1f0ea-eaa0-4bfd-a047-ee8fc12622d3','a3c5d817-69f1-4f5f-8071-890bc3f40f44');
INSERT INTO `USER_ROLE_MAPPING` VALUES ('6032f0d7-3d30-4f91-a0aa-e42ab0b82396','a3c5d817-69f1-4f5f-8071-890bc3f40f44');
INSERT INTO `USER_ROLE_MAPPING` VALUES ('77bb922f-17a2-44e3-a60a-fa8d0bc79551','a3c5d817-69f1-4f5f-8071-890bc3f40f44');
INSERT INTO `USER_ROLE_MAPPING` VALUES ('78b7dfbb-2fc1-41a2-9827-4e921e3c68a3','a3c5d817-69f1-4f5f-8071-890bc3f40f44');
INSERT INTO `USER_ROLE_MAPPING` VALUES ('7ad69e0d-eeba-4b51-87f9-7cc74b9d8fa0','a3c5d817-69f1-4f5f-8071-890bc3f40f44');
INSERT INTO `USER_ROLE_MAPPING` VALUES ('9584a1c2-aed2-4a83-a4e6-bd1fb2051d60','a3c5d817-69f1-4f5f-8071-890bc3f40f44');
INSERT INTO `USER_ROLE_MAPPING` VALUES ('a03da7dc-5350-4be1-a122-6d798288ed10','a3c5d817-69f1-4f5f-8071-890bc3f40f44');
INSERT INTO `USER_ROLE_MAPPING` VALUES ('bfbe7947-4d0d-426a-a3ca-8b447c8a3e5d','a3c5d817-69f1-4f5f-8071-890bc3f40f44');
INSERT INTO `USER_ROLE_MAPPING` VALUES ('d0c10bdd-4d85-491c-8cc5-7132b5a88a38','a3c5d817-69f1-4f5f-8071-890bc3f40f44');
INSERT INTO `USER_ROLE_MAPPING` VALUES ('e15ed03f-3659-4e2d-89f1-01808971b7c5','a3c5d817-69f1-4f5f-8071-890bc3f40f44');
INSERT INTO `USER_ROLE_MAPPING` VALUES ('e7d0e0eb-b512-4cc1-9fe8-fcf9596805a4','a3c5d817-69f1-4f5f-8071-890bc3f40f44');
INSERT INTO `USER_ROLE_MAPPING` VALUES ('eeaf3eb7-af5b-4390-a203-4f611e629fdb','a3c5d817-69f1-4f5f-8071-890bc3f40f44');
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION`
--

DROP TABLE IF EXISTS `USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_SESSION` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `AUTH_METHOD` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IP_ADDRESS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LAST_SESSION_REFRESH` int DEFAULT NULL,
  `LOGIN_USERNAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `STARTED` int DEFAULT NULL,
  `USER_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USER_SESSION_STATE` int DEFAULT NULL,
  `BROKER_SESSION_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BROKER_USER_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION`
--

LOCK TABLES `USER_SESSION` WRITE;
/*!40000 ALTER TABLE `USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_SESSION_NOTE` (
  `USER_SESSION` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`USER_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51D3472` FOREIGN KEY (`USER_SESSION`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION_NOTE`
--

LOCK TABLES `USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WEB_ORIGINS`
--

DROP TABLE IF EXISTS `WEB_ORIGINS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WEB_ORIGINS` (
  `CLIENT_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_WEB_ORIG_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_LOJPHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WEB_ORIGINS`
--

LOCK TABLES `WEB_ORIGINS` WRITE;
/*!40000 ALTER TABLE `WEB_ORIGINS` DISABLE KEYS */;
INSERT INTO `WEB_ORIGINS` VALUES ('65276c8e-b3a5-4376-a32a-af9612b26fe7','+');
INSERT INTO `WEB_ORIGINS` VALUES ('cdf9904a-f867-46de-8f2a-34b701b9ba32','+');
/*!40000 ALTER TABLE `WEB_ORIGINS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-17 15:02:47
