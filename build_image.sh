make docker-build
docker tag reg.navercorp.com/clops-playground/pipeline/oidc-authservice:latest reg.navercorp.com/clops-playground/pipeline/oidc-authservice:0.${1}
docker push reg.navercorp.com/clops-playground/pipeline/oidc-authservice:0.${1}
#k -n istio-system patch statefulset authservice -p '{"spec":{"template":{"spec":{"containers":[{"name":"kubernetes-serve-hostname","reg.navercorp.com/clops-playground/pipeline/oidc-authservice":"0.$1"}]}}}}'
k -n istio-system edit statefulset
