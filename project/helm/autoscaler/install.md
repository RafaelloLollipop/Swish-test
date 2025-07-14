helm repo add autoscaler https://kubernetes.github.io/autoscaler
helm repo update

helm install cluster-autoscaler autoscaler/cluster-autoscaler \
--namespace kube-system \
--create-namespace \
-f ./values.yaml
