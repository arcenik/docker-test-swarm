#! /bin/bash

VIRT="virtualbox"
VM_KS="mh-keystore"
VM_NODE1="node01"
VM_NODE2="node02"
VM_NODE3="node03"

docker-machine stop  ${VM_NODE1} ${VM_NODE2} ${VM_NODE3} ${VM_KS}
docker-machine rm -f ${VM_NODE1} ${VM_NODE2} ${VM_NODE3} ${VM_KS}
