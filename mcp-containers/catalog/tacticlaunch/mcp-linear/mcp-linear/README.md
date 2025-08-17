
# MCP Linear

A containerized version of "MCP Linear"

> Repository: [tacticlaunch/mcp-linear](https://github.com/tacticlaunch/mcp-linear)

## Description

A Model Context Protocol (MCP) server implementation for the Linear GraphQL API that enables AI assistants to interact with Linear project management systems.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--tacticlaunch--mcp-linear--mcp-linear
```

2. Run the container:

```bash
docker run -i --rm \ 
-e LINEAR_API_TOKEN=linear-api-token \
ghcr.io/metorial/mcp-container--tacticlaunch--mcp-linear--mcp-linear  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `LINEAR_API_TOKEN`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-linear": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--tacticlaunch--mcp-linear--mcp-linear",
        "npm run start"
      ],
      "env": {
        "LINEAR_API_TOKEN": "linear-api-token"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/tacticlaunch/mcp-linear) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  