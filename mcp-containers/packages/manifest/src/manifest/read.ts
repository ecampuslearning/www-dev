import fs from 'fs-extra';
import path from 'path';
import { rootDir } from '../root';
import { manifestSchema } from '../types/schema';

export let getServerDefinitionDir = (id: string) => {
  let [owner, repo, server] = id.split('/');

  return path.join(rootDir, `catalog/${owner}/${repo}/${server}`);
};

export let readManifest = async (id: string) => {
  let manifestPath = path.join(getServerDefinitionDir(id), 'manifest.json');

  let exists = await fs.pathExists(manifestPath);
  if (!exists) {
    throw new Error(`Manifest not found for ${id}`);
  }

  let data = await fs.readJson(manifestPath);

  let valRes = await manifestSchema.safeParseAsync(data);
  if (!valRes.success) {
    console.error(JSON.stringify(data, null, 2));
    throw new Error(
      `Manifest for ${id} is invalid: ${JSON.stringify(
        valRes.error.flatten().fieldErrors,
        null,
        2
      )}`
    );
  }

  return valRes.data;
};

export let manifestExists = async (id: string) => {
  let manifestPath = path.join(getServerDefinitionDir(id), 'manifest.json');

  return await fs.pathExists(manifestPath);
};
