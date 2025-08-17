
# MCP Salesforce Connector

A containerized version of "MCP Salesforce Connector"

> Repository: [smn2gnt/MCP-Salesforce](https://github.com/smn2gnt/MCP-Salesforce)

## Description

A Model Context Protocol (MCP) server implementation for Salesforce integration, allowing LLMs to interact with Salesforce data through SOQL queries and SOSL searches.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--smn2gnt--mcp-salesforce--mcp-salesforce
```

2. Run the container:

```bash
docker run -i --rm \ 
-e SALESFORCE_USERNAME=salesforce-username -e SALESFORCE_PASSWORD=salesforce-password -e SALESFORCE_SECURITY_TOKEN=salesforce-security-token \
ghcr.io/metorial/mcp-container--smn2gnt--mcp-salesforce--mcp-salesforce  "salesforce"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `SALESFORCE_USERNAME`
- `SALESFORCE_PASSWORD`
- `SALESFORCE_SECURITY_TOKEN`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-salesforce": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--smn2gnt--mcp-salesforce--mcp-salesforce",
        "salesforce"
      ],
      "env": {
        "SALESFORCE_USERNAME": "salesforce-username",
        "SALESFORCE_PASSWORD": "salesforce-password",
        "SALESFORCE_SECURITY_TOKEN": "salesforce-security-token"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/smn2gnt/MCP-Salesforce) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  