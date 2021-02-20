#
# https://stackoverflow.com/questions/62694747/create-a-colour-histogram-from-an-image-file
#

import tables
import math
import stb_image/read as stbi
import stb_image/write as stbiw
import colors
import sub

var
  w, h , c: int
  data: seq[uint8]
  cBin: array[256, int] #colour range was 0->255 afaict
data = stbi.load("test3.jpg", w, h, c, stbi.Default)
for d in data:
  cBin[(int)d] = cBin[(int)d] + 1

# 各色のピクセル数を数える
var his = initTable[int, int]()
for i in countUp(0, data.len - 3, step = stbi.RGB):
  let r = data[i + 0]
  let g = data[i + 1]
  let b = data[i + 2]

  let ret = sub.rgb2no(r, g, b)
  if his.hasKey(ret):
    his[ret] = his[ret] + 1
  else:
    his[ret] = 1

echo his

# 8bitに正規化
let pixels = w * h
for i in 0..63:
  if his.hasKey(i):
    his[i] = int(floor(256 * his[i] / pixels))
  else:
    his[i] = 0

echo(his)









# ===================================================================

# 16進数（カラーコード）での色表記
# for i in countUp(0, data.len - 3, step = stbi.RGB):
#   let
#     r = data[i + 0]
#     g = data[i + 1]
#     b = data[i + 2]
#     pixelColor = colors.rgb(r, g, b)
#   echo pixelColor