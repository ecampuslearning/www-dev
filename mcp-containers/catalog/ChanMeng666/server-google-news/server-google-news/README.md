
# Google News MCP Server

A containerized version of "Google News MCP Server"

> Repository: [ChanMeng666/server-google-news](https://github.com/ChanMeng666/server-google-news)

## Description

Model Context Protocol (MCP) server implementation providing Google News search capabilities via SerpAPI, with automatic news categorization and multi-language support.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--chanmeng666--server-google-news--server-google-news
```

2. Run the container:

```bash
docker run -i --rm \ 
-e SERP_API_KEY=serp-api-key \
ghcr.io/metorial/mcp-container--chanmeng666--server-google-news--server-google-news  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `SERP_API_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "server-google-news": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--chanmeng666--server-google-news--server-google-news",
        "npm run start"
      ],
      "env": {
        "SERP_API_KEY": "serp-api-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/ChanMeng666/server-google-news) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  