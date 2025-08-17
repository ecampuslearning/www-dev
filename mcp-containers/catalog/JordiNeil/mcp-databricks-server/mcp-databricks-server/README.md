
# Databricks MCP Server

A containerized version of "Databricks MCP Server"

> Repository: [JordiNeil/mcp-databricks-server](https://github.com/JordiNeil/mcp-databricks-server)

## Description

A Model Context Protocol (MCP) server that connects to Databricks API, allowing LLMs to run SQL queries, list jobs, and get job status.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--jordineil--mcp-databricks-server--mcp-databricks-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e DATABRICKS_HOST=databricks-host -e DATABRICKS_TOKEN=databricks-token -e DATABRICKS_HTTP_PATH=databricks-http-path \
ghcr.io/metorial/mcp-container--jordineil--mcp-databricks-server--mcp-databricks-server  "python main.py"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `DATABRICKS_HOST`
- `DATABRICKS_TOKEN`
- `DATABRICKS_HTTP_PATH`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-databricks-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--jordineil--mcp-databricks-server--mcp-databricks-server",
        "python main.py"
      ],
      "env": {
        "DATABRICKS_HOST": "databricks-host",
        "DATABRICKS_TOKEN": "databricks-token",
        "DATABRICKS_HTTP_PATH": "databricks-http-path"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/JordiNeil/mcp-databricks-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  