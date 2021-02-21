## これは何？
画像の類似度を色をベースに算出するアルゴリズムをnimで組んでみたかったので、  
練習がてら作成してみたもの。

## 使い方
### build
```
$ nimble build
```

### tests
```
$ nimble test
```

### usage
```nim
import /path/to/nim_image_similar

let image1 = getImageHistgram("test_img1.png")
let image2 = getImageHistgram("test_img2.png")

echo calcSimilarity(image1, image1)
```