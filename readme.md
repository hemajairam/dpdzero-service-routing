# DPDzero DevOps Assignment – Nginx Reverse Proxy + Docker Compose

## 🚀 Overview

This project sets up a Docker Compose-based system that includes:

- A **Go (Golang)** backend service (`service1`)
- A **Python (Flask)** backend service (`service2`)
- An **Nginx reverse proxy** to route traffic to each service
- Health checks for both services
- A single entry point via `localhost:8080`

All containers run in isolated Docker networks and are orchestrated using Docker Compose.
---
## 📁 Project Structure





.
├── docker-compose.yml
├── nginx
│ ├── nginx.conf
│ └── Dockerfile
├── service_1
│ ├── main.go
│ └── Dockerfile
├── service_2
│ ├── app.py
│ ├── pyproject.toml
│ ├── uv.lock
│ ├── healthcheck.sh
│ └── Dockerfile
└── README.md





---

## ⚙️ Setup Instructions

### 1. Clone the Repository

git https://github.com/hemajairam/dpdzero-service-routing
cd dpdzero-service-routing



### 2.Run the Application

docker compose up --build



This command:

Builds all three containers

Sets up a bridge network

Starts the Go and Python services

Launches Nginx as a reverse proxy on port 8080



🌐 Endpoints
URL	Description


http://localhost:8080/service1/ping	Health check from Go service
http://localhost:8080/service1/hello	Hello endpoint from Go service
http://localhost:8080/service2/ping	Health check from Python service
http://localhost:8080/service2/hello	Hello endpoint from Python service



🔁 Nginx Reverse Proxy
Nginx routes requests based on the URL path prefix:

/service1 → Go backend

/service2 → Python backend

Config file: nginx/nginx.conf



❤️ Bonus Implemented
✅ Health checks for both services via docker-compose.yml

✅ Shell script (healthcheck.sh) used for health check inside service_2

✅ All services run on single port: localhost:8080

✅ Graceful container startup with depends_on and start_period



🛠️ Tech Used
Docker, Docker Compose

Nginx

Python (Flask + uv)

Golang

📋 Notes
To check container health status:

docker ps

To view logs of all services:

docker logs <container_id>
