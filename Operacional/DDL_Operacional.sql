
-- 1 -----------------------------------------------------------------
-- OPERACIONAL
-- CREACION DE BASE DATOS
CREATE DATABASE IF NOT EXISTS OPERACIONAL
COMMENT 'BASE DE DATOS PARA OPERACIONAL'
LOCATION '/DATAMART_VENTAS/OPERACIONAL'
WITH DBPROPERTIES ('creator'='ing_delivery', 'date'='2021-04-27');

-- 2 -----------------------------------------------------------------
--CREACION DE TABLAS EXTERNAS PARQUET CON LOCATION

------------------
--F_VENTAS_PARQUET
------------------

CREATE EXTERNAL TABLE OPERACIONAL.F_VENTAS_PARQUET LIKE TEMPORAL.F_VENTAS_AVRO 
STORED AS PARQUET 
LOCATION '/DATAMART_VENTAS/OPERACIONAL/F_VENTAS_PARQUET'
TBLPROPERTIES ('creator'='ing_delivery', 'date'='2021-04-27');

ALTER TABLE OPERACIONAL.F_VENTAS_PARQUET CHANGE PRECIO_VENTA PRECIO_VENTA DOUBLE COMMENT 'Cambio PRECIO_VENTA de STRING a DOUBLE';
ALTER TABLE OPERACIONAL.F_VENTAS_PARQUET CHANGE CANTIDAD CANTIDAD DOUBLE COMMENT 'Cambio CANTIDAD de STRING a DOUBLE';
ALTER TABLE OPERACIONAL.F_VENTAS_PARQUET CHANGE TOTAL TOTAL DOUBLE COMMENT 'Cambio TOTAL de STRING a DOUBLE';

INSERT OVERWRITE TABLE OPERACIONAL.F_VENTAS_PARQUET
SELECT 
ID_BOLETA STRING, 
ID_CLIENTE STRING,
ID_CAJA STRING,
NRO_TRANSACCION STRING,
TIPO_MONEDA STRING,
TIPO_COMPROBANTE STRING,
ID_VENDEDOR STRING,
NRO_SERIE STRING,
ID_PRODUCTO STRING,
ID_FECHA STRING,
CAST(PRECIO_VENTA AS DOUBLE),
CAST(CANTIDAD AS DOUBLE), 
MODALIDAD_COMPRA STRING,
CAST(TOTAL AS DOUBLE)
FROM TEMPORAL.F_VENTAS_AVRO;

---------------------
--D_PRODUCTO_PARQUET
---------------------
CREATE EXTERNAL TABLE OPERACIONAL.D_PRODUCTO_PARQUET LIKE TEMPORAL.D_PRODUCTO_AVRO 
STORED AS PARQUET 
LOCATION '/DATAMART_VENTAS/OPERACIONAL/D_PRODUCTO_PARQUET'
TBLPROPERTIES ('creator'='ing_delivery', 'date'='2021-04-27');

ALTER TABLE OPERACIONAL.D_PRODUCTO_PARQUET CHANGE PRECIO PRECIO DOUBLE COMMENT 'Cambio PRECIO de STRING a DOUBLE';

INSERT OVERWRITE TABLE OPERACIONAL.D_PRODUCTO_PARQUET
SELECT 
ID_PRODUCTO STRING,
NOMBRE_PRODUCTO STRING,
ID_CATEGORIA STRING,
ID_MARCA STRING,
CAST(PRECIO AS DOUBLE)
FROM TEMPORAL.D_PRODUCTO_AVRO;

-------------------
--D_MARCA_PARQUET
-------------------
CREATE EXTERNAL TABLE OPERACIONAL.D_MARCA_PARQUET LIKE TEMPORAL.D_MARCA_AVRO 
STORED AS PARQUET 
LOCATION '/DATAMART_VENTAS/OPERACIONAL/D_MARCA_PARQUET'
TBLPROPERTIES ('creator'='ing_delivery', 'date'='2021-04-27');

INSERT OVERWRITE TABLE OPERACIONAL.D_MARCA_PARQUET
SELECT *
FROM TEMPORAL.D_MARCA_AVRO;

