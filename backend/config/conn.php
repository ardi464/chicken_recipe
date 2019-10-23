<?php

  $servername = "localhost";
  $username = "root";
  $password = "";
  $dbname = "db_recipe";

  //koneksi
  $conn = mysqli_connect($servername, $username, $password, $dbname);
  //cek koneksi
  if (!$conn) {
    die("Connection Failed" . mysqli_connect_error());
  }

?>