<?php
require_once "../models/EstudianteModel.php";

$option = $_REQUEST['op'];
$objEstudiante = new EstudianteModel();

if($option == "listregistros"){
   
   $arrResponse = array('status' => false, 'data'=>"");
    $arrEstudiante = $objEstudiante->getEstudiantes();
   

    if(!empty($arrEstudiante)){
        for($i=0; $i < count($arrEstudiante); $i++ ){
            $idEstudiante = $arrEstudiante[$i] ->idEstudiante;
            $option = '<a href="' . BASE_URL . 'views/editar_estud.php?p=' . $idEstudiante . '" class="btn btn-outline-primary btn-sm" title="Editar Registro"><i class="fas fa-user-edit"></i></a>' .
                  '<button class="btn btn-outline-danger btn-sm" title="Eliminar Registro" onclick="fntDelEstudiante(' . $idEstudiante . ')"><i class="fas fa-trash-alt"></i></button>';
        
         $arrEstudiante[$i]->option = $option;
           $arrResponse['status']= true;
          $arrResponse['data']= $arrEstudiante;
         }
            echo json_encode($arrResponse);
       
    die();
    }
    //echo json_encode($arrResponse);
  //  die();

}
if($option == "registro"){
    print_r($_POST);
    echo "Registrar Persona";
}

 if(empty($_POST['txtNombre']) || empty($_POST['txtNombre1']) || empty($_POST['txtApellido']) || empty($_POST['txtApellido1']) || empty($_POST['txtfechaNacimiento']) || empty($_POST['txtGenero']) || empty($_POST['txtfechaNacimiento'])){
   $arrEsponse =array('status'=> false, 'msg' => 'error de datos');

 }else {
  $strNombre = ucwords((trim($_POST['txtNombre'])));
   $strNombre1 = ucwords((trim($_POST['txtNombre1'])));
   $strApellido = ucwords((trim($_POST['txtApellido'])));
   $strApellido1 = ucwords((trim($_POST['txtApellido1'])));
    $strGenero = ucwords((trim($_POST['txtGenero'])));
    $strfechaNacimiento = ucwords((trim($_POST['txtfechaNacimiento'])));

    $arrEstudiante = $objEstudiante->insertEstudiante($strNombre,$strNombre1,$strApellido,$strApellido1,$strGenero, $strfechaNacimiento );
 print_r($arrEstudiante);

}

//die();
//}
if($option == "verregistro"){
    echo "ver un estudiante";
}
if($option == "actualizar"){
    echo "actualizar un estudiante";
}
if($option == "eliminar"){
    echo "eliminar un estudiante";
}

die();


?>