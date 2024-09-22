helm install carat-core-dev ./ -n carat-dev \
  --set image.repository=mydockeruser/myapp




  helm upgrade --install carat-core-dev ./ -f carat-core/values-dev.yaml -n carat-dev
  helm upgrade --install carat-core-stg ./ -f carat-core/values-stg.yaml -n carat-stg
  helm upgrade --install carat-core-prd ./ -f carat-core/values-prd.yaml -n carat-prd



kubectl get deployment carat-core-dev -n carat-dev -o=jsonpath='{$.spec.template.spec.containers[:1].image}'

   
docker pull altonium/carat-core-stg:latest

docker tag altonium/carat-core-stg:latest altonium/carat-core-prd:latest
docker push altonium/carat-core-prd:latest