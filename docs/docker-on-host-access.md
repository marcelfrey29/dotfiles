# Access Docker on the Host from a Dev Container

Access Docker on the host to run and manage containers from inside a Dev Container.

## Setup

- Add the `docker-outside-of-docker` Dev Container feature to the `devcontainer.json` file.
    - `moby` must be set to `false`
- Optional: Add the `ms-azuretools.vscode-docker` VS Code extension

```jsonc
{
	"features": {
		// Access Docker from the host machine
		"ghcr.io/devcontainers/features/docker-outside-of-docker:1": {
			"moby": false
		}
	},
	"customizations": {
		"vscode": {
			"extensions": [
				// Docker (for devcontainer)
				"ms-azuretools.vscode-docker"
			]
		}
	}
}
```
