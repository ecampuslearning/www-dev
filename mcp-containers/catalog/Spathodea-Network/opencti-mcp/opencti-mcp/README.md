
# OpenCTI MCP Server

A containerized version of "OpenCTI MCP Server"

> Repository: [Spathodea-Network/opencti-mcp](https://github.com/Spathodea-Network/opencti-mcp)

## Description

OpenCTI MCP Server is a Model Context Protocol (MCP) server that provides seamless integration with OpenCTI (Open Cyber Threat Intelligence) platform.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--spathodea-network--opencti-mcp--opencti-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
-e OPENCTI_URL=opencti-url \
ghcr.io/metorial/mcp-container--spathodea-network--opencti-mcp--opencti-mcp  "node ./build/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `OPENCTI_URL`




## Usage with Claude

```json
{
  "mcpServers": {
    "opencti-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--spathodea-network--opencti-mcp--opencti-mcp",
        "node ./build/index.js"
      ],
      "env": {
        "OPENCTI_URL": "opencti-url"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/Spathodea-Network/opencti-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  