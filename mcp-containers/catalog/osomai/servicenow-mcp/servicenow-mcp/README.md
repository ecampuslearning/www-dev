
# ServiceNow MCP Server

A containerized version of "ServiceNow MCP Server"

> Repository: [osomai/servicenow-mcp](https://github.com/osomai/servicenow-mcp)

## Description

A Model Completion Protocol (MCP) server implementation for ServiceNow, allowing Claude to interact with ServiceNow instances.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--osomai--servicenow-mcp--servicenow-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
-e SERVICENOW_INSTANCE_URL=servicenow-instance-url -e SERVICENOW_USERNAME=servicenow-username -e SERVICENOW_PASSWORD=servicenow-password -e SERVICENOW_AUTH_TYPE=servicenow-auth-type \
ghcr.io/metorial/mcp-container--osomai--servicenow-mcp--servicenow-mcp  "servicenow-mcp"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `SERVICENOW_INSTANCE_URL`
- `SERVICENOW_USERNAME`
- `SERVICENOW_PASSWORD`
- `SERVICENOW_AUTH_TYPE`




## Usage with Claude

```json
{
  "mcpServers": {
    "servicenow-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--osomai--servicenow-mcp--servicenow-mcp",
        "servicenow-mcp"
      ],
      "env": {
        "SERVICENOW_INSTANCE_URL": "servicenow-instance-url",
        "SERVICENOW_USERNAME": "servicenow-username",
        "SERVICENOW_PASSWORD": "servicenow-password",
        "SERVICENOW_AUTH_TYPE": "servicenow-auth-type"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/osomai/servicenow-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  