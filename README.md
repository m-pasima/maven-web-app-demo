# 🚀 DevOps Academy – Maven Web Application


Welcome to the hands-on DevOps Academy demo! This project is a Spring MVC web app (Maven-based, packaged as a WAR) showcasing a real-world, cloud-native CI/CD pipeline for Java developers and DevOps engineers.

**Note:** The application now targets **Jakarta EE 10 (Servlet&nbsp;6)** and is tested on **Apache Tomcat&nbsp;11**.

---

## 🏗️ What’s Included?

This repo demonstrates **end-to-end CI/CD** with:

- **Maven** – Build management
- **SonarQube** – Code quality & security scanning
- **Nexus** – Artifact repository (release & snapshot)
- **Docker** – Containerization
- **Apache Tomcat** – App server
- **Kubernetes** – Container orchestration
- **Jenkins** – CI/CD automation

---

## ⚡️ Quick Start: Automated Lab Setup

### 🛠️ Install DevOps Tools Automatically

Don’t waste hours on manual setup—**automated scripts are ready for you!**

- 👉 [DevOps-class-installation-scripts](https://github.com/m-pasima/DevOps-class-installation-scripts.git)  
  *Bash scripts to install Java, Maven, Docker, SonarQube, Nexus, Jenkins, and Tomcat on your Linux servers.*

  > **Best Practice:**  
  > Review each script before running. Use test VMs—don’t experiment on production.

### ☁️ One-Click AWS Lab with Terraform

Spin up an entire CI/CD environment (servers + tools) in AWS using Terraform:

- 👉 [terraform-aws-devops-lab](https://github.com/m-pasima/terraform-aws-devops-lab.git)  
  *Automated infrastructure-as-code to create EC2 servers and install SonarQube, Nexus, Jenkins, and Tomcat.*

  > **Warning:**  
  > This will provision AWS resources—costs may apply. Always run `terraform destroy` when finished to avoid surprises!

---

## 🎯 Kubernetes Controllers Teaching Lab

This project includes a comprehensive **Kubernetes Controllers Teaching Lab** in the `k8s-controllers/` directory:

### 📁 Controller Examples (7 Types)
- **Deployment** - Stateless app management with rolling updates
- **ReplicaSet** - Pod replica management (usually via Deployment)
- **DaemonSet** - Node-level services (logging, monitoring)
- **StatefulSet** - Stateful apps with persistent storage (PostgreSQL)
- **Job** - One-time tasks (database migration, data processing)
- **CronJob** - Scheduled tasks (backups, maintenance)
- **HPA** - Auto-scaling based on CPU/memory metrics

### 📚 Interactive Learning Materials
- **`kubernetes-controllers-guide.html`** - Complete visual guide with examples
- **`service-examples.yaml`** - LoadBalancer and NodePort services
- **`README.md`** - Quick reference and demo commands

### 🚀 Quick Demo
```bash
# Deploy all controllers
kubectl apply -f k8s-controllers/

# Watch controllers in action
kubectl get all -w

# Test auto-scaling
kubectl run -i --tty load-generator --rm --image=busybox --restart=Never -- /bin/sh
# Inside pod: while true; do wget -q -O- http://maven-webapp-service; done

# Cleanup
kubectl delete -f k8s-controllers/
```

---

## 📂 Project Structure

```
maven-web-app-demo-1/
├── src/
│   ├── main/
│   │   ├── java/com/mt/controller/HelloController.java
│   │   └── webapp/
│   │       ├── WEB-INF/web.xml
│   │       └── index.jsp
│   └── test/java/com/mt/controller/HelloControllerTest.java
├── k8s-controllers/
│   ├── 01-deployment-controller.yaml
│   ├── 02-replicaset-controller.yaml
│   ├── 03-daemonset-controller.yaml
│   ├── 04-statefulset-controller.yaml
│   ├── 05-job-controller.yaml
│   ├── 06-cronjob-controller.yaml
│   ├── 07-hpa-controller.yaml
│   ├── service-examples.yaml
│   ├── kubernetes-controllers-guide.html
│   └── README.md
├── pom.xml
├── Dockerfile
├── Jenkinsfile
├── k8s-deployment.yaml
└── README.md
```

---

## 🔥 Prerequisites

### Core Development Tools
- **Java 8+** - Application runtime
- **Maven 3.8+** - Build management
- **Docker** - Containerization

### CI/CD Pipeline Tools
- **Jenkins** (with Pipeline & Git plugins) - Automation
- **SonarQube** - Code quality & security
- **Nexus Repository Manager** - Artifact storage

### Container Orchestration
- **Kubernetes cluster** (minikube, EKS, AKS, GKE, etc.)
- **kubectl** - Kubernetes CLI
- **Metrics Server** - For HPA auto-scaling

### Database (for StatefulSet demos)
- **PostgreSQL** - Persistent data storage

**Tip:** Use the automated scripts/lab above to fast-track setup!

---

## 🏗️ Maven Build

```bash
mvn clean install
````

Creates `target/tesco.war`.

> Use `mvn clean verify` for strict, CI-friendly builds.

---

## 🔎 SonarQube Integration

Add to your `pom.xml`:

```xml
<properties>
  <sonar.host.url>http://<sonarqube-ip>:9000</sonar.host.url>
  <sonar.login>your-token</sonar.login>
</properties>
```

Run analysis:

```bash
mvn sonar:sonar
```

> **Store your SonarQube token securely**—use Jenkins credentials binding for pipelines.

---

## 📦 Nexus Integration

In `pom.xml` (for deploying builds):

```xml
<distributionManagement>
  <repository>
    <id>nexus</id>
    <url>http://<nexus-ip>:8081/repository/maven-releases/</url>
  </repository>
  <snapshotRepository>
    <id>nexus</id>
    <url>http://<nexus-ip>:8081/repository/maven-snapshots/</url>
  </snapshotRepository>
</distributionManagement>
```

Deploy:

```bash
mvn deploy
```

> Store Nexus credentials in Maven’s `settings.xml` and Jenkins secrets—**never commit secrets to Git!**

---

## 🐳 Docker Setup

### Dockerfile

```Dockerfile
# Example Dockerfile using Tomcat 11
FROM tomcat:11-jdk17-temurin
RUN rm -rf /usr/local/tomcat/webapps/*
COPY target/tesco.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
```

Build & run locally:

```bash
docker build -t devops-academy .
docker run -p 8080:8080 devops-academy
```

---

## ☸️ Kubernetes Deployment

### k8s-deployment.yaml

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: devops-academy-app
spec:
  replicas: 2
  selector:
    matchLabels:
      app: devops-academy
  template:
    metadata:
      labels:
        app: devops-academy
    spec:
      containers:
      - name: webapp
        image: your-dockerhub/devops-academy:latest
        ports:
        - containerPort: 8080
---
apiVersion: v1
kind: Service
metadata:
  name: devops-academy-service
spec:
  type: LoadBalancer
  selector:
    app: devops-academy
  ports:
  - port: 80
    targetPort: 8080
```

Apply to cluster:

```bash
kubectl apply -f k8s-deployment.yaml
```

> **Pro Tip:**
> Always use image tags (`:v1.0.0`, `${BUILD_NUMBER}`) instead of `latest` for predictable deployments.

---

## 📖 Complete File Reference

### 🛠️ Build & Configuration Files

#### `pom.xml`
- **Purpose**: Maven build configuration
- **Key Features**: Jakarta EE 10, Servlet 6, PostgreSQL driver
- **Build Command**: `mvn clean install`
- **Output**: `target/tesco.war`

#### `Dockerfile`
- **Purpose**: Container image definition
- **Base Image**: `tomcat:11-jdk17-temurin`
- **Deployment**: Copies WAR to `/usr/local/tomcat/webapps/ROOT.war`
- **Port**: Exposes 8080

#### `Jenkinsfile`
- **Purpose**: CI/CD pipeline automation
- **Stages**: Build → Test → SonarQube → Nexus → Docker → K8s Deploy
- **Features**: Multibranch support, automated deployments

### 🔍 Application Source Code

#### `src/main/java/com/mt/controller/HelloController.java`
- **Purpose**: Spring MVC controller
- **Endpoints**: `/`, `/enquiry` (form handling)
- **Database**: PostgreSQL integration for enquiry storage

#### `src/main/webapp/index.jsp`
- **Purpose**: Main web interface
- **Features**: Contact form, responsive design
- **Integration**: Connects to HelloController

#### `src/test/java/com/mt/controller/HelloControllerTest.java`
- **Purpose**: Unit tests for controller
- **Framework**: JUnit testing
- **Coverage**: Controller endpoints and database operations

### ☁️ Kubernetes Deployment Files

#### `k8s-deployment.yaml`
- **Purpose**: Basic Kubernetes deployment
- **Type**: Simple Deployment + Service
- **Use Case**: Quick single-controller deployment

#### `k8s-controllers/` Directory
Comprehensive Kubernetes controller examples for teaching:

**Controller YAML Files:**
- `01-deployment-controller.yaml` - Stateless app with rolling updates
- `02-replicaset-controller.yaml` - Direct ReplicaSet management
- `03-daemonset-controller.yaml` - Node-level log collection
- `04-statefulset-controller.yaml` - PostgreSQL database with persistence
- `05-job-controller.yaml` - Database migration and seeding
- `06-cronjob-controller.yaml` - Scheduled backup operations
- `07-hpa-controller.yaml` - Auto-scaling configuration
- `service-examples.yaml` - LoadBalancer and NodePort services

**Documentation Files:**
- `kubernetes-controllers-guide.html` - Interactive visual guide
- `README.md` - Quick reference and demo commands

### 📊 Deployment Architecture

```
Maven Build → Docker Image → Kubernetes Controllers
     │              │                    │
  tesco.war    →  Container     →    Pod Replicas
     │              │                    │
 CI/CD Pipeline →  Registry     →    Load Balancer
```

### 🚀 Testing & Validation Commands

```bash
# Build and test locally
mvn clean test
mvn clean install

# Docker testing
docker build -t maven-webapp .
docker run -p 8080:8080 maven-webapp

# Basic Kubernetes deployment
kubectl apply -f k8s-deployment.yaml
kubectl get pods,services

# Full controller demo
kubectl apply -f k8s-controllers/
kubectl get all -w

# Load testing (for HPA)
kubectl run -i --tty load-generator --rm --image=busybox --restart=Never -- /bin/sh
# Inside pod: while true; do wget -q -O- http://maven-webapp-service; done

# Access application
kubectl port-forward service/maven-webapp-service 8080:8080
# Visit: http://localhost:8080

# Cleanup
kubectl delete -f k8s-controllers/
kubectl delete -f k8s-deployment.yaml
```

---

## 🐘 PostgreSQL Setup

The application stores enquiries in PostgreSQL. Configure connection details using environment variables before starting Tomcat:

```bash
export DB_URL="jdbc:postgresql://<db-host>:5432/<db>"
export DB_USERNAME="postgres"
export DB_PASSWORD="your-password"
```

Pass these variables to `docker run` or your Kubernetes deployment so the webapp can connect to your database.

---

## 🔄 Jenkins Multibranch Pipeline Example

### Jenkinsfile

```groovy
pipeline {
    agent any

    tools {
        maven 'Maven 3.8.6'
        jdk 'Java 8'
    }

    environment {
        IMAGE_TAG = "${env.BRANCH_NAME}-${env.BUILD_NUMBER}"
    }

    stages {
        stage('Checkout') {
            steps {
                echo "Checked out branch: ${env.BRANCH_NAME}"
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean install'
            }
        }

        stage('Code Analysis') {
            steps {
                withSonarQubeEnv('SonarQube') {
                    sh 'mvn sonar:sonar'
                }
            }
        }

        stage('Publish Artifact') {
            steps {
                sh 'mvn deploy'
            }
        }

        stage('Docker Build & Push') {
            steps {
                script {
                    dockerImage = docker.build("your-dockerhub/devops-academy:${env.IMAGE_TAG}")
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-credentials') {
                        dockerImage.push()
                        dockerImage.push('latest')
                    }
                }
            }
        }

        stage('Deploy to Kubernetes') {
            when {
                branch 'main'
            }
            steps {
                withKubeConfig([credentialsId: 'kubeconfig-id']) {
                    sh 'kubectl apply -f k8s-deployment.yaml'
                }
            }
        }
    }
}
```

> **Multibranch Pipelines:**
> Jenkins will automatically create jobs for every branch with a `Jenkinsfile`—perfect for modern Git workflows.

---

## 🗂️ Maven Local Repository (Optional)

To use a shared Maven repo (helpful in CI/CD):

Edit `/opt/maven/conf/settings.xml`:

```xml
<localRepository>/opt/maven/repo</localRepository>
```

---

## 🦾 Best Practices & Maintenance

* **Always use Jenkins/K8s secrets for credentials.**

* **Delete stale remote branches** to keep your repo healthy:

  ```bash
  git push origin --delete <branch-name>
  ```

* **Protect key branches** via branch protection rules in your Git hosting platform.

* **Monitor your build nodes**—label agents for special tools (e.g., Docker, Java, Node.js).

---

## 🆘 Support & Contribution

* Found a bug or want to improve something?
  [Open an issue](https://github.com/m-pasima/maven-web-app-demo/issues) or connect with [Pasima](https://m-pasima.github.io/The-DevOps-Academy/).
* For installation help, see
  [DevOps-class-installation-scripts](https://github.com/m-pasima/DevOps-class-installation-scripts.git)
  and
  [terraform-aws-devops-lab](https://github.com/m-pasima/terraform-aws-devops-lab.git).

---

## © DevOps Academy

```

