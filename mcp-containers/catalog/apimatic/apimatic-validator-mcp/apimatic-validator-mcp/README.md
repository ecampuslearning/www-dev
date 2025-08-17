
# APIMatic Validator MCP Server

A containerized version of "APIMatic Validator MCP Server"

> Repository: [apimatic/apimatic-validator-mcp](https://github.com/apimatic/apimatic-validator-mcp)

## Description

This repository provides a Model Context Protocol (MCP) Server for validating OpenAPI specifications using [APIMatic](https://www.apimatic.io/). The server processes OpenAPI files and returns validation summaries by leveraging APIMatic’s API.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--apimatic--apimatic-validator-mcp--apimatic-validator-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
-e APIMATIC_API_KEY=apimatic-api-key \
ghcr.io/metorial/mcp-container--apimatic--apimatic-validator-mcp--apimatic-validator-mcp  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `APIMATIC_API_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "apimatic-validator-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--apimatic--apimatic-validator-mcp--apimatic-validator-mcp",
        "npm run start"
      ],
      "env": {
        "APIMATIC_API_KEY": "apimatic-api-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/apimatic/apimatic-validator-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  