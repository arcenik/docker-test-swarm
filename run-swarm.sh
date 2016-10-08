#! /bin/bash

VIRT="virtualbox"
VM_KS="mh-keystore"
VM_NODE1="node01"
VM_NODE2="node02"
VM_NODE3="node03"

echo "================================================================================"
echo "=== Starting Keystore VM"
docker-machine create -d ${VIRT} ${VM_KS}
eval "$(docker-machine env ${VM_KS})"

echo "================================================================================"
echo "=== Starting keystore consul"
docker run -d \
    -p "8500:8500" \
    -h "consul" \
    progrium/consul -server -bootstrap

echo "================================================================================"
echo "=== Starting node1 vm (master)"
docker-machine create -d ${VIRT} \
  --swarm --swarm-master \
  --swarm-discovery="consul://$(docker-machine ip ${VM_KS}):8500" \
  --engine-opt="cluster-store=consul://$(docker-machine ip ${VM_KS}):8500" \
  --engine-opt="cluster-advertise=eth1:2376" \
  ${VM_NODE1}

echo "================================================================================"
echo "=== Starting node2 vm"
docker-machine create -d ${VIRT} \
  --swarm \
  --swarm-discovery="consul://$(docker-machine ip ${VM_KS}):8500" \
  --engine-opt="cluster-store=consul://$(docker-machine ip ${VM_KS}):8500" \
  --engine-opt="cluster-advertise=eth1:2376" \
  ${VM_NODE2}

echo "================================================================================"
echo "=== Starting node3 vm"
docker-machine create -d ${VIRT} \
  --swarm \
  --swarm-discovery="consul://$(docker-machine ip ${VM_KS}):8500" \
  --engine-opt="cluster-store=consul://$(docker-machine ip ${VM_KS}):8500" \
  --engine-opt="cluster-advertise=eth1:2376" \
  ${VM_NODE3}
