<?php
require_once ("../config/config.php");
?>


<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<?= BASE_URL?>/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <title>Estudiantes</title>
</head>
<body>
   <header>
   <nav class="navbar navbar-expand-lg navbar-dark bg-success">
  <div class="container-fluid">
    <a class="navbar-brand" href="<?= BASE_URL?>">Sistema de Merienda Escolar</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="<?= BASE_URL?>">docentes</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Tutores</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Estudiantes
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#"> var Estudiantes</a></li>
            <li><a class="dropdown-item" href="#">Registrar Estudiantes</a></li>
            </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled" aria-disabled="true">Productos</a>
        </li>
        </ul>
      <form  id= "frmSearch" class="d-flex">
        <input class="form-control me-2" type="search" id= "txtBuscar" name ="txtBuscar" placeholder="Buscar">
        <button class="btn btn-outline-success" type="submit"></button>
      </form>
    </div>
  </div>
</nav>
   </header>