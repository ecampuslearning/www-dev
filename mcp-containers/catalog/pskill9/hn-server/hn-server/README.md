
# Hacker News MCP Server

A containerized version of "Hacker News MCP Server"

> Repository: [pskill9/hn-server](https://github.com/pskill9/hn-server)

## Description

A Model Context Protocol (MCP) server that provides tools for fetching stories from Hacker News. This server parses the HTML content from news.ycombinator.com and provides structured data for different types of stories (top, new, ask, show, jobs).


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--pskill9--hn-server--hn-server
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--pskill9--hn-server--hn-server  "node ./build/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "hn-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--pskill9--hn-server--hn-server",
        "node ./build/index.js"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/pskill9/hn-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  