
# Shodan MCP Server

A containerized version of "Shodan MCP Server"

> Repository: [BurtTheCoder/mcp-shodan](https://github.com/BurtTheCoder/mcp-shodan)

## Description

A Model Context Protocol (MCP) server for querying the [Shodan API](https://shodan.io) and [Shodan CVEDB](https://cvedb.shodan.io). This server provides comprehensive access to Shodan's network intelligence and security services, including IP reconnaissance, DNS operations, vulnerability tracking, and device discovery. All tools provide structured, formatted output for easy analysis and integration.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--burtthecoder--mcp-shodan--mcp-shodan
```

2. Run the container:

```bash
docker run -i --rm \ 
-e SHODAN_API_KEY=shodan-api-key \
ghcr.io/metorial/mcp-container--burtthecoder--mcp-shodan--mcp-shodan  "node build/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `SHODAN_API_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-shodan": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--burtthecoder--mcp-shodan--mcp-shodan",
        "node build/index.js"
      ],
      "env": {
        "SHODAN_API_KEY": "shodan-api-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/BurtTheCoder/mcp-shodan) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  