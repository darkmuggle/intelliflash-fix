#!/bin/bash

REG=${1?:first arg must be the base registry}
REPO=${2?:second arg must the repo for the registry}

podman load < /intelliflash-csi-file-driver/bin/intelliflash-csi-file-driver.tar;
podman push localhost/intelliflash-csi-file-driver:master ${REG}/${REPO}:intelliflash-csi-file-driver-master
sed -e "s|###IMAGE##|${REG}/${REPO}:intelliflash-csi-file-driver-master|g" \
	lib/intelliflash-csi-file-driver.yaml > intelliflash-csi-file-driver.yaml

podman load < intelliflash-csi-block-driver/bin/intelliflash-csi-block-driver.tar;
podman push localhost/intelliflash-csi-block-driver:master ${REG}/${REPO}:intelliflash-csi-block-driver-master
sed -e "s|###IMAGE##|${REG}/${REPO}:intelliflash-csi-block-driver-master|g" \
	lib/intelliflash-csi-block-driver.yaml > intelliflash-csi-block-driver.yaml

