
# Azure CLI MCP Server

A containerized version of "Azure CLI MCP Server"

> Repository: [jdubois/azure-cli-mcp](https://github.com/jdubois/azure-cli-mcp)

## Description

This is an [MCP Server](https://modelcontextprotocol.io) that wraps the [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/), adds a nice prompt to improve how it works, and exposes it.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--jdubois--azure-cli-mcp--azure-cli-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
-e AZURE_CREDENTIALS=azure-credentials \
ghcr.io/metorial/mcp-container--jdubois--azure-cli-mcp--azure-cli-mcp  "java -Dserver.port=$PORT $JAVA_OPTS -jar target/*jar --name name --role role --scopes scopes --json-auth json-auth --repo repo --pattern pattern"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:


#### Arguments

- `--name`
- `--role`
- `--scopes`
- `--json-auth`
- `--repo`
- `--pattern`



#### Environment Variables

- `AZURE_CREDENTIALS`




## Usage with Claude

```json
{
  "mcpServers": {
    "azure-cli-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--jdubois--azure-cli-mcp--azure-cli-mcp",
        "java -Dserver.port=$PORT $JAVA_OPTS -jar target/*jar --name name --role role --scopes scopes --json-auth json-auth --repo repo --pattern pattern"
      ],
      "env": {
        "AZURE_CREDENTIALS": "azure-credentials"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/jdubois/azure-cli-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  