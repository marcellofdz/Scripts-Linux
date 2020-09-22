#!/bin/bash

function hardwareinfo {
echo "--------------------------------"
echo "Hostname: "`hostname`
echo "Direccion IP: `hostname -I`"
echo "Fecha:  `date`"
echo "--------------------------------"


echo "          HARDWARE INFO   "
echo "--------------------------------"
echo "************* PROCESADOR **************"
echo -e "`lscpu | grep -iE 'cpu|socket'`"
echo ""
echo "************* OS RHEL **************"
echo `cat /etc/*-release`
echo ""

echo "************* MEMORIA **************"
echo -e "`free -h`"

echo "************* FILESYSTEM **************"
echo -e "`df -hPT`"


}

hardwareinfo > hardware-`hostname`.txt

cat hardware-`hostname`.txt
