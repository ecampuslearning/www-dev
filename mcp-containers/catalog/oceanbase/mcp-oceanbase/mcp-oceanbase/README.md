
# Oceanbase MCP Server

A containerized version of "Oceanbase MCP Server"

> Repository: [oceanbase/mcp-oceanbase](https://github.com/oceanbase/mcp-oceanbase)

## Description

MCP Server for OceanBase database and its tools


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--oceanbase--mcp-oceanbase--mcp-oceanbase
```

2. Run the container:

```bash
docker run -i --rm \ 
-e AK=AK -e SK=SK -e ADDRESS=ADDRESS \
ghcr.io/metorial/mcp-container--oceanbase--mcp-oceanbase--mcp-oceanbase  "oceanbase_mcp_server"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `AK`
- `SK`
- `ADDRESS`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-oceanbase": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--oceanbase--mcp-oceanbase--mcp-oceanbase",
        "oceanbase_mcp_server"
      ],
      "env": {
        "AK": "AK",
        "SK": "SK",
        "ADDRESS": "ADDRESS"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/oceanbase/mcp-oceanbase) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  