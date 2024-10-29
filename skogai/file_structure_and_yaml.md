# Skogai AI Manager System File Structure and YAML Configurations

## File System Structure

Here's a high-level layout of the file system:

```
/agents
  /agent-name
    /config
      agent-config.yaml
      secrets.yaml
    /logs
      YYYY-MM-DD.log
    /tasks
      task-queue.json
      completed-tasks.json
    /data
      /dotfiles
      /documentation
      /todo
      /backups
/shared
  /config
    global-config.yaml
  /scripts
    backup.sh
    stow-dotfiles.sh
  /cache
    task-cache.json
  /logs
    agents.log
  /docs
    README.md
```

## YAML Configurations

### Global Config (global-config.yaml)

```yaml
tasks:
  - name: Backup dotfiles
    schedule: "0 12 * * *"
    agent: dotfiles-agent
    actions:
      - backup
      - git-push
  - name: Sync bookmarks
    schedule: "0 8 * * 1"
    agent: bookmark-agent
```

### Dotfiles Agent Config (dotfiles-agent-config.yaml)

```yaml
dotfiles_path: ~/dotfiles
stow_dir: ~/dotfiles
git_repo: git@github.com:yourusername/dotfiles.git
backup_schedule: daily
```

### Notifications (notifications.yaml)

```yaml
on_success: slack, email
on_failure: email
```

## Additional Information

- The file system is designed to ensure modularity and ease of access for each agent.
- YAML configurations are used to define tasks, schedules, and agent behavior, ensuring flexibility and ease of updates.
- The structure supports both local and remote operations, with logs and caches to track task execution and system status.
