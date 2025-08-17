
# @f4ww4z/mcp-mysql-server

A containerized version of "@f4ww4z/mcp-mysql-server"

> Repository: [f4ww4z/mcp-mysql-server](https://github.com/f4ww4z/mcp-mysql-server)

## Description

A Model Context Protocol server that provides MySQL database operations. This server enables AI models to interact with MySQL databases through a standardized interface.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--f4ww4z--mcp-mysql-server--mcp-mysql-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e MYSQL_HOST=mysql-host -e MYSQL_USER=mysql-user -e MYSQL_PASSWORD=mysql-password -e MYSQL_DATABASE=mysql-database \
ghcr.io/metorial/mcp-container--f4ww4z--mcp-mysql-server--mcp-mysql-server  "node ./build/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `MYSQL_HOST`
- `MYSQL_USER`
- `MYSQL_PASSWORD`
- `MYSQL_DATABASE`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-mysql-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--f4ww4z--mcp-mysql-server--mcp-mysql-server",
        "node ./build/index.js"
      ],
      "env": {
        "MYSQL_HOST": "mysql-host",
        "MYSQL_USER": "mysql-user",
        "MYSQL_PASSWORD": "mysql-password",
        "MYSQL_DATABASE": "mysql-database"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/f4ww4z/mcp-mysql-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  