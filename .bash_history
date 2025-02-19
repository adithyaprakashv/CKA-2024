sudo apt update -y 
curl -Lo ./kind "https://kind.sigs.k8s.io/dl/latest/kind-linux-amd64"
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
kind version
kind create cluster --image kindest/node:v1.29.14@sha256:8703bd94ee24e51b778d5556ae310c6c0fa67d761fae6379c8e0bb480e6fea29 --name cka-cluster
# Update package list
sudo apt update
# Install required dependencies
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
# Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
# Add Docker repository
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# Install Docker
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io
# Start and enable Docker service
sudo systemctl start docker
sudo systemctl enable docker
# Verify Docker installation
docker --version
sudo usermod -aG docker $USER
newgrp docker  # Apply changes without logout
kind cluster --image kindest/node:v1.29.14@sha256:8703bd94ee24e51b778d5556ae310c6c0fa67d761fae6379c8e0bb480e6fea29 --name cka-cluster1
kind create cluster --image kindest/node:v1.29.14@sha256:8703bd94ee24e51b778d5556ae310c6c0fa67d761fae6379c8e0bb480e6fea29 --name cka-cluster1
kubectl cluster-info --context kind-cka-cluster1
kubectl get nodes
vi config.yaml
kind create cluster --image kindest/node:v1.29.14@sha256:8703bd94ee24e51b778d5556ae310c6c0fa67d761fae6379c8e0bb480e6fea29 --name cka-cluster2 --config config.yaml
kubectl get nodes
kubectl cluster-info --context kind-cka-cluster2
kubectl config --set-context kind-cka-cluster1 kubectl config get-contexts
kubectl config get contexts
kubectl config get-contexts
kubectl config use-context kind-cka-cluster1
kubectl get nodes
kubectl config use-context kind-cka-cluster1
kubectl get nodes
kubectl config use-context kind-cka-cluster2
kubectl get nodes
