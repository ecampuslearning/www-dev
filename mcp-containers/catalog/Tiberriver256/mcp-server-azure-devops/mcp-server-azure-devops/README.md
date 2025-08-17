
# Azure DevOps MCP Server

A containerized version of "Azure DevOps MCP Server"

> Repository: [Tiberriver256/mcp-server-azure-devops](https://github.com/Tiberriver256/mcp-server-azure-devops)

## Description

A Model Context Protocol (MCP) server implementation for Azure DevOps, allowing AI assistants to interact with Azure DevOps APIs through a standardized protocol.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--tiberriver256--mcp-server-azure-devops--mcp-server-azure-devops
```

2. Run the container:

```bash
docker run -i --rm \ 
-e AZURE_DEVOPS_ORG_URL=azure-devops-org-url -e AZURE_DEVOPS_AUTH_METHOD=azure-devops-auth-method -e AZURE_DEVOPS_DEFAULT_PROJECT=azure-devops-default-project \
ghcr.io/metorial/mcp-container--tiberriver256--mcp-server-azure-devops--mcp-server-azure-devops  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `AZURE_DEVOPS_ORG_URL`
- `AZURE_DEVOPS_AUTH_METHOD`
- `AZURE_DEVOPS_DEFAULT_PROJECT`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-server-azure-devops": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--tiberriver256--mcp-server-azure-devops--mcp-server-azure-devops",
        "npm run start"
      ],
      "env": {
        "AZURE_DEVOPS_ORG_URL": "azure-devops-org-url",
        "AZURE_DEVOPS_AUTH_METHOD": "azure-devops-auth-method",
        "AZURE_DEVOPS_DEFAULT_PROJECT": "azure-devops-default-project"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/Tiberriver256/mcp-server-azure-devops) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  