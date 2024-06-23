<?php
    session_start();
    include "../models/usuarios.model.php";
    

    if(isset($_POST['username']) && isset($_POST['password'])){
        $usuario = new Usuarios();
        $usuario->username = $_POST['username'];
        $usuario->password = $_POST['password'];

        if($res = $usuario->Authenticate()){
            if(mysqli_num_rows($res) == 1){
                $_SESSION['usuario'] = mysqli_fetch_assoc($res);
                header("Location: ../views/indexs.php");
            }
            else {
                header("Location: ../login.php");
            }
        }
    }
