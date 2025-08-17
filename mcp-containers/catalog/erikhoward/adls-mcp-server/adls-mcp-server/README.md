
# ADLS2 MCP Server

A containerized version of "ADLS2 MCP Server"

> Repository: [erikhoward/adls-mcp-server](https://github.com/erikhoward/adls-mcp-server)

## Description

A Model Context Protocol (MCP) server implementation for Azure Data Lake Storage Gen2. This service provides a standardized interface for interacting with ADLS2 storage, enabling file operations through MCP tools.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--erikhoward--adls-mcp-server--adls-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e LOG_LEVEL=log-level -e UPLOAD_ROOT=upload-root -e DOWNLOAD_ROOT=download-root -e AZURE_STORAGE_ACCOUNT_NAME=azure-storage-account-name -e READ_ONLY_MODE=read-only-mode \
ghcr.io/metorial/mcp-container--erikhoward--adls-mcp-server--adls-mcp-server  "adls2-mcp-server"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `LOG_LEVEL`
- `UPLOAD_ROOT`
- `DOWNLOAD_ROOT`
- `AZURE_STORAGE_ACCOUNT_NAME`
- `READ_ONLY_MODE`




## Usage with Claude

```json
{
  "mcpServers": {
    "adls-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--erikhoward--adls-mcp-server--adls-mcp-server",
        "adls2-mcp-server"
      ],
      "env": {
        "LOG_LEVEL": "log-level",
        "UPLOAD_ROOT": "upload-root",
        "DOWNLOAD_ROOT": "download-root",
        "AZURE_STORAGE_ACCOUNT_NAME": "azure-storage-account-name",
        "READ_ONLY_MODE": "read-only-mode"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/erikhoward/adls-mcp-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  