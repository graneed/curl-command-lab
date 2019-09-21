<?php
/* PUT されたデータは標準入力からやってきます */
$putdata = fopen("php://input", "r");

/* 書き込みモードでファイルをオープンします */
$fp = fopen("./file/myputfile.ext", "w");

/* データを 1 KB 単位で読み込み、
   ファイルに書き込みます */
while ($data = fread($putdata, 1024))
  fwrite($fp, $data);

/* ストリームを閉じます */
fclose($fp);
fclose($putdata);
?>
