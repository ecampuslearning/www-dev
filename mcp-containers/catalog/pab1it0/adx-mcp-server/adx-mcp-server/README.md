
# Azure Data Explorer MCP Server

A containerized version of "Azure Data Explorer MCP Server"

> Repository: [pab1it0/adx-mcp-server](https://github.com/pab1it0/adx-mcp-server)

## Description

A Model Context Protocol (MCP) server that enables AI assistants to query and analyze Azure Data Explorer databases through standardized interfaces.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--pab1it0--adx-mcp-server--adx-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e ADX_CLUSTER_URL=adx-cluster-url -e ADX_DATABASE=adx-database \
ghcr.io/metorial/mcp-container--pab1it0--adx-mcp-server--adx-mcp-server  "adx-mcp-server"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `ADX_CLUSTER_URL`
- `ADX_DATABASE`




## Usage with Claude

```json
{
  "mcpServers": {
    "adx-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--pab1it0--adx-mcp-server--adx-mcp-server",
        "adx-mcp-server"
      ],
      "env": {
        "ADX_CLUSTER_URL": "adx-cluster-url",
        "ADX_DATABASE": "adx-database"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/pab1it0/adx-mcp-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  