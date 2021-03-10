Syncthing Chart
===============

Forked from below chart

[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/flipenergy)](https://artifacthub.io/packages/search?repo=flipenergy)
# Helm chart for deploying Syncthing to K8s
**Go to artifact hub for versions.**

A simple helm chart for deploying [Syncthing](https://syncthing.net/) to k8s.

Syncthing uses UDP for discovery so NodePort must be used for the `backend` service (unless you figure something else out).

see [values.yaml](values.yaml) for configurations.

Install using Helm v3:

```
helm repo add flipenergy https://flipenergy.github.io/k8s-homelab/
helm install my-release flipenergy/syncthing
```
