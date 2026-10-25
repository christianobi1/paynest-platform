# PayNest Technologies — Zuri Market DevOps Capstone

## 1. Project Overview

This project demonstrates the implementation of a DevOps workflow for the Zuri Market application. It covers application containerization, infrastructure as code, continuous integration and delivery, security scanning, cloud deployment, Kubernetes orchestration, monitoring, and automated health checks.

The goal is to demonstrate how an application can be packaged, tested, scanned for vulnerabilities, deployed, monitored, and maintained using modern DevOps tools.

## 2. Project Repositories

The project is organized into three GitHub repositories:

* **Backend:** https://github.com/christianobi1/zuriapp-backend
* **Frontend:** https://github.com/christianobi1/zuriapp-frontend
* **Platform:** https://github.com/christianobi1/paynest-platform

The backend and frontend repositories contain the application code, Dockerfiles, and GitHub Actions workflows. The platform repository contains infrastructure configurations, Kubernetes manifests, Docker Compose configuration, health-check scripts, and project documentation.

## 3. Technologies Used

| Category                           | Tools                     |
| ---------------------------------- | ------------------------- |
| Version control                    | Git and GitHub            |
| Frontend                           | React, Vite, Node.js      |
| Backend                            | Node.js and Express       |
| Containerization                   | Docker                    |
| Local orchestration                | Docker Compose            |
| CI/CD                              | GitHub Actions            |
| Security scanning                  | Trivy                     |
| Container registry                 | Docker Hub                |
| Infrastructure as Code             | Terraform                 |
| Cloud provider                     | Amazon Web Services (AWS) |
| Cloud compute                      | Amazon EC2                |
| Object storage and Terraform state | Amazon S3                 |
| Secrets management                 | AWS Secrets Manager       |
| Container orchestration            | Kubernetes                |
| Package management                 | Helm                      |
| Monitoring and metrics             | Prometheus                |
| Dashboards and visualization       | Grafana                   |
| Automation                         | Bash and cron             |

## 4. Architecture

The application consists of a React frontend and a Node.js backend API. Both components are containerized and deployed on AWS EC2.

The frontend is served through Nginx. Nginx forwards API requests to the backend container over a Docker network.

GitHub Actions workflows validate the applications, build container images, and perform Trivy vulnerability scans. Docker images are published to Docker Hub for deployment.

Terraform manages the AWS infrastructure, while Kubernetes manifests define application deployments, services, configuration, and access control. Prometheus and Grafana provide monitoring and visualization.

### Application Request Flow

1. A user accesses the frontend through a web browser.
2. Nginx serves the frontend application.
3. Requests to `/api/` are forwarded to the backend container.
4. The backend processes the request and returns a response.
5. Prometheus collects available metrics, which can be visualized in Grafana.

## 5. Repository Structure

```text
paynest-capstone/
├── zuriapp-backend/
│   ├── .github/
│   │   └── workflows/
│   ├── Dockerfile
│   └── application source
├── zuriapp-frontend/
│   ├── .github/
│   │   └── workflows/
│   ├── Dockerfile
│   ├── nginx.conf
│   └── application source
└── paynest-platform/
    ├── docker-compose.yml
    ├── terraform/
    │   ├── environments/
    │   │   ├── dev/
    │   │   └── prod/
    │   └── modules/
    ├── kubernetes/
    ├── scripts/
    │   └── health-check.sh
    ├── health-reports/
    │   └── health-check.log
    ├── evidence/
    └── README.md
```

## 6. Local Development with Docker Compose

### Prerequisites

Install the following tools:

* Git
* Docker Engine or Docker Desktop
* Docker Compose v2
* Node.js and npm

### Clone the Repositories

```bash
mkdir paynest-capstone
cd paynest-capstone

git clone https://github.com/christianobi1/zuriapp-backend.git
git clone https://github.com/christianobi1/zuriapp-frontend.git
git clone https://github.com/christianobi1/paynest-platform.git
```

### Configure the Backend

Navigate to the backend repository:

