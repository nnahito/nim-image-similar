<?php

$his = makeHistogram('./test.jpg');


function rgb2no($rgb) {
    $r = ($rgb >> 16) &0xFF;
    $g = ($rgb >> 8) & 0xFF;
    $b = $rgb & 0xFF;

    $rn = floor($r / 64);
    $gn = floor($g / 64);
    $bn = floor($b / 64);

    return 16 * $rn + 4 * $gn + $bn;
}


function makeHistogram($path) {
    $im = imagecreatefromjpeg($path);
    $sx = imagesx($im);
    $sy = imagesy($im);

    // ピクセル数を数える
    $his = array_fill(0, 64, 0);
    for ($y = 0; $y < $sy; $y++) {
        for ($x = 0; $x < $sx; $x++) {
            $rgb = imagecolorat($im, $x, $y);
            var_dump($rgb);
            $no = rgb2no($rgb);
            $his[$no] += 1;
        }
    }

    var_dump($his);

    // 8bitに正規化
    $pixels = $sx * $sy;
    for ($i = 0; $i < 64; $i++) {
        $his[$i] = floor(256 * $his[$i] / $pixels);
    }

    file_put_contents('test-his.csv', implode(',', $his));
    return $his;
}