
# Token Minter MCP

A containerized version of "Token Minter MCP"

> Repository: [kukapay/token-minter-mcp](https://github.com/kukapay/token-minter-mcp)

## Description

An MCP server providing tools for AI agents to mint ERC-20 tokens, supporting 21 blockchains.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--kukapay--token-minter-mcp--token-minter-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
-e INFURA_KEY=infura-key -e PRIVATE_KEY=private-key \
ghcr.io/metorial/mcp-container--kukapay--token-minter-mcp--token-minter-mcp  "node index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `INFURA_KEY`
- `PRIVATE_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "token-minter-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--kukapay--token-minter-mcp--token-minter-mcp",
        "node index.js"
      ],
      "env": {
        "INFURA_KEY": "infura-key",
        "PRIVATE_KEY": "private-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/kukapay/token-minter-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  