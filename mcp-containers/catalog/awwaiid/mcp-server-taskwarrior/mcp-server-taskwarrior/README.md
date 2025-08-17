
# TaskWarrior MCP Server

A containerized version of "TaskWarrior MCP Server"

> Repository: [awwaiid/mcp-server-taskwarrior](https://github.com/awwaiid/mcp-server-taskwarrior)

## Description

Node.js server implementing Model Context Protocol (MCP) for [TaskWarrior](https://taskwarrior.org/) operations.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--awwaiid--mcp-server-taskwarrior--mcp-server-taskwarrior
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--awwaiid--mcp-server-taskwarrior--mcp-server-taskwarrior  "node dist/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-server-taskwarrior": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--awwaiid--mcp-server-taskwarrior--mcp-server-taskwarrior",
        "node dist/index.js"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/awwaiid/mcp-server-taskwarrior) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  