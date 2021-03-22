#!/bin/bash

oc extract secret/my-cluster-cluster-ca-cert --keys=ca.crt --to=- > ca.crt

# Enter password as 'password'
keytool -keystore client.truststore.jks -alias CARoot -import -file ca.crt
