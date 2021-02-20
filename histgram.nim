#
# 【参考】
# https://stackoverflow.com/questions/62694747/create-a-colour-histogram-from-an-image-file
#

import tables
import math
import algorithm
import stb_image/read as stbi
import stb_image/write as stbiw

type ImageData = ref object
    width*: int
    height*: int
    data*: seq[byte]

proc loadImage*(path: string): ImageData = 
    # 画像サイズなどの情報が入る
    var w, h , c: int

    # 画像の読み込み
    let data = stbi.load(path, w, h, c, stbi.Default)

    # 構造体に追加し、返す
    result = new ImageData
    result.width = w
    result.height = h
    result.data = data

proc rgb2no*(r: uint8, g: uint8, b: uint8): int =
    #RGBをもとに64色のどこに位置するか調べる
    let rn = floor(int(r) / 64)
    let gn = floor(int(g) / 64)
    let bn = floor(int(b) / 64)

    return int(16.0 * rn + 4.0 * gn + bn)


proc createHistgram*(imageData: seq[uint8], imageWIdth: int, imageHeight: int): OrderedTable[int, int] =
    # 各色のピクセル数を数える
    var his = initOrderedTable[int, int]()
    for i in countUp(0, imageData.len - 3, step = stbi.RGB):
        let r = imageData[i + 0]
        let g = imageData[i + 1]
        let b = imageData[i + 2]

        let ret = rgb2no(r, g, b)
        if his.hasKey(ret):
            his[ret] = his[ret] + 1
        else:
            his[ret] = 1

    # 8bitに正規化
    let pixels = imageWIdth * imageHeight
    for i in 0..63:
        if his.hasKey(i):
            his[i] = int(floor(256 * his[i] / pixels))
        else:
            his[i] = 0

    # キー順にソートをかける
    his.sort(system.cmp)

    echo his

    return his


proc calcSimilarityScore*(histgram1: OrderedTable[int, int], histgram2: OrderedTable[int, int]): int =
    for i in 0..63:
        result = result + min(histgram1[i], histgram2[i])

