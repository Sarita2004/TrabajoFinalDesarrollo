<?php

require_once 'Conexion.php';
require_once 'Materia.php';

class Alumno extends Conexion
{

    public $id_alumno, $nombre, $apellido, $email, $DNI, $fecha_nacimiento, $telefono, $calle, $nro, $codigo_postal, $estado_civil, $genero;

    public function create()
    {
        $this->conectar();
        $pre = mysqli_prepare($this->con, "INSERT INTO alumnos (nombre, apellido, email, DNI, fecha_nacimiento, telefono, calle, nro, codigo_postal, estado_civil, genero) VALUES (?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
        $pre->bind_param(
            "sssisisiiss",
            $this->nombre,
            $this->apellido,
            $this->email,
            $this->DNI,
            $this->fecha_nacimiento,
            $this->telefono, 
            $this->calle,
            $this->nro,
            $this->codigo_postal,
            $this->estado_civil,
            $this->genero
        );
        $pre->execute();
    }



    public static function all()
    {
        $conexion = new Conexion();
        $conexion->conectar();
        $result = mysqli_prepare($conexion->con, "SELECT * FROM alumnos");
        $result->execute();
        $valoresDb = $result->get_result();
        $alumnos = [];
        while ($alumno = $valoresDb->fetch_object(Alumno::class)) {
            $alumnos[] = $alumno;
        }
        return $alumnos;
    }

    public static function getById($id_alumno)
    {
        $conexion = new Conexion();
        $conexion->conectar();
        $result = mysqli_prepare($conexion->con, "SELECT * FROM alumnos WHERE id_alumno = ?");
        $result->bind_param("i", $id_alumno);
        $result->execute();
        $valorDb = $result->get_result();
        $alumno = $valorDb->fetch_object(Alumno::class);
        return $alumno;
    }



    public function delete()
    {
        $this->conectar();
        $pre = mysqli_prepare($this->con, "DELETE FROM alumnos WHERE id_alumno = ?");
        $pre->bind_param("i", $this->id_alumno);
        $pre->execute();
    }

    public function update()
    {
        $this->conectar();
        $pre = mysqli_prepare($this->con, "UPDATE alumnos SET nombre = ?, apellido = ?, email = ?, DNI = ?, fecha_nacimiento = ?, telefono = ?, calle = ?, nro = ?, codigo_postal = ?, estado_civil = ?, genero = ? WHERE id_alumno = ?");
        $pre->bind_param(
            "sssisisiissi",
            $this->nombre,
            $this->apellido,
            $this->email,
            $this->DNI,
            $this->fecha_nacimiento,
            $this->telefono,
            $this->calle,
            $this->nro,
            $this->codigo_postal,
            $this->estado_civil,
            $this->genero,
            $this->id_alumno
        );
        $pre->execute();
    }

    public function materias()
    {
        $this->conectar();
        $result = mysqli_prepare($this->con, "SELECT * FROM materia INNER JOIN materias_alumnos ON materia.id_materia= materias_alumnos.id_materia WHERE materias_alumnos.id_materia = ?");
        $result->bind_param("i", $this->id_materia);
        $result->execute();
        $valoresDb = $result->get_result(); 
        $materias = [];
        while ($materia = $valoresDb->fetch_object(Materia::class)) { 

            $materias[] = $materia;
        }
        return $materias;
    }



    public function desasignarTodasLasMaterias() 
    {
        $this->conectar();
        $pre = mysqli_prepare($this->con, "DELETE FROM materias_alumnos WHERE id_alumno = ?");
        $pre->bind_param("i", $this->id_alumno);
        $pre->execute();
    }

    public function asignarMateria($id_materia) 
    {
        $this->conectar();
        $pre = mysqli_prepare($this->con, "INSERT INTO materias_alumnos (id_alumno, id_materia) VALUES (?, ?)");
        $pre->bind_param("ii", $this->id_alumno, $id_materia);
        $pre->execute();
    }
}
