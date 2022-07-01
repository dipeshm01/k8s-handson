#!/bin/bash
set -x
kubectl -n aem scale deploy test-ops-1460-publish2-dispatcher --replicas=0
time_limit=300
time_started=$(date +%s)
time_spent=$(($(date +%s) - $time_started))
while [[ $(kubectl -n aem get po -l 'env=test-ops-1460-publish2-dispatcher' -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') == "True" ]]; do 
echo wait;
echo $time_spent
time_spent=$(($(date +%s) - $time_started))
kubectl -n aem get po -l 'env=test-ops-1460-publish2-dispatcher' -o wide
done;
set +x

b0Y3GW