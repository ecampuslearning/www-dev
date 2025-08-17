
# Pulumi MCP Server

A containerized version of "Pulumi MCP Server"

> Repository: [dogukanakkaya/pulumi-mcp-server](https://github.com/dogukanakkaya/pulumi-mcp-server)

## Description

An MCP server that provides access to Pulumi.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--dogukanakkaya--pulumi-mcp-server--pulumi-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e PULUMI_ACCESS_TOKEN=plumi-access-token \
ghcr.io/metorial/mcp-container--dogukanakkaya--pulumi-mcp-server--pulumi-mcp-server  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `PULUMI_ACCESS_TOKEN`




## Usage with Claude

```json
{
  "mcpServers": {
    "pulumi-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--dogukanakkaya--pulumi-mcp-server--pulumi-mcp-server",
        "npm run start"
      ],
      "env": {
        "PULUMI_ACCESS_TOKEN": "plumi-access-token"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/dogukanakkaya/pulumi-mcp-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  