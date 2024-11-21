<?php
require_once '../Model/Alumno.php';

if (isset($_GET['id_alumno'])) {
    $id_alumno = intval($_GET['id_alumno']);
    $alumno = Alumno::getById($id_alumno);
    }
require_once '../View/verDatosAlumno.view.php';
?>
