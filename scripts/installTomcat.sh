#!/bin/bash

source ../properties.sh

function check_exit()
{
  if [ $? -ne $1 ]
  then
    echo "$2"
    exit 1
  fi
}

if [ -e $TOMCAT_INSTALL_DIR ]
then
  $TOMCAT_INSTALL_DIR/apache-tomcat-$TOMCAT_VERSION/bin/shutdown.sh
  rm -rf $TOMCAT_INSTALL_DIR
fi

mkdir $TOMCAT_INSTALL_DIR
tar -x -v -f $TOMCAT_PKG -z -C $TOMCAT_INSTALL_DIR

check_exit 0 "Tar Failed"

cp $SOURCE_DIR/scripts/tomcat-users.xml $TOMCAT_INSTALL_DIR/apache-tomcat-$TOMCAT_VERSION/conf/tomcat-users.xml

check_exit 0 "cp Failed"

patch -p0 $TOMCAT_INSTALL_DIR/apache-tomcat-$TOMCAT_VERSION/bin/catalina.sh $SOURCE_DIR/scripts/tc-$TOMCAT_VERSION.catalina.sh.patch

check_exit 0 "patch Failed"

$TOMCAT_INSTALL_DIR/apache-tomcat-$TOMCAT_VERSION/bin/startup.sh
