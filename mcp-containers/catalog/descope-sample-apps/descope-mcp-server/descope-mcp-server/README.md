
# Descope MCP Server

A containerized version of "Descope MCP Server"

> Repository: [descope-sample-apps/descope-mcp-server](https://github.com/descope-sample-apps/descope-mcp-server)

## Description

The Descope Model Context Protocol (MCP) server provides an interface to interact with Descope's Management APIs, enabling the search and retrieval of project-related information.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--descope-sample-apps--descope-mcp-server--descope-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e DESCOPE_PROJECT_ID=descope-project-id -e DESCOPE_MANAGEMENT_KEY=descope-management-key \
ghcr.io/metorial/mcp-container--descope-sample-apps--descope-mcp-server--descope-mcp-server  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `DESCOPE_PROJECT_ID`
- `DESCOPE_MANAGEMENT_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "descope-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--descope-sample-apps--descope-mcp-server--descope-mcp-server",
        "npm run start"
      ],
      "env": {
        "DESCOPE_PROJECT_ID": "descope-project-id",
        "DESCOPE_MANAGEMENT_KEY": "descope-management-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/descope-sample-apps/descope-mcp-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  