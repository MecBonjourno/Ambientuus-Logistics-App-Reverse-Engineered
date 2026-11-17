
import struct, sys, os, glob

def read_uleb(data, off):
    result = 0; shift = 0
    while True:
        b = data[off]; off += 1
        result |= (b & 0x7f) << shift
        if not (b & 0x80): break
        shift += 7
    return result, off

def dex_strings(path):
    data = open(path, 'rb').read()
    n = struct.unpack_from('<I', data, 0x38)[0]
    off = struct.unpack_from('<I', data, 0x3C)[0]
    out = set()
    for i in range(n):
        sdo = struct.unpack_from('<I', data, off + 4*i)[0]
        _, p = read_uleb(data, sdo)          # utf16 length
        end = data.index(b'\x00', p)
        raw = data[p:end]
        try: s = raw.decode('utf-8', 'replace')
        except Exception: s = raw.decode('latin1')
        out.add(s)
    return out

def load_dir(d):
    s = set()
    for f in sorted(glob.glob(os.path.join(d, 'classes*.dex'))):
        s |= dex_strings(f)
    return s

a = load_dir(sys.argv[1]); b = load_dir(sys.argv[2])
only_a = a - b; only_b = b - a
print('original unique strings:', len(a))
print('rebuilt  unique strings:', len(b))
print('only in original:', len(only_a), ' only in rebuilt:', len(only_b))
for s in sorted(only_a)[:60]:
    print('  ORIG ONLY:', repr(s[:160]))
for s in sorted(only_b)[:20]:
    print('  REBUILT ONLY:', repr(s[:160]))
