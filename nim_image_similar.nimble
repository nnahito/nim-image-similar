# Package

version       = "0.1.0"
author        = "nnahito"
description   = "Computes image similarity with color histogram"
license       = "MIT"
srcDir        = "src"
bin           = @["nim_image_similar"]
binDir        = "bin"
installExt    = @["nim"]


# Dependencies

requires "nim >= 1.2.6"
requires "stb_image"