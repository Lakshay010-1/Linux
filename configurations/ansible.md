# Ansible

- Ansible is an open-source IT automation tool used for configuration management, application deployment, task automation, and orchestration.
- Agentless automation — uses SSH to connect to remote systems.
- Uses YAML for playbooks
- Automate updates, manage servers, deploy apps, configure networks, etc.

# Configuration

| Step   | Action                                            | Command / File / Path                                                                                                       | Purpose / Notes                                                                                                  |
| ------ | ------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------- |
| **1️⃣** | **Install Ansible**                               | **RHEL/CentOS:**<br>`sudo dnf install ansible -y`<br>**Ubuntu/Debian:**<br>`sudo apt update && sudo apt install ansible -y` | Installs Ansible package and dependencies.                                                                       |
| **2️⃣** | **Verify installation**                           | `ansible --version`                                                                                                         | Confirms Ansible is successfully installed.                                                                      |
| **3️⃣** | **Create inventory file (list of managed hosts)** | Default: `/etc/ansible/hosts`<br>or create custom file:<br>`sudo nano ~/inventory`                                          | Defines target systems for automation<br>Example:<br>```[webservers]<br/> 192.168.1.10<br/>192.168.1.11<br/>```` |
| **4️⃣** | **Configure SSH access to remote nodes**          | Generate SSH key:<br>`ssh-keygen -t rsa`<br>Copy to remote hosts:<br>`ssh-copy-id user@192.168.1.10`                        | Enables passwordless SSH login (Ansible uses SSH for connections).                                               |
| **5️⃣** | **Test connectivity to hosts**                    | `ansible all -m ping -i ~/inventory`                                                                                        | Tests communication with remote nodes — should return `pong`.                                                    |
| **6️⃣** | **Create Ansible configuration file (optional)**  | `sudo nano /etc/ansible/ansible.cfg`                                                                                        | Defines defaults such as inventory path, roles path, and logging settings.                                       |
| **7️⃣** | **Write a simple playbook (YAML)**                | Example file: `~/setup.yml`                                                                                                 | Defines a simple automation task using Ansible’s declarative syntax.                                             |
| **8️⃣** | **Run the playbook**                              | `ansible-playbook -i ~/inventory ~/setup.yml`                                                                               | Executes tasks defined in the playbook across target systems.                                                    |
| **9️⃣** | **Check results and logs**                        | `ansible -i ~/inventory all -m setup`                                                                                       | Displays system facts and confirms successful automation.                                                        |
