VERSION 0.6

build:
  FROM fedora:rawhide
  ARG --required VARIANT
  RUN dnf install -y ostree rpm-ostree selinux-policy
  RUN ostree init --repo build-tree --mode archive
  COPY --dir $VARIANT Common .
  RUN --privileged rpm-ostree compose tree $VARIANT/core.yaml --repo build-tree --unified-core
  RUN ostree summary --repo build-tree -u

build-core:
  BUILD --platform=linux/amd64 --platform=linux/arm64 +build --VARIANT=Core

build-home:
  BUILD --platform=linux/amd64 --platform=linux/arm64 +build --VARIANT=Home

build-forward:
  BUILD --platform=linux/amd64 --platform=linux/arm64 +build --VARIANT=Forward