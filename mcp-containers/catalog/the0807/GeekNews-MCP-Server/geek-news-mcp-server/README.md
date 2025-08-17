
# GeekNews MCP Server

A containerized version of "GeekNews MCP Server"

> Repository: [the0807/GeekNews-MCP-Server](https://github.com/the0807/GeekNews-MCP-Server)

## Description

이 프로젝트는 [GeekNews](https://news.hada.io)에서 아티클을 가져오는 Model Context Protocol(MCP) 서버입니다. Python으로 구현되었으며, BeautifulSoup을 사용하여 웹 스크래핑을 수행합니다.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--the0807--geeknews-mcp-server--geek-news-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--the0807--geeknews-mcp-server--geek-news-mcp-server  "python main.py"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "geek-news-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--the0807--geeknews-mcp-server--geek-news-mcp-server",
        "python main.py"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/the0807/GeekNews-MCP-Server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  