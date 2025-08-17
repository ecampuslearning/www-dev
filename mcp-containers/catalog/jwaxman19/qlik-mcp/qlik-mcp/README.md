
# Qlik MCP Server

A containerized version of "Qlik MCP Server"

> Repository: [jwaxman19/qlik-mcp](https://github.com/jwaxman19/qlik-mcp)

## Description

MCP Server for the Qlik Cloud API, enabling Claude to interact with Qlik applications and extract data from visualizations.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--jwaxman19--qlik-mcp--qlik-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
-e QLIK_API_KEY=qlik-api-key -e QLIK_BASE_URL=qlik-base-url -e QLIK_APP_ID=qlik-app-id \
ghcr.io/metorial/mcp-container--jwaxman19--qlik-mcp--qlik-mcp  "deno run --allow-all src/index.ts"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `QLIK_API_KEY`
- `QLIK_BASE_URL`
- `QLIK_APP_ID`




## Usage with Claude

```json
{
  "mcpServers": {
    "qlik-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--jwaxman19--qlik-mcp--qlik-mcp",
        "deno run --allow-all src/index.ts"
      ],
      "env": {
        "QLIK_API_KEY": "qlik-api-key",
        "QLIK_BASE_URL": "qlik-base-url",
        "QLIK_APP_ID": "qlik-app-id"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/jwaxman19/qlik-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  