----------------------
--D_CATEGORIA_PARQUET
----------------------
CREATE EXTERNAL TABLE OPERACIONAL.D_CATEGORIA_PARQUET LIKE TEMPORAL.D_CATEGORIA_AVRO 
STORED AS PARQUET 
LOCATION '/DATAMART_VENTAS/OPERACIONAL/D_CATEGORIA_PARQUET'
TBLPROPERTIES ('creator'='ing_delivery', 'date'='2021-04-27');

INSERT OVERWRITE TABLE OPERACIONAL.D_CATEGORIA_PARQUET
SELECT *
FROM TEMPORAL.D_CATEGORIA_AVRO;

--------------------
--D_CLIENTE_PARQUET
--------------------
CREATE EXTERNAL TABLE OPERACIONAL.D_CLIENTE_PARQUET LIKE TEMPORAL.D_CLIENTE_AVRO 
STORED AS PARQUET 
LOCATION '/DATAMART_VENTAS/OPERACIONAL/D_CLIENTE_PARQUET'
TBLPROPERTIES ('creator'='ing_delivery', 'date'='2021-04-27');

INSERT OVERWRITE TABLE OPERACIONAL.D_CLIENTE_PARQUET
SELECT *
FROM TEMPORAL.D_CLIENTE_AVRO;

-----------------------
--D_VENDEDOR_PARQUET
-----------------------
CREATE EXTERNAL TABLE OPERACIONAL.D_VENDEDOR_PARQUET LIKE TEMPORAL.D_VENDEDOR_AVRO 
STORED AS PARQUET 
LOCATION '/DATAMART_VENTAS/OPERACIONAL/D_VENDEDOR_PARQUET'
TBLPROPERTIES ('creator'='ing_delivery', 'date'='2021-04-27');

INSERT OVERWRITE TABLE OPERACIONAL.D_VENDEDOR_PARQUET
SELECT *
FROM TEMPORAL.D_VENDEDOR_AVRO;

-----*******************************************************
-------------------
--D_FECHA_PARQUET
-------------------
CREATE TABLE OPERACIONAL.D_FECHA_PARQUET LIKE TEMPORAL.D_FECHA_AVRO 
STORED AS PARQUET 
LOCATION '/DATAMART_VENTAS/OPERACIONAL/D_FECHA_PARQUET'
TBLPROPERTIES ('creator'='ing_delivery', 'date'='2021-04-27');

INSERT OVERWRITE TABLE OPERACIONAL.D_FECHA_PARQUET
SELECT *
FROM TEMPORAL.D_FECHA_AVRO;

------------------
--D_ANO_PARQUET
------------------
CREATE EXTERNAL TABLE OPERACIONAL.D_ANO_PARQUET LIKE TEMPORAL.D_ANO_AVRO 
STORED AS PARQUET
LOCATION '/DATAMART_VENTAS/OPERACIONAL/D_ANO_PARQUET'
TBLPROPERTIES ('creator'='ing_delivery', 'created_at'='2021-04-27');

ALTER TABLE OPERACIONAL.D_ANO_PARQUET CHANGE ANO ANO DOUBLE COMMENT 'Cambio A??O de STRING a INT';

INSERT OVERWRITE TABLE OPERACIONAL.D_ANO_PARQUET
SELECT 
ID_ANO STRING,
CAST(ANO AS DOUBLE)
FROM TEMPORAL.D_ANO_AVRO;

-----------------
--D_MES_PARQUET
-----------------
CREATE EXTERNAL TABLE OPERACIONAL.D_MES_PARQUET LIKE TEMPORAL.D_MES_AVRO
STORED AS PARQUET
LOCATION '/DATAMART_VENTAS/OPERACIONAL/D_MES_PARQUET'
TBLPROPERTIES ('creator'='ing_delivery', 'created_at'='2021-04-25');

INSERT OVERWRITE TABLE OPERACIONAL.D_MES_PARQUET
SELECT *
FROM TEMPORAL.D_MES_AVRO;

