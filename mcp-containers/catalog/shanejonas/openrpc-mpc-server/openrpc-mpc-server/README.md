
# OpenRPC MCP Server

A containerized version of "OpenRPC MCP Server"

> Repository: [shanejonas/openrpc-mpc-server](https://github.com/shanejonas/openrpc-mpc-server)

## Description

A Model Context Protocol (MCP) server that provides JSON-RPC functionality through [OpenRPC](https://open-rpc.org).


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--shanejonas--openrpc-mpc-server--openrpc-mpc-server
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--shanejonas--openrpc-mpc-server--openrpc-mpc-server  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "openrpc-mpc-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--shanejonas--openrpc-mpc-server--openrpc-mpc-server",
        "npm run start"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/shanejonas/openrpc-mpc-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  