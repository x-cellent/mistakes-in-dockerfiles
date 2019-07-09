# install Minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
  && sudo install minikube-linux-amd64 /usr/local/bin/minikube

# deleate ~/./minikube/cache/iso/*.iso
minikube stop; minikube delete
minikube start

#curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
#  && chmod +x minikube
#sudo cp minikube /usr/local/bin && rm minikube

# install kubectl

sudo apt-get update && sudo apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl


