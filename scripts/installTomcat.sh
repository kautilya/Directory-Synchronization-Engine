#!/bin/bash

source ../properties.sh

if [ -e $TOMCAT_INSTALL_DIR ]
then
  $TOMCAT_INSTALL_DIR/apache-tomcat-$TOMCAT_VERSION/bin/shutdown.sh
  rm -rf $TOMCAT_INSTALL_DIR
fi

mkdir $TOMCAT_INSTALL_DIR
tar -x -v -f $TOMCAT_PKG -z -C $TOMCAT_INSTALL_DIR

if [ $? -ne 0 ]
then
  echo "tar failed"
  exit 1
fi

cp $SOURCE_DIR/scripts/tomcat-users.xml $TOMCAT_INSTALL_DIR/apache-tomcat-$TOMCAT_VERSION/conf/tomcat-users.xml

if [ $? -ne 0 ]
then
  echo "cp tomcat users failed"
  exit 1
fi

$TOMCAT_INSTALL_DIR/apache-tomcat-$TOMCAT_VERSION/bin/startup.sh
