
# Shopify MCP Server

A containerized version of "Shopify MCP Server"

> Repository: [GeLi2001/shopify-mcp](https://github.com/GeLi2001/shopify-mcp)

## Description

MCP Server for Shopify API, enabling interaction with store data through GraphQL API. This server provides tools for managing products, customers, orders, and more.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--geli2001--shopify-mcp--shopify-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--geli2001--shopify-mcp--shopify-mcp  "npm run start --accessToken access-token --domain domain"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:


#### Arguments

- `--accessToken`
- `--domain`






## Usage with Claude

```json
{
  "mcpServers": {
    "shopify-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--geli2001--shopify-mcp--shopify-mcp",
        "npm run start --accessToken access-token --domain domain"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/GeLi2001/shopify-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  