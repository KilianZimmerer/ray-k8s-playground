# ray-k8s-playground
A playground for deploying Ray on Kubernetes (kind) using OpenTofu.

## Setup AWS Infrastructure and KubeRay

You need to have aws-cli, kubectl, tofu installed.

### Configure AWS Crdentials

Set your aws credentials via

```bash
aws configure
```

### Deploy KubeRay via EKS

Deploy K8s-Cluster with

```bash
cd infrastructure
tofu init
tofu apply
```

### Generate kubeconfig

```bash
aws eks update-kubeconfig --region eu-central-1 --name ray-k8s-playground
```

and test:

```bash
kubectl get nodes
```

### Forward Kuberay GUI

```bash
kubectl port-forward service/ray-cluster-tiny-kuberay-head-svc 8265:8265
```

And open GUI at `http://localhost:8265/`