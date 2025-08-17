import type { ServerManifest } from '@metorial-mcp-containers/manifest';
import fs from 'fs-extra';
import path from 'path';
import { rootDir } from '../../root';
import { stripMarkdown } from './stripMarkdown';

let getServerMarkdown = async (server: ServerManifest) => {
  return `- <img src="https://github.com/${
    server.repo.owner
  }.png?size=120" width="12px" height="12px" /> **[${await stripMarkdown(
    server.title,
    'no-formatting'
  )}](catalog/${server.fullId}/README.md)** - ${await stripMarkdown(
    server.description ?? '',
    'simple-formatting'
  )}`;
};

export let generateRepoReadme = async (servers: ServerManifest[]) => {
  let featured = new Set<string>(
    await fs.readJSON(path.join(rootDir, 'featured.json'), 'utf-8')
  );

  return `
<img src="./assets/repo-header.png" alt="MCP Containers" width="100%" />

<h1 align="center">Metorial MCP Containers</h1>

<p align="center">Containerized versions of hundreds of <a href="https://modelcontextprotocol.io">MCP servers</a> curated by <a href="https://metorial.com">Metorial</a> 📡 🧠</p>

> [!TIP]
> *Hosted MCP Containers:* Skip the local setup and go hosted. [Metorial's](https://metorial.com) serverless MCP enables you to integrate the MCP servers listed in this repo in a single line of code. Built for devs; with logging, monitoring and SDKs included.
> 
> ➡️ **[Get Early Access (with free tier)](https://metorial.com/early-access)**

## Features

- **🚀 Simple Setup** - Just pull the Docker image to use any MCP server
- **🛠️ Always Up-to-Date** - We automatically update the images daily
- **🔒 Secure** - Run MCP servers in isolated containers

## Motivation

While experimenting with Model Context Protocol (MCP) servers, we found that setting them up could be a bit tedious and time-consuming. 
To simplify the process, we created containerized versions of these servers—making it quick, easy, and secure for anyone to get started.

This repository contains the scripts we use to build and manage these containers using [Nixpacks](https://nixpacks.com). 
New images are automatically built whenever changes are made to the corresponding server repositories, 
ensuring that our containers are always up-to-date.

We're committed to supporting as many MCP servers as possible. 
If there's a specific server you'd like to see included, feel free to open an issue or submit a pull request!

## Usage

To use the containers, simply pull the Docker image for the server you want to use. 
We have provided a list of available servers below, along with their respective readme files.

## Featured Servers

${(
  await Promise.all(
    servers.filter(s => featured.has(s.fullId)).map(async server => getServerMarkdown(server))
  )
).join('\n')}

## Available Servers

${(await Promise.all(servers.map(async server => getServerMarkdown(server)))).join('\n')}

# License

The code of this project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details. 
The source code of the containers is licensed under the respective licenses of the projects. 
See the linked project repositories for more information.

## Contributing

Contributions are welcome! If you want to contribute a containerized MCP server, please use the [Contributing Guide](CONTRIBUTING.md) to get started.
If you have any questions or suggestions, feel free to open an issue or a pull request.

<div align="center">
  <sub>Built with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  `;
};
