# Use Host SSH Keys and Config in Dev Container

> [!CAUTION] Don't share SSH Keys
> **SSH Keys should never leave the machine they were created. Each machine should have it's own key pair.**
> With Dev Containers we make an _exception_ for better usability - and for security reasons.
> First, technically, we _mount_ the keys from the host system and don't _share_ them, so they technically don't leave the machine.
> Second, without sharing, we would have to create a new key pair at every container rebuild. 
> This would cause too many SSH keys, so key management would get complicated.

## Setup

In addition to installing `ssh`, we need to ensure that a `.ssh` directory exists to make sure mounting works. 
Add the following statements to the Dev Container `Dockerfile`:

```Dockerfile
# Use Host SSH Config & Keys
RUN apt-get install -y ssh
RUN mkdir -p ~/.ssh
```

Configure the mount to access the hosts `.ssh` directory:

```jsonc
{
	"mounts": [
		// SSH Config & Keys from host machine
		"source=${localEnv:HOME}${localEnv:USERPROFILE}/.ssh,target=/root/.ssh,type=bind",
	],
}
```
