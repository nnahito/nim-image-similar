# This is just an example to get you started. You may wish to put all of your
# tests into a single file, or separate them into multiple `test1`, `test2`
# etc. files (better names are recommended, just make sure the name starts with
# the letter 't').
#
# To run these tests, simply execute `nimble test`.

import unittest
import os
import nim_image_similar

test "test similarity1":
  let image1 = getImageHistgram(getCurrentDir() / "tests" / "test_img1.png")

  check calcSimilarity(image1, image1) == 254


test "test similarity2":
  let image1 = getImageHistgram(getCurrentDir() / "tests" / "test_img1.png")
  let image2 = getImageHistgram(getCurrentDir() / "tests" / "test_img2.png")

  check calcSimilarity(image1, image2) == 252


test "test similarity3":
  let image1 = getImageHistgram(getCurrentDir() / "tests" / "test_img1.png")
  let image3 = getImageHistgram(getCurrentDir() / "tests" / "test_img3.png")
  
  check calcSimilarity(image1, image3) == 253


test "test similarity4":
  let image2 = getImageHistgram(getCurrentDir() / "tests" / "test_img2.png")
  let image3 = getImageHistgram(getCurrentDir() / "tests" / "test_img3.png")
  
  check calcSimilarity(image2, image3) == 252