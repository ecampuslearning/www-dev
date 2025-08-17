import { z } from 'zod';

export let manifestSchema = z.object({
  id: z.string(),
  fullId: z.string(),
  repo: z.object({
    provider: z.string(),
    owner: z.string(),
    repo: z.string(),
    branch: z.string(),
    url: z.string()
  }),
  config: z.object({
    argumentsTemplate: z.string().optional().nullable(),
    configValues: z.array(
      z.object({
        title: z.string(),
        description: z.string().optional().nullable(),
        default: z.string().optional().nullable(),
        required: z.boolean(),

        fields: z.array(
          z.object({
            type: z.enum(['environment', 'cli', 'file']),
            key: z.string()
          })
        )
      })
    )
  }),
  subdirectory: z.string(),
  title: z.string(),
  description: z.string().optional().nullable(),
  build: z
    .object({
      startCommand: z.string().optional().nullable(),
      buildCommand: z.string().optional().nullable(),
      installCommand: z.string().optional().nullable(),

      nodeVersion: z.string().optional().nullable(),
      pythonVersion: z.string().optional().nullable(),

      buildDir: z.string().optional().nullable(),

      nixPackages: z.array(z.string()).optional().nullable(),
      aptPackages: z.array(z.string()).optional().nullable(),

      platforms: z
        .array(z.union([z.literal('linux/arm64'), z.literal('linux/amd64')]))
        .optional()
        .nullable()
    })
    .optional()
    .nullable()
});

export type ServerManifest = z.infer<typeof manifestSchema>;
