
# Website Downloader MCP Server

A containerized version of "Website Downloader MCP Server"

> Repository: [pskill9/website-downloader](https://github.com/pskill9/website-downloader)

## Description

This MCP server provides a tool to download entire websites using wget. It preserves the website structure and converts links to work locally.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--pskill9--website-downloader--website-downloader
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--pskill9--website-downloader--website-downloader  "node ./build/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "website-downloader": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--pskill9--website-downloader--website-downloader",
        "node ./build/index.js"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/pskill9/website-downloader) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  