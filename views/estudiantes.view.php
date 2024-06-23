<?php
include "../assets/header.php";
include "../assets/menu.php";
include "../assets/zona_priv.php";
?>
<main class="container">
        <h1 class="text-center">Lista de Estudiantes</h1>
        <a href="registrar_estud.php" class="btn btn-success mb-3"><i class="fa-solid fa-user-plus"></i> Registrar Estudiante</a>
        <table id="tblEstudiantes" class="table table-striped">
  <thead>
    <tr>
      <th scope="col">N°</th>
      <th scope="col">Primer Nombre</th>
      <th scope="col">Segundo Nombre</th>
      <th scope="col">Primer Apellido</th>
      <th scope="col">Segundo Apellido</th>
      <th scope="col">Género</th>
      <th scope="col">Fecha de Nacimiento</th>
      <th scope="col">Opciones</th>
    </tr>
  </thead>
  <tbody id ="tblBodyEstudiante">
  
  </tbody>
</table>
    </main>
    
</body>
</html>
<?php include "../assets/footer.php"; ?>
<script src="../js/functions-estudiante.js"></script>
