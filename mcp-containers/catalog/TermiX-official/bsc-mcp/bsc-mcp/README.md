
# # 📦 BNBChain MCP – Binance Smart Chain Tool Server (MCP + CLI Ready)

A containerized version of "# 📦 BNBChain MCP – Binance Smart Chain Tool Server (MCP + CLI Ready)"

> Repository: [TermiX-official/bsc-mcp](https://github.com/TermiX-official/bsc-mcp)

## Description

A plug-and-play MCP tool server to **send BNB**, **transfer BEP-20 tokens**, **deploy tokens**, and **interact with smart contracts** on the **Binance Smart Chain (BSC)** — built for **Claude Desktop**, **AI agents**, and **developers.**


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--termix-official--bsc-mcp--bsc-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--termix-official--bsc-mcp--bsc-mcp  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "bsc-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--termix-official--bsc-mcp--bsc-mcp",
        "npm run start"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/TermiX-official/bsc-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  