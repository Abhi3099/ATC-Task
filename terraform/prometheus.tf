resource "helm_release" "prometheus_operator" {
  name       = "prometheus-operator"
  namespace  = "default"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  version    = "45.7.1"

  values = [<<-EOF
    prometheusOperator:
      createCustomResource: true
    EOF
  ]
  set {
    name  = "server.persistentVolume.enabled"
    value = false
  }
  set {
    name  = "podSecurityPolicy.enabled"
    value = true
  }
}
