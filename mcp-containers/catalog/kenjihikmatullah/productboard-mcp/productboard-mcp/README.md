
# Productboard MCP Server

A containerized version of "Productboard MCP Server"

> Repository: [kenjihikmatullah/productboard-mcp](https://github.com/kenjihikmatullah/productboard-mcp)

## Description

Integrate the Productboard API into agentic workflows via MCP


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--kenjihikmatullah--productboard-mcp--productboard-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
-e PRODUCTBOARD_ACCESS_TOKEN=productboard-access-token \
ghcr.io/metorial/mcp-container--kenjihikmatullah--productboard-mcp--productboard-mcp  "node ./build/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `PRODUCTBOARD_ACCESS_TOKEN`




## Usage with Claude

```json
{
  "mcpServers": {
    "productboard-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--kenjihikmatullah--productboard-mcp--productboard-mcp",
        "node ./build/index.js"
      ],
      "env": {
        "PRODUCTBOARD_ACCESS_TOKEN": "productboard-access-token"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/kenjihikmatullah/productboard-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  