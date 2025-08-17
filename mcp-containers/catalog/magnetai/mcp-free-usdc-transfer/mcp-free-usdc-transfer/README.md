
# Free USDC Transfer MCP Server

A containerized version of "Free USDC Transfer MCP Server"

> Repository: [magnetai/mcp-free-usdc-transfer](https://github.com/magnetai/mcp-free-usdc-transfer)

## Description

An MCP server implementation enabling free USDC transfers on **[Base](https://base.org)** with **[Coinbase CDP](https://docs.cdp.coinbase.com/)** MPC Wallet integration.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--magnetai--mcp-free-usdc-transfer--mcp-free-usdc-transfer
```

2. Run the container:

```bash
docker run -i --rm \ 
-e COINBASE_CDP_API_KEY_NAME=coinbase-cdp-api-key-name -e COINBASE_CDP_PRIVATE_KEY=coinbase-cdp-private-key \
ghcr.io/metorial/mcp-container--magnetai--mcp-free-usdc-transfer--mcp-free-usdc-transfer  "node dist/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `COINBASE_CDP_API_KEY_NAME`
- `COINBASE_CDP_PRIVATE_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-free-usdc-transfer": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--magnetai--mcp-free-usdc-transfer--mcp-free-usdc-transfer",
        "node dist/index.js"
      ],
      "env": {
        "COINBASE_CDP_API_KEY_NAME": "coinbase-cdp-api-key-name",
        "COINBASE_CDP_PRIVATE_KEY": "coinbase-cdp-private-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/magnetai/mcp-free-usdc-transfer) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  