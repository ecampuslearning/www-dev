
# Browserbase MCP Server

A containerized version of "Browserbase MCP Server"

> Repository: [browserbase/mcp-server-browserbase](https://github.com/browserbase/mcp-server-browserbase)

## Description

This server provides cloud browser automation capabilities using [Browserbase](https://www.browserbase.com/), [Puppeteer](https://pptr.dev/), and [Stagehand](https://github.com/browserbase/stagehand). This server enables LLMs to interact with web pages, take screenshots, and execute JavaScript in a cloud browser environment.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--browserbase--mcp-server-browserbase--browserbase
```

2. Run the container:

```bash
docker run -i --rm \ 
-e BROWSERBASE_API_KEY=browserbase-api-key -e BROWSERBASE_PROJECT_ID=browserbase-project-id \
ghcr.io/metorial/mcp-container--browserbase--mcp-server-browserbase--browserbase  "node cli.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `BROWSERBASE_API_KEY`
- `BROWSERBASE_PROJECT_ID`




## Usage with Claude

```json
{
  "mcpServers": {
    "browserbase": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--browserbase--mcp-server-browserbase--browserbase",
        "node cli.js"
      ],
      "env": {
        "BROWSERBASE_API_KEY": "browserbase-api-key",
        "BROWSERBASE_PROJECT_ID": "browserbase-project-id"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/browserbase/mcp-server-browserbase) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  