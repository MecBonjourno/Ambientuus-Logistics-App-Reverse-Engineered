
import sys
from PIL import Image, ImageChops
a = Image.open(sys.argv[1]).convert('RGB')
b = Image.open(sys.argv[2]).convert('RGB')
print('sizes', a.size, b.size)
box = (0, 120, a.size[0], a.size[1])
a2, b2 = a.crop(box), b.crop(box)
diff = ImageChops.difference(a2, b2)
bbox = diff.getbbox()
hist = diff.convert('L').histogram()
total = sum(hist); nonzero = total - hist[0]
print('differing pixels (below status bar):', nonzero, 'of', total, '=', round(100*nonzero/total, 4), '%')
print('diff bbox:', bbox)
