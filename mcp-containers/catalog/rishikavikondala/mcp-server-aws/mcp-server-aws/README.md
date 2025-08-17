
# AWS MCP Server

A containerized version of "AWS MCP Server"

> Repository: [rishikavikondala/mcp-server-aws](https://github.com/rishikavikondala/mcp-server-aws)

## Description

A [Model Context Protocol](https://www.anthropic.com/news/model-context-protocol) server implementation for AWS operations that currently supports S3 and DynamoDB services. All operations are automatically logged and can be accessed through the audit://aws-operations resource endpoint.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--rishikavikondala--mcp-server-aws--mcp-server-aws
```

2. Run the container:

```bash
docker run -i --rm \ 
-e AWS_ACCESS_KEY_ID=AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=AWS_SECRET_ACCESS_KEY -e AWS_REGION=AWS_REGION \
ghcr.io/metorial/mcp-container--rishikavikondala--mcp-server-aws--mcp-server-aws  "mcp-server-aws"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `AWS_REGION`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-server-aws": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--rishikavikondala--mcp-server-aws--mcp-server-aws",
        "mcp-server-aws"
      ],
      "env": {
        "AWS_ACCESS_KEY_ID": "AWS_ACCESS_KEY_ID",
        "AWS_SECRET_ACCESS_KEY": "AWS_SECRET_ACCESS_KEY",
        "AWS_REGION": "AWS_REGION"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/rishikavikondala/mcp-server-aws) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  