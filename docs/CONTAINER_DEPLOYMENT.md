# Container Deployment Guide

## Podman Setup

### Prerequisites

- Podman installed on the host system
- Sufficient disk space for container images and models

### Port Configuration

| Service    | Container Port | Host Port |
|------------|----------------|-----------|
| granite4   | 11434          | 55077     |
| qwen-coder | 11434          | 66044     |
| LangFlow   | 7860           | 7860      |

## Ollama Containers

### granite4 Model

```bash
podman run -d \
  --name ollama-granite4 \
  -p 55077:11434 \
  -v ollama-granite4:/root/.ollama \
  ollama/ollama:latest
```

### qwen-coder Model

```bash
podman run -d \
  --name ollama-qwen-coder \
  -p 66044:11434 \
  -v ollama-qwen-coder:/root/.ollama \
  ollama/ollama:latest
```

## LangFlow Container

```bash
podman run -d \
  --name langflow \
  -p 7860:7860 \
  -v langflow-data:/root/langflow \
  langflowai/langflow:latest
```

## Network Configuration

Ensure the containers can communicate:

```bash
podman network create langflow-network
podman network connect langflow-network ollama-granite4
podman network connect langflow-network ollama-qwen-coder
podman network connect langflow-network langflow
```

## Verification

Check running containers:

```bash
podman ps
```

Test endpoints:

- LangFlow: http://localhost:7860
- granite4: http://localhost:55077
- qwen-coder: http://localhost:66044
