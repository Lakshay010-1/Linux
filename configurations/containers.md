# Containers

- A container is a lightweight, isolated environment that packages an application and all its dependencies, ensuring it runs the same on any system.
- Most commonly managed using Docker or Podman.
- It's fast, portable, and consistent application deployment without full virtual machines.

---

<br/>
<br/>

## Main Components of a Container

| Component                        | Description / Function                                                                                         | Example / Notes                                                     |
| -------------------------------- | -------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------- |
| **1️. Image**                    | A read-only template that contains the application and its dependencies. Containers are created from images.   | Example: **nginx:latest**, **ubuntu:20.04**                         |
| **2️. Container**                | A running instance of an image. It has its own process, filesystem, and network stack, isolated from the host. | Example: A running **NGINX web server**                             |
| **3️. Dockerfile**               | A text file containing instructions to build a custom image (`FROM`, `RUN`, `COPY`, `CMD`, etc.).              | Example: `FROM ubuntu:20.04` → `RUN apt install nginx -y`           |
| **4️. Registry / Repository**    | A storage and distribution system for images — public or private.                                              | Example: **Docker Hub**, **AWS ECR**, **GitHub Container Registry** |
| **5️. Container Engine**         | The runtime that manages images and containers (pulls images, starts/stops containers).                        | Example: **Docker Engine**, **Podman**, **containerd**              |
| **6️. Container Runtime**        | The low-level component that actually runs containers, providing isolation using namespaces and cgroups.       | Example: **runc**, **crun**                                         |
| **7️. Storage / Volumes**        | Persistent storage mechanism to keep data outside the container lifecycle.                                     | Example: `docker volume create webdata` or `-v /data:/var/www/html` |
| **8️. Network**                  | Provides connectivity between containers and the host or external systems.                                     | Example: **bridge**, **host**, **overlay** networks                 |
| **9️. Orchestrator (optional)**  | Manages multiple containers across clusters, handling scaling, load balancing, and health checks.              | Example: **Kubernetes**, **Docker Swarm**                           |
| **10. Configuration / Metadata** | Environment variables, ports, labels, and settings defined for containers.                                     | Example: `-e MYSQL_ROOT_PASSWORD=pass123`, `-p 8080:80`             |

---

<br/>
<br/>

## Containers Engine Confiuration

| Step    | Action                                | **Docker Commands / Notes**                                                                         | **Podman Commands / Notes**                                                                      |
| ------- | ------------------------------------- | --------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------ |
| **1️**  | **Install the Engine**                | **Ubuntu/Debian:** `sudo apt install docker.io -y`<br>**RHEL/CentOS:** `sudo dnf install docker -y` | **Ubuntu/Debian:** `sudo apt install podman -y`<br>**RHEL/CentOS:** `sudo dnf install podman -y` |
| **2️**  | **Start and enable the service**      | `sudo systemctl enable --now docker`                                                                | No daemon required (Podman is **daemonless**)                                                    |
| **3️**  | **Verify installation**               | `docker --version`                                                                                  | `podman --version`                                                                               |
| **4️**  | **Check system info**                 | `docker info`                                                                                       | `podman info`                                                                                    |
| **5️**  | **Search for an image**               | `docker search nginx`                                                                               | `podman search nginx`                                                                            |
| **6️**  | **Pull an image**                     | `docker pull nginx`                                                                                 | `podman pull nginx`                                                                              |
| **7️**  | **Run a container**                   | `docker run -d -p 8080:80 --name web nginx`                                                         | `podman run -d -p 8080:80 --name web nginx`                                                      |
| **8️**  | **List running containers**           | `docker ps`                                                                                         | `podman ps`                                                                                      |
| **9️**  | **View container logs**               | `docker logs web`                                                                                   | `podman logs web`                                                                                |
| **10**  | **Access shell inside container**     | `docker exec -it web /bin/bash`                                                                     | `podman exec -it web /bin/bash`                                                                  |
| **11️** | **Stop a container**                  | `docker stop web`                                                                                   | `podman stop web`                                                                                |
| **12️** | **Remove a container**                | `docker rm web`                                                                                     | `podman rm web`                                                                                  |
| **13️** | **List downloaded images**            | `docker images`                                                                                     | `podman images`                                                                                  |
| **14️** | **Remove image**                      | `docker rmi nginx`                                                                                  | `podman rmi nginx`                                                                               |
| **15️** | **Enable rootless mode**              | Requires `sudo` by default (root-based).                                                            | Runs **rootless by default** (per-user).                                                         |
| **16️** | **Persistent volumes**                | `docker volume create data`<br>`docker run -v data:/var/www/html nginx`                             | `podman volume create data`<br>`podman run -v data:/var/www/html nginx`                          |
| **17️** | **Enable Docker socket (API access)** | Automatically runs at `/var/run/docker.sock`                                                        | `systemctl --user enable --now podman.socket`                                                    |
| **18️** | **Use Docker CLI with Podman**        | N/A                                                                                                 | `export DOCKER_HOST=unix:///run/user/$UID/podman/podman.sock`<br>`docker ps`                     |
| **19️** | **Compose / Multi-container apps**    | `docker-compose up -d`                                                                              | `podman-compose up -d` _(install with `sudo apt install podman-compose`)_                        |
| **20️** | **Cleanup unused resources**          | `docker system prune -a`                                                                            | `podman system prune -a`                                                                         |
