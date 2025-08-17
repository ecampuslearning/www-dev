
# Rijksmuseum MCP Server

A containerized version of "Rijksmuseum MCP Server"

> Repository: [r-huijts/rijksmuseum-mcp](https://github.com/r-huijts/rijksmuseum-mcp)

## Description

A Model Context Protocol (MCP) server that provides access to the Rijksmuseum's collection through natural language interactions. This server enables AI models to explore, analyze, and interact with artworks and collections from the Rijksmuseum.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--r-huijts--rijksmuseum-mcp--rijksmuseum-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
-e RIJKSMUSEUM_API_KEY=rijksmuseum-api-key \
ghcr.io/metorial/mcp-container--r-huijts--rijksmuseum-mcp--rijksmuseum-mcp  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `RIJKSMUSEUM_API_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "rijksmuseum-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--r-huijts--rijksmuseum-mcp--rijksmuseum-mcp",
        "npm run start"
      ],
      "env": {
        "RIJKSMUSEUM_API_KEY": "rijksmuseum-api-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/r-huijts/rijksmuseum-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  