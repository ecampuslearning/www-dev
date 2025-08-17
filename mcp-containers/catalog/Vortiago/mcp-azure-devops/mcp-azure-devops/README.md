
# MCP Azure DevOps Server

A containerized version of "MCP Azure DevOps Server"

> Repository: [Vortiago/mcp-azure-devops](https://github.com/Vortiago/mcp-azure-devops)

## Description

A Model Context Protocol (MCP) server enabling AI assistants to interact with Azure DevOps services.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--vortiago--mcp-azure-devops--mcp-azure-devops
```

2. Run the container:

```bash
docker run -i --rm \ 
-e AZURE_DEVOPS_PAT=azure-devops-pat -e AZURE_DEVOPS_ORGANIZATION_URL=azure-devops-organization-url \
ghcr.io/metorial/mcp-container--vortiago--mcp-azure-devops--mcp-azure-devops  "mcp-azure-devops"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `AZURE_DEVOPS_PAT`
- `AZURE_DEVOPS_ORGANIZATION_URL`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-azure-devops": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--vortiago--mcp-azure-devops--mcp-azure-devops",
        "mcp-azure-devops"
      ],
      "env": {
        "AZURE_DEVOPS_PAT": "azure-devops-pat",
        "AZURE_DEVOPS_ORGANIZATION_URL": "azure-devops-organization-url"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/Vortiago/mcp-azure-devops) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  