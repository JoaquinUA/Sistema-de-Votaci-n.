CREATE DATABASE  IF NOT EXISTS `votaciones` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `votaciones`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: votaciones
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
-- Table structure for table `comunas`
--

DROP TABLE IF EXISTS `comunas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comunas` (
  `nombre` varchar(45) NOT NULL,
  `region_abr` varchar(2) NOT NULL,
  PRIMARY KEY (`nombre`),
  KEY `FK_region_abr` (`region_abr`),
  CONSTRAINT `FK_region_abr` FOREIGN KEY (`region_abr`) REFERENCES `regiones` (`abreviatura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comunas`
--

LOCK TABLES `comunas` WRITE;
/*!40000 ALTER TABLE `comunas` DISABLE KEYS */;
INSERT INTO `comunas` VALUES ('Aysén','AI'),('Chile Chico','AI'),('Cisnes','AI'),('Cochrane','AI'),('Coyhaique','AI'),('Guaitecas','AI'),('Largo Verde','AI'),('O\'higgins','AI'),('Río Ibáñez','AI'),('Tortel','AI'),('Antofagasta','AN'),('Calama','AN'),('María Elena','AN'),('Mejillones','AN'),('Ollagüe','AN'),('San Pedro de Atacama','AN'),('Sierra Gorda','AN'),('Taltal','AN'),('Tocopilla','AN'),('Arica','AP'),('Camarones','AP'),('General Lagos','AP'),('Putre','AP'),('Angol','AR'),('Carahue','AR'),('Cholchol','AR'),('Collipulli','AR'),('Cunco','AR'),('Curacautín','AR'),('Curarrehue','AR'),('Ercilla','AR'),('Freire','AR'),('Galvarino','AR'),('Gorbea','AR'),('Lautaro','AR'),('Loncoche','AR'),('Lonquimay','AR'),('Los Sauces','AR'),('Lumaco','AR'),('Melipeuco','AR'),('Nueva Imperial','AR'),('Padre Las Casas','AR'),('Perquenco','AR'),('Pitrufquén','AR'),('Pucón','AR'),('Purén','AR'),('Renaico','AR'),('Saavedra','AR'),('Temuco','AR'),('Teodoro Schmidt','AR'),('Toltén','AR'),('Traiguén','AR'),('Victoria','AR'),('Vilcún','AR'),('Villarrica','AR'),('Alto del Carmen','AT'),('Caldera','AT'),('Chañaral','AT'),('Copiapó','AT'),('Diego de Almagro','AT'),('Freirina','AT'),('Huasco','AT'),('Tierra Amarilla','AT'),('Vallenar','AT'),('Alto Biobío','BI'),('Antuco','BI'),('Arauco','BI'),('Cabrero','BI'),('Cañete','BI'),('Chiguayante','BI'),('Concepción','BI'),('Contulmo','BI'),('Coronel','BI'),('Curanilahue','BI'),('Florida','BI'),('Hualpén','BI'),('Hualqui','BI'),('Laja','BI'),('Lebu','BI'),('Los Alamos','BI'),('Los Angeles','BI'),('Lota','BI'),('Mulchén','BI'),('Nacimiento','BI'),('Negrete','BI'),('Penco','BI'),('Quillaco','BI'),('Quilleco','BI'),('San Pedro de la Paz','BI'),('San Rosendo','BI'),('Santa Bárbara','BI'),('Santa Juana','BI'),('Talcahuano','BI'),('Tirúa','BI'),('Tomé','BI'),('Tucapel','BI'),('Yumbel','BI'),('Andacollo','CO'),('Canela','CO'),('Combarbalá','CO'),('Coquimbo','CO'),('Illapel','CO'),('La Higuera','CO'),('La Serena','CO'),('Los Vilos','CO'),('Monte Patria','CO'),('Ovalle','CO'),('Paihuano','CO'),('Punitaqui','CO'),('Río Hurtado','CO'),('Salamanca','CO'),('Vicuña','CO'),('Chépica','LI'),('Chimbarongo','LI'),('Codegua','LI'),('Coínco','LI'),('Coltauco','LI'),('Doñihue','LI'),('Graneros','LI'),('La Estrella','LI'),('Las Cabras','LI'),('Litueche','LI'),('Lolol','LI'),('Machalí','LI'),('Malloa','LI'),('Marchihue','LI'),('Mostazal','LI'),('Nancagua','LI'),('Navidad','LI'),('Olivar','LI'),('Palmilla','LI'),('Paredones','LI'),('Peralillo','LI'),('Peumo','LI'),('Pichidegua','LI'),('Pichilemu','LI'),('Placilla','LI'),('Pumanque','LI'),('Quinta de Tilcoco','LI'),('Rancagua','LI'),('Rengo','LI'),('Requinoa','LI'),('San Fernando','LI'),('San Vicente','LI'),('Santa Cruz','LI'),('Ancud','LL'),('Calbuco','LL'),('Castro','LL'),('Chaitén','LL'),('Chonchi','LL'),('Cochamó','LL'),('Curaco de Vélez','LL'),('Dalcahue','LL'),('Fresia','LL'),('Frutillar','LL'),('Futaleufú','LL'),('Hualaihué','LL'),('LLanquihue','LL'),('Los Muermos','LL'),('Maullín','LL'),('Osorno','LL'),('Palena','LL'),('Puerto Montt','LL'),('Puerto Octay','LL'),('Puerto Varas','LL'),('Puqueldón','LL'),('Purranque','LL'),('Puyehue','LL'),('Queilén','LL'),('Quellón','LL'),('Quemchi','LL'),('Quinchao','LL'),('Río Negro','LL'),('San Juan de la Costa','LL'),('San Pablo','LL'),('Corral','LR'),('Futrono','LR'),('La Unión','LR'),('Lago Ranco','LR'),('Lanco','LR'),('Los Lagos','LR'),('Máfil','LR'),('Mariquina','LR'),('Paillaco','LR'),('Panguipullí','LR'),('Río Bueno','LR'),('Valdivia','LR'),('Antártica','MA'),('Cabo de Hornos','MA'),('Laguna Blanca','MA'),('Natales','MA'),('Porvenir','MA'),('Primavera','MA'),('Punta Arenas','MA'),('Río Verde','MA'),('San Gregorio','MA'),('Timaukel','MA'),('Torres del Paine','MA'),('Cauquenes','ML'),('Chanco','ML'),('Colbún','ML'),('Constitución','ML'),('Curepto','ML'),('Curicó','ML'),('Empedrado','ML'),('Hualañe','ML'),('Licantén','ML'),('Linares','ML'),('Longaví','ML'),('Maule','ML'),('Molina','ML'),('Parral','ML'),('Pelarco','ML'),('Pencahue','ML'),('Pullehue','ML'),('Rauco','ML'),('Retiro','ML'),('Río Claro','ML'),('Romeral','ML'),('Sagrada Familia','ML'),('San Clemente','ML'),('San Javier','ML'),('San Rafael','ML'),('Talca','ML'),('Teno','ML'),('Vichunquén','ML'),('Villa Alegre','ML'),('Yerbas Buenas','ML'),('Bulnes','NB'),('Chillán','NB'),('Chillán Viejo','NB'),('Cobquecura','NB'),('Coelemu','NB'),('Coihueco','NB'),('El Carmen','NB'),('Ninhue','NB'),('Ñinquén','NB'),('Pemuco','NB'),('Pinto','NB'),('Portezuelo','NB'),('Quillón','NB'),('Quirihue','NB'),('Ránquil','NB'),('San Carlos','NB'),('San Fabián','NB'),('San Ignacio','NB'),('San Nicolas','NB'),('Treguaco','NB'),('Yungay','NB'),('Alhué','RM'),('Buin','RM'),('Calera de Tango','RM'),('Cerrillos','RM'),('Cerro Navia','RM'),('Colina','RM'),('Conchalí','RM'),('Curacaví','RM'),('El Bosque','RM'),('El Monte','RM'),('Estación Central','RM'),('Huechuraba','RM'),('Independencia','RM'),('Isla de Maipo','RM'),('La Cisterna','RM'),('La Florida','RM'),('La Granja','RM'),('La Pintana','RM'),('La Reina','RM'),('Lampa','RM'),('Las Condes','RM'),('Lo Bernechea','RM'),('Lo Espejo','RM'),('Lo Prado','RM'),('Macul','RM'),('Maipú','RM'),('María Pinto','RM'),('Melipilla','RM'),('Ñuñoa','RM'),('Padre Hurtado','RM'),('Paine','RM'),('Pedro Aguirre Cerda','RM'),('Peñaflor','RM'),('Peñalolén','RM'),('Pirque','RM'),('Providencia','RM'),('Pudahuel','RM'),('Puente Alto','RM'),('Quilicura','RM'),('Quinta Normal','RM'),('Recoleta','RM'),('Renca','RM'),('San Bernardo','RM'),('San Joaquín','RM'),('San José de Maipo','RM'),('San Miguel','RM'),('San Pedro','RM'),('San Ramón','RM'),('Santiago','RM'),('Talagante','RM'),('Tiltil','RM'),('Vitacura','RM'),('Alto Hospicio','TA'),('Camiña','TA'),('Coichane','TA'),('Huana','TA'),('Iquique','TA'),('Pica','TA'),('Pozo Almonte','TA'),('Algarrobo','VA'),('Cabildo','VA'),('Calera','VA'),('Calle Larga','VA'),('Cartagena','VA'),('Casablanca','VA'),('Catemu','VA'),('Concón','VA'),('El Quisco','VA'),('El Tabo','VA'),('Hijuelas','VA'),('Isla de Pascua','VA'),('Juan Fernández','VA'),('La Cruz','VA'),('La Ligua','VA'),('Limache','VA'),('Llaillay','VA'),('Los Andes','VA'),('Nogales','VA'),('Olmué','VA'),('Panquehue','VA'),('Papudo','VA'),('Petorca','VA'),('Puchuncaví','VA'),('Putaendo','VA'),('Quillota','VA'),('Quilpué','VA'),('Quintero','VA'),('Rinconada','VA'),('San Antonio','VA'),('San Esteban','VA'),('San Felipe','VA'),('Santa María','VA'),('Santo Domingo','VA'),('Valparaiso','VA'),('Vi{a del Mar','VA'),('Villa Alemana','VA'),('Zapallar','VA');
/*!40000 ALTER TABLE `comunas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-09 23:28:15
