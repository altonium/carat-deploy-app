# Install Notes

Basically, to deploy using helm, use commands like this:

```bash
helm install carat-core-dev ./ -n carat-dev --set image.repository=mydockeruser/myapp
```

Activate your kubeconfig

```bash
export KUBECONFIG=/Users/diablo/Library/CloudStorage/Dropbox/ssh-keys/kube/carat/kubeconfig.yml
```

Invoke `helm` manually like this:

```bash
helm upgrade --install carat-core-dev ./ -f carat-core/values-dev.yaml -n carat-dev
helm upgrade --install carat-core-stg ./ -f carat-core/values-stg.yaml -n carat-stg
helm upgrade --install carat-core-prd ./ -f carat-core/values-prd.yaml -n carat-prd
```

Get the image tag

```bash
kubectl get deployment carat-core-dev -n carat-dev -o=jsonpath='{$.spec.template.spec.containers[:1].image}'
```

To deploy to production, we tag latest `-stg` and push to as `-prd`.

```bash
docker pull altonium/carat-core-stg:latest
docker tag altonium/carat-core-stg:latest altonium/carat-core-prd:latest
docker push altonium/carat-core-prd:latest
```

Below commands are useful for debugging.

```bash
docker pull --platform linux/amd64 altonium/carat-core-dev@sha256:9ef112a96ef45e78100291bd91f319dd33fb1d1197ebdfce38c53935ba516e5a

curl -u altonium:yourpassword "https://auth.docker.io/token?service=registry.docker.io&scope=repository:yourusername/yourrepo:pull"

helm list -n <namespace>

# helm history <release-name> -n <namespace>
helm history carat-core-stg -n carat-stg

# helm rollback <release-name> <revision-number> -n <namespace>
helm rollback carat-core-stg 19 -n carat-stg
```
