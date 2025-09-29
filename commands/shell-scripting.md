# Shell

- A shell is a program that provides an interface between the user and the kernel (the core of the OS).
- User type commands → the shell interprets them → passes requests to the kernel → shows user the results.
- It’s called a “shell” because it’s the outer layer around the operating system kernel.

## Types of Shells

- **Command-line shells (CLI)** → Text-based interface.<br/>
  _Examples_ - Bash (Bourne Again Shell), sh (Bourne Shell), zsh, fish, ksh, tcsh, etc.

- **Graphical shells (GUI)** → Desktop environments that let user interact with windows, icons, and menus.<br/>
  _Examples_: GNOME, KDE Plasma, XFCE.

## Shell Does

- **Command interpretation** → translates text into system calls.
- **Program execution** → launches apps (e.g., ls, top, vim).
- **Scripting** → user can write scripts to automate tasks.
- **Environment control** → lets user set variables, paths, permissions.

---

<br/>

# Shell Scripting

- A shell script is a text file containing a series of commands that the shell can execute automatically.
- Key Points :
  - **Text-based** – It’s just a plain text file.
  - **Executable** – The shell reads it line by line and executes each command.
  - **Automates tasks** – Anything user can type in the shell, user can put in a script.
  - **Variables & Logic** – user can use variables, loops, and conditionals.

---

<br/>

# Script File

```
- shebang or hashbang :
    #!/bin/bash (tells the system which interpreter to use to run the script)
    (
        #! = shebang symbol (signals to the OS: “Use the program specified on this line to execute the file.”)
        /bin/bash = interpreter path
    )

- Comments : using '#'.

- Commands : echo, cat, cp , grep, etc.

- Statements : if, for-loop, while-loop, etc.
```

## Shell Variables

- A variable in a shell stores a value (string (default), number, path, etc.) so user can reuse it later.
  <br/><br/>
- **`Set`** Variable - ' NAME="Linux" ' (There should be no spaces around =).
- **`Read`** Variable :

  - `$VAR` → Access variable value
  - `${VAR}` → Safer way

  ### Types of Shell Variables

  1. **Local / Script Variables**
     <br/>
     Examples : `GREETING="Hi"`,etc.
     <br/><br/>
  2. **Environment Variables**
     <br/>
     Examples : `export GREETING="Hi"`,etc.
     <br/><br/>
  3. **Positional Variables**
     <br/>
     Examples : `$0` - script name , `$1` - first arguments , `$2` - second arguments , `$@` - all arguments `, $#` - number of arguments , etc.
     <br/><br/>
  4. **Special Script Variables**
     <br/>
     Examples :`$?`- exit status of last command (0 = success, non-zero = error), `$$` - PID (process ID) of the current shell, `$!` - PID of the last background job, etc.

- Inside a script or current shell session, Local variables override environment variables if they share the same name.
- Outside the script, the environment variable is unaffected , unless user export the new value.

## Shell Input / Output

1. Output Redirection

   - `>` → redirect stdout (overwrite file)
   - `>>` → redirect stdout (append to file)
   - `2>` → redirect stderr (overwrite file)
   - `2>>` → redirect stderr (append to file)
   - `&>` → redirect both stdout and stderr

2. Input Redirection

   - `<` → take stdin from a file

3. Read Input
   - In scripts, user's input can be taken using `read`.<br/>
   - Example :
     ```
     read NAME<br/>
     echo "Hello, $NAME!"
     ```

## Shell Commands

- In shell script, any valid shell command can be written directly in the script.
- To take/capture the output of the command and use it's value, use:
  - Backticks
    ```
    `command`
    ```
  - **`$(command)` - [ preferred ]**

### Common Operators

- `-eq`, `-ne` → equal, not equal (numbers)

- `-gt`, `-lt`, `-ge`, `-le` → greater/less than (numbers)

- `=,` `!=` → string comparison

- `-f file` → file exists and is a regular file

- `-d dir` → directory exists

## Shell Statements

- if-then-elif-else<br/>

  ```bash
  read -p "Enter a number: " num

  if [ $num -gt 10 ]; then
    echo "Greater than 10"
  elif [ $num -eq 10 ]; then
    echo "Equal to 10"
  else
    echo "Less than 10"
  fi
  ```

- case

  ```bash
  read -p "Enter a letter: " letter

  case $letter in
    a|A) echo "You chose A";;
    b|B) echo "You chose B";;
    *)   echo "Unknown letter";;
  esac

  ```

- Loops

  - for

    ```bash
    for i in {1...5}; do
      echo "Number $i"
    done

    ```

  - while

    ```bash
    count=1
    while [ $count -le 5 ]; do
      echo "Count is $count"
      ((count++))
    done

    ```

  - until

    ```bash
    count=1
    until [ $count -gt 5 ]; do
      echo "Count is $count"
      ((count++))
    done

    ```

- exit

  ```bash
  if [ ! -f "$1" ]; then
    echo "File not found!"
    exit 1
  fi
  ```

---

<br/>
