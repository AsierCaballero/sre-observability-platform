# SRE Observability Platform

[![Docker](https://img.shields.io/badge/docker-compose-2496ED?logo=docker&logoColor=white)](https://docs.docker.com/compose/)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Python](https://img.shields.io/badge/python-3.11-blue?logo=python)](docker/app.py)

A batteries-inlined observability stack for production environments running Prometheus, Grafana, Loki, Jaeger, and more — all wired up with Docker Compose, Kubernetes manifests, and Terraform for AWS.

## What's inside

| Service | Port | What it does |
|---------|------|-------------|
| Prometheus | 9090 | Metrics collection & infra monitoring |
| Grafana | 3000 | Dashboards & visualization |
| AlertManager | 9093 | Alert routing & deduplication |
| Loki | 3100 | Log aggregation (Promtail ships the logs) |
| Jaeger | 16686 | Distributed tracing |
| Node Exporter | 9100 | Host-level system metrics |
| Blackbox Exporter | 9115 | External end-point probing |
| Sample App | 8080 | Demo Flask app exporting Prometheus metrics |

## Getting started

```bash
docker compose up -d
./scripts/health-check.sh
```

Grafana will be available at `http://localhost:3000` (admin / admin123).

## Project layout

```
.
├── config/                  # Prometheus, Grafana, Loki, AlertManager configs
│   ├── alertmanager/
│   ├── blackbox/
│   ├── grafana/
│   ├── loki/
│   ├── prometheus/
│   └── promtail/
├── docker/                  # Sample app sources and Dockerfile
├── docker-compose.yml       # Local dev environment (all 8 services)
├── k8s/                     # Kubernetes manifests
├── monitoring/dashboards/   # Pre-built Grafana dashboards (infra, SLO, logs)
├── scripts/                 # Health check, manage, backup, restore
├── terraform/               # AWS provisioning (EC2, VPC, etc.)
├── .github/workflows/       # CI/CD pipelines
├── CONTRIBUTING.md
├── LICENSE
└── README.md
```

## Scripts

| Script | Purpose |
|--------|---------|
| `scripts/health-check.sh` | Probe all services and report health |
| `scripts/manage.sh` | Control the stack (start / stop / restart / status) |
| `scripts/backup.sh` | Snapshot configs and persistent data |
| `scripts/restore.sh` | Restore from a backup snapshot |

## Dashboards

A few Grafana dashboards are included under `monitoring/dashboards/`:

- **Infrastructure** — host metrics, container resource usage, Prometheus targets
- **SLO** — service-level objectives and error budgets
- **Logs** — Loki-based log exploration and alert correlation

## Deployment options

### Local — Docker Compose

```bash
docker compose up -d
```

### Kubernetes

```bash
kubectl apply -f k8s/
```

### AWS — Terraform

```bash
cd terraform
terraform init && terraform apply
```

## Further reading

- [Deployment Guide](docs/DEPLOYMENT.md)
- [Changelog](CHANGELOG.md)
