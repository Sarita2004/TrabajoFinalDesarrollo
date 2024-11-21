<?php
require_once __DIR__ . '/../Model/Alumno.php';

    $id_alumno = $_GET['id_alumno'];
    $alumno = Alumno::getById($id_alumno); 

    if ($alumno) {
        $alumno->delete(); 
        header('Location: indexAlumno.php'); 
        exit();
    }