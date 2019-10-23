<?php 

    include "../config/conn.php";

    $id = $_GET['id'];

    $q=mysqli_query($conn,"SELECT * FROM tb_steps WHERE id_recipe = '$id'");
    $result=array();
    while($data=mysqli_fetch_assoc($q)){
        $result[]=$data;
    }
    echo json_encode($result);
