
# Excel MCP Server

A containerized version of "Excel MCP Server"

> Repository: [haris-musa/excel-mcp-server](https://github.com/haris-musa/excel-mcp-server)

## Description

A Model Context Protocol (MCP) server that lets you manipulate Excel files without needing Microsoft Excel installed. Create, read, and modify Excel workbooks with your AI agent.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--haris-musa--excel-mcp-server--excel-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e FASTMCP_PORT=fastmcp-port -e EXCEL_FILES_PATH=excel-files-path \
ghcr.io/metorial/mcp-container--haris-musa--excel-mcp-server--excel-mcp-server  "excel-mcp-server"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `FASTMCP_PORT`
- `EXCEL_FILES_PATH`




## Usage with Claude

```json
{
  "mcpServers": {
    "excel-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--haris-musa--excel-mcp-server--excel-mcp-server",
        "excel-mcp-server"
      ],
      "env": {
        "FASTMCP_PORT": "fastmcp-port",
        "EXCEL_FILES_PATH": "excel-files-path"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/haris-musa/excel-mcp-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  