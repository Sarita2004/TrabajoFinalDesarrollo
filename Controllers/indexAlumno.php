
<?php
require_once __DIR__ . '/../Model/Alumno.php';

$alumnos = Alumno::all();

require_once __DIR__ . '/../View/indexAlumno.view.php';