
const fs = require('node:fs');
const path = require('node:path');
const dir = process.argv[2];
const outDir = process.argv[3];
const files = fs.readdirSync(dir).filter(f => /^classes\d*\.dex$/.test(f));
const found = new Set();
for (const f of files) {
  const buf = fs.readFileSync(path.join(dir, f));
  const s = buf.toString('latin1');
  const re = /[\x20-\x7e]{5,400}/g;
  let m;
  while ((m = re.exec(s)) !== null) { if (m[0].length <= 400) found.add(m[0]); }
}
const all = [...found];
fs.mkdirSync(outDir, { recursive: true });
const urls = [...new Set(all.filter(s => /^https?:\/\//i.test(s) && s.length < 300))];
const hosts = new Set();
for (const u of urls) { try { hosts.add(new URL(u).host); } catch {} }
const apiPaths = [...new Set(all.filter(s => /^\/(api|services|rest|v\d|mobile|app)\//i.test(s) && s.length < 200))].sort();
const secrets = [...new Set(all.filter(s => /(api[_-]?key|secret|token|password|passwd|authorization|bearer|private[_-]?key|client[_-]?secret|access[_-]?key)/i.test(s) && s.length < 200))].sort();
fs.writeFileSync(path.join(outDir, 'dex-strings.txt'), all.join('\n'));
fs.writeFileSync(path.join(outDir, 'urls.txt'), urls.sort().join('\n'));
fs.writeFileSync(path.join(outDir, 'hosts.txt'), [...hosts].sort().join('\n'));
fs.writeFileSync(path.join(outDir, 'api-paths.txt'), apiPaths.join('\n'));
fs.writeFileSync(path.join(outDir, 'secret-like.txt'), secrets.join('\n'));
console.log('TOTAL_STRINGS=' + all.length + ' URLS=' + urls.length + ' HOSTS=' + hosts.size + ' APIPATHS=' + apiPaths.length + ' SECRETLIKE=' + secrets.length);
