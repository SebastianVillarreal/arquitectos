<?php
class generador{

    // database connection and table name
    private $conn;
    private $table_name = "generador_contrato";

    // object properties
    public $id_contrato;
    public $id_renglon;
    public $id_area;
    public $largo;
    public $ancho;
    public $total;
    public $usuario;
    public $id_concepto;
    public $id;

    public function __construct($db){
        $this->conn = $db;
    }

   // create product
function create(){

    // Procedure Insert Pregunta
    $call = "CALL sp_insert_generador(:id_contrato, :id_renglon, :id_area, :largo, :ancho, :total, :usuario)";
    //$call = 'CALL sp_Alta_Encuesta(:nombre,:estatus,:fechalimite,:idarea,:idusuario)';

    $stmt = $this->conn->prepare($call);

    // sanitize
    $this->id_contrato=htmlspecialchars(strip_tags($this->id_contrato));
    $this->id_renglon=htmlspecialchars(strip_tags($this->id_renglon));
    $this->id_area=htmlspecialchars(strip_tags($this->id_area));
    $this->largo=htmlspecialchars(strip_tags($this->largo));
    $this->ancho=htmlspecialchars(strip_tags($this->ancho));
    $this->total=htmlspecialchars(strip_tags($this->total));
    $this->usuario=htmlspecialchars(strip_tags($this->usuario));
    $this->descripcion=htmlspecialchars(strip_tags($this->descripcion));


    // bind values
    $stmt->bindParam(":id_contrato", $this->id_contrato);
    $stmt->bindParam(":id_renglon", $this->id_renglon);
    $stmt->bindParam(":id_area", $this->id_area);
    $stmt->bindParam(":largo", $this->largo);
    $stmt->bindParam(":ancho", $this->ancho);
    $stmt->bindParam(":total", $this->total);
    $stmt->bindParam(":usuario", $this->usuario);

    // execute query
    if($stmt->execute()){
        return true;
    }

    return false;

}

//validar cantidad
function validar_cantidad(){
    $call = "CALL sp_validar_cantidad_generador(:id_renglon, :total, :id_contrato, :id_area, :largo, :ancho, :usuario)";
    $stmt = $this->conn->prepare($call);
    $stmt->bindParam(':id_renglon', $this->id_renglon);
    $stmt->bindParam(':total', $this->total);
    $stmt->bindParam(':id_contrato', $this->id_contrato);
    $stmt->bindParam(':id_area', $this->id_area);
    $stmt->bindParam(':largo', $this->largo);
    $stmt->bindParam(':ancho', $this->ancho);
    $stmt->bindParam(':usuario', $this->usuario);
    $stmt->execute();
    return $stmt;
}

// update the product
function update(){


    //update procedure
    $call = "CALL sp_update_generador(".$this->id.",". $this->largo.",".$this->ancho.",".$this->id_renglon.")";

    // prepare query statement
    $stmt = $this->conn->prepare($call);
    //$this->fecha=htmlspecialchars(strip_tags($this->tipo));

    // bind new values
    $stmt->bindParam(':id_generador', $this->id);
    $stmt->bindParam(':nuevo_largo', $this->largo);
    $stmt->bindParam(':nuevo_ancho', $this->ancho);
    $stmt->bindParam(':id_renglon', $this->id_renglon);
    

    // execute the query
    if($stmt->execute()){
        //return $this->id;
        return $stmt;
        //return "1";
    }else{
        //return "0";
    }

    //return false;
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
function read(){
    $call = "CALL sp_select_generador(:id_renglon)";
    $stmt = $this->conn->prepare( $call );
    $stmt->bindParam(':id_renglon', $this->id_renglon);
    $stmt->execute();
    return $stmt;
}

public function read_one(){

    $query = "SELECT concepto FROM detalle_contratos WHERE id =".$this->id_renglon;

    $stmt = $this->conn->prepare( $query );
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
