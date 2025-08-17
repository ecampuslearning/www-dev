
# MCP Zotero

A containerized version of "MCP Zotero"

> Repository: [kaliaboi/mcp-zotero](https://github.com/kaliaboi/mcp-zotero)

## Description

A Model Context Protocol server for Zotero integration that allows Claude to interact with your Zotero library.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--kaliaboi--mcp-zotero--mcp-zotero
```

2. Run the container:

```bash
docker run -i --rm \ 
-e ZOTERO_API_KEY=zotero-api-key -e ZOTERO_USER_ID=zotero-user-id \
ghcr.io/metorial/mcp-container--kaliaboi--mcp-zotero--mcp-zotero  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `ZOTERO_API_KEY`
- `ZOTERO_USER_ID`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-zotero": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--kaliaboi--mcp-zotero--mcp-zotero",
        "npm run start"
      ],
      "env": {
        "ZOTERO_API_KEY": "zotero-api-key",
        "ZOTERO_USER_ID": "zotero-user-id"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/kaliaboi/mcp-zotero) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  