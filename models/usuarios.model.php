<?php
    include "conexion.model.php";
class Usuarios{
    private $conn;
    public $username;
    public $password;

    public function __construct(){
        $this->conn = new Conexion();
    }

    public function Authenticate(){
        $consulta = "select * from usuarios where usuario = '$this->username' and contrasena = '$this->password'";
        return $this->conn->consultar($consulta);
    }

}
