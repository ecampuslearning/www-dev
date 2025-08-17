
# MCP Server for MySQL

A containerized version of "MCP Server for MySQL"

> Repository: [benborla/mcp-server-mysql](https://github.com/benborla/mcp-server-mysql)

## Description

A Model Context Protocol server that provides access to MySQL databases. This server enables LLMs to inspect database schemas and execute SQL queries.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--benborla--mcp-server-mysql--mcp-server-mysql
```

2. Run the container:

```bash
docker run -i --rm \ 
-e MYSQL_HOST=mysql-host -e MYSQL_PORT=mysql-port -e MYSQL_USER=mysql-user -e MYSQL_PASS=mysql-pass -e MYSQL_DB=mysql-db -e ALLOW_INSERT_OPERATION=allow-insert-operation -e ALLOW_UPDATE_OPERATION=allow-update-operation -e ALLOW_DELETE_OPERATION=allow-delete-operation -e PATH=path \
ghcr.io/metorial/mcp-container--benborla--mcp-server-mysql--mcp-server-mysql  "pnpm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `MYSQL_HOST`
- `MYSQL_PORT`
- `MYSQL_USER`
- `MYSQL_PASS`
- `MYSQL_DB`
- `ALLOW_INSERT_OPERATION`
- `ALLOW_UPDATE_OPERATION`
- `ALLOW_DELETE_OPERATION`
- `PATH`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-server-mysql": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--benborla--mcp-server-mysql--mcp-server-mysql",
        "pnpm run start"
      ],
      "env": {
        "MYSQL_HOST": "mysql-host",
        "MYSQL_PORT": "mysql-port",
        "MYSQL_USER": "mysql-user",
        "MYSQL_PASS": "mysql-pass",
        "MYSQL_DB": "mysql-db",
        "ALLOW_INSERT_OPERATION": "allow-insert-operation",
        "ALLOW_UPDATE_OPERATION": "allow-update-operation",
        "ALLOW_DELETE_OPERATION": "allow-delete-operation",
        "PATH": "path"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/benborla/mcp-server-mysql) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  