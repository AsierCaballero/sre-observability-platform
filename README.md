# SRE Observability Platform

Plataforma de observabilidad para entornos de producción.

## Servicios

| Servicio | Puerto | Descripción |
|----------|--------|-------------|
| Prometheus | 9090 | Métricas |
| Grafana | 3000 | Dashboards |
| AlertManager | 9093 | Alertas |
| Loki | 3100 | Logs |
| Jaeger | 16686 | Tracing |
| Sample App | 8080 | App demo |

## Quick Start

```bash
docker compose up -d
./scripts/health-check.sh
```

## Scripts

| Script | Función |
|--------|---------|
| `scripts/health-check.sh` | Verificar servicios |
| `scripts/manage.sh` | start/stop/restart |
| `scripts/backup.sh` | Backup config |
| `scripts/restore.sh` | Restaurar config |

## Componentes

- **Config**: Prometheus, AlertManager, Loki, Grafana
- **Dashboards**: Infrastructure, SLO, Logs
- **Infra**: Kubernetes manifests, Terraform AWS
- **CI/CD**: GitHub Actions

## Documentación

- [Deployment Guide](docs/DEPLOYMENT.md)
- [Changelog](CHANGELOG.md)