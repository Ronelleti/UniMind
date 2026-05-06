# UniMind

AI-powered university workspace platform built with modern DevOps infrastructure.

---

# Features

- AI study summaries
- AI quiz generator
- Flashcards
- Assignment tracking
- Multi-environment Kubernetes deployment
- GitOps with ArgoCD
- CI/CD with GitHub Actions
- Terraform infrastructure
- Helm deployments
- PostgreSQL with automated backups
- Secure Kubernetes architecture

---

# Infrastructure Stack

## Application
- React
- Spring Boot
- PostgreSQL
- Ollama AI

## DevOps
- Docker
- Kubernetes
- Minikube
- Helm
- Terraform
- ArgoCD
- GitHub Actions

## Monitoring
- Prometheus
- Grafana
- Loki

---

# Environments

- unimind-dev
- unimind-staging
- unimind-prod

---

# Project Structure

```text
UniMind/
│
├── frontend/
├── backend/
├── ai-service/
├── terraform/
├── helm/
├── argocd/
├── scripts/
├── monitoring/
└── docs/
```

---

# Bootstrap Setup

## Clone Repository

```bash
git clone git@github.com:Ronelleti/UniMind.git
cd UniMind
```

---

# Run Infrastructure Bootstrap

```bash
chmod +x scripts/*.sh
./scripts/bootstrap.sh
```

---

# Verify Cluster

```bash
./scripts/verify-cluster.sh
```

---

# Kubernetes Namespaces

```text
argocd
monitoring
database
ai-services
unimind-dev
unimind-staging
unimind-prod
```

---

# Security Features

- Non-root containers
- Namespace isolation
- Kubernetes Secrets
- RBAC
- NetworkPolicies
- Automated backups
- Container scanning

---

# PostgreSQL Backups

Daily automated PostgreSQL backups using Kubernetes CronJobs.

Retention:
- keep last 7 backups

---

# Future Features

- AI tutor
- RAG AI system
- Mobile app
- Realtime collaboration
- Notifications
- Autoscaling
- Full observability stack

---


