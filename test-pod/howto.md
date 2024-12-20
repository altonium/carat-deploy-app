kubectl apply -f test-pod.yaml -n carat-dev

kubectl apply -f test-pod.yaml -n carat-stg

kubectl apply -f test-pod.yaml -n carat-prd


curl http://carat-services-dev.carat-dev.svc.cluster.local:3000/hello



//install curl
apt update && apt install -y curl

//install redis-cli
apt update && apt install -y redis-tools

//install psql-cli
apt update && apt install -y postgresql-client