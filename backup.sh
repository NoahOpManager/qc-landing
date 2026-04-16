#!/bin/bash
# Daily GitHub backup - runs at 12am CST (6am UTC)

cd /root/.openclaw/workspace/memory

# Add new files from today + update existing tracked files
git add .

# Remove credentials from staging if accidentally added
git reset -q credentials.md 2>/dev/null

# Commit only if there are changes
if git diff --staged --quiet; then
    echo "No changes to commit"
else
    git commit -m "Daily backup - $(date '+%Y-%m-%d')"
    git push origin main
    echo "Backup completed at $(date)"
fi