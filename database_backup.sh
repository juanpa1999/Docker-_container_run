#!/bin/bash

echo "datase back up in proguess"

# conectarte al contenedor y generar el backup
sleep 3


sudo docker exec -t CONTAINER_NAME pg_dump -U USER -d DATA_BASE_NAME -F c -f /backup.dump

sleep 3
# Una vez creado el backup dentro del contenedor, cópialo a tu máquina con

sudo docker cp CONTAINER_NAME:/backup.dump ./backup.dump

sleep 3

aws s3 cp ./backup.dump s3://pablodevops-bucket-terraform/ --recursive


#echo "restore in progress"

# Comando para copiar el archivo al contenedor

# sudo docker cp backup.dump CONTAINER_NAME:/backup.dump

# sudo docker exec -t CONTAINER_NAME pg_restore -U USER -d DATA_BASE_NAME -F c /backup.dump
