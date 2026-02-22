#!/bin/bash

set -e

PROJECTS_DIR="$HOME/projects"
LOG_FILE="$PROJECTS_DIR/daily-github-sync.log"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

sync_project() {
    local project_dir="$1"
    local project_name=$(basename "$project_dir")
    
    if [ ! -d "$project_dir/.git" ]; then
        log "Skipping $project_name - not a git repository"
        return
    fi
    
    cd "$project_dir"
    
    log "Syncing $project_name..."
    
    git fetch origin
    
    local current_branch=$(git rev-parse --abbrev-ref HEAD)
    local remote_branch="origin/$current_branch"
    
    if git rev-parse --verify "$remote_branch" >/dev/null 2>&1; then
        local behind=$(git rev-list --count "$remote_branch"..HEAD)
        
        if [ "$behind" -gt 0 ]; then
            log "  Pulling $behind commit(s) from remote..."
            git pull origin "$current_branch"
        else
            log "  Already up to date"
        fi
    fi
    
    local uncommitted=$(git status --porcelain | wc -l)
    if [ "$uncommitted" -gt 0 ]; then
        log "  Found $uncommitted uncommitted changes"
    fi
}

log "=== Starting daily GitHub sync ==="

for project in "$PROJECTS_DIR"/*; do
    if [ -d "$project" ]; then
        sync_project "$project"
    fi
done

log "=== Daily GitHub sync complete ==="
