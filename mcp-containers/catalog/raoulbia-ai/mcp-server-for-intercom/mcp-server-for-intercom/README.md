
# MCP Server for Intercom

A containerized version of "MCP Server for Intercom"

> Repository: [raoulbia-ai/mcp-server-for-intercom](https://github.com/raoulbia-ai/mcp-server-for-intercom)

## Description

An MCP-compliant server for retrieving customer support tickets from Intercom. This tool enables AI assistants like Claude Desktop and Cline to access and analyze your Intercom support tickets.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--raoulbia-ai--mcp-server-for-intercom--mcp-server-for-intercom
```

2. Run the container:

```bash
docker run -i --rm \ 
-e INTERCOM_ACCESS_TOKEN=intercom-access-token \
ghcr.io/metorial/mcp-container--raoulbia-ai--mcp-server-for-intercom--mcp-server-for-intercom  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `INTERCOM_ACCESS_TOKEN`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-server-for-intercom": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--raoulbia-ai--mcp-server-for-intercom--mcp-server-for-intercom",
        "npm run start"
      ],
      "env": {
        "INTERCOM_ACCESS_TOKEN": "intercom-access-token"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/raoulbia-ai/mcp-server-for-intercom) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  