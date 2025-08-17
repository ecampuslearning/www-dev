
# MCP server for kintone

A containerized version of "MCP server for kintone"

> Repository: [macrat/mcp-server-kintone](https://github.com/macrat/mcp-server-kintone)

## Description

This server allows you to explore and manipulate kintone data using AI tools such as [Claude Desktop](https://claude.ai/download)!


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--macrat--mcp-server-kintone--mcp-server-kintone
```

2. Run the container:

```bash
docker run -i --rm \ 
-e KINTONE_BASE_URL=kintone-base-url -e KINTONE_USERNAME=kintone-username -e KINTONE_PASSWORD=kintone-password -e KINTONE_API_TOKEN=kintone-api-token -e KINTONE_ALLOW_APPS=kintone-allow-apps -e KINTONE_DENY_APPS=kintone-deny-apps \
ghcr.io/metorial/mcp-container--macrat--mcp-server-kintone--mcp-server-kintone  "./out"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `KINTONE_BASE_URL`
- `KINTONE_USERNAME`
- `KINTONE_PASSWORD`
- `KINTONE_API_TOKEN`
- `KINTONE_ALLOW_APPS`
- `KINTONE_DENY_APPS`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-server-kintone": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--macrat--mcp-server-kintone--mcp-server-kintone",
        "./out"
      ],
      "env": {
        "KINTONE_BASE_URL": "kintone-base-url",
        "KINTONE_USERNAME": "kintone-username",
        "KINTONE_PASSWORD": "kintone-password",
        "KINTONE_API_TOKEN": "kintone-api-token",
        "KINTONE_ALLOW_APPS": "kintone-allow-apps",
        "KINTONE_DENY_APPS": "kintone-deny-apps"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/macrat/mcp-server-kintone) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  