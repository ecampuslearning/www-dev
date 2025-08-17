
# # What is YepCode MCP Server?

A containerized version of "# What is YepCode MCP Server?"

> Repository: [yepcode/mcp-server-js](https://github.com/yepcode/mcp-server-js)

## Description

An MCP ([Model Context Protocol](https://modelcontextprotocol.io/introduction)) server that enables AI platforms to interact with [YepCode](https://yepcode.io)'s infrastructure. Run LLM generated scripts and turn your YepCode processes into powerful tools that AI assistants can use directly.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--yepcode--mcp-server-js--mcp-server-js
```

2. Run the container:

```bash
docker run -i --rm \ 
-e YEPCODE_API_TOKEN=yepcode-api-token \
ghcr.io/metorial/mcp-container--yepcode--mcp-server-js--mcp-server-js  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `YEPCODE_API_TOKEN`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-server-js": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--yepcode--mcp-server-js--mcp-server-js",
        "npm run start"
      ],
      "env": {
        "YEPCODE_API_TOKEN": "yepcode-api-token"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/yepcode/mcp-server-js) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  