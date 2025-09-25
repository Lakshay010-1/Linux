# User Communication Commands

| Command | Syntax                          | Description                                                                                             | Example                                     |
| ------- | ------------------------------- | ------------------------------------------------------------------------------------------------------- | ------------------------------------------- |
| write   | `write username [tty]`          | Send a direct message to a specific user (session-to-session communication). End message with `Ctrl+D`. | write alice → type message, end with Ctrl+D |
| wall    | `wall [message]` or `wall file` | Broadcast a message to all logged-in users.                                                             | wall "System will reboot in 5 minutes"      |
| mesg    | `mesg y/n`                      | Enable (`y`) or disable (`n`) receiving messages from others (`write`/`wall`).                          | mesg n → block incoming messages            |
| talk    | `talk username[@host]`          | Start a two-way, real-time chat session with another user.                                              | talk bob                                    |
| who     | `who`                           | Show who is logged in (useful before `write`/`talk`).                                                   | who                                         |
| users   | `users`                         | Show usernames of currently logged-in users.                                                            | users                                       |

---
