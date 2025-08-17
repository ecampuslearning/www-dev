
# Gitee MCP Server

A containerized version of "Gitee MCP Server"

> Repository: [oschina/mcp-gitee](https://github.com/oschina/mcp-gitee)

## Description

Gitee MCP Server is a Model Context Protocol (MCP) server implementation for Gitee. It provides a set of tools for interacting with Gitee's API, allowing AI assistants to manage repositories, issues, pull requests, and more.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--oschina--mcp-gitee--mcp-gitee
```

2. Run the container:

```bash
docker run -i --rm \ 
-e GITEE_API_BASE=gitee-api-base -e GITEE_ACCESS_TOKEN=gitee-access-token \
ghcr.io/metorial/mcp-container--oschina--mcp-gitee--mcp-gitee  "./out"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `GITEE_API_BASE`
- `GITEE_ACCESS_TOKEN`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-gitee": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--oschina--mcp-gitee--mcp-gitee",
        "./out"
      ],
      "env": {
        "GITEE_API_BASE": "gitee-api-base",
        "GITEE_ACCESS_TOKEN": "gitee-access-token"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/oschina/mcp-gitee) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  