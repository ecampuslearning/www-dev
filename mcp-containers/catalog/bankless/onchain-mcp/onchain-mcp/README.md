
# Bankless Onchain MCP Server

A containerized version of "Bankless Onchain MCP Server"

> Repository: [Bankless/onchain-mcp](https://github.com/Bankless/onchain-mcp/)

## Description

MCP (Model Context Protocol) server for blockchain data interaction through the Bankless API.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--bankless--onchain-mcp--onchain-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
-e BANKLESS_API_TOKEN=bankless-api-token \
ghcr.io/metorial/mcp-container--bankless--onchain-mcp--onchain-mcp  "node dist/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `BANKLESS_API_TOKEN`




## Usage with Claude

```json
{
  "mcpServers": {
    "onchain-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--bankless--onchain-mcp--onchain-mcp",
        "node dist/index.js"
      ],
      "env": {
        "BANKLESS_API_TOKEN": "bankless-api-token"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/Bankless/onchain-mcp/) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  