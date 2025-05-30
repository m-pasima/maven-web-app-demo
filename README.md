
# 🚀 DevOps Academy - Maven Web Application

Welcome to the ultimate hands-on DevOps pipeline demo! This project is a **Spring MVC web app** built with Maven and designed to showcase an enterprise-grade, cloud-native CI/CD pipeline.

---

## 📦 Automated Setup

### 🛠️ **Installation Scripts**

- **Quick-start installation scripts** for tools like Java, Maven, Docker, SonarQube, Nexus, Jenkins, and Tomcat are available here:  
  👉 [DevOps-class-installation-scripts](https://github.com/m-pasima/DevOps-class-installation-scripts.git)

    - These scripts are designed to help you set up your DevOps tools on Linux VMs quickly and reproducibly.
    - **Best Practice:** Always review scripts before running, and test on non-production VMs first!

---

### ☁️ **Automated Cloud Lab with Terraform**

- Want to spin up a complete DevOps lab—including **EC2 servers** and auto-install of SonarQube, Nexus, Jenkins, and Tomcat?  
  👉 Use this Terraform project:  
  [terraform-aws-devops-lab](https://github.com/m-pasima/terraform-aws-devops-lab.git)

    - **Scenario:** Launch a ready-to-go CI/CD environment in AWS with a single `terraform apply`.
    - **Warning:** These scripts will create AWS resources and may incur costs—destroy resources when finished (`terraform destroy`).

---

## 🛠️ Stack Overview

- **Maven** – Build & dependency management
- **SonarQube** – Code quality & security scanning
- **Nexus** – Artifact repository (release & snapshot)
- **Docker** – App containerization
- **Apache Tomcat** – App server
- **Kubernetes** – Orchestration & scaling
- **Jenkins** – CI/CD automation engine

---

## ⚡ Quick Start

1. **Provision servers & install tools:**  
   Use the [installation scripts](https://github.com/m-pasima/DevOps-class-installation-scripts.git) or [Terraform AWS lab](https://github.com/m-pasima/terraform-aws-devops-lab.git) to automate setup.

2. **Clone this project:**  
   ```bash
   git clone https://github.com/m-pasima/maven-web-app-demo.git
   cd maven-web-app-demo
````

3. **Follow the rest of the README** to build, analyze, containerize, and deploy your application.

---

> **Pro Tip:**
> If you want to **customize servers (e.g., different regions, larger instances, or specific security group rules),** edit the Terraform variables and scripts as needed. Always test in a non-production account first!

---

## 🆘 Support

If you need help with the setup scripts, cloud lab, or CI/CD pipeline, [open an issue](https://github.com/m-pasima/maven-web-app-demo/issues) or reach out to [Pasima](https://m-pasima.github.io/The-DevOps-Academy/).

---

## © DevOps Academy

```



