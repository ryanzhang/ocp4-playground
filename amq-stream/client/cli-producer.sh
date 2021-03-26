#/bin/bash
ROUTE_ADDRESS=`oc get routes my-cluster-kafka-bootstrap -o=jsonpath='{.status.ingress[0].host}{"\n"}'`

kafka-console-producer.sh --broker-list $ROUTE_ADDRESS:443 --producer.config producer_ssl.properties --topic my-topic
