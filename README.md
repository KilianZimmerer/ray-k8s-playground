# ray-k8s-playground
A playground for deploying Ray on Kubernetes (kind) using OpenTofu.

## Setup AWS Infrastructure and KubeRay-Operator

You need to have aws-cli, kubectl, tofu installed.

### Configure AWS Crdentials

Set your aws credentials via

```bash
aws configure
```

### Deploy KubeRay via EKS

Deploy K8s-Cluster and Kuberay-Operator with your specific variables

```bash
cd infrastructure
tofu init
tofu apply -var="aws_profile=default" -var="aws_region=eu-central-1"
```

and test kuberay-operator setup

```bash
kubectl get nodes
kubectl get all -n kuberay-system
```
