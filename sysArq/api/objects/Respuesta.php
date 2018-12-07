<?php
class Respuesta{
 
    // database connection and table name
    private $conn;
    private $table_name = "Respuesta";
 
    // object properties
    public $id_respuesta;
    public $id_encuesta;
    public $id_pregunta;
    public $id_tipo;
    public $encuesta_name;    
    public $pregunta_desc;
    public $respuesta_desc;
    
    
 
    public function __construct($db){
        $this->conn = $db;
    }
 // used by select drop-down list
public function read(){
 
    //select all data
    $query = "SELECT
                e.IDEncuesta, e.Nombre as Encuesta, p.IDPregunta, p.Pregunta, r.IDRespuesta, r.Respuesta, r.IDTipo
            FROM
                " . $this->table_name . " r
                LEFT JOIN Pregunta p
                ON r.IDEncuesta = p.IDEncuesta and r.IDPregunta = p.IDPregunta
                LEFT JOIN Encuesta e
                ON r.IDEncuesta = e.IDEncuesta
            ORDER BY
                r.IDEncuesta,r.IDPregunta,r.IDRespuesta DESC";
 
    $stmt = $this->conn->prepare( $query );
    $stmt->execute();
 
    return $stmt;
}
    // used by select drop-down list
   /* public function readAll(){
        //select all data
        $query = "SELECT
                    id, name, description
                FROM
                    " . $this->table_name . "
                ORDER BY
                    name";
 
        $stmt = $this->conn->prepare( $query );
        $stmt->execute();
 
        return $stmt;
    }*/
    
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
// used when filling up the update product form
function readOne(){
 
    // query to read single record
    $query = "SELECT
               e.IDEncuesta, e.Nombre as Encuesta, p.IDPregunta, p.Pregunta, r.IDRespuesta, r.Respuesta, r.IDTipo
            FROM
                " . $this->table_name . " r
                LEFT JOIN Pregunta p
                ON r.IDEncuesta = p.IDEncuesta and r.IDPregunta = p.IDPregunta
                LEFT JOIN Encuesta e
                ON r.IDEncuesta = e.IDEncuesta
            WHERE
                r.IDRespuesta = :idr and r.IDEncuesta = :ide and r.IDPregunta = :idp
            LIMIT
                0,1";
 
    // prepare query statement
    $stmt = $this->conn->prepare( $query );
 
    // sanitize
    $this->id_pregunta=htmlspecialchars(strip_tags($this->id_pregunta));
    $this->id_encuesta=htmlspecialchars(strip_tags($this->id_encuesta));
    $this->id_respuesta=htmlspecialchars(strip_tags($this->id_respuesta));
    
    // bind new values
    $stmt->bindParam(':ide', $this->id_pregunta);
    $stmt->bindParam(':idp', $this->id_encuesta);
    $stmt->bindParam(':idr', $this->id_respuesta);
 
    // execute query
    $stmt->execute();
 
    // get retrieved row
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
 
    // set values to object properties
    $this->id_respuesta = $row['IDRespuesta'];
    $this->id_pregunta = $row['IDPregunta'];
    $this->id_encuesta = $row['IDEncuesta'];
    $this->id_tipo = $row['IDTipo'];
    $this->encuesta_name = $row['Encuesta'];
    $this->pregunta_desc = $row['Pregunta'];
    $this->respuesta_desc = $row['Respuesta'];
}
// update the product
function update(){
 
    
    //update procedure
    $call = 'CALL sp_Update_Respuesta(:idr,:ide,:idp,:idt,respuesta)';
 
    // prepare query statement
    $stmt = $this->conn->prepare($call);
 
    // sanitize
    $this->id_encuesta=htmlspecialchars(strip_tags($this->id_encuesta));
    $this->id_pregunta=htmlspecialchars(strip_tags($this->id_pregunta));  
    $this->id_tipo=htmlspecialchars(strip_tags($this->id_tipo));
    $this->id_respuesta=htmlspecialchars(strip_tags($this->id_respuesta));  
    $this->respuesta=htmlspecialchars(strip_tags($this->respuesta));
 
    // bind new values
    $stmt->bindParam(":ide", $this->id_encuesta);
    $stmt->bindParam(":idp", $this->id_pregunta);
    $stmt->bindParam(":idt", $this->id_tipo);
    $stmt->bindParam(":idr", $this->id_respuesta);
    $stmt->bindParam(":respuesta", $this->respuesta);
 
    // execute the query
    if($stmt->execute()){
        return true;
    }
 
    return false;
}
// delete the product
function delete(){
 
    
    // delete procedure
    $call = 'CALL sp_Delete_Respuesta(:ide,:idp,:idr)';
 
    // prepare query
    $stmt = $this->conn->prepare($call);
 
    // sanitize
    $this->id_encuesta=htmlspecialchars(strip_tags($this->id_encuesta));
    $this->id_pregunta=htmlspecialchars(strip_tags($this->id_pregunta));
    $this->id_respuesta=htmlspecialchars(strip_tags($this->id_respuesta));
 
    // bind id of record to delete
    $stmt->bindParam(':ide', $this->id_encuesta);
    $stmt->bindParam(':idp', $this->id_pregunta);
    $stmt->bindParam(':idr', $this->id_respuesta);
 
    // execute query
    if($stmt->execute()){
        return true;
    }
 
    return false;
     
}
// search products
function search($keywords){
 
    // select all query
    $query = "SELECT
                e.IDEncuesta, e.Nombre as Encuesta, p.IDPregunta, p.Pregunta, r.IDRespuesta, r.Respuesta, r.IDTipo
            FROM
                " . $this->table_name . " r
                LEFT JOIN Pregunta p
                ON r.IDEncuesta = p.IDEncuesta and r.IDPregunta = p.IDPregunta
                LEFT JOIN Encuesta e
                ON r.IDEncuesta = e.IDEncuesta
            WHERE
                r.Respuesta LIKE ? OR p.Pregunta LIKE ? OR e.Nombre LIKE ?
            ORDER BY
                p.IDEncuesta,p.IDPregunta,p.IDRespuesta DESC";
 
    // prepare query statement
    $stmt = $this->conn->prepare($query);
 
    // sanitize
    $keywords=htmlspecialchars(strip_tags($keywords));
    $keywords = "%{$keywords}%";
 
    // bind
    $stmt->bindParam(1, $keywords);
    $stmt->bindParam(2, $keywords);
    $stmt->bindParam(3, $keywords);
 
    // execute query
    $stmt->execute();
 
    return $stmt;
}
// read products with pagination
public function readPaging($from_record_num, $records_per_page){
 
    // select query
    $query = "SELECT
                e.IDEncuesta, e.Nombre as Encuesta, p.IDPregunta, p.Pregunta, r.IDRespuesta, r.Respuesta, r.IDTipo
            FROM
                " . $this->table_name . " r
                LEFT JOIN Pregunta p
                ON r.IDEncuesta = p.IDEncuesta and r.IDPregunta = p.IDPregunta
                LEFT JOIN Encuesta e
                ON r.IDEncuesta = e.IDEncuesta
            ORDER BY e.IDEncuesta,p.IDPregunta,r.IDRespuesta DESC
            LIMIT ?, ?";
 
    // prepare query statement
    $stmt = $this->conn->prepare( $query );
 
    // bind variable values
    $stmt->bindParam(1, $from_record_num, PDO::PARAM_INT);
    $stmt->bindParam(2, $records_per_page, PDO::PARAM_INT);
 
    // execute query
    $stmt->execute();
 
    // return values from database
    return $stmt;
}
// used for paging products
public function count(){
    $query = "SELECT COUNT(*) as total_rows FROM " . $this->table_name . "";
 
    $stmt = $this->conn->prepare( $query );
    $stmt->execute();
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
 
    return $row['total_rows'];
} 
    
}

?>