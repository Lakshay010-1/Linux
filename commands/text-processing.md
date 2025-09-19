# Text Processing Commands

## 0. Standard File Descriptors

| Name     | File Descriptor | Default Device  | Description                                    | Redirections |
| -------- | --------------- | --------------- | ---------------------------------------------- | ------------ |
| `stdin`  | `0`             | Keyboard        | **Standard Input** — data fed _into_ a program | <            |
| `stdout` | `1`             | Terminal screen | **Standard Output** — normal program output    | >, >>        |
| `stderr` | `2`             | Terminal screen | **Standard Error** — error messages            | 2>, $>       |

---

## 1. Viewing Text

| Command | Syntax             | Description                        | Example                 |
| ------- | ------------------ | ---------------------------------- | ----------------------- |
| cat     | cat <file>         | Display file content               | cat notes.txt           |
| tac     | tac <file>         | Display file in reverse order      | tac notes.txt           |
| more    | more <file>        | View file page by page             | more notes.txt          |
| less    | less <file>        | Scrollable view with search        | less notes.txt          |
| head    | head [-n N] <file> | Show first N lines (default 10)    | head -n 5 notes.txt     |
| tail    | tail [-n N] <file> | Show last N lines                  | tail -n 5 notes.txt     |
| tail -f | tail -f <file>     | Show appended content in real time | tail -f /var/log/syslog |

---

## 2. Editing Text

| Command  | Syntax                                                | Description                                          | Example                                  |
| -------- | ----------------------------------------------------- | ---------------------------------------------------- | ---------------------------------------- |
| vi / vim | vi <file>                                             | Open file in vi/vim editor                           | vi notes.txt                             |
| awk      | awk '{print $N}' <file>                               | Print specific column(s) [NF=total Number of fields] | awk '{print $1, $3}' data.txt            |
| awk      | awk '/word/ {print $0}' <file>                        | Search for a specific word                           | awk '/abc/ {print $0}' data.txt          |
| awk      | awk '{$1="ReplacedWord"; print $0}' <file>            | Replace words with field words                       | awk {'$3="mno"; print $0}' data.txt      |
| awk      | awk 'length($<fieldNum>)><ByteNum>' <file>            | Get lines that have more than <ByteNum> byte size    | awk 'length($5)>15' data.txt             |
| awk      | awk '{if($<fieldNum>=="Something") print $0;}' <file> | Get the field matching the if condition              | awk '{if($3=="mno") print $0;}' data.txt |

---

## 3. Searching & Filtering Text

| Command         | Syntax                   | Description                             | Example                                                                                                                                                               |
| --------------- | ------------------------ | --------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| grep            | grep "pattern" <file>    | Search for a pattern                    | grep "error" log.txt                                                                                                                                                  |
| grep -r         | grep -r "pattern" <dir>  | Recursive search in directory           | grep -r "main()" src/                                                                                                                                                 |
| egrep           | egrep "pat1 pat2" <file> | Extended regex search                   | egrep "error\| warning" log.txt                                                                                                                                       |
| fgrep           | fgrep "text" <file>      | Fixed string search (faster than regex) | fgrep "ERROR" log.txt                                                                                                                                                 |
| wc              | wc [options] <file>      | Count lines, words, characters          | wc -l notes.txt (Get no. of lines),<br> wc -w notes.txt (Get no. of words),<br> wc -b notes.txt (Get no. of bytes)                                                            |
| cut (by chars)  | cut -cN-M <file>         | Extract character range                 | cut -c file.txt -> print a charfrom each line<br>cut -c1,2,4 file.txt -> print selected char from each line<br>cut -c1-6 file.txt-> print ranged chars from each line |
| cut (by fields) | cut -d':' -fN <file>     | Extract fields by delimiter             | cut -d':' -f1 /etc/passwd<br>cut -d':' -f1-5 /etc/passwd                                                                                                              |
| sort            | sort <file>              | Sort lines alphabetically               | sort names.txt                                                                                                                                                        |
| uniq            | uniq <file>              | Remove duplicate lines                  | uniq sorted.txt                                                                                                                                                       |

**Options**:

- #### grep / egrep / fgrep:
  - -i = Case-insensitive search
  - -n = show line number
  - -c = count matches
  - -v = invert match

---

## 4. Redirecting & Combining Text

| Command        | Syntax          | Description                 | Example                          |
| -------------- | --------------- | --------------------------- | -------------------------------- |
| echo           | echo "text"     | Print text                  | echo "Hello World"               |
| >              | command > file  | Redirect output (overwrite) | echo "Linux" > file.txt          |
| >>             | command >> file | Redirect output (append)    | echo "Rocks" >> file.txt         |
| <              | command < file  | Redirect input from file    | tr a-z A-Z < file.txt            |
| cat >          | cat > file      | Create/overwrite file       | cat > notes.txt (Ctrl+D to save) |
| cat >>         | cat >> file     | Append manually typed text  | cat >> notes.txt                 |
| tee \| command | tee file        | Save and display output     | echo "log" \| tee out.txt        |

---

## 5. Advanced Text Processing

| Command | Syntax                  | Description                       | Example                   |
| ------- | ----------------------- | --------------------------------- | ------------------------- |
| diff    | diff <file1> <file2>    | Show line differences             | diff old.txt new.txt      |
| cmp     | cmp <file1> <file2>     | Compare files byte by byte        | cmp file1.bin file2.bin   |
| tr      | tr 'set1' 'set2' < file | Translate characters              | tr 'a-z' 'A-Z' < file.txt |
| nl      | nl <file>               | Number of lines in file           | nl notes.txt              |
| strings | strings <binary>        | Extract readable text from binary | strings a.out             |
