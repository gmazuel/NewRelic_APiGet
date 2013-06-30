#!/bin/bash
# TREE(3e) Extractor de datos desde API NewRelic
# 11 de Junio 2013
# Version 1.0
# Ref: https://github.com/newrelic/newrelic_api

# Configuración de Variables
# Directorio de Trabajo
home_work=/newrelic

# Sub Directrio de trabajo|
sub_work=/scripts

# Archivo de almacenamiento de Api Key


for $home_worl/$sub_work/api_key in `cat api_keys`
do
# Crea el directorio de trabajo
DIR=$home_work/scripts/$api_key 
if [ ! -d "$DIR" ]; then                                        
mkdir "$DIR"  
if [ $? -eq 0 ]; then 
echo "$DIR" ha sido creado..."  
else 
echo "Se produce un error al crear "$DIR"  
fi 
else 
echo "Se usará "$DIR" existente"
fi
exit
# Extracion de Información de la Cuenta
echo "Extracción de Cuentas Account ID" 
echo "#############################"
echo "curl -gH \"x-api-key:$api_key\" 'https://api.newrelic.com/api/v1/accounts.xml'"
echo "#############################"
curl -gH "x-api-key:$api_key" 'https://api.newrelic.com/api/v1/accounts.xml' > $api_key.accounts.xml
echo "#############################"
echo
cat $api_key.accounts.xml|grep "<name>"
cat $api_key.accounts.xml|grep "</id>"
done


exit
