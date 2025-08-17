
# Crypto Fear & Greed Index MCP Server

A containerized version of "Crypto Fear & Greed Index MCP Server"

> Repository: [kukapay/crypto-feargreed-mcp](https://github.com/kukapay/crypto-feargreed-mcp)

## Description

A mcp server that provides real-time and historical Crypto Fear & Greed Index data, powered by the Alternative.me.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--kukapay--crypto-feargreed-mcp--crypto-feargreed-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--kukapay--crypto-feargreed-mcp--crypto-feargreed-mcp  "python main.py"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "crypto-feargreed-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--kukapay--crypto-feargreed-mcp--crypto-feargreed-mcp",
        "python main.py"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/kukapay/crypto-feargreed-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  