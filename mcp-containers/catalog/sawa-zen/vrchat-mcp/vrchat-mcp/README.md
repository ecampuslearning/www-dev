
# VRChat MCP Server

A containerized version of "VRChat MCP Server"

> Repository: [sawa-zen/vrchat-mcp](https://github.com/sawa-zen/vrchat-mcp)

## Description

The VRChat MCP server provides a way to access VRChat's API endpoints in a structured manner. It supports a wide range of functionalities, including user authentication, retrieving user and friend information, accessing avatar and world data, and more.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--sawa-zen--vrchat-mcp--vrchat-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
-e VRCHAT_USERNAME=vrchat-username -e VRCHAT_PASSWORD=vrchat-password -e VRCHAT_TOTP_SECRET=vrchat-totp-secret -e VRCHAT_EMAIL=vrchat-email \
ghcr.io/metorial/mcp-container--sawa-zen--vrchat-mcp--vrchat-mcp  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `VRCHAT_USERNAME`
- `VRCHAT_PASSWORD`
- `VRCHAT_TOTP_SECRET`
- `VRCHAT_EMAIL`




## Usage with Claude

```json
{
  "mcpServers": {
    "vrchat-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--sawa-zen--vrchat-mcp--vrchat-mcp",
        "npm run start"
      ],
      "env": {
        "VRCHAT_USERNAME": "vrchat-username",
        "VRCHAT_PASSWORD": "vrchat-password",
        "VRCHAT_TOTP_SECRET": "vrchat-totp-secret",
        "VRCHAT_EMAIL": "vrchat-email"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/sawa-zen/vrchat-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  