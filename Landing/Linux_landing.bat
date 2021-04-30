# 1 LINUX
# Crear Carpetas en LINUX
mkdir -p datamart/dataset
mkdir datamart/schema
mkdir datamart/scripts

# 2 Subir archivos manualmente a carpetas creadas en Linux DATASET Y AVRO SCHEMA

# 3 HDFS
# Crear Carpetas en HDFS
hdfs dfs -mkdir -p /DATAMART_VENTAS/TEMPORAL
hdfs dfs -mkdir /DATAMART_VENTAS/TEMPORAL/SCHEMA_AVRO

# 4 Subir Schemas Avro de LINUX a HDFS

hdfs dfs -put datamart/schema/* /DATAMART_VENTAS/TEMPORAL/SCHEMA_AVRO

# 5 (DDL_LANDING)
# 6 (DDL_LANDING)



 
