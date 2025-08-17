
# 语雀 MCP 服务器

A containerized version of "语雀 MCP 服务器"

> Repository: [HenryHaoson/Yuque-MCP-Server](https://github.com/HenryHaoson/Yuque-MCP-Server)

## Description

一个用于与语雀 API 集成的 Model-Context-Protocol (MCP) 服务器。此实现受 [Figma-Context-MCP](https://github.com/GLips/Figma-Context-MCP) 的启发，并使用 [语雀开放 API](https://app.swaggerhub.com/apis-docs/Jeff-Tian/yuque-open_api/2.0.1)。


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--henryhaoson--yuque-mcp-server--yuque-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e YUQUE_API_TOKEN=yuque-api-token -e YUQUE_API_BASE_URL=yuque-api-base-url \
ghcr.io/metorial/mcp-container--henryhaoson--yuque-mcp-server--yuque-mcp-server  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `YUQUE_API_TOKEN`
- `YUQUE_API_BASE_URL`




## Usage with Claude

```json
{
  "mcpServers": {
    "yuque-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--henryhaoson--yuque-mcp-server--yuque-mcp-server",
        "npm run start"
      ],
      "env": {
        "YUQUE_API_TOKEN": "yuque-api-token",
        "YUQUE_API_BASE_URL": "yuque-api-base-url"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/HenryHaoson/Yuque-MCP-Server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  