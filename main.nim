import histgram

# 画像を読み込む
let imageData = loadImage("test.jpg")

# ヒストグラムの作成
let hist = createHistgram(imageData.data, imageData.width, imageData.height)


