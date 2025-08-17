
# GitHub Enterprise MCP Server

A containerized version of "GitHub Enterprise MCP Server"

> Repository: [ddukbg/github-enterprise-mcp](https://github.com/ddukbg/github-enterprise-mcp)

## Description

An MCP (Model Context Protocol) server for integration with GitHub Enterprise API. This server provides an MCP interface to easily access repository information, issues, PRs, and more from GitHub Enterprise in Cursor.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--ddukbg--github-enterprise-mcp--github-enterprise-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--ddukbg--github-enterprise-mcp--github-enterprise-mcp  "npm run start --token token --github-enterprise-url github-enterprise-url"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:


#### Arguments

- `--token`
- `--github-enterprise-url`






## Usage with Claude

```json
{
  "mcpServers": {
    "github-enterprise-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--ddukbg--github-enterprise-mcp--github-enterprise-mcp",
        "npm run start --token token --github-enterprise-url github-enterprise-url"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/ddukbg/github-enterprise-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  