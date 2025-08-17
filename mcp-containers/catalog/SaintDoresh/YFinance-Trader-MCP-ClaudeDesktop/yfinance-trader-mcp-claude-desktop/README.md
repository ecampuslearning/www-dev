
# YFinance Trader MCP Tool for Claude Desktop

A containerized version of "YFinance Trader MCP Tool for Claude Desktop"

> Repository: [SaintDoresh/YFinance-Trader-MCP-ClaudeDesktop](https://github.com/SaintDoresh/YFinance-Trader-MCP-ClaudeDesktop)

## Description

An MCP (Model Context Protocol) tool that provides stock market data and trading capabilities using the yfinance library, specifically adapted for Claude Desktop.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--saintdoresh--yfinance-trader-mcp-claudedesktop--yfinance-trader-mcp-claude-desktop
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--saintdoresh--yfinance-trader-mcp-claudedesktop--yfinance-trader-mcp-claude-desktop  "python main.py"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "yfinance-trader-mcp-claude-desktop": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--saintdoresh--yfinance-trader-mcp-claudedesktop--yfinance-trader-mcp-claude-desktop",
        "python main.py"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/SaintDoresh/YFinance-Trader-MCP-ClaudeDesktop) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  