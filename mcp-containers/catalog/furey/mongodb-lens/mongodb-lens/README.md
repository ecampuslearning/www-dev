
# MongoDB Lens

A containerized version of "MongoDB Lens"

> Repository: [furey/mongodb-lens](https://github.com/furey/mongodb-lens)

## Description

**MongoDB Lens** is a local Model Context Protocol (MCP) server with full featured access to MongoDB databases using natural language via LLMs to perform queries, run aggregations, optimize performance, and more.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--furey--mongodb-lens--mongodb-lens
```

2. Run the container:

```bash
docker run -i --rm \ 
-e CONFIG_MONGO_URI=mongo-uri -e CONFIG_LOG_LEVEL=log-level -e CONFIG_DEFAULT_DB_NAME=default-db-name \
ghcr.io/metorial/mcp-container--furey--mongodb-lens--mongodb-lens  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `CONFIG_MONGO_URI`
- `CONFIG_LOG_LEVEL`
- `CONFIG_DEFAULT_DB_NAME`




## Usage with Claude

```json
{
  "mcpServers": {
    "mongodb-lens": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--furey--mongodb-lens--mongodb-lens",
        "npm run start"
      ],
      "env": {
        "CONFIG_MONGO_URI": "mongo-uri",
        "CONFIG_LOG_LEVEL": "log-level",
        "CONFIG_DEFAULT_DB_NAME": "default-db-name"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/furey/mongodb-lens) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  