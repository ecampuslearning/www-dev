
# Keycloak MCP Server

A containerized version of "Keycloak MCP Server"

> Repository: [ChristophEnglisch/keycloak-model-context-protocol](https://github.com/ChristophEnglisch/keycloak-model-context-protocol)

## Description

A Model Context Protocol server for Keycloak administration, providing tools to manage users and realms.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--christophenglisch--keycloak-model-context-protocol--keycloak-model-context-protocol
```

2. Run the container:

```bash
docker run -i --rm \ 
-e KEYCLOAK_URL=keycloak-url -e KEYCLOAK_ADMIN=keycloak-admin \
ghcr.io/metorial/mcp-container--christophenglisch--keycloak-model-context-protocol--keycloak-model-context-protocol  "node ./dist/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `KEYCLOAK_URL`
- `KEYCLOAK_ADMIN`




## Usage with Claude

```json
{
  "mcpServers": {
    "keycloak-model-context-protocol": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--christophenglisch--keycloak-model-context-protocol--keycloak-model-context-protocol",
        "node ./dist/index.js"
      ],
      "env": {
        "KEYCLOAK_URL": "keycloak-url",
        "KEYCLOAK_ADMIN": "keycloak-admin"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/ChristophEnglisch/keycloak-model-context-protocol) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  