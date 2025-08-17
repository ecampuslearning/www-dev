
# mcp-server-unitycatalog: An Unity Catalog MCP server

A containerized version of "mcp-server-unitycatalog: An Unity Catalog MCP server"

> Repository: [ognis1205/mcp-server-unitycatalog](https://github.com/ognis1205/mcp-server-unitycatalog)

## Description

Unity Catalog AI Model Context Protocol Server


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--ognis1205--mcp-server-unitycatalog--mcp-server-unitycatalog
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--ognis1205--mcp-server-unitycatalog--mcp-server-unitycatalog  "mcp-server-unitycatalog --uc_server uc-server --uc_catalog uc-catalog --uc_schema uc-schema"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:


#### Arguments

- `--uc_server`
- `--uc_catalog`
- `--uc_schema`






## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-server-unitycatalog": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--ognis1205--mcp-server-unitycatalog--mcp-server-unitycatalog",
        "mcp-server-unitycatalog --uc_server uc-server --uc_catalog uc-catalog --uc_schema uc-schema"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/ognis1205/mcp-server-unitycatalog) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  