# PayNest Technologies — Zuri Market DevOps Capstone

This repository contains the platform and deployment configuration for the Zuri Market application.

## Repositories

- Backend: https://github.com/christianobi1/zuriapp-backend
- Frontend: https://github.com/christianobi1/zuriapp-frontend
- Platform: https://github.com/christianobi1/paynest-platform

## Prerequisites

- Git
- Docker Engine or Docker Desktop
- Docker Compose v2

## 1. Clone the repositories

Clone all three repositories into the same parent directory:

    mkdir paynest-capstone
    cd paynest-capstone
    git clone https://github.com/christianobi1/zuriapp-backend.git
    git clone https://github.com/christianobi1/zuriapp-frontend.git
    git clone https://github.com/christianobi1/paynest-platform.git

Expected directory layout:

    paynest-capstone/
    ├── zuriapp-backend/
    ├── zuriapp-frontend/
    └── paynest-platform/
        ├── docker-compose.yml
        └── README.md

## 2. Configure backend environment variables

Enter the backend directory:

    cd zuriapp-backend

Create a local environment file from the example:

    cp .env.example .env

Edit .env and set a strong, private API_SECRET_KEY.

Never commit .env or publish its secret values.

## 3. Start the application

From the paynest-platform directory, run:

    docker compose up -d --build

Check the services:

    docker compose ps

## 4. Test the application

- Frontend: http://localhost:3000
- Backend store endpoint: http://localhost:5000/api/store
- Backend products endpoint: http://localhost:5000/api/products

Expected store response:

    {"name":"Zuri Market","totalProducts":8}

## 5. View logs

    docker compose logs

Follow logs continuously:

    docker compose logs -f

## 6. Stop the application

    docker compose down

This stops and removes the Compose containers and network. It does not delete the source repositories.

## Current scope

The local Docker Compose stack is the initial application deployment stage. Terraform infrastructure, CI/CD pipelines, Kubernetes deployment, security scanning, monitoring, and automated health checks will be documented as they are implemented.
