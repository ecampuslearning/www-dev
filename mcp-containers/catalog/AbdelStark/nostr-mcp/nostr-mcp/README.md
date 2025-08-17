
# 🌐 Nostr MCP Server

A containerized version of "🌐 Nostr MCP Server"

> Repository: [AbdelStark/nostr-mcp](https://github.com/AbdelStark/nostr-mcp)

## Description

A Model Context Protocol (MCP) server that enables AI models to interact with Nostr, allowing them to post notes and interact with the freedom of speech protocol.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--abdelstark--nostr-mcp--nostr-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
-e LOG_LEVEL=log-level -e NODE_ENV=node-env -e NOSTR_RELAYS=nostr-relays -e NOSTR_NSEC_KEY=nostr-nsec-key \
ghcr.io/metorial/mcp-container--abdelstark--nostr-mcp--nostr-mcp  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `LOG_LEVEL`
- `NODE_ENV`
- `NOSTR_RELAYS`
- `NOSTR_NSEC_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "nostr-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--abdelstark--nostr-mcp--nostr-mcp",
        "npm run start"
      ],
      "env": {
        "LOG_LEVEL": "log-level",
        "NODE_ENV": "node-env",
        "NOSTR_RELAYS": "nostr-relays",
        "NOSTR_NSEC_KEY": "nostr-nsec-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/AbdelStark/nostr-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  