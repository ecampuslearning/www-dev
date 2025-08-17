
# locust-mcp-server

A containerized version of "locust-mcp-server"

> Repository: [QAInsights/locust-mcp-server](https://github.com/QAInsights/locust-mcp-server)

## Description

A Model Context Protocol (MCP) server implementation for running Locust load tests. This server enables seamless integration of Locust load testing capabilities with AI-powered development environments.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--qainsights--locust-mcp-server--locust-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--qainsights--locust-mcp-server--locust-mcp-server  "python main.py"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "locust-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--qainsights--locust-mcp-server--locust-mcp-server",
        "python main.py"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/QAInsights/locust-mcp-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  