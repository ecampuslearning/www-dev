export let normalizeUrl = (url: string) => {
  url = url.trim().replace('.git', '');

  let u = new URL(url);
  u.pathname = u.pathname.split('/').filter(Boolean).join('/');

  u.hash = '';
  u.search = '';

  return u.toString();
};
