<?php
if (!isset($_COOKIE['alphabet'])) {
    setcookie("alphabet", "abcde");
}

if (!isset($_COOKIE['hiragana'])) {
    setcookie("hiragana", "あいうえお", time()+3600);
}
echo "alphabet:" . $_COOKIE["alphabet"] . "\n";
echo "hiragana:" . $_COOKIE["hiragana"] . "\n";
?>
