
# MCP Shell Server

A containerized version of "MCP Shell Server"

> Repository: [tumf/mcp-shell-server](https://github.com/tumf/mcp-shell-server)

## Description

A secure shell command execution server implementing the Model Context Protocol (MCP). This server allows remote execution of whitelisted shell commands with support for stdin input.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--tumf--mcp-shell-server--mcp-shell-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e ALLOW_COMMANDS=allow-commands \
ghcr.io/metorial/mcp-container--tumf--mcp-shell-server--mcp-shell-server  "mcp-shell-server"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `ALLOW_COMMANDS`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-shell-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--tumf--mcp-shell-server--mcp-shell-server",
        "mcp-shell-server"
      ],
      "env": {
        "ALLOW_COMMANDS": "allow-commands"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/tumf/mcp-shell-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  