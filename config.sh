#!/bin/bash

TIMESTAMP=`date "+%s"`
MYIP=`hostname -I`
#MYIP=`cat /etc/hosts | grep -v 127.0.0.1 | grep -v ::1 | awk '{print $1}' `
echo $TIMESTAMP
echo $MYIP

## 

YAML_PATH=/data/SIEM/elasticsearch/config/node2
YAML_PATH2=/data/SIEM/elasticsearch/config/node2.origin

cp -rf $YAML_PATH2 $YAML_PATH

sed -i "s|ESDTNODE|n$TIMESTAMP|" $YAML_PATH/elasticsearch.yml

sed -i "s|MYPRIVATEIP|$MYIP|" $YAML_PATH/elasticsearch.yml

mv $YAML_PATH /data/SIEM/elasticsearch/config/n$TIMESTAMP
