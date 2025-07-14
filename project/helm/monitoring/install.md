helm upgrade --install monitoring prometheus-community/kube-prometheus-stack \
--namespace monitoring \
--create-namespace \
-f values.yaml
