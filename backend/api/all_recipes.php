<?php 

    include "../config/conn.php";

    $q=mysqli_query($conn,"SELECT * FROM tb_recipe WHERE id_app = 1");
    $result=array();
    while($data=mysqli_fetch_assoc($q)){
        $result[]=$data;
    }
    echo json_encode($result);

?>