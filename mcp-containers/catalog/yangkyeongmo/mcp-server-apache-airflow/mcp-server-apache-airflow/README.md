
# mcp-server-apache-airflow

A containerized version of "mcp-server-apache-airflow"

> Repository: [yangkyeongmo/mcp-server-apache-airflow](https://github.com/yangkyeongmo/mcp-server-apache-airflow)

## Description

A Model Context Protocol (MCP) server implementation for Apache Airflow, enabling seamless integration with MCP clients. This project provides a standardized way to interact with Apache Airflow through the Model Context Protocol.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--yangkyeongmo--mcp-server-apache-airflow--mcp-server-apache-airflow
```

2. Run the container:

```bash
docker run -i --rm \ 
-e AIRFLOW_HOST=airflow-host -e AIRFLOW_USERNAME=airflow-username -e AIRFLOW_PASSWORD=airflow-password \
ghcr.io/metorial/mcp-container--yangkyeongmo--mcp-server-apache-airflow--mcp-server-apache-airflow  "mcp-server-apache-airflow"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `AIRFLOW_HOST`
- `AIRFLOW_USERNAME`
- `AIRFLOW_PASSWORD`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-server-apache-airflow": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--yangkyeongmo--mcp-server-apache-airflow--mcp-server-apache-airflow",
        "mcp-server-apache-airflow"
      ],
      "env": {
        "AIRFLOW_HOST": "airflow-host",
        "AIRFLOW_USERNAME": "airflow-username",
        "AIRFLOW_PASSWORD": "airflow-password"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/yangkyeongmo/mcp-server-apache-airflow) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  