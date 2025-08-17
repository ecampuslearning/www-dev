
# Eunomia MCP Server

A containerized version of "Eunomia MCP Server"

> Repository: [whataboutyou-ai/eunomia-MCP-server](https://github.com/whataboutyou-ai/eunomia-MCP-server)

## Description

**Eunomia MCP Server** is an extension of the \[Eunomia]\[eunomia-repo] framework that connects Eunomia instruments with \[MCP]\[mcp-docs] servers. It provides a simple way to orchestrate data governance policies (like PII detection or user access control) and seamlessly integrate them with external server processes in the MCP ecosystem.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--whataboutyou-ai--eunomia-mcp-server--eunomia-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--whataboutyou-ai--eunomia-mcp-server--eunomia-mcp-server  "orchestra_server"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "eunomia-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--whataboutyou-ai--eunomia-mcp-server--eunomia-mcp-server",
        "orchestra_server"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/whataboutyou-ai/eunomia-MCP-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  