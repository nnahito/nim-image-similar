import nim_image_similar/logics
import tables

proc getImageHistgram*(imagePath: string): OrderedTable[int, int] =
  let imageData = loadImage(imagePath);
  return createHistgram(imageData.data, imageData.width, imageData.height)

proc calcSimilarity*(histgram1: OrderedTable[int, int], histgram2: OrderedTable[int, int]): int =
  return calcSimilarityScore(histgram1, histgram2)