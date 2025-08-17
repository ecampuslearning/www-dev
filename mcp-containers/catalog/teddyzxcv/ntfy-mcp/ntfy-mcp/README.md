
# ntfy-mcp: Your Friendly Task Completion Notifier

A containerized version of "ntfy-mcp: Your Friendly Task Completion Notifier"

> Repository: [teddyzxcv/ntfy-mcp](https://github.com/teddyzxcv/ntfy-mcp)

## Description

Welcome to ntfy-mcp, the MCP server that keeps you caffeinated and informed! 🚀☕️


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--teddyzxcv--ntfy-mcp--ntfy-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
-e NTFY_TOPIC=ntfy-topic \
ghcr.io/metorial/mcp-container--teddyzxcv--ntfy-mcp--ntfy-mcp  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `NTFY_TOPIC`




## Usage with Claude

```json
{
  "mcpServers": {
    "ntfy-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--teddyzxcv--ntfy-mcp--ntfy-mcp",
        "npm run start"
      ],
      "env": {
        "NTFY_TOPIC": "ntfy-topic"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/teddyzxcv/ntfy-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  