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

    $query = "CALL sp_select_contratistas(:contratista)";

    $stmt = $this->conn->prepare( $query );
    $stmt->bindParam(':contratista', $this->contratista);
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
    $query = "CALL sp_insert_asistencias(:obra, :contratista, :asiste)";
    $stmt = $this->conn->prepare($query);
    $stmt->bindParam(':obra', $this->obra);
    $stmt->bindParam(':contratista', $this->contratista);
    $stmt->bindParam(':asiste', $this->asiste);
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



}

?>
