import math

proc rgb2no*(r: uint8, g: uint8, b: uint8): int =
    #RGBをもとに64色のどこに位置するか調べる
    let rn = floor(int((r shr 16) and 0xFF) / 64)
    let gn = floor(int((g shr 8) and 0xFF) / 64)
    let bn = floor(int(b and 0xFF) / 64)

    return int(16.0 * rn + 4.0 * gn + bn)