#!/bin/bash

echo "=== SRE Platform Health Check ==="
echo "Timestamp: $(date)"
echo ""

check_service() {
    local service=$1
    local port=$2
    
    if nc -z localhost "$port" 2>/dev/null; then
        echo "[OK] $service listening on port $port"
        return 0
    else
        echo "[FAIL] $service not reachable on port $port"
        return 1
    fi
}

FAILED=0

check_service "Prometheus" 9090 || ((FAILED++))
check_service "Grafana" 3000 || ((FAILED++))
check_service "AlertManager" 9093 || ((FAILED++))
check_service "Loki" 3100 || ((FAILED++))
check_service "Jaeger" 16686 || ((FAILED++))

echo ""
if [ $FAILED -eq 0 ]; then
    echo "=== All services operational ==="
    exit 0
else
    echo "=== $FAILED service(s) failed ==="
    exit 1
fi