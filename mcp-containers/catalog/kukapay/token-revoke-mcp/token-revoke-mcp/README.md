
# Token Revoke MCP

A containerized version of "Token Revoke MCP"

> Repository: [kukapay/token-revoke-mcp](https://github.com/kukapay/token-revoke-mcp)

## Description

An MCP server for checking and revoking ERC-20 token allowances, enhancing security and control.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--kukapay--token-revoke-mcp--token-revoke-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
-e MORALIS_API_KEY=moralis-api-key -e PRIVATE_KEY=private-key \
ghcr.io/metorial/mcp-container--kukapay--token-revoke-mcp--token-revoke-mcp  "node index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `MORALIS_API_KEY`
- `PRIVATE_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "token-revoke-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--kukapay--token-revoke-mcp--token-revoke-mcp",
        "node index.js"
      ],
      "env": {
        "MORALIS_API_KEY": "moralis-api-key",
        "PRIVATE_KEY": "private-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/kukapay/token-revoke-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  