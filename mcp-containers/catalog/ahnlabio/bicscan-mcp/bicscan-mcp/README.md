
# BICScan MCP Server

A containerized version of "BICScan MCP Server"

> Repository: [ahnlabio/bicscan-mcp](https://github.com/ahnlabio/bicscan-mcp)

## Description

A powerful and efficient Blockchain address risk scoring API MCP Server, leveraging the BICScan API to provide comprehensive risk assessments and asset information for blockchain addresses, domains, and decentralized applications (dApps).


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--ahnlabio--bicscan-mcp--bicscan-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
-e BICSCAN_API_KEY=bicscan-api-key \
ghcr.io/metorial/mcp-container--ahnlabio--bicscan-mcp--bicscan-mcp  "bicscan-mcp"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `BICSCAN_API_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "bicscan-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--ahnlabio--bicscan-mcp--bicscan-mcp",
        "bicscan-mcp"
      ],
      "env": {
        "BICSCAN_API_KEY": "bicscan-api-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/ahnlabio/bicscan-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  