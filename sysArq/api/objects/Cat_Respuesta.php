<?php
class Cat_Respuesta{

    // database connection and table name
    private $conn;
    private $table_name = "Cat_Respuesta";

    // object properties
    public $id_respuesta;
    public $respuesta;



    public function __construct($db){
        $this->conn = $db;
    }
 // used by select drop-down list
public function read(){

    //select all data
    $query = "SELECT
              IDRespuesta, Respuesta
            FROM
                " . $this->table_name . " 
                where IDRespuesta != 0
            ORDER BY
                IDRespuesta ASC";

    $stmt = $this->conn->prepare( $query );
    $stmt->execute();

    return $stmt;
}

   // create product
function create(){

    // Procedure Insert Pregunta
    $call = 'CALL sp_Alta_Respuesta(:ide,:idp,:idt,:respuesta)';

    $stmt = $this->conn->prepare($call);

    // sanitize
    $this->id_encuesta=htmlspecialchars(strip_tags($this->id_encuesta));
    $this->id_pregunta=htmlspecialchars(strip_tags($this->id_pregunta));
    $this->id_tipo=htmlspecialchars(strip_tags($this->id_tipo));
    $this->respuesta_desc=htmlspecialchars(strip_tags($this->respuesta_desc));

    // bind values
    $stmt->bindParam(":ide", $this->id_encuesta);
    $stmt->bindParam(":idp", $this->id_pregunta);
    $stmt->bindParam(":idt", $this->id_tipo);
    $stmt->bindParam(":respuesta", $this->respuesta_desc);
    // execute query
    if($stmt->execute()){
        return true;
    }

    return false;

}

public function count(){
    $query = "SELECT COUNT(*) as total_rows FROM " . $this->table_name . "";

    $stmt = $this->conn->prepare( $query );
    $stmt->execute();
    $row = $stmt->fetch(PDO::FETCH_ASSOC);

    return $row['total_rows'];
}

}

?>
