
# tfmcp: Terraform Model Context Protocol Tool

A containerized version of "tfmcp: Terraform Model Context Protocol Tool"

> Repository: [nwiizo/tfmcp](https://github.com/nwiizo/tfmcp)

## Description

🌍 Terraform Model Context Protocol (MCP) Tool - An experimental CLI tool that enables AI assistants to manage and operate Terraform environments.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--nwiizo--tfmcp--tfmcp
```

2. Run the container:

```bash
docker run -i --rm \ 
-e TERRAFORM_DIR=terraform-dir -e TFMCP_LOG_LEVEL=tfmcp-log-level -e TFMCP_DEMO_MODE=tfmcp-demo-mode \
ghcr.io/metorial/mcp-container--nwiizo--tfmcp--tfmcp  "./bin/tfmcp --dir terraform-dir --path path"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:


#### Arguments

- `--dir`
- `--path`



#### Environment Variables

- `TERRAFORM_DIR`
- `TFMCP_LOG_LEVEL`
- `TFMCP_DEMO_MODE`




## Usage with Claude

```json
{
  "mcpServers": {
    "tfmcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--nwiizo--tfmcp--tfmcp",
        "./bin/tfmcp --dir terraform-dir --path path"
      ],
      "env": {
        "TERRAFORM_DIR": "terraform-dir",
        "TFMCP_LOG_LEVEL": "tfmcp-log-level",
        "TFMCP_DEMO_MODE": "tfmcp-demo-mode"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/nwiizo/tfmcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  