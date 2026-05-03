#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
COMPOSE_FILE="${SCRIPT_DIR}/../docker-compose.yml"

action="$1"

case "$action" in
    start)
        docker-compose -f "$COMPOSE_FILE" up -d
        echo "Services started"
        echo "  Prometheus:    http://localhost:9090"
        echo "  Grafana:       http://localhost:3000"
        echo "  AlertManager:  http://localhost:9093"
        echo "  Loki:          http://localhost:3100"
        echo "  Jaeger:        http://localhost:16686"
        ;;
    stop)
        docker-compose -f "$COMPOSE_FILE" down
        echo "Services stopped"
        ;;
    restart)
        docker-compose -f "$COMPOSE_FILE" restart
        echo "Services restarted"
        ;;
    status)
        docker-compose -f "$COMPOSE_FILE" ps
        ;;
    logs)
        docker-compose -f "$COMPOSE_FILE" logs -f "${2:-}"
        ;;
    clean)
        docker-compose -f "$COMPOSE_FILE" down -v
        echo "Volumes removed"
        ;;
    *)
        echo "Usage: $0 {start|stop|restart|status|logs|clean}"
        exit 1
        ;;
esac