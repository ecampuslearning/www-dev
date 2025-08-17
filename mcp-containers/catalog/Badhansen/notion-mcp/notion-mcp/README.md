
# notion-mcp

A containerized version of "notion-mcp"

> Repository: [Badhansen/notion-mcp](https://github.com/Badhansen/notion-mcp)

## Description

A simple Model Context Protocol (MCP) server that integrates with Notion's API to manage my personal todo list.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--badhansen--notion-mcp--notion-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
-e NOTION_TOKEN=notion-token -e PAGE_ID=page-id -e NOTION_VERSION=notion-version -e NOTION_BASE_URL=notion-base-url \
ghcr.io/metorial/mcp-container--badhansen--notion-mcp--notion-mcp  "uv run main_adfin_mcp.py"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `NOTION_TOKEN`
- `PAGE_ID`
- `NOTION_VERSION`
- `NOTION_BASE_URL`




## Usage with Claude

```json
{
  "mcpServers": {
    "notion-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--badhansen--notion-mcp--notion-mcp",
        "uv run main_adfin_mcp.py"
      ],
      "env": {
        "NOTION_TOKEN": "notion-token",
        "PAGE_ID": "page-id",
        "NOTION_VERSION": "notion-version",
        "NOTION_BASE_URL": "notion-base-url"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/Badhansen/notion-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  