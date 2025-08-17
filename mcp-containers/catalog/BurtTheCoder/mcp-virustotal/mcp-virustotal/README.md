
# VirusTotal MCP Server

A containerized version of "VirusTotal MCP Server"

> Repository: [BurtTheCoder/mcp-virustotal](https://github.com/BurtTheCoder/mcp-virustotal)

## Description

A Model Context Protocol (MCP) server for querying the [VirusTotal API](https://www.virustotal.com/). This server provides comprehensive security analysis tools with automatic relationship data fetching. It integrates seamlessly with MCP-compatible applications like [Claude Desktop](https://claude.ai).


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--burtthecoder--mcp-virustotal--mcp-virustotal
```

2. Run the container:

```bash
docker run -i --rm \ 
-e VIRUSTOTAL_API_KEY=virustotal-api-key \
ghcr.io/metorial/mcp-container--burtthecoder--mcp-virustotal--mcp-virustotal  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `VIRUSTOTAL_API_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-virustotal": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--burtthecoder--mcp-virustotal--mcp-virustotal",
        "npm run start"
      ],
      "env": {
        "VIRUSTOTAL_API_KEY": "virustotal-api-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/BurtTheCoder/mcp-virustotal) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  