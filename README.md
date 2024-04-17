# Lamp Stack Pipeline 🛋️

This repo contains a pipeline that deploys a LAMP stack in the form of a Docker container named "lamp". The pipeline has the following flow:

* Github
* Github Actions
* Dockerhub
* Ansible

To deploy the container run the Ansible playbook with `insert command`. The playbook assumes SystemD is being used and that the package manager is either apt, DNF, or pacman. The site will be at http://localhost:8080. 
