<?PHP
header("Content-Type: text/plain");
if ($_SERVER['HTTP_X_FORWARDED_FOR']) {
  echo $_SERVER['HTTP_X_FORWARDED_FOR'] . "\xA";
} else {
  echo $_SERVER['REMOTE_ADDR'] . "\xA";
}
?>
