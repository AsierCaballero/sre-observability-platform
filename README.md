# SRE Observability Platform

Plataforma de observabilidad para entornos de producción.

## Servicios

| Servicio | Puerto |
|----------|--------|
| Prometheus | 9090 |
| Grafana | 3000 |
| AlertManager | 9093 |
| Loki | 3100 |
| Jaeger | 16686 |

## Quick Start

```bash
docker-compose up -d
./scripts/health-check.sh
```

## Scripts

- `scripts/health-check.sh` - Verificar estado de servicios