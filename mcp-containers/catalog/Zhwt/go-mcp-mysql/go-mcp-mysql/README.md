
# go-mcp-mysql

A containerized version of "go-mcp-mysql"

> Repository: [Zhwt/go-mcp-mysql](https://github.com/Zhwt/go-mcp-mysql)

## Description

Zero burden, ready-to-use Model Context Protocol (MCP) server for interacting with MySQL and automation.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--zhwt--go-mcp-mysql--go-mcp-mysql
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--zhwt--go-mcp-mysql--go-mcp-mysql  "./out --host host --user user --pass pass --port port --db db --dsn dsn --read-only read-only"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:


#### Arguments

- `--host`
- `--user`
- `--pass`
- `--port`
- `--db`
- `--dsn`
- `--read-only`






## Usage with Claude

```json
{
  "mcpServers": {
    "go-mcp-mysql": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--zhwt--go-mcp-mysql--go-mcp-mysql",
        "./out --host host --user user --pass pass --port port --db db --dsn dsn --read-only read-only"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/Zhwt/go-mcp-mysql) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  