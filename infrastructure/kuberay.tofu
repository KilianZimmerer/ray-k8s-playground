resource "helm_release" "kuberay_operator" {
  name             = "kuberay-operator"
  repository       = "https://ray-project.github.io/kuberay-helm/"
  chart            = "kuberay-operator"
  namespace        = "kuberay-system"
  create_namespace = true
  version          = "1.5.1"

depends_on = [ null_resource.update_kubeconfig, module.eks ]
}

resource "null_resource" "update_kubeconfig" {
  depends_on = [module.eks]

  triggers = {
    endpoint = module.eks.cluster_endpoint
  }

  provisioner "local-exec" {
    environment = {
      AWS_PROFILE = var.aws_profile
    }

    command = "aws eks update-kubeconfig --region ${var.aws_region} --name ${module.eks.cluster_name}"
  }
}