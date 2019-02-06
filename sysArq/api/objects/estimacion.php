<?php
class estimacion{

    // database connection and table name
    private $conn;
    private $table_name = "estimaciones";

    // object properties
    public $id_contrato;
    public $id;
    public $cantidad;
    public $id_renglon;

    public function __construct($db){
        $this->conn = $db;
    }

   // create product
function create(){

    // Procedure Insert Pregunta
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


    //update procedure
    $call = 'CALL sp_update_cantidad_estimacion(:id_renglon, :quantity, :id_estimacion)';

    // prepare query statement
    $stmt = $this->conn->prepare($call);

    // bind new values
    $stmt->bindParam(':id_renglon', $this->id_renglon);
    $stmt->bindParam(':quantity', $this->cantidad);
    $stmt->bindParam(':id_estimacion', $this->id);

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

// used when filling up the update product form
function readOne(){

    // query to read single record
    $query = "SELECT
                    contratos.id,
                    contratos.nombre,
                    contratos.contratista,
                    usuarios.nombre_usuario,
                    contratos.descripcion,
                    contratos.`status`,
                    contratos.tipo_contrato,
                    contratos.monto_anticipo,
                    contratos.monto_fondo_garantia,
                    contratos.monto_iva,
                    contratos.total_a,
                    contratos.total_b,
                    contratos.total_c,
                    contratos.total_c,
                    contratos.total_d,
                    contratos.total_e,
                    contratos.monto_pendiente,
                    contratos.total_contrato,
                    contratos.total_contrato_impuestos,
                    proyectos.nombre,
                    (
                    SELECT
                        CONCAT( nombre, ' ', ap_paterno, ' ', ap_materno )
                    FROM
                        personas
                        INNER JOIN usuarios ON usuarios.id_persona = personas.id
                    WHERE
                        usuarios.id = contratos.residente
                    ),
                    CONCAT( contratistas.nombre, ' ', contratistas.ap_paterno, ' ', contratistas.ap_materno ),
                    contratos.fecha
                FROM
                    contratos
                    INNER JOIN proyectos ON proyectos.id = contratos.nombre
                    INNER JOIN usuarios ON usuarios.id = contratos.residente
                    INNER JOIN contratistas ON contratistas.id = contratos.contratista
                WHERE
                    contratos.id = '".$this->id_contrato."'";

    // prepare query statement
    $stmt = $this->conn->prepare( $query );

    // bind id of product to be updated
    $stmt->bindParam(1, $this->id_contrato);

    // execute query
    $stmt->execute();

    // get retrieved row
    return $stmt;
}

public function read_detalle_estimacion(){

    $query = "CALL sp_select_detalle_estimacion(:id_estimacion)";

    $stmt = $this->conn->prepare( $query );
    $stmt->bindParam(':id_estimacion', $this->id);
    $stmt->execute();
    return $stmt;
}


public function read(){

    $query = "CALL sp_select_estimaciones(:id_contrato)";

    $stmt = $this->conn->prepare( $query );
    $stmt->bindParam(':id_contrato', $this->id_contrato);
    $stmt->execute();
    return $stmt;
}

public function read_siguientes(){
    $query = "CALL sp_select_contratos_sig(:obra, :id_usr)";
    $stmt = $this->conn->prepare( $query );
    $stmt->bindParam(':obra', $this->id_proyecto);
    $stmt->bindParam(':id_usr', $this->id_user);
    $stmt->execute();
    return $stmt;
}

public function read_desarrollo(){

    $query = "CALL sp_select_contratos_desarrollo(:perfil, :usr, :id_usr)";

    $stmt = $this->conn->prepare( $query );
    $stmt->bindParam(':perfil', $this->perfil_user);
    $stmt->bindParam(':usr', $this->User_r);
    $stmt->bindParam(':id_usr', $this->id_user);
    $stmt->execute();
    return $stmt;
}

public function read_agrupado(){

    $query = "CALL sp_select_contratos_agrupado(:perfil, :usr, :id_usr)";

    $stmt = $this->conn->prepare( $query );
    $stmt->bindParam(':perfil', $this->perfil_user);
    $stmt->bindParam(':usr', $this->User_r);
    $stmt->bindParam(':id_usr', $this->id_user);
    $stmt->execute();
    return $stmt;
}

public function count_pend(){

    $query = "CALL sp_count_pend(:id_usr, :perfil)";

    $stmt = $this->conn->prepare( $query );
    $stmt->bindParam(':perfil', $this->perfil_user);
    $stmt->bindParam(':id_usr', $this->id_user);
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

public function read_historial_filtro(){

    $query = "CALL sp_select_historial_filtro(:perfil, :usr, :id_usr, :proyecto)";

    $stmt = $this->conn->prepare( $query );
    $stmt->bindParam(':perfil', $this->perfil_user);
    $stmt->bindParam(':usr', $this->User_r);
    $stmt->bindParam(':id_usr', $this->id_user);
    $stmt->bindParam(':proyecto', $this->id_proyecto);
    $stmt->execute();
    return $stmt;
}

public function read_autorizados(){

    $query = "CALL sp_filtros_sp(:t_sp,:perfil, :usr, :id_usr)";

    $stmt = $this->conn->prepare( $query );
    $stmt->bindParam(':perfil', $this->perfil_user);
    $stmt->bindParam(':usr', $this->User_r);
    $stmt->bindParam(':id_usr', $this->id_user);
    $stmt->bindParam(':t_sp', $this->tipo_sp);
    $stmt->execute();
    return $stmt;
}

public function read_autorizados_filtro(){

    $query = "CALL sp_select_autorizados_filtro(:perfil, :usr, :id_usr, :obra)";

    $stmt = $this->conn->prepare( $query );
    $stmt->bindParam(':perfil', $this->perfil_user);
    $stmt->bindParam(':usr', $this->User_r);
    $stmt->bindParam(':id_usr', $this->id_user);
    $stmt->bindParam(':obra', $this->id_proyecto);
    $stmt->execute();
    return $stmt;
}

public function add_concepts(){
    $call = "CALL sp_add_concepts(:id_c)";
    $stmt = $this->conn->prepare($call);
    $stmt ->bindParam(':id_c', $this->id_contrato);
    
    if ($stmt->execute()) {
        return true;
    }else{
        return false;
    }
}



}

?>
