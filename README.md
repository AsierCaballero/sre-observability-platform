# SRE Observability Platform

[![Docker](https://img.shields.io/badge/Docker-Compose-2496ED?logo=docker)](https://docker.com)
[![Prometheus](https://img.shields.io/badge/Prometheus-2.48-E6522C?logo=prometheus)](https://prometheus.io)
[![Grafana](https://img.shields.io/badge/Grafana-10.2-F46800?logo=grafana)](https://grafana.com)
[![License](https://img.shields.io/badge/license-MIT-blue)](LICENSE)
[![Python](https://img.shields.io/badge/Python-3.11-blue?logo=python)](https://python.org)

Monitoring and observability stack for production environments. Includes Prometheus, Grafana, Loki, Jaeger, AlertManager, and a sample instrumented application.

## Quick start

```bash
docker compose up -d
./scripts/health-check.sh
```

## Services

| Service | Port | Description |
|---------|------|-------------|
| Prometheus | 9090 | Metrics collection and alerting |
| Grafana | 3000 | Dashboards and visualization |
| AlertManager | 9093 | Alert routing and notifications |
| Loki | 3100 | Log aggregation |
| Jaeger | 16686 | Distributed tracing |
| Node Exporter | 9100 | System metrics |
| Blackbox Exporter | 9115 | External endpoint monitoring |
| Sample App | 8080 | Flask app with Prometheus metrics |

## Scripts

| Script | Purpose |
|--------|---------|
| `scripts/health-check.sh` | Check service health |
| `scripts/manage.sh` | Start/stop/restart/status |
| `scripts/backup.sh` | Backup configurations |
| `scripts/restore.sh` | Restore configurations |

## Dashboard files

Pre-built Grafana dashboards for infrastructure monitoring, SLO tracking, and log analysis are in `monitoring/dashboards/`. They auto-provision on Grafana startup.

## Deployment options

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
terraform init
terraform apply
```

## Docs

- [Deployment Guide](docs/DEPLOYMENT.md)
- [Changelog](CHANGELOG.md)
