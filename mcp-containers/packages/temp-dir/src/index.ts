import { registerCleanup } from '@metorial-mcp-containers/cleanup';
import { generateId } from '@metorial-mcp-containers/id';
import fs from 'fs-extra';
import os from 'os';
import path from 'path';

let PREFIX = 'metorial';

export let getTempDir = async (prefix = 'midx') => {
  let tempDir = path.join(os.tmpdir(), PREFIX, generateId(prefix));
  await fs.ensureDir(tempDir);

  registerCleanup(() => fs.remove(tempDir));

  return tempDir;
};
