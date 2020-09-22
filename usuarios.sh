#!/bin/bash
 

if [ $EUID != 0 ]
then
  echo "Por favor, correr este script como root para mayor detalles. Usa mejor sudo."
  exit 1
fi
rm sysusers*
function sysusers {
 
echo "`hostname`"
echo "##########################################################"
echo "          Cantidad de usuarios             "
echo "**********************************************************"
echo "`getent passwd | grep -E "/bin/bash|/bin/sh"`"
echo "##########################################################"
echo "          USUARIOS GRUPO WHEELS   "
echo "**********************************************************"
echo "`cat /etc/group | grep wheel`"
echo "##########################################################"
echo "          USUARIOS CON PERMISOS SUDO /ETC/SUDOERS  "
echo "**********************************************************"
echo "`cat /etc/sudoers | grep -i "ALL="`"
echo "**********************************************************"
 
}
 
FILENAME="sysusers-`hostname`-`date +%Y%m%d`-`date +%H%M`.txt"
sysusers > $FILENAME
echo -e "Archivo de reporte $FILENAME generado en el directorio actual."
cat $FILENAME
