Project Overview
This project deploys a Flask web application to Google Kubernetes Engine (GKE) using:

Terraform to provision GKE and Kubernetes resources

Docker to containerize the Flask app

Kubernetes Service to expose the app to the internet via LoadBalancer

Architecture
Local Machine:
  - Build Docker Image
  - Push Image to Google Container Registry (GCR)

Terraform:
  - Create GKE Cluster
  - Deploy Kubernetes Deployment & Service

GKE:
  - Run Flask App Containers
  - Expose App via LoadBalancer
Tech Stack
Google Cloud (GKE, GCR)

Terraform

Docker

Kubernetes

Flask (Python)

Manual Deployment Process
1️⃣ Build and Push Docker Image
gcloud auth configure-docker

docker build -t flask-app .
docker tag flask-app gcr.io/flask-gke-2025/flask-app:latest
docker push gcr.io/flask-gke-2025/flask-app:latest
2️⃣ Provision Infrastructure and Deploy App

terraform init
terraform apply
3️⃣ Access the App
Get the LoadBalancer IP:

kubectl get service flask-service
Visit:

http://<EXTERNAL-IP>

Folder Structure
flask-gke-terraform/
├── app/
│   ├── app.py
│   ├── requirements.txt
│   └── Dockerfile
├── terraform/
│   ├── main.tf
│   ├── provider.tf
│   └── outputs.tf
├── README.md
Project Purpose
This project demonstrates:

Infrastructure as Code using Terraform

Containerization using Docker

Cloud-native deployment using Kubernetes (GKE)

