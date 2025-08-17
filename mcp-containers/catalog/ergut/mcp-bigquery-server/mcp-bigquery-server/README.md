
# BigQuery MCP Server

A containerized version of "BigQuery MCP Server"

> Repository: [ergut/mcp-bigquery-server](https://github.com/ergut/mcp-bigquery-server)

## Description

A Model Context Protocol (MCP) server that provides secure, read-only access to BigQuery datasets. Enables Large Language Models (LLMs) to safely query and analyze data through a standardized interface.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--ergut--mcp-bigquery-server--mcp-bigquery-server
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--ergut--mcp-bigquery-server--mcp-bigquery-server  "node dist/index.js --project-id project-id --location location"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:


#### Arguments

- `--project-id`
- `--location`






## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-bigquery-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--ergut--mcp-bigquery-server--mcp-bigquery-server",
        "node dist/index.js --project-id project-id --location location"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/ergut/mcp-bigquery-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  