```bash
cd zuriapp-backend
cp .env.example .env
```

Configure the required environment variables in `.env`, including a strong, private `API_SECRET_KEY` where required by the application.

Never commit `.env` files or expose secret values.

### Start the Application

Navigate to the platform repository:

```bash
cd ../paynest-platform
docker compose up -d --build
```

Check the running services:

```bash
docker compose ps
```

### Application Endpoints

When running the local Docker Compose configuration:

* Frontend: http://localhost:3000
* Backend store endpoint: http://localhost:5000/api/store
* Backend products endpoint: http://localhost:5000/api/products

The store endpoint was verified to return a successful JSON response:

```json
{
  "name": "My Store",
  "totalProducts": 8
}
```

### View Logs

```bash
docker compose logs
```

Follow the logs continuously:

```bash
docker compose logs -f
```

### Stop the Application

```bash
docker compose down
```

This stops and removes the Compose containers and network without deleting the source repositories.

## 7. Infrastructure as Code with Terraform

Terraform is used to provision and manage AWS infrastructure.

The platform repository contains development and production environment configurations and reusable infrastructure modules.

The infrastructure configuration covers resources such as:

* Virtual Private Cloud (VPC) and networking
* Subnets and internet connectivity
* Security groups
* IAM roles and permissions
* EC2 compute resources
* Amazon S3 remote Terraform state
* AWS Secrets Manager integration

The development infrastructure was successfully applied to AWS.

Remote Terraform state is configured in Amazon S3, with separate state keys for development and production.

**Environment status:** Development infrastructure was deployed. The presence of production configuration does not mean production infrastructure has been deployed.

### Important Cost Consideration

AWS resources may incur charges while running. Review EC2 instances, storage, networking resources, and other billable services when the environment is not needed.

Always review Terraform plans before applying changes or destroying infrastructure.

## 8. CI/CD with GitHub Actions

GitHub Actions workflows are configured in both application repositories.

### Backend Pipeline

The backend workflow includes:

1. Checking out the source code.
2. Setting up Node.js.
3. Installing dependencies using `npm ci`.
4. Running ESLint.
5. Running API tests.
6. Scanning the filesystem with Trivy.
7. Building the Docker image.
8. Scanning the image for vulnerabilities.
9. Publishing the image to Docker Hub on version-tag pushes.

### Frontend Pipeline

The frontend workflow includes:

1. Checking out the source code.
2. Setting up Node.js.
3. Installing dependencies using `npm ci`.
4. Building the frontend application.
5. Scanning the filesystem with Trivy.
6. Building the Docker image.
7. Scanning the image for vulnerabilities.
8. Publishing the image to Docker Hub on version-tag pushes.

### Security Scanning

Trivy is configured to detect HIGH and CRITICAL vulnerabilities and fail the relevant workflow step when findings meet the configured failure criteria. Unfixed vulnerabilities are excluded by the workflow configuration.

Both backend and frontend GitHub Actions workflows have been confirmed successful.

Docker Hub credentials are configured through GitHub Actions secrets rather than being embedded directly in workflow files.

## 9. Docker Image Deployment

The application components are packaged as separate Docker images and published to Docker Hub.

The frontend uses Nginx to serve the built React application and proxy API requests to the backend.

The backend container exposes its API internally to the frontend container through a Docker network. Its host port is bound to localhost on the EC2 instance rather than exposed publicly.

The frontend is exposed through port 80.

The deployed frontend and backend were tested successfully on the EC2 instance.

## 10. AWS Deployment

The application was deployed to an AWS EC2 instance in the `us-east-1` region.

The deployed components include:

* Frontend container serving the application through Nginx
* Backend container serving the API
* Docker network connecting the frontend and backend
* AWS security groups controlling network access
* An IAM instance role for permitted AWS operations

### Deployment Verification

The following checks were successful:

* The frontend returned HTTP 200.
* The backend store endpoint returned HTTP 200.
* The public frontend website was accessible through the EC2 public IP.
* The frontend successfully communicated with the backend through the Nginx proxy.

