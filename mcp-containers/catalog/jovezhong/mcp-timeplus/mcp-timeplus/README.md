
# Timeplus MCP Server

A containerized version of "Timeplus MCP Server"

> Repository: [jovezhong/mcp-timeplus](https://github.com/jovezhong/mcp-timeplus)

## Description

An MCP server for Timeplus.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--jovezhong--mcp-timeplus--mcp-timeplus
```

2. Run the container:

```bash
docker run -i --rm \ 
-e TIMEPLUS_HOST=timeplus-host -e TIMEPLUS_PORT=timeplus-port -e TIMEPLUS_USER=timeplus-user -e TIMEPLUS_PASSWORD=timeplus-password -e TIMEPLUS_SECURE=timeplus-secure -e TIMEPLUS_VERIFY=timeplus-verify -e TIMEPLUS_CONNECT_TIMEOUT=timeplus-connect-timeout -e TIMEPLUS_SEND_RECEIVE_TIMEOUT=timeplus-send-receive-timeout -e TIMEPLUS_READ_ONLY=timeplus-read-only -e TIMEPLUS_KAFKA_CONFIG=timeplus-kafka-config \
ghcr.io/metorial/mcp-container--jovezhong--mcp-timeplus--mcp-timeplus  "mcp-timeplus"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `TIMEPLUS_HOST`
- `TIMEPLUS_PORT`
- `TIMEPLUS_USER`
- `TIMEPLUS_PASSWORD`
- `TIMEPLUS_SECURE`
- `TIMEPLUS_VERIFY`
- `TIMEPLUS_CONNECT_TIMEOUT`
- `TIMEPLUS_SEND_RECEIVE_TIMEOUT`
- `TIMEPLUS_READ_ONLY`
- `TIMEPLUS_KAFKA_CONFIG`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-timeplus": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--jovezhong--mcp-timeplus--mcp-timeplus",
        "mcp-timeplus"
      ],
      "env": {
        "TIMEPLUS_HOST": "timeplus-host",
        "TIMEPLUS_PORT": "timeplus-port",
        "TIMEPLUS_USER": "timeplus-user",
        "TIMEPLUS_PASSWORD": "timeplus-password",
        "TIMEPLUS_SECURE": "timeplus-secure",
        "TIMEPLUS_VERIFY": "timeplus-verify",
        "TIMEPLUS_CONNECT_TIMEOUT": "timeplus-connect-timeout",
        "TIMEPLUS_SEND_RECEIVE_TIMEOUT": "timeplus-send-receive-timeout",
        "TIMEPLUS_READ_ONLY": "timeplus-read-only",
        "TIMEPLUS_KAFKA_CONFIG": "timeplus-kafka-config"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/jovezhong/mcp-timeplus) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  