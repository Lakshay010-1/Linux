# grep (Global Regular Expression Print)

- Searches files or input for patterns and prints matching lines.
- ### `grep [options] pattern [file...]`

## Grep Family Command Reference

| Command      | Meaning / Function                                            | Equivalent Command | Typical Use                                                   |
| ------------ | ------------------------------------------------------------- | ------------------ | ------------------------------------------------------------- |
| **grep**     | Basic Regular Expression search                               | `grep`             | Most common text-search tool for patterns in files or output. |
| **egrep**    | Extended Regular Expressions (supports `+`, `?`, `\| `, `()`) | `grep -E`          | Search using advanced regex syntax.                           |
| **fgrep**    | Fixed string search (no regex)                                | `grep -F`          | Faster literal text search — no pattern interpretation.       |
| **pgrep**    | Process grep — search for running processes by name           | —                  | Find processes matching a given name or regex.                |
| **pkill**    | Process kill — terminate processes by name or pattern         | —                  | Kill processes matching a keyword or regex.                   |
| **rgrep**    | Recursive grep — search through subdirectories                | `grep -r`          | Search entire directory trees for matches.                    |
| **zgrep**    | Grep for compressed `.gz` files                               | —                  | Search directly inside gzip-compressed logs.                  |
| **bzgrep**   | Grep for `.bz2` compressed files                              | —                  | Search bzip2-compressed archives.                             |
| **xzgrep**   | Grep for `.xz` compressed files                               | —                  | Search xz-compressed files without manual decompression.      |
| **git grep** | Search within a Git repository                                | —                  | Fast code search restricted to tracked project files.         |

## Common grep Options

| Option     | Meaning                                  |
| ---------- | ---------------------------------------- |
| **-i**     | Ignore case (case-insensitive search)    |
| **-r**     | Recursive search through directories     |
| **-n**     | Show line numbers for matches            |
| **-v**     | Invert match (show non-matching lines)   |
| **-w**     | Match whole words only                   |
| **-c**     | Count number of matching lines           |
| **-l**     | List files **with** matches              |
| **-L**     | List files **without** matches           |
| **-o**     | Print only the matching part of lines    |
| **-q**     | Quiet mode (no output, status code only) |
| **-A** _N_ | Show _N_ lines **After** match           |
| **-B** _N_ | Show _N_ lines **Before** match          |
| **-C** _N_ | Show _N_ lines of **Context**            |
| **-E**     | Use extended regex (same as `egrep`)     |
| **-F**     | Fixed-string search (literal, no regex)  |

---

## Regex Symbols (Used in grep Patterns)

| Regex    | Meaning                                   | Example                                        |
| -------- | ----------------------------------------- | ---------------------------------------------- |
| **.**    | Matches **any one character**             | `gr.p` → matches `grip`, `grap`, `grp`         |
| **^**    | Start of line                             | `^error` → matches lines starting with “error” |
| **$**    | End of line                               | `done$` → matches lines ending with “done”     |
| **\***   | Zero or more occurrences of previous char | `lo*l` → `ll`, `lol`, `loool`                  |
| **[ ]**  | Character class                           | `[0-9]` → any digit                            |
| **[^ ]** | NOT character class                       | `[^a-z]` → any char **not** in a–z             |
