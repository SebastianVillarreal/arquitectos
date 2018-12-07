<?php
class Pregunta{
 
    // database connection and table name
    private $conn;
    private $table_name = "Pregunta";
 
    // object properties
    public $id_pregunta;
    public $id_encuesta;
    public $id_area;
    public $encuesta_name;
    public $pregunta_desc;
 
    // constructor with $db as database connection
    public function __construct($db){
        $this->conn = $db;
    }
      // read products
function read(){
 
    // select all query
    $query = "SELECT
                c.IDEncuesta, c.Nombre as Encuesta, p.IDPregunta, p.Pregunta, p.IDArea
            FROM
                " . $this->table_name . " p
                LEFT JOIN
                    Encuesta c
                        ON p.IDEncuesta = c.IDEncuesta
                         WHERE
                 p.IDEncuesta = :ide
                ORDER BY
                p.IDArea , p.IDPregunta ASC";
 
    // prepare query statement
    $stmt = $this->conn->prepare($query);
    
    // sanitize
    $this->id_encuesta=htmlspecialchars(strip_tags($this->id_encuesta));
    //$this->id_area=htmlspecialchars(strip_tags($this->id_area));    
 
    // bind values
    $stmt->bindParam(":ide", $this->id_encuesta);
    //$stmt->bindParam(":area", $this->id_area);
 
    // execute query
    $stmt->execute();
 
    return $stmt;
}
// create product
function create(){
 
    // Procedure Insert Pregunta
    $call = 'CALL sp_Alta_Pregunta(:ide,:pregunta)';
    
    $stmt = $this->conn->prepare($call);
     
    // sanitize
    $this->id_encuesta=htmlspecialchars(strip_tags($this->id_encuesta));
    $this->pregunta_desc=htmlspecialchars(strip_tags($this->pregunta));    
 
    // bind values
    $stmt->bindParam(":ide", $this->id_encuesta);
    $stmt->bindParam(":pregunta", $this->pregunta_desc);
 
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
               c.IDEncuesta, c.Nombre as Encuesta, p.IDPregunta, p.Pregunta
            FROM
                " . $this->table_name . " p
                LEFT JOIN
                    Encuesta c
                        ON p.IDEncuesta = c.IDEncuesta
            WHERE
                p.IDPregunta = :idp and p.IDEncuesta = :ide
            LIMIT
                0,1";
 
    // prepare query statement
    $stmt = $this->conn->prepare( $query );
    
     // sanitize
    $this->id_pregunta=htmlspecialchars(strip_tags($this->id_pregunta));
    $this->id_encuesta=htmlspecialchars(strip_tags($this->id_encuesta));
    
    // bind new values
    $stmt->bindParam(':idp', $this->id_pregunta);
    $stmt->bindParam(':ide', $this->id_encuesta);

 
    // execute query
    $stmt->execute();
 
    // get retrieved row
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
    

 
    // set values to object properties
    $this->pregunta_desc = $row['Pregunta'];    
    $this->encuesta_name = $row['Encuesta'];
    $this->id_encuesta = $row['IDEncuesta'];
    $this->id_pregunta = $row['IDPregunta'];
}
// update the product
function update(){
 
    
    //update procedure
    $call = 'CALL sp_Update_Pregunta(:ide,:idp,:pregunta)';
 
    // prepare query statement
    $stmt = $this->conn->prepare($call);
 
    // sanitize
    $this->id_pregunta=htmlspecialchars(strip_tags($this->id_pregunta));
    $this->id_encuesta=htmlspecialchars(strip_tags($this->id_encuesta));
    $this->pregunta_desc=htmlspecialchars(strip_tags($this->pregunta_desc));
    
 
    // bind new values
    $stmt->bindParam(':idp', $this->id_pregunta);
    $stmt->bindParam(':ide', $this->id_encuesta);
    $stmt->bindParam(':pregunta', $this->pregunta_desc);
 
    // execute the query
    if($stmt->execute()){
        return true;
    }
 
    return false;
}
// delete the product
function delete(){
 
    
    // delete procedure
    $call = 'CALL sp_Delete_Pregunta(:ide,:idp)';
 
    // prepare query
    $stmt = $this->conn->prepare($call);
 
    // sanitize
    $this->id_pregunta=htmlspecialchars(strip_tags($this->id_pregunta));
    $this->id_encuesta=htmlspecialchars(strip_tags($this->id_encuesta));
 
    // bind id of record to delete
    $stmt->bindParam(':idp', $this->id_pregunta);
    $stmt->bindParam(':ide', $this->id_encuesta);
 
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
                 c.IDEncuesta, c.Nombre as Encuesta, p.IDPregunta, p.Pregunta
            FROM
                " . $this->table_name . " p
                LEFT JOIN
                    Encuesta c
                        ON p.IDEncuesta = c.IDEncuesta
            WHERE
                p.Pregunta LIKE ? OR c.Nombre LIKE ?
            ORDER BY
                p.IDEncuesta,p.IDPregunta DESC";
 
    // prepare query statement
    $stmt = $this->conn->prepare($query);
 
    // sanitize
    $keywords=htmlspecialchars(strip_tags($keywords));
    $keywords = "%{$keywords}%";
 
    // bind
    $stmt->bindParam(1, $keywords);
    $stmt->bindParam(2, $keywords);
 
    // execute query
    $stmt->execute();
 
    return $stmt;
}
// read products with pagination
public function readPaging($from_record_num, $records_per_page){
 
    // select query
    $query = "SELECT
                 c.IDEncuesta, c.Nombre as Encuesta, p.IDPregunta, p.Pregunta
            FROM
                " . $this->table_name . " p
                LEFT JOIN
                    Encuesta c
                        ON p.IDEncuesta = c.IDEncuesta
            ORDER BY p.IDEncuesta,p.IDPregunta DESC
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