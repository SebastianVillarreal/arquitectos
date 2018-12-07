<?php
class Area{
 
    // database connection and table name
    private $conn;
    private $table_name = "Cat_Area";
 
    // object properties
    public $id_area;
    public $name;
    public $estatus;
 
    public function __construct($db){
        $this->conn = $db;
    }
 // used by select drop-down list
public function read(){
 
    //select all data
    $query = "SELECT
                IDArea, Nombre as Area , Estatus
            FROM
                " . $this->table_name . "               
            ORDER BY
                Nombre";
 
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
    $call = 'CALL sp_Alta_Area(:nombre)';
    
    $stmt = $this->conn->prepare($call);
     
    // sanitize
    $this->name=htmlspecialchars(strip_tags($this->name));
    
    // bind values
    $stmt->bindParam(":nombre", $this->name);
    if($stmt->execute()){
        return true;
    }
 
    return false;
     
}
// used when filling up the update product form
function readOne(){
 
    // query to read single record
    $query = "SELECT
               IDArea, Nombre, Estatus
            FROM
                " . $this->table_name . " 
            WHERE
                IDArea = ?
            LIMIT
                0,1";
 
    // prepare query statement
    $stmt = $this->conn->prepare( $query );
 
    // sanitize
    $this->id_area=htmlspecialchars(strip_tags($this->id_area));
    // bind id of product to be updated
    $stmt->bindParam(1, $this->id_area);
 
    // execute query
    $stmt->execute();
 
    // get retrieved row
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
 
    // set values to object properties
    $this->id_area = $row['IDArea'];
    $this->name = $row['Nombre'];
    $this->estatus = $row['Estatus'];
}
// update the product
function update(){
 
    
    //update procedure
    $call = 'CALL sp_Update_Area(:ida,:name,:estatus)';
 
    // prepare query statement
    $stmt = $this->conn->prepare($call);
 
    // sanitize
    $this->id_area=htmlspecialchars(strip_tags($this->id_area));
    $this->name=htmlspecialchars(strip_tags($this->name));
 
    // bind new values
    $stmt->bindParam(":ida", $this->id_area);
    $stmt->bindParam(":name", $this->name);
    $stmt->bindParam(":estatus", $this->estatus);
 
    // execute the query
    if($stmt->execute()){
        return true;
    }
 
    return false;
}

// search products
function search($keywords){
 
    // select all query
    $query = "SELECT
                IDArea, Nombre as Area, Estatus
            FROM
                " . $this->table_name . " 
            WHERE
                Nombre LIKE ?
            ORDER BY
                Nombre DESC";
 
    // prepare query statement
    $stmt = $this->conn->prepare($query);
 
    // sanitize
    $keywords=htmlspecialchars(strip_tags($keywords));
    $keywords = "%{$keywords}%";
 
    // bind
    $stmt->bindParam(1, $keywords);
 
    // execute query
    $stmt->execute();
 
    return $stmt;
}
// read products with pagination
public function readPaging($from_record_num, $records_per_page){
 
    // select query
    $query = "SELECT
               IDArea, Nombre as Area, Estatus
            FROM
                " . $this->table_name . " 
            ORDER BY
                Nombre
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