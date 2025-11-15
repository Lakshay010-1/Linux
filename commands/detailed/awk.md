# awk

- awk is a powerful text-processing and pattern-scanning language used in Linux for:
- Use Cases:
  - Processing files line by line
  - Splitting lines into fields
  - Searching and filtering
  - Performing calculations
  - Formatting text
  - Generating reports
- Syntax : `awk 'pattern { action }' file`

## Built-in Variables

| Variable        | Meaning                                       | Notes / Example                               |
| --------------- | --------------------------------------------- | --------------------------------------------- |
| **$0**          | Entire current line                           | Prints full record: `awk '{print $0}' file`   |
| **$1, $2, ...** | Individual fields (columns)                   | `$1` = first column, `$2` = second column     |
| **NF**          | Number of fields in current record            | Last field = `$NF`                            |
| **NR**          | Total record number (overall line number)     | First line = NR=1                             |
| **FNR**         | Line number _per file_ (resets for each file) | Useful in multi-file processing               |
| **FS**          | Input field separator (default: whitespace)   | Example: `awk 'BEGIN{FS=":"}' /etc/passwd`    |
| **OFS**         | Output field separator                        | Example: `awk 'BEGIN{OFS=","} {print $1,$2}'` |
| **RS**          | Input record separator                        | Default: newline (`\n`)                       |

## Command Options

| Option         | Meaning / Purpose                          | Example                                  |
| -------------- | ------------------------------------------ | ---------------------------------------- |
| -F             | Set input field separator                  | awk -F: '{print $1}' /etc/passwd         |
| -v             | Assign variable before processing          | awk -v x=10 '{print x,$1}' file          |
| -f             | Use external AWK script file               | awk -f script.awk input.txt              |
| -e             | Allow multiple commands on command line    | awk -e '{print $1}' -e '{print $2}' file |
| -t (gawk)      | Enable debugging/trace mode (gawk only)    | gawk -t -f script.awk                    |
| --color        | Highlight matched patterns                 | gawk --color=auto '/error/' file         |
| -W re-interval | Enable interval regex `{n,m}` (older gawk) | awk -W re-interval '/a{2,4}/' file       |

## Pattern Matching & Conditions

| Pattern / Condition | Meaning / Purpose                 | Example                     |
| ------------------- | --------------------------------- | --------------------------- |
| /regex/             | Select lines matching regex       | awk '/error/' log.txt       |
| !/regex/            | Select lines NOT matching regex   | awk '!/warning/' log.txt    |
| $1 == "hello"       | Match if 1st field equals "hello" | awk '$1=="hello"' file      |
| $3 > 50             | Numeric comparison on field 3     | awk '$3>50' data.txt        |
| pattern1, pattern2  | Select a range of lines           | awk '/start/,/end/' file    |
| NR == 5             | Select specific line              | awk 'NR==5' file            |
| NR % 2 == 0         | Even-numbered lines               | awk 'NR%2==0' file          |
| BEGIN { }           | Run before input is processed     | awk 'BEGIN {print "Start"}' |
| END { }             | Run after all input is processed  | awk 'END {print "Done"}'    |
