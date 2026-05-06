# Setup UniMind Infrastructure

## Clone Repository

```bash
git clone git@github.com:Ronelleti/UniMind.git
cd UniMind
```

---

# Give Execute Permissions

```bash
chmod +x scripts/*.sh
```

---

# Install Development Tools

Installs:
- Docker
- kubectl
- Minikube
- Helm
- Terraform
- Git
- jq

```bash
./scripts/install-tools.sh
```

IMPORTANT:
After installation finishes, reboot the VM.

```bash
sudo reboot
```

---

# Install SSH Server

```bash
./scripts/install-ssh.sh
```

---

# Start Kubernetes Cluster

```bash
./scripts/start-minikube.sh
```

---

# Create Infrastructure Namespaces

```bash
./scripts/create-namespaces.sh
```

---

# Verify Cluster Infrastructure

```bash
./scripts/verify-cluster.sh
```

---

# Full Automated Bootstrap

Run entire infrastructure setup automatically:

```bash
./scripts/bootstrap.sh
```

---

# Cleanup Environment

Stops and deletes Minikube cluster.

```bash
./scripts/cleanup.sh
```

# Install PostgreSQL

Installs:
- PostgreSQL
- Persistent Volume Claim
- Kubernetes Secret
- PostgreSQL Service

```bash
./scripts/install-postgres.sh
```

## Database Features

- PostgreSQL
- Persistent storage
- Namespace isolation
- Kubernetes Secrets
- Resource limits
- Health probes