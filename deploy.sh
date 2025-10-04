#!/bin/bash

# Ensure Minikube is running
minikube status || minikube start --driver=docker

# Pull the latest Docker image from Docker Hub
docker pull alexguria17/wisecow-app:latest

# Apply Kubernetes manifests
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml

# Wait for rollout to finish
kubectl rollout status deployment/wisecow-deployment

# Show current pods and services
kubectl get pods
kubectl get svc

# Show the service URL
echo "Access Wisecow service at:"
minikube service wisecow-service --url

