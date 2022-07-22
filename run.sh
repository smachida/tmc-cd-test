#!/bin/bash

if [ $# -ne 1 ]; then
  echo "引数に start もしくは stop を指定してください"
  exit 1
fi

if [ $1 = "start" ]; then

  echo "Deploying ..."
  kubectl apply -k .

  echo "Waiting for the services to start up..."
  kubectl wait --timeout=600s --for=condition=ready pod --all -n default
fi

if [ $1 = "stop" ]; then
  echo "Deleting ..."
  kubectl delete -k .
fi

