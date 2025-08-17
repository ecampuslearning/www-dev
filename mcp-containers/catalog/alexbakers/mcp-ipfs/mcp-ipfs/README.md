
# 🪐 MCP IPFS Server (storacha.network) 🛰️

A containerized version of "🪐 MCP IPFS Server (storacha.network) 🛰️"

> Repository: [alexbakers/mcp-ipfs](https://github.com/alexbakers/mcp-ipfs)

## Description

A Node.js server implementing the [Model Context Protocol (MCP)](https://github.com/ModelContextProtocol/specification) for interacting with the [storacha.network](https://storacha.network/) platform via the w3 command-line interface (@web3-storage/w3cli).


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--alexbakers--mcp-ipfs--mcp-ipfs
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--alexbakers--mcp-ipfs--mcp-ipfs  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-ipfs": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--alexbakers--mcp-ipfs--mcp-ipfs",
        "npm run start"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/alexbakers/mcp-ipfs) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  