.PHONY: root
root:
	helm template \
    --include-crds \
    --namespace argocd \
    --values values.yaml \
    argocd . \
    | kubectl apply -n argocd -f -