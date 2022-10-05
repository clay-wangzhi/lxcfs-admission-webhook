#!/bin/bash

kubectl delete -f deployment/mutatingwebhook-ca-bundle.yaml
kubectl delete -f deployment/service.yaml
kubectl delete -f deployment/deployment.yaml
kubectl -n sre delete secret lxcfs-admission-webhook-certs

