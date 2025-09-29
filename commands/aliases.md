# Aliases

An alias is a shortcut for a longer command.

---

## Set / Create

- ### Temporary Aliases

  #### **`alias name='command'`**

  Example : `alias ll='ls -la'`

- ### Permanent Aliases

  To make them permanent, add them to your shell config file:

1. #### User Specific

   For Bash: `/.bashrc`

   For Zsh: `/.zshrc`

   `etc`.

   Example : `echo "alias ll='ls -la'" >> /.bashrc`

2. #### All Users System wide

   For Bash: `/etc/bashrc`

   `etc`.

   Example : `echo "alias ll='ls -la'" >> /etc/bashrc`

## Unset / Remove

### **`unalias alias_name`**

**Example :** unalias ll

## View

- List speicific alias. i.e.- **`alias_name`**

  **Example :** ll

- List all aliases. i.e.- **`alias`**

  **Example :** alias
