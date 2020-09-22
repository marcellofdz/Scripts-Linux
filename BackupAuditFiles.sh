#!/bin/bash
 

FILENAME="AUDITLOG-`date +%y%m%d`-`date +%H%M`.bak.tar"
dia=$(date "+%A_%d/%m/%Y")
hora=$(date "+%H:%M")
 
if [ $EUID != 0 ]
then
  echo "Por favor, correr este script como root para mayor detalles. Usa mejor sudo."
  exit 1
fi
 
echo "COMENZANDO BACKUP $dia"
 
cd /var/log/audit
for i in `find audit* -mtime +7 -type f -exec ls {} \;` ;
do 
  tar cJvf audit$FILENAME
$i;done
 
sleep 2
 
mv audit$FILENAME.bak.tar /tmp/
echo "  BACKUP FINALIZADO "
 
echo "Archivo generado con el nombre: audit$FILENAME"
echo "En la ruta /tmp/audit$FILENAME"
