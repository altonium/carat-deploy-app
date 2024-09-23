helm install carat-core-dev ./ -n carat-dev \
  --set image.repository=mydockeruser/myapp




  helm upgrade --install carat-core-dev ./ -f carat-core/values-dev.yaml -n carat-dev
  helm upgrade --install carat-core-stg ./ -f carat-core/values-stg.yaml -n carat-stg
  helm upgrade --install carat-core-prd ./ -f carat-core/values-prd.yaml -n carat-prd



kubectl get deployment carat-core-dev -n carat-dev -o=jsonpath='{$.spec.template.spec.containers[:1].image}'

   
docker pull altonium/carat-core-stg:latest

docker tag altonium/carat-core-stg:latest altonium/carat-core-prd:latest
docker push altonium/carat-core-prd:latest


docker pull  --platform linux/amd64 altonium/carat-core-dev@sha256:9ef112a96ef45e78100291bd91f319dd33fb1d1197ebdfce38c53935ba516e5a






curl -u altonium:yourpassword "https://auth.docker.io/token?service=registry.docker.io&scope=repository:yourusername/yourrepo:pull"
