# Terminal Multiplexer

Terminal multiplexer is a tool that allows you to:

- Run multiple terminal sessions inside a single terminal window.
- Detach and reattach sessions so processes keep running even if you disconnect.
- Split your terminal screen into multiple panes.
- Manage long-running processes safely over SSH.

<br/>

# Popular Terminal Multiplexers

## 1. tmux

Modern and widely used. Easy to script and customize. Has panes, windows, sessions.

### Start & Manage Sessions

- | Command                             | Description                     | Example                  |
  | ----------------------------------- | ------------------------------- | ------------------------ |
  | `tmux`                              | Start a new tmux session        | tmux                     |
  | `tmux new -s session_name`          | Start a new session with a name | tmux new -s dev          |
  | `tmux ls`                           | List all tmux sessions          | tmux ls                  |
  | `tmux attach -t session_name`       | Attach to a session             | tmux attach -t dev       |
  | `tmux kill-session -t session_name` | Kill a session                  | tmux kill-session -t dev |

### Windows & Panes

- | Command    | Description               | Example           |
  | ---------- | ------------------------- | ----------------- |
  | `Ctrl+b c` | Create a new window       | Press inside tmux |
  | `Ctrl+b n` | Switch to next window     | Press inside tmux |
  | `Ctrl+b p` | Switch to previous window | Press inside tmux |
  | `Ctrl+b w` | List windows              | Press inside tmux |
  | `Ctrl+b %` | Split window vertically   | Press inside tmux |
  | `Ctrl+b "` | Split window horizontally | Press inside tmux |
  | `Ctrl+b o` | Switch to next pane       | Press inside tmux |
  | `Ctrl+b x` | Close current pane        | Press inside tmux |
  | `Ctrl+b d` | Detach session            | Press inside tmux |

### Other Useful Commands

- | Command                            | Description        | Example                            |
  | ---------------------------------- | ------------------ | ---------------------------------- |
  | `tmux rename-session -t old new`   | Rename a session   | tmux rename-session -t dev project |
  | `tmux resize-pane -L/-R/-U/-D <n>` | Resize panes       | Ctrl+b : resize-pane -R 10         |
  | `tmux source-file ~/.tmux.conf`    | Reload tmux config | tmux source-file ~/.tmux.conf      |

<br/>

---

## 2. screen

Older but very stable. Simple detach/reattach workflow. Still used on servers without tmux installed.

### Start & Manage Sessions

- | Command                          | Description                | Example               |
  | -------------------------------- | -------------------------- | --------------------- |
  | `screen`                         | Start a new screen session | screen                |
  | `screen -S session_name`         | Start a new named session  | screen -S dev         |
  | `screen -ls`                     | List all screen sessions   | screen -ls            |
  | `screen -r session_name`         | Reattach a session         | screen -r dev         |
  | `screen -X -S session_name quit` | Kill a session             | screen -X -S dev quit |

### Windows & Navigation

- | Command       | Description          | Example             |
  | ------------- | -------------------- | ------------------- |
  | `Ctrl+a c`    | Create a new window  | Press inside screen |
  | `Ctrl+a n`    | Next window          | Press inside screen |
  | `Ctrl+a p`    | Previous window      | Press inside screen |
  | `Ctrl+a "`    | List windows         | Press inside screen |
  | `Ctrl+a 0..9` | Switch to window 0-9 | Press inside screen |

### Panes / Regions

- | Command      | Description               | Example             |
  | ------------ | ------------------------- | ------------------- |
  | `Ctrl+a S`   | Split screen horizontally | Press inside screen |
  | `Ctrl+a \| ` | Split screen vertically   | Press inside screen |
  | `Ctrl+a tab` | Switch between regions    | Press inside screen |
  | `Ctrl+a X`   | Close current region      | Press inside screen |

### Detaching & Logging

- | Command    | Description                | Example             |
  | ---------- | -------------------------- | ------------------- |
  | `Ctrl+a d` | Detach session             | Press inside screen |
  | `Ctrl+a H` | Start/stop logging session | Press inside screen |
