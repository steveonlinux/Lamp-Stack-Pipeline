# LAMP Stack Pipeline 🛋️

This repo contains a pipeline that deploys a LAMP stack in the form of a Docker container named "lamp". The pipeline has the following flow:

```mermaid
flowchart TD
    A[Code Commit] --> B{GitHub Actions}
    B -->|Build| C[Docker Build]
    C --> D[Docker Push]
    D --> E[Push to DockerHub]
    E --> F{User Action}
    F -->|Pull Docker Image| G[Ansible Playbook]
    G --> H[Deploy on Local Machine]
    F -->|Direct Pull| I[Direct Docker Pull & Run]
    H --> J[Application Running]
    I --> J

    click B "https://docs.github.com/en/actions" "GitHub Actions Docs"
    click C "https://docs.docker.com/engine/reference/commandline/build/" "Docker Build Docs"
    click D "https://docs.docker.com/engine/reference/commandline/push/" "Docker Push Docs"
    click G "https://docs.ansible.com/ansible/latest/user_guide/playbooks.html" "Ansible Playbooks"
```


To deploy the container run the Ansible playbook with:
```bash 
ansible-playbook playbook.yml
```
Or pull and run directly from Dockerhub at https://hub.docker.com/r/steveonlinux/lamp.

The playbook assumes SystemD is being used and that the package manager is either apt, DNF, or pacman. The site will be at http://localhost:8080. 
