<?php
require_once "../libraries/conexion.php";

class EstudianteModel {
    private $conexion;

    function __construct() {
        $this->conexion = new Conexion();
        $this->conexion = $this->conexion->conect();
    }

    public function getEstudiantes() {
      $arrRegistros = array();
        $rs = $this->conexion->query("CALL select_estudiante()");
      
        while ($obj= $rs->fetch_object())
        {
          array_push($arrRegistros, $obj);
          
        }
        
        return $arrRegistros;
       }
    }

    public function insertEstudiante (string $nombre, string $nombre1, string $apellido, string $apellido1, string $fechanacimiento, string $genero){
        $sql = $mysql->query("CALL insertar_estudiante('{$nombre}','{$nombre1}','{$apellido}','{$apellido1}','{$fechanacimiento}','{$genero}')");
    return $sql;
    }


?>
