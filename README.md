# Advanced DevOps CI/CD Pipeline

![Java](https://img.shields.io/badge/Java-17-orange)
![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.4.11-green)
![Docker](https://img.shields.io/badge/Docker-Enabled-blue)
![Kubernetes](https://img.shields.io/badge/Kubernetes-Ready-blue)
![CI/CD](https://img.shields.io/badge/GitHub%20Actions-CI%2FCD-action)

A production-grade microservice demonstrating **DevSecOps principles**, automated security scanning, and Kubernetes deployment.

> **Note:** For a detailed academic report on the project's background, architecture decisions, and results, please refer to [project_report.md](./project_report.md).

---

## 🚀 Quick Start

### Prerequisites
- Java 17+
- Docker Desktop
- Maven

### Run Locally (Maven)
```bash
./mvnw spring-boot:run
```
Access the API at: `http://localhost:8080/`

### Run with Docker
```bash
docker build -t advanced-app .
docker run -p 8080:8080 advanced-app
```

---

## 📡 API Reference

The application serves a User API on the root path.

### 1. Get All Users (Health Check)
Acts as both the data endpoint and the Kubernetes Liveness Probe.

- **URL:** `/`
- **Method:** `GET`
- **Success Response:** `200 OK`
- **Response Body:**
  ```json
  [
    {"id": 1, "name": "Alice", "email": "alice@example.com"}
  ]
  ```

### 2. Create User
- **URL:** `/`
- **Method:** `POST`
- **Headers:** `Content-Type: application/json`
- **Body:**
  ```json
  {
    "name": "Bob",
    "email": "bob@example.com"
  }
  ```
- **Example Command:**
  ```bash
  curl -X POST -H "Content-Type: application/json" -d '{"name":"Bob","email":"bob@example.com"}' http://localhost:8080/
  ```

---

## ☸️ Kubernetes Deployment

Deploy the application to a local cluster (Minikube/Kind).

1.  **Start Cluster:**
    ```bash
    minikube start
    ```
2.  **Deploy Manifests:**
    ```bash
    kubectl apply -f k8s/deployment.yaml
    kubectl apply -f k8s/service.yaml
    ```
3.  **Verify Status:**
    ```bash
    kubectl get pods
    kubectl logs -l app=advanced-app
    ```
4.  **Access Service:**
    ```bash
    minikube service advanced-app-service
    ```

---

## 🛠 Project Structure

```bash
├── .github/workflows/   # CI/CD Pipelines (Build, Test, Scan, Deploy)
├── k8s/                 # Kubernetes Manifests (Deployment, Service)
├── src/main/java/       # Spring Boot Source Code
│   ├── controller/      # REST Controllers
│   ├── service/         # Business Logic
│   ├── repository/      # Data Access Layer
│   ├── model/           # JPA Entities
│   └── dto/             # Data Transfer Objects
└── Dockerfile           # Multi-stage Docker build config
```

---

## 🔒 Security Features

This project implements "Shift-Left" security:
- **SAST:** CodeQL scans for code vulnerabilities.
- **SCA:** Snyk scans dependencies for CVEs.
- **Container Scan:** Trivy scans the Docker image for OS vulnerabilities.
- **Runtime:** Runs as a non-root user (`devopsuser`).

---

## 🤝 CI/CD Pipelines

This repository uses **GitHub Actions** for automation:

1.  **CI Pipeline** (`ci.yml`):
    - Runs on Pull Request / Push.
    - Compiles code, runs unit tests, performs security scans.
    - Builds Docker image if all checks pass.

2.  **CD Pipeline** (`cd.yml`):
    - Triggered after successful CI.
    - Deploys to Kubernetes (Kind).
    - Performs Smoke Tests.
---

## 📜 License

Distributed under the MIT License. See `LICENSE` for more information.

## 👤 Author

**Siddharth Baleja**
- GitHub: [@siddharthbaleja7](https://github.com/siddharthbaleja7)

---

## References

- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Docker Best Practices](https://docs.docker.com/develop/dev-best-practices/)
- [Kubernetes Documentation](https://kubernetes.io/docs/)
- [OWASP Top 10](https://owasp.org/www-project-top-ten/)