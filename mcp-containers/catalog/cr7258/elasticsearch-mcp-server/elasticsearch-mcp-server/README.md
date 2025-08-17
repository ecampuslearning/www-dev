
# Elasticsearch/OpenSearch MCP Server

A containerized version of "Elasticsearch/OpenSearch MCP Server"

> Repository: [cr7258/elasticsearch-mcp-server](https://github.com/cr7258/elasticsearch-mcp-server)

## Description

A Model Context Protocol (MCP) server implementation that provides Elasticsearch and OpenSearch interaction.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--cr7258--elasticsearch-mcp-server--elasticsearch-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e ELASTICSEARCH_HOSTS=elasticsearch-hosts -e ELASTICSEARCH_USERNAME=elasticsearch-username -e ELASTICSEARCH_PASSWORD=elasticsearch-password \
ghcr.io/metorial/mcp-container--cr7258--elasticsearch-mcp-server--elasticsearch-mcp-server  "elasticsearch-mcp-server"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `ELASTICSEARCH_HOSTS`
- `ELASTICSEARCH_USERNAME`
- `ELASTICSEARCH_PASSWORD`




## Usage with Claude

```json
{
  "mcpServers": {
    "elasticsearch-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--cr7258--elasticsearch-mcp-server--elasticsearch-mcp-server",
        "elasticsearch-mcp-server"
      ],
      "env": {
        "ELASTICSEARCH_HOSTS": "elasticsearch-hosts",
        "ELASTICSEARCH_USERNAME": "elasticsearch-username",
        "ELASTICSEARCH_PASSWORD": "elasticsearch-password"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/cr7258/elasticsearch-mcp-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  