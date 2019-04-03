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
    public $perfil;
    public $cantidad_devolucion;
    public $porcentaje;
    public $valor;
    public $id_area;
    public $obra;
    public $id_cuarto;
    public $folio_erp;
    public $concepto;
    public $total;
    public $usuario;

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



public function read_detalle_estimacion(){

    $query = "CALL sp_select_detalle_estimacion(:id_estimacion)";

    $stmt = $this->conn->prepare( $query );
    $stmt->bindParam(':id_estimacion', $this->id);
    $stmt->execute();
    return $stmt;
}


public function read(){

    $query = "CALL sp_select_estimaciones(:id_contrato, :perfil)";

    $stmt = $this->conn->prepare( $query );
    $stmt->bindParam(':id_contrato', $this->id_contrato);
    $stmt->bindParam(':perfil', $this->perfil);
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

public function autorizar_estimacion()
{
    $call = "CALL sp_update_status_estimaciones(:estimacion, :valor)";
    $stmt = $this->conn->prepare($call);
    $stmt->bindParam(':estimacion', $this->id);
    $stmt->bindParam(':valor', $this->valor);
    if ($stmt->execute()) {
        return true;
    }else{
        return false;
    }
}

public function insertar_devolucion()
{
    $call = "CALL sp_insert_devolucion_garantia(:valor, :estimacion)";
    $stmt = $this->conn->prepare($call);
    $stmt->bindParam(':valor', $this->cantidad_devolucion);
    $stmt->bindParam(':estimacion', $this->id);
    $stmt->execute();
    return $stmt; 
}

public function read_generador()
{
    $call = "CALL sp_select_generador_estimaciones(:renglon, :estimacion)";
    $stmt = $this->conn->prepare($call);
    $stmt->bindParam('renglon', $this->id_renglon);
    $stmt->bindParam('estimacion', $this->id);
    $stmt->execute();
    return $stmt;
}

public function estimar_generador()
{
    $call = "CALL sp_estimar_porcentaje(:renglon, :valor, :cantidad_total, :estimacion, :cuarto)";
    $stmt = $this->conn->prepare($call);
    $stmt->bindParam(':renglon', $this->id_renglon);
    $stmt->bindParam(':valor', $this->porcentaje);
    $stmt->bindParam(':cantidad_total', $this->valor);
    $stmt->bindParam(':estimacion', $this->id);
    $stmt->bindParam(':cuarto', $this->id_cuarto);
    $stmt->execute();
    return $stmt;
}

public function captura()
{
    $call = "CALL sp_insert_captura(:folio, :concepto, :total, :usuario)";
    $stmt = $this->conn->prepare($call);
    $stmt->bindParam(':folio', $this->folio_erp);
    $stmt->bindParam(':concepto', $this->concepto);
    $stmt->bindParam(':total', $this->total);
    $stmt->bindParam(':usuario', $this->usuario);
    if ($stmt->execute()) {
        return true;
    }else{
        return false;
    }
}


}

?>
