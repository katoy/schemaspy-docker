#!/bin/bash
rm -fr output/*
docker run -v "$PWD/output:/output" -v "$PWD/config/schemaspy.properties:/schemaspy.properties" schemaspy/japanese:ipaexg00401
