#!/bin/bash
# Script to start the Frappe Bench development environment
export GIT_CONFIG_GLOBAL=/Users/pooja/.gemini/antigravity/scratch/frappe_workspace/.gitconfig
export PATH=/Users/pooja/.gemini/antigravity/scratch/frappe_workspace/frappe-bench/env/bin:/Users/pooja/.gemini/antigravity/scratch/bench_env/bin:/opt/homebrew/bin:$PATH

# Clean up any previously orphaned processes on ports 11000, 13000, 8000
kill $(lsof -t -i :11000 -i :13000 -i :8000 2>/dev/null) 2>/dev/null || true
sleep 0.5

cd /Users/pooja/.gemini/antigravity/scratch/frappe_workspace/frappe-bench
echo "Starting Frappe Bench on http://localhost:8000 (site: training.local)..."
echo "Login with Username: Administrator | Password: admin"
bench start
