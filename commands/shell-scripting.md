# Topics:

- ### [Shell](#shell-1)
- ### [Shell Scripting](#shell-scripting-1)
- ### [Script Input/Output](#shell-input--output)
- ### [Script Shell Commands](#shell-commands)
- ### [Logger](#logger-1)
- ### [Debugger](#debugger-1)
- ### [Variables](#shell-variables)
- ### [Operators](#operators-1)
- ### [Statements](#shell-statements)
- ### [Arrays](#arrays-1)
- ### [Strings](#strings-1)
- ### [Functions](#functions-1)

---

<br/>
<br/>
<br/>

# Shell

- A shell is a program that provides an interface between the user and the kernel (the core of the OS).
- It’s called a “shell” because it’s the outer layer around the operating system kernel.
- Process - `User type commands` → `the shell interprets them` → `passes requests to the kernel` → `shows user the results`.
  <br/>
  <br/>

## Shell Does

- **Command interpretation** - translates text into system calls.
- **Program execution** - launches apps (e.g., ls, top, vim).
- **Scripting** - user can write scripts to automate tasks.
- **Environment control** - lets user set variables, paths, permissions.

<br/>

## Types of Shells

- **Command-line shells (CLI)**

  - Text-based interface.<br/>
  - _Examples_ - Bash (Bourne Again Shell), sh (Bourne Shell), zsh, fish, ksh, tcsh, etc.
  - `$0` holds the name of the current shell program/script.<br/>

- **Graphical shells (GUI)**
  - Desktop environments that let user interact with windows, icons, and menus.<br/>
  - _Examples_: GNOME, KDE Plasma, XFCE.

---

<br/>
<br/>
<br/>

# Shell Scripting

- A shell script is a text file containing a series of commands that the shell can execute automatically.
- To run script in backgroup use `nohup <script>`.
- Key Points :

  - **Text-based** – It’s just a plain text file.
  - **Executable** – The shell reads it line by line and executes each command.
  - **Automates tasks** – Anything user can type in the shell, user can put in a script.
  - **Variables & Logic** – user can use variables, loops, and conditionals.

- `[...]` is the classic test command (POSIX / sh-compatible)
- `[[...]]` is the advanced Bash test operator with more features and safer syntax

---

<br/>

## Script File

```
#!/bin/bash
    # 1. shebang or hashbang :
    # (tells the system which interpreter to use to run the script)
    # {
    #     #! = shebang symbol (signals to the OS: “Use the program specified on this line to execute the file.”)
    #     /bin/bash = interpreter path
    # }

# Single Line Comment
    # 2. Comments :
    # '#' at the start of the single line comment,
    #               and
    # '<<<comment', 'comment' at the start and end of the multi line comment respectively.

echo "$(hostname)"
    # 3. Commands : echo, cat, cp , grep, etc.

if [ $num -gt 10 ]; then
  echo "Greater than 10"
fi
    # 4. Statements : if, for-loop, while-loop, etc.
```

<br/>

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
     Approach-1.
     echo "What is your Name"
     read NAME

     Approach-2.
     read -p "What is your Name" NAME     # -p = display prompt (show a message on the same line where the user will type input)
     ```

4. Script Output
   - Example :
     ```
     echo "Hello, ${NAME}!"
     ```

## Shell Commands

- In shell script, any valid shell command can be written directly in the script.
- To take/capture the output of the command and use it's value, use:
  - **\`command\`**
  - **$(command)** - [ preferred ]

<br/>

## Logger

- logger is used to write messages to the system log (/var/log/messages, /var/log/syslog, or journald on systemd systems).<br/>
  Example: `logger "This is a test log message"`

## Debugger

- Bash provides built-in options to debug scripts and see what commands are executing.
- Methods:
  1. Run Script in Debug Mode = `bash -x script.sh`
  2. Add Debug Mode Inside Script: <br/>
     At the top: `set -x`<br/>
     At the bottom: `set +x` to turn it off

## Shell Variables

- A variable in a shell stores a value (string (default), number, path, etc.) so user can reuse it later.<br/>

  | Variable    | Meaning                                        |
  | ----------- | ---------------------------------------------- |
  | `$0`        | Script name<br/>                               |
  | `$1`        | … $9 Positional parameters<br/>                |
  | `$@`        | All arguments as separate words<br/>           |
  | `$*`        | All arguments as a single word<br/>            |
  | `$#`        | Number of arguments passed<br/>                |
  | `$?`        | Exit status of last command<br/>               |
  | `$$`        | PID of current script<br/>                     |
  | `$!`        | PID of last background job                     |
  | `$UID`      | User ID of the current user                    |
  | `$USER`     | Username of the current user                   |
  | `$HOSTNAME` | System’s hostname                              |
  | `$RANDOM`   | Generates a random integer between 0 and 32767 |

- **`Read`** Variable :

  - `$VAR` → Access variable value
  - `${VAR}` → Safer way - [ preferred ]

