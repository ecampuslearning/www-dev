
# Crypto Portfolio MCP

A containerized version of "Crypto Portfolio MCP"

> Repository: [kukapay/crypto-portfolio-mcp](https://github.com/kukapay/crypto-portfolio-mcp)

## Description

An MCP server for tracking and managing cryptocurrency portfolio allocations, enabling AI agents to query and optimize portfolio strategies in real time.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--kukapay--crypto-portfolio-mcp--crypto-portfolio-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--kukapay--crypto-portfolio-mcp--crypto-portfolio-mcp  "python main.py"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "crypto-portfolio-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--kukapay--crypto-portfolio-mcp--crypto-portfolio-mcp",
        "python main.py"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/kukapay/crypto-portfolio-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  