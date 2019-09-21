<?php
$hosts = "curl.test";
$dbusername = "flaguser";
$dbpasswd = "";
$dbname = "flagdb";
$dbport = 3306;
$conn = mysqli_connect($hosts,$dbusername,$dbpasswd,$dbname,$dbport);
$result = mysqli_query($conn,"select * from flagtbl;");
var_dump($result->fetch_all());
mysqli_close($conn);
?>
