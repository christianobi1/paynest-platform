#!/usr/bin/env bash

set -u

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
REPORT_DIR="${PROJECT_ROOT}/health-reports"
REPORT_FILE="${REPORT_DIR}/health-check.log"

mkdir -p "$REPORT_DIR"

TIMESTAMP="$(date '+%Y-%m-%d %H:%M:%S %Z')"

check_deployment() {
    local deployment="$1"

    if kubectl rollout status "deployment/${deployment}" \
        --namespace default --timeout=10s >/dev/null 2>&1; then
        return 0
    else
        return 1
    fi
}

backend_status="HEALTHY"
frontend_status="HEALTHY"
exit_code=0

check_deployment paynest-backend || {
    backend_status="UNHEALTHY"
    exit_code=1
}

check_deployment paynest-frontend || {
    frontend_status="UNHEALTHY"
    exit_code=1
}

printf '%s | backend=%s | frontend=%s\n' \
    "$TIMESTAMP" "$backend_status" "$frontend_status" \
    | tee -a "$REPORT_FILE"

exit "$exit_code"
