#!/bin/bash

echo "Setting up Prometheus..."
wget https://github.com/prometheus/prometheus/releases/download/v2.52.0/prometheus-2.52.0.linux-amd64.tar.gz
tar xvf prometheus-2.52.0.linux-amd64.tar.gz
cd prometheus-2.52.0.linux-amd64
cp ../../prometheus/prometheus.yml .
cp ../../prometheus/alert.rules.yml .
./prometheus --config.file=prometheus.yml &

echo "Setting up Node Exporter..."
cd ..
wget https://github.com/prometheus/node_exporter/releases/download/v1.8.0/node_exporter-1.8.0.linux-amd64.tar.gz
tar xvf node_exporter-1.8.0.linux-amd64.tar.gz
cd node_exporter-1.8.0.linux-amd64
./node_exporter &

echo "Setup complete. Prometheus at http://localhost:9090, Node Exporter at http://localhost:9100"
