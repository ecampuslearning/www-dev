
# Logfire MCP Server

A containerized version of "Logfire MCP Server"

> Repository: [pydantic/logfire-mcp](https://github.com/pydantic/logfire-mcp)

## Description

This repository contains a Model Context Protocol (MCP) server with tools that can access the OpenTelemetry traces and


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--pydantic--logfire-mcp--logfire-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--pydantic--logfire-mcp--logfire-mcp  "logfire-mcp"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:


#### Arguments

- `READ_TOKEN`






## Usage with Claude

```json
{
  "mcpServers": {
    "logfire-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--pydantic--logfire-mcp--logfire-mcp",
        "logfire-mcp"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/pydantic/logfire-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  