
# OceanBase MCP Server

A containerized version of "OceanBase MCP Server"

> Repository: [yuanoOo/oceanbase_mcp_server](https://github.com/yuanoOo/oceanbase_mcp_server)

## Description

A Model Context Protocol (MCP) server that enables secure interaction with OceanBase databases.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--yuanooo--oceanbase_mcp_server--oceanbase-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e OB_HOST=ob-host -e OB_PORT=ob-port -e OB_USER=ob-user -e OB_PASSWORD=ob-password -e OB_DATABASE=ob-database \
ghcr.io/metorial/mcp-container--yuanooo--oceanbase_mcp_server--oceanbase-mcp-server  "oceanbase_mcp_server"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `OB_HOST`
- `OB_PORT`
- `OB_USER`
- `OB_PASSWORD`
- `OB_DATABASE`




## Usage with Claude

```json
{
  "mcpServers": {
    "oceanbase-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--yuanooo--oceanbase_mcp_server--oceanbase-mcp-server",
        "oceanbase_mcp_server"
      ],
      "env": {
        "OB_HOST": "ob-host",
        "OB_PORT": "ob-port",
        "OB_USER": "ob-user",
        "OB_PASSWORD": "ob-password",
        "OB_DATABASE": "ob-database"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/yuanoOo/oceanbase_mcp_server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  