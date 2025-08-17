
# ElevenLabs MCP Server

A containerized version of "ElevenLabs MCP Server"

> Repository: [mamertofabian/elevenlabs-mcp-server](https://github.com/mamertofabian/elevenlabs-mcp-server)

## Description

A Model Context Protocol (MCP) server that integrates with ElevenLabs text-to-speech API, featuring both a server component and a sample web-based MCP Client (SvelteKit) for managing voice generation tasks.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--mamertofabian--elevenlabs-mcp-server--elevenlabs-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e ELEVENLABS_API_KEY=elevenlabs-api-key -e ELEVENLABS_VOICE_ID=elevenlabs-voice-id -e ELEVENLABS_MODEL_ID=elevenlabs-model-id -e ELEVENLABS_STABILITY=elevenlabs-stability -e ELEVENLABS_SIMILARITY_BOOST=elevenlabs-similarity-boost -e ELEVENLABS_STYLE=elevenlabs-style -e ELEVENLABS_OUTPUT_DIR=elevenlabs-output-dir \
ghcr.io/metorial/mcp-container--mamertofabian--elevenlabs-mcp-server--elevenlabs-mcp-server  "elevenlabs-mcp-server"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `ELEVENLABS_API_KEY`
- `ELEVENLABS_VOICE_ID`
- `ELEVENLABS_MODEL_ID`
- `ELEVENLABS_STABILITY`
- `ELEVENLABS_SIMILARITY_BOOST`
- `ELEVENLABS_STYLE`
- `ELEVENLABS_OUTPUT_DIR`




## Usage with Claude

```json
{
  "mcpServers": {
    "elevenlabs-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--mamertofabian--elevenlabs-mcp-server--elevenlabs-mcp-server",
        "elevenlabs-mcp-server"
      ],
      "env": {
        "ELEVENLABS_API_KEY": "elevenlabs-api-key",
        "ELEVENLABS_VOICE_ID": "elevenlabs-voice-id",
        "ELEVENLABS_MODEL_ID": "elevenlabs-model-id",
        "ELEVENLABS_STABILITY": "elevenlabs-stability",
        "ELEVENLABS_SIMILARITY_BOOST": "elevenlabs-similarity-boost",
        "ELEVENLABS_STYLE": "elevenlabs-style",
        "ELEVENLABS_OUTPUT_DIR": "elevenlabs-output-dir"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/mamertofabian/elevenlabs-mcp-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  