- **`Set`** Variable - `NAME="Linux"` (There should be no spaces around =).

  - Inside a script or current shell session, Local variables override environment variables if they share the same name.
  - Outside the script, the environment variable is unaffected , unless user export the new value.

  ### Types of Shell Variables

  1. **Local / Script Variables**
     <br/>
     Examples : `GREETING="Hi"`,etc.
     <br/><br/>
  2. **Constant Variable**
     <br/>
     Examples : `readonly NAME="Linux"`,etc.
     <br/><br/>
  3. **Environment Variables**
     <br/>
     Examples : `export GREETING="Hi"`,etc.
     <br/><br/>
  4. **Positional Variables**
     <br/>
     Examples : `$0` - script name , `$1` - first arguments , `$2` - second arguments , `$@` - all arguments `, $#` - number of arguments , etc.
     <br/><br/>
  5. **Special Script Variables**
     <br/>
     Examples :`$?`- exit status of last command (0 = success, non-zero = error), `$$` - PID (process ID) of the current shell, `$!` - PID of the last background job, etc.

## Operators

1. Arithmetic Operators

   | Operator | Meaning        | Example            |
   | -------- | -------------- | ------------------ |
   | +        | Addition       | `echo $((5 + 2))`  |
   | -        | Subtraction    | `echo $((5 - 2))`  |
   | \*       | Multiplication | `echo $((5 * 2))`  |
   | /        | Division       | `echo $((10 / 2))` |
   | %        | Modulus        | `echo $((10 % 3))` |
   | \*\*     | Exponent       | `echo $((2 ** 3))` |

2. Integer Comparison Operators

   | Operator | Meaning          |
   | -------- | ---------------- |
   | -eq      | equal to         |
   | -ne      | not equal        |
   | -gt      | greater than     |
   | -lt      | less than        |
   | -ge      | greater or equal |
   | -le      | less or equal    |

3. String Comparison Operators

   | Operator | Meaning                                              |
   | -------- | ---------------------------------------------------- |
   | =        | strings are equal                                    |
   | ==       | strings are equal (Best for bash, supports patterns) |
   | !=       | strings are NOT equal                                |
   | <        | lexicographically less                               |
   | >        | lexicographically greater                            |
   | -z       | string is empty                                      |
   | -n       | string is not empty                                  |

4. File Test Operators

   | Operator | Meaning                           |
   | -------- | --------------------------------- |
   | -e file  | file exists                       |
   | -f file  | file exists and is a regular file |
   | -d dir   | directory exists                  |
   | -s file  | file size > 0                     |
   | -r file  | readable                          |
   | -w file  | writable                          |
   | -x file  | executable                        |
   | -L file  | symbolic link                     |

5. Boolean Operators

   | Operator   | Meaning |
   | ---------- | ------- |
   | !          | NOT     |
   | -a or &&   | AND     |
   | -o or \|\| | OR      |

6. Logical Command Operators (outside [...] )

   | Operator | Meaning                                     |
   | -------- | ------------------------------------------- |
   | &&       | Run next command only if previous succeeded |
   | \|\|     | Run next command only if previous failed    |

7. Increment / Decrement Operators

   | Operator | Meaning   |
   | -------- | --------- |
   | ++       | increment |
   | --       | decrement |

8. Assignment Operators

   | Operator | Meaning                 |
   | -------- | ----------------------- |
   | =        | assign                  |
   | +=       | append / add and assign |
   | -=       | subtract and assign     |
   | \*=      | multiply and assign     |

## Shell Statements

- ### `;` means end of one command and start of another on the same line.

- ### if-else<br/>

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

- ### case

  ```bash
  read -p "Enter a letter: " letter

  case ${letter} in
    a|A) echo "You chose A";;
    b|B) echo "You chose B";;
    *)   echo "Unknown letter";;
  esac
  ```

- ### Loops

  - #### for

    ```bash
    for i in {1...5};     # or for i in 1 2 3 4 5
    do
      echo "Number $i"
    done

    ```

  - #### while ( runs while condition is TRUE )

    ```bash
    count=1
    while [ $count -le 5 ]; do
      echo "Count is $count"
      ((count++))
    done

    ```

  - #### until ( runs while condition is FALSE )

    ```bash
    count=1
    until [ $count -gt 5 ]; do
      echo "Count is $count"
      ((count++))
    done

    ```

- ### exit ( Stops the execution of the script immediately and Returns a exit status )

  - Status Code:
    - `0` - success
    - `non-zero` - error
    - `$?` - Check last command exit status

  ```bash
  if [ ! -f "$1" ]; then
    echo "File not found!"
    exit 1
  fi
  ```

- ### break ( Stops the execution of the loop )

- ### continue ( Skip the current iteration of the loop and start the next iteration )

- ### sleep ( Create delay between two executions )

---

<br/>

## Arrays

```bash
  1. 0-indexed based array
    arr=("apple" "banana" "mango")
    echo ${arr[0]}
    echo ${arr[*]}
    echo ${#arr[*]}   # length

  2. key-value pair based array
    declare -A arr2
    arr2=([key1]=value1 [key2]=value2 )
    echo ${arr2[key1]}
```

<br/>

## Strings

```bash
    str = "String Value"
    length = ${#str}
    UPPER CASE = ${str^^}
    lower case = ${str,,}
    Replace Word = ${str/oldWord/newWord}
    Slice String = ${str:from:to}
```

<br/>

## Functions

```bash
greet() {
  echo "Hello $1"
}

greet "Alice"
```

<br/>
