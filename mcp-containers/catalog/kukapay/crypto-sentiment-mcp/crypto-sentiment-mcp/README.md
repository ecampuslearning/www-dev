
# Crypto Sentiment MCP Server

A containerized version of "Crypto Sentiment MCP Server"

> Repository: [kukapay/crypto-sentiment-mcp](https://github.com/kukapay/crypto-sentiment-mcp)

## Description

An MCP server that delivers cryptocurrency sentiment analysis to AI agents, leveraging Santiment's aggregated social media and news data to track market mood and detect emerging trends.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--kukapay--crypto-sentiment-mcp--crypto-sentiment-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
-e SANTIMENT_API_KEY=santiment-api-key \
ghcr.io/metorial/mcp-container--kukapay--crypto-sentiment-mcp--crypto-sentiment-mcp  "python main.py"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `SANTIMENT_API_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "crypto-sentiment-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--kukapay--crypto-sentiment-mcp--crypto-sentiment-mcp",
        "python main.py"
      ],
      "env": {
        "SANTIMENT_API_KEY": "santiment-api-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/kukapay/crypto-sentiment-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  