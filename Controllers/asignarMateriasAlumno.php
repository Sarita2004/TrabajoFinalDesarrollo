<?php
require_once __DIR__ .'/../Model/Alumno.php';
require_once __DIR__ .'/../Model/Materia.php';

$id_alumno = $_GET['id_alumno']; 
$alumno = Alumno::getById($id_alumno); 
$todasLasMaterias = Materia::all(); 


if (isset($_POST['guardarMaterias'])) {
    $alumno->desasignarTodasLasMaterias(); 

    if (isset($_POST['materias'])) {
        foreach ($_POST['materias'] as $id_materia) {

            $alumno->asignarMateria($id_materia);

        }
    }

    header('Location: indexAlumno.php');// 
    exit;
}

require_once __DIR__ . '/../View/asignarMateriasAlumno.view.php';