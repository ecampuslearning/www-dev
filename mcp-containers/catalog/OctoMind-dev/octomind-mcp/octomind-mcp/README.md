
# octomind mcp server: let agents create and manage e2e tests

A containerized version of "octomind mcp server: let agents create and manage e2e tests"

> Repository: [OctoMind-dev/octomind-mcp](https://github.com/OctoMind-dev/octomind-mcp)

## Description

An MCP server for octomind tools, resources and prompts


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--octomind-dev--octomind-mcp--octomind-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
-e APIKEY=apikey \
ghcr.io/metorial/mcp-container--octomind-dev--octomind-mcp--octomind-mcp  "node ./dist/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `APIKEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "octomind-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--octomind-dev--octomind-mcp--octomind-mcp",
        "node ./dist/index.js"
      ],
      "env": {
        "APIKEY": "apikey"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/OctoMind-dev/octomind-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  