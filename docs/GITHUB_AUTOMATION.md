# GitHub Automation

## Daily Sync Script

The `scripts/daily-github-sync.sh` script automates daily synchronization with GitHub repositories.

### Features

- Automatic git pull from remote repositories
- Commit and push local changes
- Sync multiple project directories

### Configuration

Set the `GITHUB_TOKEN` environment variable for authentication.

### Usage

```bash
./scripts/daily-github-sync.sh
```

### Cron Schedule

Add to crontab for daily execution:

```cron
0 6 * * * /home/sdw3098/projects/langflow-ollama-podman/scripts/daily-github-sync.sh
```
