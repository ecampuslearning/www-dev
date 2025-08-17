
# trieve-mcp-server

A containerized version of "trieve-mcp-server"

> Repository: [devflowinc/trieve](https://github.com/devflowinc/trieve)

## Description

A Model Context Protocol (MCP) server that provides agentic tools for interacting with the Trieve API. This server enables AI agents to search and interact with Trieve datasets through a standardized interface.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--devflowinc--trieve--mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e TRIEVE_API_KEY=trieve-api-key -e TRIEVE_ORGANIZATION_ID=trieve-organization-id -e TRIEVE_DATASET_ID=trieve-dataset-id \
ghcr.io/metorial/mcp-container--devflowinc--trieve--mcp-server  "node build/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `TRIEVE_API_KEY`
- `TRIEVE_ORGANIZATION_ID`
- `TRIEVE_DATASET_ID`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--devflowinc--trieve--mcp-server",
        "node build/index.js"
      ],
      "env": {
        "TRIEVE_API_KEY": "trieve-api-key",
        "TRIEVE_ORGANIZATION_ID": "trieve-organization-id",
        "TRIEVE_DATASET_ID": "trieve-dataset-id"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/devflowinc/trieve) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  