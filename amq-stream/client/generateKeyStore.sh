#!/bin/bash

oc extract secret/my-cluster-cluster-ca-cert --keys=ca.crt --to=- > ca.crt
oc get secret my-cluster-cluster-ca-cert -o jsonpath='{.data.ca\.p12}' | base64 -d > ca.p12
oc get secret my-cluster-cluster-ca-cert -o jsonpath='{.data.ca\.password}' | base64 -d > ca.password

oc extract secret/quarkus --keys=quarkus.user.crt --to=- > user.crt
oc get secret quarkus -o jsonpath='{.data.user\.p12}' | base64 -d > user.p12
oc get secret quarkus -o jsonpath='{.data.user\.password}' | base64 -d > user.password


# Enter password as 'password'
keytool -keystore client.truststore.jks -alias CARoot -import -file ca.crt
# keytool -keystore client.keystore.jks -alias CARoot -import -file user.crt
