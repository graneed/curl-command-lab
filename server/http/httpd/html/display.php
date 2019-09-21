<?php
echo "[HTTP Method]\n";
echo $_SERVER['REQUEST_METHOD']."\n";
echo "\n";

echo "[HTTP Request Header]\n";
foreach (getallheaders() as $name => $value) {
    echo "$name: $value\n";
}
echo "\n";

echo "[GET Parameter]\n";
foreach ($_GET as $name => $value) {
    echo "$name: $value\n";
}
echo "\n";

echo "[POST Data]\n";
foreach ($_POST as $name => $value) {
    echo "$name: $value\n";
}
echo "\n";
?>
