
# Replicate Flux MCP

A containerized version of "Replicate Flux MCP"

> Repository: [awkoy/replicate-flux-mcp](https://github.com/awkoy/replicate-flux-mcp)

## Description

MCP for Replicate Flux Model - A powerful tool for generating customized images and SVG assets that match specific coding vibes and aesthetic styles. Streamline your visual asset creation process with AI-powered design generation tailored for developers.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--awkoy--replicate-flux-mcp--replicate-flux-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
-e REPLICATE_API_TOKEN=replicate-api-token \
ghcr.io/metorial/mcp-container--awkoy--replicate-flux-mcp--replicate-flux-mcp  "node build/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `REPLICATE_API_TOKEN`




## Usage with Claude

```json
{
  "mcpServers": {
    "replicate-flux-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--awkoy--replicate-flux-mcp--replicate-flux-mcp",
        "node build/index.js"
      ],
      "env": {
        "REPLICATE_API_TOKEN": "replicate-api-token"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/awkoy/replicate-flux-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  