The current deployment uses HTTP and an EC2 public IP address. HTTPS and a custom domain have not been configured.

## 11. Kubernetes

The `kubernetes/` directory contains Kubernetes manifests for deploying and exposing the application components.

The manifests include resources for:

* Backend Deployment and Service
* Frontend Deployment and Service
* Backend configuration
* Ingress
* ServiceAccount
* Role and RoleBinding
* Backend ServiceMonitor

These resources define application workloads, networking, configuration, and access control.

### Useful Kubernetes Commands

Check the active context:

```bash
kubectl config current-context
```

List nodes:

```bash
kubectl get nodes
```

List application pods:

```bash
kubectl get pods
```

List deployments and services:

```bash
kubectl get deployments
kubectl get services
```

Inspect a specific resource:

```bash
kubectl describe deployment <deployment-name>
```

Replace placeholder names with the actual resource names in the active cluster.

Always verify the Kubernetes context and namespace before applying manifests.

## 12. Monitoring with Prometheus and Grafana

Prometheus and Grafana are deployed in the local Kubernetes environment.

Prometheus serves as the metrics collection and querying system, while Grafana provides dashboards for visualizing metrics.

The configured dashboard includes panels for:

* Running pods
* Application pods
* Unhealthy application pods
* CPU usage
* Memory usage

Prometheus is configured as the Grafana data source.

The monitoring environment was checked, and the Grafana pods were observed running successfully.

## 13. Automated Health Checks

The `scripts/health-check.sh` script checks the availability of the frontend and backend and records timestamped results.

The results are appended to:

```text
health-reports/health-check.log
```

The script is configured for scheduled execution through cron in the WSL environment.

The scheduled entry runs daily at 05:00 West Africa Time (WAT).

The log contains multiple entries showing frontend and backend health-check results.

**Execution note:** The scheduled job depends on WSL and its cron service being active at the scheduled time.

### Inspect the Health Report

```bash
cat health-reports/health-check.log
```

### Inspect the Scheduled Job

```bash
crontab -l
```

## 14. Security Practices

The project incorporates several security practices:

* GitHub Actions secrets for Docker Hub credentials
* Trivy filesystem and container image scanning
* AWS IAM roles and scoped permissions
* AWS Secrets Manager for application secret storage
* Restricted SSH access through security group rules
* Environment variables for application configuration
* Exclusion of local environment files from source control

Secrets, tokens, private keys, and AWS credentials must never be committed to the repositories or included in public documentation.

## 15. Project Verification Summary

| Component                            | Status                     |
| ------------------------------------ | -------------------------- |
| Backend GitHub Actions workflow      | Passed                     |
| Frontend GitHub Actions workflow     | Passed                     |
| Docker image builds and publishing   | Images built and published |
| Terraform development infrastructure | Applied successfully       |
| AWS EC2 application deployment       | Running and tested         |
| Public frontend access               | Verified                   |
| Backend API endpoint                 | Verified                   |
| Kubernetes manifests                 | Added                      |
| Prometheus and Grafana               | Running                    |
| Automated health-check script        | Configured                 |
| Cron schedule and health logs        | Verified                   |
| Production infrastructure deployment | Not confirmed              |
| HTTPS and custom domain              | Not configured             |
| Argo CD/GitOps                       | Intentionally excluded     |

## 16. Future Improvements

Potential improvements include:

* Configure HTTPS with a domain name and TLS certificates.
* Add a managed or highly available production deployment.
* Expand application-level monitoring for request rate, error rate, and latency.
* Improve automated integration and end-to-end testing.
* Collect final screenshots and execution logs for project evidence.
* Add a documented disaster recovery and rollback procedure.

## Conclusion

The PayNest Technologies Zuri Market DevOps capstone demonstrates an end-to-end workflow involving application containerization, CI/CD, security scanning, infrastructure as code, AWS deployment, Kubernetes, monitoring, and automated health checks.

The project provides practical experience in deploying and operating an application while applying DevOps automation and security practices.

