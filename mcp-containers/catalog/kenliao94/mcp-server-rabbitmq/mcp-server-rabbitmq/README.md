
# RabbitMQ MCP Server

A containerized version of "RabbitMQ MCP Server"

> Repository: [kenliao94/mcp-server-rabbitmq](https://github.com/kenliao94/mcp-server-rabbitmq)

## Description

A [Model Context Protocol](https://www.anthropic.com/news/model-context-protocol) server implementation for RabbitMQ. Enabling MCP client to interact with queues and topics hosted in a RabbitMQ instance.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--kenliao94--mcp-server-rabbitmq--mcp-server-rabbitmq
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--kenliao94--mcp-server-rabbitmq--mcp-server-rabbitmq  "mcp-server-rabbitmq --rabbitmq-host rabbitmq-host --port port --username username --password password --use-tls use-tls"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:


#### Arguments

- `--rabbitmq-host`
- `--port`
- `--username`
- `--password`
- `--use-tls`






## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-server-rabbitmq": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--kenliao94--mcp-server-rabbitmq--mcp-server-rabbitmq",
        "mcp-server-rabbitmq --rabbitmq-host rabbitmq-host --port port --username username --password password --use-tls use-tls"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/kenliao94/mcp-server-rabbitmq) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  