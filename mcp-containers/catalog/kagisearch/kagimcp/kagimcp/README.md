
# Kagi MCP server

A containerized version of "Kagi MCP server"

> Repository: [kagisearch/kagimcp](https://github.com/kagisearch/kagimcp)

## Description

A Model Context Protocol (MCP) server for Kagi search & other tools.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--kagisearch--kagimcp--kagimcp
```

2. Run the container:

```bash
docker run -i --rm \ 
-e KAGI_API_KEY=kagi-api-key -e KAGI_SUMMARIZER_ENGINE=kagi-summarizer-engine \
ghcr.io/metorial/mcp-container--kagisearch--kagimcp--kagimcp  "kagimcp"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `KAGI_API_KEY`
- `KAGI_SUMMARIZER_ENGINE`




## Usage with Claude

```json
{
  "mcpServers": {
    "kagimcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--kagisearch--kagimcp--kagimcp",
        "kagimcp"
      ],
      "env": {
        "KAGI_API_KEY": "kagi-api-key",
        "KAGI_SUMMARIZER_ENGINE": "kagi-summarizer-engine"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/kagisearch/kagimcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  