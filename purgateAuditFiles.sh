#!/bin/bash
 
dia=$(date "+%A_%d/%m/%Y")
hora=$(date "+%H:%M")
 
if [ $EUID != 0 ]
then
  echo "Por favor, correr este script como root para mayor detalles. Usa mejor sudo."
  exit 1
fi
 
echo "Comienzo de limpiado de filesystem en la fecha: $dia $hora"
cd /var/log/audit/
find audit.log.* -mtime +7 -type f -exec rm -vf {} \;
 
sleep 3
 
echo "Purgado de archivos terminados en la fecha: $dia $hora "
