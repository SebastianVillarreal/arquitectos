<?php
class rayas{

    // database connection and table name
    private $conn;
    private $table_name = "estimaciones";

    // object properties
    public $obra;
    public $contratista;
    public $asiste;
    public $fecha_i;
    public $fecha_fin;
    public $id_asistencia;

    public function __construct($db){
        $this->conn = $db;
    }

   // create product
function create(){

    // Procedure Insert estimacion
    $id_c = $this->id_contrato;
    $call = "CALL sp_insert_estimaciones(".$id_c.")";

    $stmt = $this->conn->prepare($call);


    // bind values
    $stmt->bindParam(":id_contrato", $this->id_contrato);

    // execute query
    if($stmt->execute()){

        return $stmt;
    }

    return false;

}

// update the product
function update(){

    $id_renglon = $this->id_renglon;
    $id = $this->id;
    $cantidad = $this->cantidad;
    //update procedure
    $call = 'CALL sp_update_cantidad_estimacion('.$id_renglon.', '.$cantidad.', '.$id.')';

    // prepare query statement
    $stmt = $this->conn->prepare($call);

    // bind new values
    $stmt->execute();
    return $stmt;
}

public function read_contratistas(){

    $query = "CALL sp_select_contratistas(:contratista, :fecha_c)";

    $stmt = $this->conn->prepare( $query );
    $stmt->bindParam(':contratista', $this->contratista);
    $stmt->bindParam(':fecha_c', $this->fecha_i);
    $stmt->execute();
    return $stmt;
}

public function read_one(){
    $query = "CALL sp_select_datos_estimacion(:estimacion)";
    $stmt = $this->conn->prepare($query);
    $stmt->bindParam(':estimacion', $this->id);
    $stmt->execute();
    return $stmt;
}

public function insertar_asistencia()
{
    $query = "CALL sp_insert_asistencias(:obra, :contratista, :asiste, :fecha_c)";
    $stmt = $this->conn->prepare($query);
    $stmt->bindParam(':obra', $this->obra);
    $stmt->bindParam(':contratista', $this->contratista);
    $stmt->bindParam(':asiste', $this->asiste);
    $stmt->bindParam(':fecha_c', $this->fecha_i);
    if ($stmt->execute()) {
        return true;
    }else{
        return false;
    }
}

public function capturar_asistencia()
{
    $call = "CALL sp_captura_asistencia(:obra, :contratista, :asiste, :fecha_c)";
    $stmt = $this->conn->prepare($call);

    $stmt->bindParam(':obra', $this->obra);
    $stmt->bindParam(':contratista', $this->contratista);
    $stmt->bindParam(':asiste', $this->asiste);
    $stmt->bindParam(':fecha_c', $this->fecha_i);
    //print_r($stmt);
    if ($stmt->execute()) {
        return true;
    }else{
        return false;
    }

}

public function seleccionar_rayas()
{
    $query = "CALL sp_select_rayas_admin(:obra, :fecha_i, :fecha_fin)";
    $stmt = $this->conn->prepare($query);
    $stmt->bindParam(':obra', $this->obra);
    $stmt->bindParam(':fecha_i', $this->fecha_i);
    $stmt->bindParam(':fecha_fin', $this->fecha_fin);
    $stmt->execute();
    return $stmt;
}

public function seleccionar_anticipos(){
    $query = "CALL sp_select_anticipos_pagados(:obra, :fecha_i, :fecha_fin)";
    $stmt = $this->conn->prepare($query);
    $stmt->bindParam(':obra', $this->obra);
    $stmt->bindParam(':fecha_i', $this->fecha_i);
    $stmt->bindParam(':fecha_fin', $this->fecha_fin);
    $stmt->execute();
    return $stmt;
}

public function datos_reportes()
{
    $query = "CALL sp_reporte_asistencia(:contratista, :obra, :fecha_i, :fecha_f)";
    $stmt = $this->conn->prepare($query);
    $stmt->bindParam(':contratista', $this->contratista);
    $stmt->bindParam(':obra', $this->obra);
    $stmt->bindParam(':fecha_i', $this->fecha_i);
    $stmt->bindParam(':fecha_f', $this->fecha_fin);
    $stmt->execute();
    return $stmt;
}

public function read_asistencia()
{
    $fecha = $this->fecha_i;
    $id_contratista = $this->contratista;
    $query = "SELECT
                a_c.id,
                CONCAT( e_c.nombre, ' ', IFNULL ( e_c.ap_paterno, '' ), ' ', IFNULL( e_c.ap_materno, '' ) ),
                a_c.asistencia,
                a_c.id_obra,
                p.nombre
            FROM
                asistencias_contratistas a_c
                INNER JOIN empleados_contratistas e_c ON e_c.id = a_c.id_usuario 
                INNER JOIN puestos p ON p.id = e_c.puesto
            WHERE
                fecha = '$fecha'
                AND e_c.id_contratista = '$id_contratista'";
                //print_r($query);
    $stmt = $this->conn->prepare($query);
    $stmt->execute();
    return $stmt;

}

public function update_asistencia()
{
    $call = "CALL sp_update_asistencia(:id_a, :obra, :asis)";
    $stmt = $this->conn->prepare($call);
    $stmt->bindParam(':id_a', $this->id_asistencia);
    $stmt->bindParam(':obra', $this->obra);
    $stmt->bindParam(':asis', $this->asiste);
    if ($stmt->execute()) {
        return true;
    }else{
        return false;
    }
}

}

?>
