# 💧 Urine HL7 Server

This project runs an HL7 MLLP listener that parses urine test results and sends them to an ERPNext server.

---

## 📦 Features

- ✅ HL7 MLLP Listener on port `5030`
- ✅ Parses `OBX` segments from HL7 messages
- ✅ Sends structured results to ERPNext (`Lab Result` DocType)
- ✅ Containerized using Docker
- ✅ CI/CD via GitHub Actions → GHCR (GitHub Container Registry)

---

## 🚀 How to Deploy

### 🛑 Prerequisites

Before you begin, make sure you have:

- [Docker Desktop](https://www.docker.com/products/docker-desktop) installed
- Access to an **ERPNext** server with:
  - REST API enabled
  - A `Lab Result` DocType that includes `normal_test_items`
- Optional but recommended: basic command line knowledge

---

### 1️⃣ Pull the Docker Image

Use this command to download the latest pre-built container image:

```bash
docker pull ghcr.io/ahmedibar/urine-hl7-server:latest


### 2️⃣ Create the .env File
In the same folder where you run the Docker container, create a file called .env:

HL7_PORT=5030
ERP_URL=http://<your-erp-ip-or-host>
ERP_USER=administrator
ERP_PASSWORD=yourpassword
💡 You can create a sample by copying from .env.example if available.


### 3️⃣ Run the Container
✅ For Windows PowerShell / macOS / Linux Terminal:

docker run -d --name urine-hl7-server --env-file .env -p 5030:5030 --add-host=host.docker.internal:host-gateway ghcr.io/ahmedibar/urine-hl7-server:latest

### 🔁 Update the Container
To update to the latest version of the image:

docker pull ghcr.io/ahmedibar/urine-hl7-server:latest
docker stop urine-hl7-server
docker rm urine-hl7-server
# Then rerun the container using the same run command above