
# Puppeteer

A containerized version of "Puppeteer"

> Repository: [modelcontextprotocol/servers](https://github.com/modelcontextprotocol/servers)

## Description

A Model Context Protocol server that provides browser automation capabilities using Puppeteer. This server enables LLMs to interact with web pages, take screenshots, and execute JavaScript in a real browser environment.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--modelcontextprotocol--servers--puppeteer
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--modelcontextprotocol--servers--puppeteer  "cd ./src/puppeteer && node ./dist/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "puppeteer": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--modelcontextprotocol--servers--puppeteer",
        "cd ./src/puppeteer && node ./dist/index.js"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/modelcontextprotocol/servers) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  