
# AWS Athena

A containerized version of "AWS Athena"

> Repository: [lishenxydlgzs/aws-athena-mcp](https://github.com/lishenxydlgzs/aws-athena-mcp)

## Description

A Model Context Protocol (MCP) server for running AWS Athena queries. This server enables AI assistants to execute SQL queries against your AWS Athena databases and retrieve results.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--lishenxydlgzs--aws-athena-mcp--aws-athena-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
-e AWS_ACCESS_KEY_ID=AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=AWS_SECRET_ACCESS_KEY -e AWS_REGION=AWS_REGION \
ghcr.io/metorial/mcp-container--lishenxydlgzs--aws-athena-mcp--aws-athena-mcp  "npm run start"
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
    "aws-athena-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--lishenxydlgzs--aws-athena-mcp--aws-athena-mcp",
        "npm run start"
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

Please refer to the license provided in [the project repository](https://github.com/lishenxydlgzs/aws-athena-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  