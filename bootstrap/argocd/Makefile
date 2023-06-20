default: namespace argocd wait

.PHONY: namespace
namespace:
	kubectl create namespace argocd --dry-run=client --output=yaml \
		| kubectl apply -f -

.PHONY: argocd
argocd:
	helm template \
    --dependency-update \
    --include-crds \
    --namespace argocd \
    --values values.yaml \
    argocd . \
    | kubectl apply -n argocd -f -

.PHONY: wait
wait:
	kubectl -n argocd wait --timeout=60s --for condition=Established \
       crd/applications.argoproj.io \
       crd/applicationsets.argoproj.io