use 0atorgar;

drop table if exists categoria;
CREATE TABLE categoria (
  id INTEGER NOT NULL,
  nombre VARCHAR(30) NOT NULL,
  PRIMARY KEY (id)
);

drop table if exists pais;
CREATE TABLE pais (
  id INTEGER NOT NULL,
  nombre VARCHAR(30) NOT NULL,
  PRIMARY KEY (id)
);

drop table if exists fabricante;
CREATE TABLE fabricante (
  id INTEGER NOT NULL,
  nombre VARCHAR(30) NOT NULL,
  ciudad VARCHAR(30) DEFAULT NULL,
  pais INTEGER DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (pais) REFERENCES pais (id)
);

CREATE TABLE articulo (
  id INTEGER NOT NULL,
  modelo VARCHAR(50) NOT NULL,
  precio INTEGER NOT NULL,
  categoria INTEGER DEFAULT NULL,
  temporada YEAR(4) DEFAULT NULL,
  fabricante INTEGER DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (categoria) REFERENCES categoria (id),
  FOREIGN KEY (fabricante) REFERENCES fabricante (id)
);



-- Datos categoria
INSERT INTO categoria VALUES (1,'Bota');
INSERT INTO categoria VALUES (2,'Zapato');
INSERT INTO categoria VALUES (3,'Zapatilla');
INSERT INTO categoria VALUES (4,'Deportivo running');
INSERT INTO categoria VALUES (5,'Deportivo trail');
INSERT INTO categoria VALUES (6,'Deportivo casual');

-- Datos pais
INSERT INTO pais VALUES (1,'España');
INSERT INTO pais VALUES (2,'Reino Unido');
INSERT INTO pais VALUES (3,'Portugal');
INSERT INTO pais VALUES (4,'Francia');
INSERT INTO pais VALUES (5,'Alemania');
INSERT INTO pais VALUES (6,'Estados Unidos');
INSERT INTO pais VALUES (7,'Italia');

-- Datos fabricante
INSERT INTO fabricante VALUES (1,'Camper','Palma de Mallorca',1);
INSERT INTO fabricante VALUES (2,'Pikolinos','Elche',1);
INSERT INTO fabricante VALUES (3,'Panama Jack','Elche',1);
INSERT INTO fabricante VALUES (4,'Toni Pons','Gerona',1);
INSERT INTO fabricante VALUES (5,'DR Martens','Wallaston',2);
INSERT INTO fabricante VALUES (6,'Nike','Beaverton',6);
INSERT INTO fabricante VALUES (7,'Puma','Herzogenaurach',5);
INSERT INTO fabricante VALUES (8,'Adidas','Herzogenaurach',5);
INSERT INTO fabricante VALUES (9,'Salomon','Annecy',4);
INSERT INTO fabricante VALUES (10,'Suministros Málaga SA','Málaga',1);
INSERT INTO fabricante VALUES (11,'Martinelli',NULL,NULL);
INSERT INTO fabricante VALUES (12,'Emidio Tucci','Madrid',1);
INSERT INTO fabricante VALUES (13,'Magnanni','Almansa (Albacete)',1);


-- Datos articulo
INSERT INTO articulo VALUES (1,'Bota Gore-Tex',190,1,2017,1);
INSERT INTO articulo VALUES (2,'Botín piel elastico',150,1,2018,2);
INSERT INTO articulo VALUES (3,'Botín piel',179,1,2020,3);
INSERT INTO articulo VALUES (4,'Botín serraje marrón',45,2,2017,4);
INSERT INTO articulo VALUES (5,'Cordón Unisex negro',140,2,2019,5);
INSERT INTO articulo VALUES (6,'Casual Unisex vintage 77',90,6,2019,6);
INSERT INTO articulo VALUES (7,'Unisex Future Raider',85,6,2020,7);
INSERT INTO articulo VALUES (8,'Mujer Future Raider',85,6,2017,7);
INSERT INTO articulo VALUES (9,'Escape run nike',95,4,2018,6);
INSERT INTO articulo VALUES (10,'Liberate Nitro puma',110,4,2021,7);
INSERT INTO articulo VALUES (11,'Terrex Agravic',140,5,2020,8);
INSERT INTO articulo VALUES (12,'Response super adidas',90,4,2020,8);
INSERT INTO articulo VALUES (13,'Run Falcon',120,4,2018,8);
INSERT INTO articulo VALUES (14,'Pegasus Trail-2',150,5,2017,6);
INSERT INTO articulo VALUES (15,'Pro 3D v8 Gore-Tex',160,5,2021,9);
INSERT INTO articulo VALUES (16,'Cordón 30 cm blanco',3,NULL,NULL,10);
INSERT INTO articulo VALUES (17,'Crema zapato negra',5,NULL,NULL,10);
INSERT INTO articulo VALUES (18,'Cepillo piel',4,NULL,NULL,NULL);
INSERT INTO articulo VALUES (19,'Plantilla devorolor',12,NULL,NULL,NULL);
INSERT INTO articulo VALUES (20,'Zapatos cordones punta recta',109,2,2021,12);
INSERT INTO articulo VALUES (21,'Buches con punta recta y hevillas',229,2,2022,13);
INSERT INTO articulo VALUES (22,'Bota Jax plus',120,1,2021,1);
INSERT INTO articulo VALUES (23,'Bota media caña',98,1,2023,3);
INSERT INTO articulo VALUES (24,'Bota Emerson',80,1,2022,1);


