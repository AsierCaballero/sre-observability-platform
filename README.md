# SRE Observability Platform

Plataforma de observabilidad para entornos de producción con Prometheus, Grafana, Loki, Jaeger y más.

## Servicios

| Servicio | Puerto | Descripción |
|----------|--------|-------------|
| Prometheus | 9090 | Métricas e infraestructura |
| Grafana | 3000 | Dashboards y visualización |
| AlertManager | 9093 | Gestión de alertas |
| Loki | 3100 | Agregación de logs |
| Jaeger | 16686 | Tracing distribuido |
| Node Exporter | 9100 | Métricas de sistema |
| Blackbox Exporter | 9115 | Monitorización externa |
| Sample App | 8080 | App demo con métricas |

## Quick Start

```bash
docker compose up -d
./scripts/health-check.sh
```

## Scripts

| Script | Función |
|--------|---------|
| `scripts/health-check.sh` | Verificar estado de servicios |
| `scripts/manage.sh` | start/stop/restart/status |
| `scripts/backup.sh` | Backup de configuraciones |
| `scripts/restore.sh` | Restaurar configuraciones |

## Componentes

- **Dashboards**: Infrastructure, SLO, Logs
- **Sample App**: Flask con métricas Prometheus
- **Infra**: Kubernetes manifests, Terraform AWS
- **CI/CD**: GitHub Actions

## Deployment

### Docker Compose (local)
```bash
docker compose up -d
```

### Kubernetes
```bash
kubectl apply -f k8s/
```

### AWS (Terraform)
```bash
cd terraform
terraform init && terraform apply
```

## Documentación

- [Deployment Guide](docs/DEPLOYMENT.md)
- [Changelog](CHANGELOG.md)
