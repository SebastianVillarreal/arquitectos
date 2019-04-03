<?php
class personal{

    // database connection and table name
    private $conn;
    private $table_name = "empleados_contratistas";

    // object properties
    public $id_contratista;
    public $id_empleado;
    public $tipo;
    public $nombre;
    public $ap_paterno;
    public $ap_materno;
    public $salario;
    public $puesto;

    public function __construct($db){
        $this->conn = $db;
    }

   // create product
function create(){

    // Procedure Insert Pregunta
    $call = "CALL sp_insert_empleados(:contratista, :nombre, :ap_paterno, :ap_materno, :sueldo, :puesto)";

    $stmt = $this->conn->prepare($call);

    // sanitize
    // $this->nombre=htmlspecialchars(strip_tags($this->nombre));
    // $this->contratista=htmlspecialchars(strip_tags($this->contratista));
    // $this->fecha=htmlspecialchars(strip_tags($this->fecha));
    // $this->tipo=htmlspecialchars(strip_tags($this->tipo));
    // $this->residente=htmlspecialchars(strip_tags($this->residente));
    // $this->Usuario_m=htmlspecialchars(strip_tags($this->Usuario_m));
    // $this->User_r=htmlspecialchars(strip_tags($this->User_r));
    // $this->descripcion=htmlspecialchars(strip_tags($this->descripcion));
    // $this->tipo_rayas=htmlspecialchars(strip_tags($this->tipo_rayas));
    // $this->folio_erp=htmlspecialchars(strip_tags($this->folio_erp));


    // bind values
    $stmt->bindParam(":contratista", $this->id_contratista);
    $stmt->bindParam(":nombre", $this->nombre);
    $stmt->bindParam(":ap_paterno", $this->ap_paterno);
    $stmt->bindParam(":ap_materno", $this->ap_materno);
    $stmt->bindParam(":sueldo", $this->salario);
    $stmt->bindParam(":puesto", $this->puesto);

    // execute query
    if($stmt->execute()){
        return true;
    }

    else{
        return false;
    }
}

// update the product
function update(){


    //update procedure
    $call = 'CALL sp_activar_desactivar_personal(:id_empleado, :tipo)';

    // prepare query statement
    $stmt = $this->conn->prepare($call);

    // sanitize
    $this->id_contrato=htmlspecialchars(strip_tags($this->id_contrato));
    $this->tipo=htmlspecialchars(strip_tags($this->tipo));

    // bind new values
    $stmt->bindParam(':id_empleado', $this->id_empleado);
    $stmt->bindParam(':tipo', $this->tipo);

    // execute the query
    if($stmt->execute()){
        return true;
    }else{
        return false;
    }

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

    $query = "CALL sp_select_personal()";

    $stmt = $this->conn->prepare( $query );
    // $stmt->bindParam(':perfil', $this->perfil_user);
    // $stmt->bindParam(':usr', $this->User_r);
    // $stmt->bindParam(':id_usr', $this->id_user);
    $stmt->execute();
    return $stmt;
}

public function readOne(){
    $query = "SELECT
                    id,
                    id_contratista,
                    nombre,
                    ap_paterno,
                    ap_materno,
                    sueldo_diario,
                    puesto 
                FROM
                    empleados_contratistas 
                WHERE
                    id =".$this->id_empleado."";
    $stmt = $this->conn->prepare($query);
    $stmt->execute();
    return $stmt;
}

public function update_data()
{
    $query = "CALL sp_update_persona(:id_persona, :contratista, :nombre, :a_paterno, :a_materno, :sueldo, :puesto)";
    $stmt = $this->conn->prepare($query);
        // bind values
    $stmt->bindParam(":contratista", $this->id_contratista);
    $stmt->bindParam(":nombre", $this->nombre);
    $stmt->bindParam(":a_paterno", $this->ap_paterno);
    $stmt->bindParam(":a_materno", $this->ap_materno);
    $stmt->bindParam(":sueldo", $this->salario);
    $stmt->bindParam(":puesto", $this->puesto);
    $stmt->bindParam(":id_persona", $this->id_empleado);
    if ($stmt->execute()) {
        return true;
    }else{
        return false;
    }
    
    
}

}

?>
