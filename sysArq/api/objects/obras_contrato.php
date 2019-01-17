<?php
class obras_contrato{

    // database connection and table name
    private $conn;
    private $table_name = "obras_contrato";

    // object properties

    public $obra;
    public $contrato_lista;
    public function __construct($db){
        $this->conn = $db;
    }

   // create product
function create(){

    $call = "CALL sp_insert_obras_contratos(:obra, :contrato)";

    $stmt = $this->conn->prepare($call);



    // bind values
    $stmt->bindParam(":obra", $this->obra);
    $stmt->bindParam(":contrato", $this->contrato_lista);

    // execute query
    if($stmt->execute()){
        return true;
    }

    return false;

}

// update the product
function update(){


    //update procedure
    $call = 'CALL sp_update_status(:id_contrato, :tipo, :fecha)';

    // prepare query statement
    $stmt = $this->conn->prepare($call);

    // sanitize
    $this->id_contrato=htmlspecialchars(strip_tags($this->id_contrato));
    $this->tipo=htmlspecialchars(strip_tags($this->tipo));
    //$this->fecha=htmlspecialchars(strip_tags($this->tipo));

    // bind new values
    $stmt->bindParam(':id_contrato', $this->id_contrato);
    $stmt->bindParam(':tipo', $this->tipo);
    $stmt->bindParam(':fecha', $this->fecha);

    // execute the query
    if($stmt->execute()){
        return true;
    }else{
        return false;
    }

    return false;
}

function rechazar_contrato(){


    //update procedure
    $call = 'CALL sp_rechazar_contrato(:id_c, :fecha)';

    // prepare query statement
    $stmt = $this->conn->prepare($call);

    // sanitize
    $this->id_contrato=htmlspecialchars(strip_tags($this->id_contrato));

    // bind new values
    $stmt->bindParam(':id_c', $this->id_contrato);
    $stmt->bindParam(':fecha', $this->fecha);

    // execute the query
    if($stmt->execute()){
        return true;
    }else{
        return false;
    }

    return false;
}
// delete the product
function delete(){


    // delete procedure
    $call = 'CALL sp_Delete_Encuesta(:ide)';

    // prepare query
    $stmt = $this->conn->prepare($call);

    // sanitize
    $this->id=htmlspecialchars(strip_tags($this->id));

    // bind id of record to delete
    $stmt->bindParam(':ide', $this->id);

    // execute query
    if($stmt->execute()){
        return true;
    }

    return false;

}

public function read(){

    $query = "CALL sp_select_obras_contratos(:obra)";

    $stmt = $this->conn->prepare( $query );
    $stmt->bindParam(':obra', $this->obra);
    $stmt->execute();
    return $stmt;
}

public function read_historial(){

        $query = "CALL sp_select_historial(:perfil, :usr, :id_usr)";

        $stmt = $this->conn->prepare( $query );
        $stmt->bindParam(':perfil', $this->perfil_user);
        $stmt->bindParam(':usr', $this->User_r);
        $stmt->bindParam(':id_usr', $this->id_user);
        $stmt->execute();
        return $stmt;
    }
}

?>
