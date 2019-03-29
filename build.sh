#!/usr/bin/env bash

set -eux

jmc_version=`echo $(basename -a $JAVA_HOME/lib/missioncontrol/plugins/com.oracle.jmc.common_*.jar) | sed 's/.*_\(.*\)\.jar/\1/'`
bash install-mc-jars.sh
mvn clean package -Djmc.version=$jmc_version
