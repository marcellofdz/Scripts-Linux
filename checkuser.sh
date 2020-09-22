#!/bin/bash
 
read -p "Introduzca un nombre de usuario: " usuario
#read usuario
echo -e ""
cat /etc/passwd | grep -i $usuario
echo -e ""
#chage -l $usuario
 
if [ $? -ne 0 ]; then
        echo -e "Este usuario no existe en el archivo /etc/passwd"
 
else
 
echo -e "       INFORMACION DE PASSWORD DE USUARIO: $usuario
================================================================
"
        chage -l $usuario
 
echo -e ""
 
echo -e "       PRIVILEGIOS USUARIO: $usuario
================================================================
"
 
sudo -l -U $usuario
 
echo -e "       INFORMACION DE CUENTA  DE USUARIO: $usuario
===============================================================
"
        lslogins $usuario
fi
 
echo -e ""
echo ---------Fin del script.-------------
