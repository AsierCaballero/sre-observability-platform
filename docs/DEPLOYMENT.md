# Deployment Guide

## Local Deployment (Docker Compose)

```bash
# Start all services
docker compose up -d

# Check status
./scripts/health-check.sh

# View logs
docker compose logs -f
```

## Kubernetes Deployment

```bash
kubectl apply -f k8s/
kubectl get pods -n monitoring
```

## AWS Deployment (Terraform)

```bash
cd terraform
terraform init
terraform plan
terraform apply
```

## Ports

| Service       | Port |
|---------------|------|
| Prometheus    | 9090 |
| Grafana       | 3000 |
| AlertManager  | 9093 |
| Loki          | 3100 |
| Jaeger        | 16686 |
| Sample App    | 8080 |