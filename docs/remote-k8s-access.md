# Access a Kubernetes Cluster outside the Dev Container

To access a Kubernetes Cluster, the `kubectl` CLI and the Kubeconfig is required.

## Setup

To install `kubectl`, add the following statements to the Dev Container `Dockerfile` file and update the `K8S_VERSION` version accordingly:

```Dockerfile
# Kubernetes (kubectl)
ARG K8S_VERSION="1.35"
RUN apt-get install -y apt-transport-https ca-certificates curl gnupg && \
    curl -fsSL https://pkgs.k8s.io/core:/stable:/v$K8S_VERSION/deb/Release.key | gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg && \
    chmod 644 /etc/apt/keyrings/kubernetes-apt-keyring.gpg && \
    echo "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v$K8S_VERSION/deb/ /" | tee /etc/apt/sources.list.d/kubernetes.list && \
    chmod 644 /etc/apt/sources.list.d/kubernetes.list && \
    apt-get update && \
    apt-get install -y kubectl
RUN mkdir -p ~/.kube
```

To use the Kubeconfig from the host machine (which is ideal for sharing it across multiple Dev Containers), add the following mount:

```jsonc
{
    "mounts": [
		// Use Kubernetes Config from host machine
		"source=${localEnv:HOME}${localEnv:USERPROFILE}/.kube/config,target=/root/.kube/config,type=bind"
	]
}
```

Recommended: Install the Docker & K8s VS Code extensions:

```jsonc
{
	"customizations": {
		"vscode": {
			"extensions": [
			    // Docker & Kubernetes
				"ms-azuretools.vscode-docker",
				"ms-kubernetes-tools.vscode-kubernetes-tools",
			]
		}
	}
}
```
