
# Weather MCP Tool

A containerized version of "Weather MCP Tool"

> Repository: [SaintDoresh/Weather-MCP-ClaudeDesktop](https://github.com/SaintDoresh/Weather-MCP-ClaudeDesktop)

## Description

An MCP (Model Context Protocol) tool that provides real-time weather data, forecasts, and historical weather information using the OpenWeatherMap API, specifically designed for Claude Desktop.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--saintdoresh--weather-mcp-claudedesktop--weather-mcp-claude-desktop
```

2. Run the container:

```bash
docker run -i --rm \ 
-e OPENWEATHER_API_KEY=openweather-api-key \
ghcr.io/metorial/mcp-container--saintdoresh--weather-mcp-claudedesktop--weather-mcp-claude-desktop  "python main.py"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `OPENWEATHER_API_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "weather-mcp-claude-desktop": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--saintdoresh--weather-mcp-claudedesktop--weather-mcp-claude-desktop",
        "python main.py"
      ],
      "env": {
        "OPENWEATHER_API_KEY": "openweather-api-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/SaintDoresh/Weather-MCP-ClaudeDesktop) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  