-----------------
--D_DIA_PARQUET
-----------------
CREATE EXTERNAL TABLE OPERACIONAL.D_DIA_PARQUET LIKE TEMPORAL.D_DIA_AVRO
STORED AS PARQUET
LOCATION '/DATAMART_VENTAS/OPERACIONAL/D_DIA_PARQUET'
TBLPROPERTIES ('creator'='ing_delivery', 'created_at'='2021-04-25');

ALTER TABLE OPERACIONAL.D_DIA_PARQUET CHANGE DIA DIA DOUBLE COMMENT 'Cambio DIA de STRING a INT';

INSERT OVERWRITE TABLE OPERACIONAL.D_DIA_PARQUET
SELECT
ID_DIA STRING,
CAST(DIA AS DOUBLE)
FROM TEMPORAL.D_DIA_AVRO;


------------------
--D_HORA_PARQUET
------------------

CREATE EXTERNAL TABLE OPERACIONAL.D_HORA_PARQUET LIKE TEMPORAL.D_HORA_AVRO 
STORED AS PARQUET 
LOCATION '/DATAMART_VENTAS/OPERACIONAL/D_HORA_PARQUET'
TBLPROPERTIES ('creator'='ing_delivery', 'date'='2021-04-27');

INSERT OVERWRITE TABLE OPERACIONAL.D_HORA_PARQUET
SELECT *
FROM TEMPORAL.D_HORA_AVRO;

------------------
--D_LOCAL_PARQUET
------------------

CREATE EXTERNAL TABLE OPERACIONAL.D_LOCAL_PARQUET LIKE TEMPORAL.D_LOCAL_AVRO 
STORED AS PARQUET 
LOCATION '/DATAMART_VENTAS/OPERACIONAL/D_LOCAL_PARQUET'
TBLPROPERTIES ('creator'='ing_delivery', 'date'='2021-04-27');

INSERT OVERWRITE TABLE OPERACIONAL.D_LOCAL_PARQUET
SELECT *
FROM TEMPORAL.D_LOCAL_AVRO;

------------------
--D_CAJA_PARQUET
------------------

CREATE EXTERNAL TABLE OPERACIONAL.D_CAJA_PARQUET LIKE TEMPORAL.D_CAJA_AVRO 
STORED AS PARQUET 
LOCATION '/DATAMART_VENTAS/OPERACIONAL/D_CAJA_PARQUET'
TBLPROPERTIES ('creator'='ing_delivery', 'date'='2021-04-27');

INSERT OVERWRITE TABLE OPERACIONAL.D_CAJA_PARQUET
SELECT *
FROM TEMPORAL.D_CAJA_AVRO;

------------------
--F_STOCK_INVENTARIO
------------------

CREATE EXTERNAL TABLE OPERACIONAL.F_STOCK_INVENTARIO_PARQUET LIKE TEMPORAL.F_STOCK_INVENTARIO_AVRO 
STORED AS PARQUET 
LOCATION '/DATAMART_VENTAS/OPERACIONAL/F_STOCK_INVENTARIO_PARQUET'
TBLPROPERTIES ('creator'='ing_delivery', 'date'='2021-04-27');

ALTER TABLE OPERACIONAL.F_STOCK_INVENTARIO_PARQUET CHANGE STOCK_MINIMO STOCK_MINIMO DOUBLE COMMENT 'Cambio STOCKMINIMO de STRING a DOUBLE';
ALTER TABLE OPERACIONAL.F_STOCK_INVENTARIO_PARQUET CHANGE TOTAL TOTAL DOUBLE COMMENT 'Cambio TOTAL de STRING a DOUBLE';

INSERT OVERWRITE TABLE OPERACIONAL.F_STOCK_INVENTARIO_PARQUET
SELECT 
ID_STOCK_INVENTARIO STRING, 
ID_PRODUCTO STRING,
LOTE STRING,
FECHA_VENCIMIENTO STRING,
CAST(STOCK_MINIMO AS DOUBLE),
CAST(TOTAL AS DOUBLE)
FROM TEMPORAL.F_STOCK_INVENTARIO_AVRO;