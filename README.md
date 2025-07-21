# Flask App Deployment on GKE using Terraform and Docker

## Project Overview

This project demonstrates how to deploy a **Flask web application** on **Google Kubernetes Engine (GKE)** using:

- **Terraform** – to provision the GKE cluster and Kubernetes resources  
- **Docker** – to containerize the Flask application  
- **Kubernetes Service** – to expose the app to the internet with a LoadBalancer

## Architecture

```
Local Machine:
  - Build Docker Image
  - Push Image to Google Container Registry (GCR)

Terraform:
  - Create GKE Cluster
  - Deploy Kubernetes Deployment & Service

GKE:
  - Run Flask App Containers
  - Expose App via LoadBalancer (External IP)
```

## Tech Stack

- **Google Cloud Platform (GKE, GCR)**
- **Terraform**
- **Docker**
- **Kubernetes**
- **Flask (Python)**

## Deployment Steps

### 1️⃣ Build and Push Docker Image

gcloud auth configure-docker

docker build -t flask-app .
docker tag flask-app gcr.io/flask-gke-2025/flask-app:latest
docker push gcr.io/flask-gke-2025/flask-app:latest
```

### 2️⃣ Deploy Infrastructure with Terraform

terraform init
terraform apply
```

### 3️⃣ Access the Flask App

After deployment, get the LoadBalancer IP:

kubectl get service flask-service
```

Open in your browser:

```
http://<EXTERNAL-IP>
```

## Project Structure

```
flask-gke-terraform/
├── app/
│   ├── app.py              # Flask application
│   ├── requirements.txt    # Python dependencies
│   └── Dockerfile          # Docker build instructions
├── terraform/
│   ├── main.tf              # GKE Cluster & Kubernetes Deployment/Service
│   ├── provider.tf          # GCP & Kubernetes provider configs
│   └── outputs.tf           # Outputs for service IP etc.
├── README.md
```

## Project Purpose

This project gives hands-on experience in:

- **Infrastructure Automation (IaC)** with Terraform  
- **Containerization** with Docker  
- **Cloud-native Application Deployment** using Kubernetes on GKE  

It simulates real-world DevOps workflows for cloud infrastructure and microservices deployment.



