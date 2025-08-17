
# Chroma MCP Server

A containerized version of "Chroma MCP Server"

> Repository: [chroma-core/chroma-mcp](https://github.com/chroma-core/chroma-mcp)

## Description

This server provides data retrieval capabilities powered by Chroma, enabling AI models to create collections over generated data and user inputs, and retrieve that data using vector search, full text search, metadata filtering, and more.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--chroma-core--chroma-mcp--chroma-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
-e CHROMA_CLIENT_TYPE=chroma-client-type -e CHROMA_DATA_DIR=chroma-data-dir -e CHROMA_TENANT=chroma-tenant -e CHROMA_DATABASE=chroma-database -e CHROMA_API_KEY=chroma-api-key -e CHROMA_HOST=chroma-host -e CHROMA_PORT=chroma-port -e CHROMA_CUSTOM_AUTH_CREDENTIALS=chroma-custom-auth-credentials -e CHROMA_SSL=chroma-ssl -e CHROMA_DOTENV_PATH=chroma-dotenv-path -e CHROMA_COHERE_API_KEY=chroma-cohere-api-key \
ghcr.io/metorial/mcp-container--chroma-core--chroma-mcp--chroma-mcp  "chroma-mcp --client-type chroma-client-type --data-dir chroma-data-dir --tenant chroma-tenant --database chroma-database --api-key chroma-api-key --host chroma-host --port chroma-port --custom-auth-credentials chroma-custom-auth-credentials --ssl chroma-ssl --dotenv-path chroma-dotenv-path"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:


#### Arguments

- `--client-type`
- `--data-dir`
- `--tenant`
- `--database`
- `--api-key`
- `--host`
- `--port`
- `--custom-auth-credentials`
- `--ssl`
- `--dotenv-path`



#### Environment Variables

- `CHROMA_CLIENT_TYPE`
- `CHROMA_DATA_DIR`
- `CHROMA_TENANT`
- `CHROMA_DATABASE`
- `CHROMA_API_KEY`
- `CHROMA_HOST`
- `CHROMA_PORT`
- `CHROMA_CUSTOM_AUTH_CREDENTIALS`
- `CHROMA_SSL`
- `CHROMA_DOTENV_PATH`
- `CHROMA_COHERE_API_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "chroma-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--chroma-core--chroma-mcp--chroma-mcp",
        "chroma-mcp --client-type chroma-client-type --data-dir chroma-data-dir --tenant chroma-tenant --database chroma-database --api-key chroma-api-key --host chroma-host --port chroma-port --custom-auth-credentials chroma-custom-auth-credentials --ssl chroma-ssl --dotenv-path chroma-dotenv-path"
      ],
      "env": {
        "CHROMA_CLIENT_TYPE": "chroma-client-type",
        "CHROMA_DATA_DIR": "chroma-data-dir",
        "CHROMA_TENANT": "chroma-tenant",
        "CHROMA_DATABASE": "chroma-database",
        "CHROMA_API_KEY": "chroma-api-key",
        "CHROMA_HOST": "chroma-host",
        "CHROMA_PORT": "chroma-port",
        "CHROMA_CUSTOM_AUTH_CREDENTIALS": "chroma-custom-auth-credentials",
        "CHROMA_SSL": "chroma-ssl",
        "CHROMA_DOTENV_PATH": "chroma-dotenv-path",
        "CHROMA_COHERE_API_KEY": "chroma-cohere-api-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/chroma-core/chroma-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  