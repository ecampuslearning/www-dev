
# Maigret MCP Server

A containerized version of "Maigret MCP Server"

> Repository: [BurtTheCoder/mcp-maigret](https://github.com/BurtTheCoder/mcp-maigret)

## Description

A Model Context Protocol (MCP) server for [maigret](https://github.com/soxoj/maigret), a powerful OSINT tool that collects user account information from various public sources. This server provides tools for searching usernames across social networks and analyzing URLs. It is designed to integrate seamlessly with MCP-compatible applications like [Claude Desktop](https://claude.ai).


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--burtthecoder--mcp-maigret--mcp-maigret
```

2. Run the container:

```bash
docker run -i --rm \ 
-e MAIGRET_REPORTS_DIR=maigret-reports-dir \
ghcr.io/metorial/mcp-container--burtthecoder--mcp-maigret--mcp-maigret  "node build/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `MAIGRET_REPORTS_DIR`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-maigret": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--burtthecoder--mcp-maigret--mcp-maigret",
        "node build/index.js"
      ],
      "env": {
        "MAIGRET_REPORTS_DIR": "maigret-reports-dir"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/BurtTheCoder/mcp-maigret) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  