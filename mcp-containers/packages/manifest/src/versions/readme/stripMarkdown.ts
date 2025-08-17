import { remark } from 'remark';
import strip from 'strip-markdown';

export let stripMarkdown = async (
  text: string,
  mode: 'no-formatting' | 'simple-formatting' = 'no-formatting'
) => {
  let file = await remark()
    .use(strip, { keep: mode == 'no-formatting' ? [] : ['link', 'strong', 'emphasis'] })
    .process(text);

  return String(file);
};
