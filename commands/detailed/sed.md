# sed (Stream Editor)

- It’s a non-interactive text editor that works on streams of data (input from a file or stdin).
- Processes text line by line.
- Commonly used for: Search and Replace, Delete, Insert/Append, transform, Filter, Batch edit text.

## Addressing

| Address         | Meaning                | Example                                  |
| --------------- | ---------------------- | ---------------------------------------- |
| `N`             | Specific line number   | `sed '3d' file.txt` → delete line 3      |
| `M,N`           | Range of lines         | `sed '2,5d' file.txt` → delete lines 2–5 |
| `/pattern/`     | Lines matching regex   | `sed '/error/d' log.txt`                 |
| `/pat1/,/pat2/` | Range between patterns | `sed '/start/,/end/d' file.txt`          |
| `$`             | Last line              | `sed '$d' file.txt` → delete last line   |

<hr/>
<br/>

## Options

| Options          | Description                                  | Example                                         |
| ---------------- | -------------------------------------------- | ----------------------------------------------- |
| -n               | Suppress automatic printing of pattern space | sed -n '2p' file.txt                            |
| -e               | Add multiple commands in one line            | sed -e 's/foo/bar/' -e 's/linux/unix/' file.txt |
| -i               | Edit file in place (modify original file)    | sed -i 's/foo/bar/g' file.txt                   |
| -f \<script>.sed | Run commands from a script file              | sed -f edits.sed file.txt                       |

<hr/>
<br/>

## Command

| Command | Description                                  | Example                                                                                                |
| ------- | -------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `p`     | Print lines                                  | `sed -n '3p' file.txt` → print line 3                                                                  |
| `d`     | Delete lines                                 | `sed '2d' file.txt` → delete line 2<br/>`sed '/\<keyword>/d' \<file>` -> Delete selected keyword lines |
| `s`     | Substitute (find & replace)                  | `sed 's/foo/bar/' file.txt`                                                                            |
| `i`     | Insert text before line                      | `sed '2i Inserted line' file.txt`                                                                      |
| `a`     | Append text after line                       | `sed '2a Appended line' file.txt`                                                                      |
| `c`     | Change (replace whole line)                  | `sed '3c New line content' file.txt`                                                                   |
| `y`     | Transform (character replacement)            | `sed 'y/abc/ABC/' file.txt`                                                                            |
| `q`     | Quit after given line                        | `sed '5q' file.txt` → stop after line 5                                                                |
| `=`     | Print line number                            | `sed '=' file.txt`                                                                                     |
| `!`     | Negate command (apply to non-matching lines) | `sed '/error/!d' file.txt` → keep only lines with "error"                                              |
| `{ }`   | Group multiple commands for same address     | `sed '2,4 { s/foo/bar/; s/x/y/ }' file.txt`                                                            |

<hr/>
<br/>
