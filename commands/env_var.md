# Environment Variables

Environment variables are key-value pairs that define the behavior and environment of processes.

---

## 🔹 Set(or Update) Environment Variables

| Type      | Scope                 | Shell Type         | Command / File                                                    | Description                                                                         | Example                                          |
| --------- | --------------------- | ------------------ | ----------------------------------------------------------------- | ----------------------------------------------------------------------------------- | ------------------------------------------------ |
| Temporary | Current session only  | Login or Non-login | `export VAR=value`                                                | Sets a variable only for the current shell session. Lost after logout.              | `export MY_VAR=hello`                            |
| Permanent | All current user      | Login shell        | `~/.bash_profile` or `~/.profile`                                 | Variable persists across login sessions for the user.                               | `echo 'export MY_VAR=hello' >> ~/.bash_profile`  |
| Permanent | All current user      | Non-login shell    | `~/.bashrc`                                                       | Variable persists for interactive non-login shells. Often sourced by login scripts. | `echo 'export MY_VAR=hello' >> ~/.bashrc`        |
| Permanent | All system-wide users | Login shell        | `/etc/profile`                                                    | Variable is available for all users at login.                                       | `echo 'export MY_VAR=hello' >> /etc/profile`     |
| Permanent | All system-wide users | Non-login shell    | `/etc/bash.bashrc` (Debian/Ubuntu) or `/etc/bashrc` (RHEL/CentOS) | Variable available for interactive shells for all users.                            | `echo 'export MY_VAR=hello' >> /etc/bash.bashrc` |

## 🔹 Read Environment Variable

| Method         | Description                                                  | Example                                                    |
| -------------- | ------------------------------------------------------------ | ---------------------------------------------------------- |
| `$VAR`         | Display the value of a specific environment variable         | `echo $PATH` → Shows the current PATH variable             |
| `printenv VAR` | Print a specific environment variable                        | `printenv HOME` → Shows home directory of the current user |
| `printenv`     | List all environment variables for the current shell session | `printenv` → Displays all exported variables               |
| `env`          | List all environment variables for the current shell session | `env` → Displays all exported variables                    |

## 🔹 Un-Set Environment Variable

| Type      | Shell Type                | Command / File                                           | Description                                                                                                         | Example                |
| --------- | ------------------------- | -------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- | ---------------------- |
| Temporary | Current shell session     | `unset VAR`                                              | Removes the variable from the current shell session. It will be gone immediately but returns if set in login files. | `unset MY_VAR`         |
| Permanent | Future login sessions     | Remove or comment from `~/.bash_profile` or `~/.profile` | Edit the file and delete the `export VAR=value` line, then reload with `source`.                                    | `nano ~/.bash_profile` |
| Permanent | Future non-login sessions | Remove or comment from `~/.bashrc`                       | Delete the `export VAR=value` line and reload shell.                                                                | `nano ~/.bashrc`       |

---
