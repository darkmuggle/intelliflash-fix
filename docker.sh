#!/bin/bash

REG=${1:?first arg must be the base registry}
REPO=${2?:second arg must the repo for the registry}

docker run --privileged --rm -it \
	--workdir /src \
	-v $PWD:/src \
	-v $HOME/.docker:/root/.docker:ro \
	quay.io/containers/podman /bin/bash /src/podman.sh ${REG} ${REPO}
