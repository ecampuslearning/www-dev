
# Firebase MCP Server

A containerized version of "Firebase MCP Server"

> Repository: [gannonh/firebase-mcp](https://github.com/gannonh/firebase-mcp)

## Description

🔥 Model Context Protocol (MCP) server for Firebase.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--gannonh--firebase-mcp--firebase-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
-e SERVICE_ACCOUNT_KEY_PATH=service-account-key-path -e FIREBASE_STORAGE_BUCKET=firebase-storage-bucket \
ghcr.io/metorial/mcp-container--gannonh--firebase-mcp--firebase-mcp  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `SERVICE_ACCOUNT_KEY_PATH`
- `FIREBASE_STORAGE_BUCKET`




## Usage with Claude

```json
{
  "mcpServers": {
    "firebase-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--gannonh--firebase-mcp--firebase-mcp",
        "npm run start"
      ],
      "env": {
        "SERVICE_ACCOUNT_KEY_PATH": "service-account-key-path",
        "FIREBASE_STORAGE_BUCKET": "firebase-storage-bucket"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/gannonh/firebase-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  