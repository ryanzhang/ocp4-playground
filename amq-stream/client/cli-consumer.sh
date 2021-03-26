#/bin/bash
ROUTE_ADDRESS=`oc get routes my-cluster-kafka-bootstrap -o=jsonpath='{.status.ingress[0].host}{"\n"}'`

kafka-console-consumer.sh --bootstrap-server $ROUTE_ADDRESS:443 --consumer-property security.protocol=SSL --consumer-property ssl.truststore.password=password --consumer-property ssl.truststore.location=./client.truststore.jks --topic my-topic --from-beginning
