
# IP Geolocation MCP Server

A containerized version of "IP Geolocation MCP Server"

> Repository: [briandconnelly/mcp-server-ipinfo](https://github.com/briandconnelly/mcp-server-ipinfo)

## Description

This is a simple [Model Context Protocol](https://modelcontextprotocol.io) server that uses the [ipinfo.io](https://ipinfo.io) API to get detailed information about an IP address.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--briandconnelly--mcp-server-ipinfo--mcp-server-ipinfo
```

2. Run the container:

```bash
docker run -i --rm \ 
-e IPINFO_API_TOKEN=ipinfo-api-token \
ghcr.io/metorial/mcp-container--briandconnelly--mcp-server-ipinfo--mcp-server-ipinfo  "mcp-server-ipinfo"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `IPINFO_API_TOKEN`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-server-ipinfo": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--briandconnelly--mcp-server-ipinfo--mcp-server-ipinfo",
        "mcp-server-ipinfo"
      ],
      "env": {
        "IPINFO_API_TOKEN": "ipinfo-api-token"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/briandconnelly/mcp-server-ipinfo) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  