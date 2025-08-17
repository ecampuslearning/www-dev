
# Amazon Bedrock MCP Server

A containerized version of "Amazon Bedrock MCP Server"

> Repository: [zxkane/mcp-server-amazon-bedrock](https://github.com/zxkane/mcp-server-amazon-bedrock)

## Description

A Model Control Protocol (MCP) server that integrates with Amazon Bedrock's Nova Canvas model for AI image generation.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--zxkane--mcp-server-amazon-bedrock--mcp-server-amazon-bedrock
```

2. Run the container:

```bash
docker run -i --rm \ 
-e AWS_PROFILE=aws-profile \
ghcr.io/metorial/mcp-container--zxkane--mcp-server-amazon-bedrock--mcp-server-amazon-bedrock  "node ./build/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `AWS_PROFILE`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-server-amazon-bedrock": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--zxkane--mcp-server-amazon-bedrock--mcp-server-amazon-bedrock",
        "node ./build/index.js"
      ],
      "env": {
        "AWS_PROFILE": "aws-profile"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/zxkane/mcp-server-amazon-bedrock) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  