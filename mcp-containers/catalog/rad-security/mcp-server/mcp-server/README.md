
# RAD Security MCP Server

A containerized version of "RAD Security MCP Server"

> Repository: [rad-security/mcp-server](https://github.com/rad-security/mcp-server)

## Description

A Model Context Protocol (MCP) server for RAD Security, providing AI-powered security insights for Kubernetes and cloud environments.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--rad-security--mcp-server--mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e RAD_SECURITY_ACCESS_KEY_ID=rad-security-access-key-id -e RAD_SECURITY_SECRET_KEY=rad-security-secret-key -e RAD_SECURITY_ACCOUNT_ID=rad-security-account-id \
ghcr.io/metorial/mcp-container--rad-security--mcp-server--mcp-server  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `RAD_SECURITY_ACCESS_KEY_ID`
- `RAD_SECURITY_SECRET_KEY`
- `RAD_SECURITY_ACCOUNT_ID`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--rad-security--mcp-server--mcp-server",
        "npm run start"
      ],
      "env": {
        "RAD_SECURITY_ACCESS_KEY_ID": "rad-security-access-key-id",
        "RAD_SECURITY_SECRET_KEY": "rad-security-secret-key",
        "RAD_SECURITY_ACCOUNT_ID": "rad-security-account-id"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/rad-security/mcp-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  