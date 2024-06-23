<?php
require "../assets/header.php";
require "../assets/menu.php";
include "../assets/zona_priv.php";
?>
   <main class="container">
    <h1 class="text-center">Editar Estudiantes</h1>
    <a href="<?= BASE_URL ?>/views/indexs.php">Lista Estudiante</a>
    <br>
    <br>
    <form id="frmRestro">
  <div class="mb-3">
    <label for="txtNombre" class="form-label">Primer Nombre</label>
    <input type="text" class="form-control" id="txtNombre" name ="txtNombre" placeholder="Nombres" require>
  </div>
  <div class="mb-3">
    <label for="txtNombre1" class="form-label">Segundo Nombre</label>
    <input type="text" class="form-control" id="txtNombre1" name ="txtNombre1" placeholder="Nombres1" >
  </div>
  <div class="mb-3">
    <label for="txtApellido" class="form-label">Primer Apellido</label>
    <input type="text" class="form-control" id="txtApellido" name ="txtApellido" placeholder="Apellidos" require>
  </div>
  <div class="mb-3">
    <label for="txtApellido1" class="form-label">Segundo Apellido</label>
    <input type="text" class="form-control" id="txtApellido1" name ="txtApellido1" placeholder="Apellidos1" >
  </div>
 
  <div class="mb-3">
    <label for="txtGenero" class="form-label">Genero</label>
    <input type="text" class="form-control" id="txtGenero" name ="txtGenero" placeholder="Genero" >
  </div>
  <div class="mb-3">
    <label for="txtfechaNacimiento" class="form-label">Fecha de Nacimiento</label>
    <input type="date" class="form-control" id="txtfechaNacimiento" name ="txtfechaNacimiento" placeholder="Fecha de Nacimiento" >
  </div>
  
  <button type="submit" class="btn btn-info"><i class="fa-solid fa-file-pen"></i>Actualizar</button>
</form>
   </main>

   <?php

?>
<script src="../js/functions-estudiante.js"></script>