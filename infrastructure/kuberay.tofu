resource "helm_release" "kuberay_operator" {
  name             = "kuberay-operator"
  repository       = "https://ray-project.github.io/kuberay-helm/"
  chart            = "kuberay-operator"
  namespace        = "kuberay-system"
  create_namespace = true
  version          = "1.5.1"
}

resource "helm_release" "ray_cluster" {
  name       = "ray-cluster-tiny"
  repository = "https://ray-project.github.io/kuberay-helm/"
  chart      = "ray-cluster"
  namespace  = "default"
  version    = "1.5.1"

  depends_on = [helm_release.kuberay_operator]

  set = [
    {
      name  = "head.rayStartParams.num-cpus"
      value = "1"
    },
    {
      name  = "head.resources.limits.cpu"
      value = "1"
    },
    {
      name  = "head.resources.limits.memory"
      value = "2Gi"
    },
    {
      name  = "worker.replicas"
      value = "1"
    },
    {
      name  = "worker.resources.limits.cpu"
      value = "1"
    },
    {
      name  = "worker.resources.limits.memory"
      value = "2Gi"
    }
  ]
}