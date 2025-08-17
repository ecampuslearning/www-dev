import { cleanup } from '@metorial-mcp-containers/cleanup';
import { initializeCli } from './cli';

await initializeCli();

await cleanup();
