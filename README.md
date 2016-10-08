
Simple script to demonstrate docker-swarm with docker-machine and Virtualbox.

This is currently not working due to API mismatch between Docker CLI and Swarm.

## Run the swarm

* ./run-swarm.sh
* eval $(docker-machine env --swarm node01)
* docker info
* docker version

## Run the service

* docker network create -d overlay catnet
* docker network ls
* docker service create --network catnet --name cat-app vegasbrianc/cats


    Error response from daemon: 404 page not found

## Known problem / 2016/10/08

* [Issue 25626 (closed)](https://github.com/docker/docker/issues/25626)
* [Issue 25498](https://github.com/docker/docker/issues/25498)

The problem :

    docker service ls
    Error response from daemon: 404 page not found

Docker versions :

    docker version
    Client:
     Version:      1.12.1
     API version:  1.24
     Go version:   go1.7
     Git commit:   23cf638
     Built:        Fri Aug 19 02:03:02 2016
     OS/Arch:      linux/amd64

    Server:
     Version:      swarm/1.2.5
     API version:  1.22
     Go version:   go1.5.4
     Git commit:   27968ed
     Built:        Thu Aug 18 23:10:29 UTC 2016
     OS/Arch:      linux/amd64
