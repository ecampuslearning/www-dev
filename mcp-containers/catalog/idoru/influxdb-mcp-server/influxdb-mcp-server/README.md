
# InfluxDB MCP Server

A containerized version of "InfluxDB MCP Server"

> Repository: [idoru/influxdb-mcp-server](https://github.com/idoru/influxdb-mcp-server)

## Description

A Model Context Protocol (MCP) server that exposes access to an InfluxDB instance using the InfluxDB OSS API v2. Mostly built with Claude Code.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--idoru--influxdb-mcp-server--influxdb-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e INFLUXDB_TOKEN=influxdb-token -e INFLUXDB_URL=influxdb-url -e INFLUXDB_ORG=influxdb-org \
ghcr.io/metorial/mcp-container--idoru--influxdb-mcp-server--influxdb-mcp-server  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `INFLUXDB_TOKEN`
- `INFLUXDB_URL`
- `INFLUXDB_ORG`




## Usage with Claude

```json
{
  "mcpServers": {
    "influxdb-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--idoru--influxdb-mcp-server--influxdb-mcp-server",
        "npm run start"
      ],
      "env": {
        "INFLUXDB_TOKEN": "influxdb-token",
        "INFLUXDB_URL": "influxdb-url",
        "INFLUXDB_ORG": "influxdb-org"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/idoru/influxdb-mcp-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  