
# JMeter MCP Server

A containerized version of "JMeter MCP Server"

> Repository: [QAInsights/jmeter-mcp-server](https://github.com/QAInsights/jmeter-mcp-server)

## Description

This is a Model Context Protocol (MCP) server that allows executing JMeter tests through MCP-compatible clients.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--qainsights--jmeter-mcp-server--jmeter-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--qainsights--jmeter-mcp-server--jmeter-mcp-server  "python main.py"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "jmeter-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--qainsights--jmeter-mcp-server--jmeter-mcp-server",
        "python main.py"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/QAInsights/jmeter-mcp-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  