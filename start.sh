#!/bin/bash
. /home/eirsapp/.bash_profile

#Check for VIP for HA. In case VIP not found on this server then exit
set -x
VAR=""
commonConfigurationFile=$commonConfigurationFilePath
source $commonConfigurationFile
build_path="${APP_HOME}/SmsService/SmsCallback"
build="callbackService.jar"
cd $build_path
status=`ps -ef | grep $build | grep java`
if [ "$status" != "$VAR" ]
then
 echo "Process Already Running"
else
 echo "Starting Process"
java -Dlog4j.configurationFile=file:./log4j2.xml  -Dspring.config.location=file:./application.properties,file:${APP_HOME}/configuration/configuration.properties -jar $build_path/$build &
echo "Process Started"
fi
