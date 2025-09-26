# VI Editor Commands

## 0. Enter VI Editor

- `vi <file>`
  <br/>
  The filename can be the name of an existing file or the name of the file you want to create.

## 1. Modes

- | Mode           | Description                            |
  | -------------- | -------------------------------------- |
  | `Normal`       | Default mode for navigation & commands |
  | `Insert`       | Add text (i, a, o, etc)                |
  | `Command-line` | Type `:` for save/quit/search/replace  |

---

## 2. Normal Mode

- | Key   | Description                |
  | ----- | -------------------------- |
  | `ESC` | Switch back to Normal mode |

---

## 3. Command-Line

- | Command             | Description                     |
  | ------------------- | ------------------------------- |
  | `:w`                | Save (write) file               |
  | `:q`                | Quit (exit) vi                  |
  | `:q!`               | Quit without saving changes     |
  | `:wq! or ZZ or :x!` | Save and quit (force if needed) |
  | `:set nu`           | Show line numbers               |
  | `:set nonu`         | Hide line numbers               |
  | `:help`             | Open general help               |
  | `:help <command>`   | Show help for specific command  |

---

## 4. Navigation

- | Command | Description                                         |
  | ------- | --------------------------------------------------- |
  | `h`     | Move cursor left                                    |
  | `l`     | Move cursor right                                   |
  | `j`     | Move cursor down one line                           |
  | `k`     | Move cursor up one line                             |
  | `0`     | Move to beginning of the current line               |
  | `$`     | Move to end of the current line                     |
  | `w`     | Move forward to beginning of next word              |
  | `b`     | Move backward to beginning of current/previous word |
  | `e`     | Move forward to end of current/next word            |
  | `gg`    | Go to the start of first line of the file           |
  | `G`     | Go to the start of last line of the file            |
  | `nG`    | Go to start of \<n> line of the file                |

---

## 5. Insert

- | Command | Description                        |
  | ------- | ---------------------------------- |
  | `i`     | Insert text before cursor          |
  | `I`     | Insert text at beginning of line   |
  | `a`     | Append text after cursor           |
  | `A`     | Append text at end of line         |
  | `o`     | Open a new line below current line |
  | `O`     | Open a new line above current line |

---

## 6. Delete

- | Command | Description                          |
  | ------- | ------------------------------------ |
  | `x`     | Delete character under cursor        |
  | `X`     | Delete character before cursor       |
  | `dd`    | Delete (cut) the current line        |
  | `ndd`   | Delete (cut) _n_ lines (e.g., `3dd`) |

---

## 7. Replace

- | Command | Description                                      |
  | ------- | ------------------------------------------------ |
  | `r`     | Replace a single character under cursor          |
  | `R`     | Enter Replace mode (overwrite text)              |
  | `C`     | Change (replace) text from cursor to end of line |
  | `cc`    | Change (replace) the entire line                 |
  | `cw`    | Change (replace) from cursor to end of word      |

---

## 8. Copy / Yank & Paste

- | Command | Description                         |
  | ------- | ----------------------------------- |
  | `yy`    | Yank (copy) the current line        |
  | `nyy`   | Yank (copy) _n_ lines (e.g., `3yy`) |
  | `p`     | Paste after cursor / line           |
  | `P`     | Paste before cursor / line          |

---

## 9. Indent / Unindent

- | Command | Description           |
  | ------- | --------------------- |
  | `>>`    | Indent current line   |
  | `<<`    | Unindent current line |

---

## 10. Visual Mode

- | Command    | Description                             |
  | ---------- | --------------------------------------- |
  | `v`        | Start visual mode (select by character) |
  | `V`        | Start visual line mode                  |
  | `Ctrl + v` | Start visual block mode                 |

---

## 11. Search & Replace

- | Command                       | Description                             |
  | ----------------------------- | --------------------------------------- |
  | `/pattern`                    | Search forward for _pattern_            |
  | `?pattern`                    | Search backward for _pattern_           |
  | `:%s/<word>/<replacedWord>/g` | Replace all occurrences in file         |
  | `:s/<word>/<replacedWord>/g`  | Replace all occurrences in current line |

---
