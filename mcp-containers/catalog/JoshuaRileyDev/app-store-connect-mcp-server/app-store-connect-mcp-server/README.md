
# App Store Connect MCP Server

A containerized version of "App Store Connect MCP Server"

> Repository: [JoshuaRileyDev/app-store-connect-mcp-server](https://github.com/JoshuaRileyDev/app-store-connect-mcp-server)

## Description

A Model Context Protocol (MCP) server for interacting with the App Store Connect API. This server provides tools for managing apps, beta testers, bundle IDs, devices, and capabilities in App Store Connect.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--joshuarileydev--app-store-connect-mcp-server--app-store-connect-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e APP_STORE_CONNECT_KEY_ID=app-store-connect-key-id -e APP_STORE_CONNECT_ISSUER_ID=app-store-connect-issuer-id -e APP_STORE_CONNECT_P8_PATH=app-store-connect-p-8-path \
ghcr.io/metorial/mcp-container--joshuarileydev--app-store-connect-mcp-server--app-store-connect-mcp-server  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `APP_STORE_CONNECT_KEY_ID`
- `APP_STORE_CONNECT_ISSUER_ID`
- `APP_STORE_CONNECT_P8_PATH`




## Usage with Claude

```json
{
  "mcpServers": {
    "app-store-connect-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--joshuarileydev--app-store-connect-mcp-server--app-store-connect-mcp-server",
        "npm run start"
      ],
      "env": {
        "APP_STORE_CONNECT_KEY_ID": "app-store-connect-key-id",
        "APP_STORE_CONNECT_ISSUER_ID": "app-store-connect-issuer-id",
        "APP_STORE_CONNECT_P8_PATH": "app-store-connect-p-8-path"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/JoshuaRileyDev/app-store-connect-mcp-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  