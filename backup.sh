#!/bin/bash
# Daily GitHub backup for Quantum Coherence

cd /root/.openclaw/workspace/memory

# Add all files except credentials
git add . -A -- ':!credentials.md'

# Commit with date
git commit -m "Daily backup - $(date '+%Y-%m-%d %H:%M')" 2>/dev/null

# Push to GitHub
git push origin main 2>/dev/null

echo "Backup completed at $(date)"