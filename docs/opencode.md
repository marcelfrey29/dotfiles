# OpenCode

## Setup

To install OpenCode in the Dev Container, add the following statements to the `Dockerfile` (_We don't want to have Agents on the host machine to limit action and explosion radius_).

```Dockerfile
RUN curl -fsSL https://opencode.ai/install | bash
```

Credentials for providers are stored in `~/.local/share/opencode/auth.json`. 
To share credentials between containers (via the host), add the following mount:

```jsonc
{
	"mounts": [
		// OpenCode Credentials
		"source=${localEnv:HOME}${localEnv:USERPROFILE}/.opencode/credentials/auth.json,target=/root/.local/share/opencode/auth.json,type=bind"
	],
}
```

OpenCode can now be used both in the Terminal (TUI) and via browser (Web UI).
**Ideally start it from the workspace root.**

```bash
# Run OpenCode in TUI
opencode

# Run OpenCode in Web UI
opencode web
```

## Additional Configuration without Dotfiles Repository

As long as the Dev Container uses this `dotfiles` repository no additional Docker mounts are required. 
When this `dotfiles` repository is **not** used, the configuration, agents, and skills are not copied to the home directory.
In case they should still be used, the Devcontainer needs the following additional mount (we assume they are available on the host machine):

```jsonc
{
	"mounts": [
		// OpenCode Configuration, Agent, and Skills
		"source=${localEnv:HOME}${localEnv:USERPROFILE}/.config/opencode,target=/root/.config/opencode,type=bind",
	],
}
```
