
# MCP-wolfram-alpha

A containerized version of "MCP-wolfram-alpha"

> Repository: [SecretiveShell/MCP-wolfram-alpha](https://github.com/SecretiveShell/MCP-wolfram-alpha)

## Description

A MCP server to connect to wolfram alpha API.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--secretiveshell--mcp-wolfram-alpha--mcp-wolfram-alpha
```

2. Run the container:

```bash
docker run -i --rm \ 
-e WOLFRAM_API_KEY=wolfram-api-key \
ghcr.io/metorial/mcp-container--secretiveshell--mcp-wolfram-alpha--mcp-wolfram-alpha  "mcp-wolfram-alpha"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `WOLFRAM_API_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-wolfram-alpha": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--secretiveshell--mcp-wolfram-alpha--mcp-wolfram-alpha",
        "mcp-wolfram-alpha"
      ],
      "env": {
        "WOLFRAM_API_KEY": "wolfram-api-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/SecretiveShell/MCP-wolfram-alpha) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  