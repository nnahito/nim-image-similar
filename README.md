## これは何？
画像の類似度を色をベースに算出するアルゴリズムをnimで組んでみたかったので、  
練習がてら作成してみたもの。

## 準備
1. 画像を用意します
2. main.nimの4行目の以下の部分を、用意した画像のパスに変更します。
    ```nim
    let imageData = loadImage("test.jpg")
    ```
3. `nim c -r main.nim` で、ヒストグラムが計算されます
4. 計算されたヒストグラムのテーブルを`calcSimilarityScore`関数に食わせると、スコアが出ます。
    スコアは数値が大きいほど、類似度が高くなります。