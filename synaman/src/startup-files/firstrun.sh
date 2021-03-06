#!/bin/bash

if [ -f "/opt/SynaMan/run.sh" ]; then
echo "SynaMan files are in place"
else
mkdir -p /opt/SynaMan
cp -r /root/temp/SynaMan/*  /opt/SynaMan/
fi

cd /opt/SynaMan
CP=
for i in `ls lib/*.jar`
do
CP=$CP:$i
done
echo $CP
exec java -server -Xmx128m -cp $CP -DLoggingConfigFile=logconfig.xml com.synametrics.sradef.BootLoader &
