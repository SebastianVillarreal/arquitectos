<?php
class Rol{
 
    // database connection and table name
    private $conn;
    private $table_name = "Cat_Rol";
 
    // object properties
    public $id_rol;
    public $name;
 
    public function __construct($db){
        $this->conn = $db;
    }
 // used by select drop-down list
public function read(){
 
    //select all data
    $query = "SELECT
                IDRol, Nombre
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
    $call = 'CALL sp_Alta_Rol(:nombre)';
    
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
               IDRol, Nombre
            FROM
                " . $this->table_name . " 
            WHERE
                IDRol = ?
            LIMIT
                0,1";
 
    // prepare query statement
    $stmt = $this->conn->prepare( $query );
 
    // sanitize
    $this->id_rol=htmlspecialchars(strip_tags($this->id_rol));
    // bind id of product to be updated
    $stmt->bindParam(1, $this->id_rol);
 
    // execute query
    $stmt->execute();
 
    // get retrieved row
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
 
    // set values to object properties
    $this->id_rol = $row['IDRol'];
    $this->name = $row['Nombre'];
// update the product
function update(){
 
    
    //update procedure
    $call = 'CALL sp_Update_Rol(:idr,:name)';
 
    // prepare query statement
    $stmt = $this->conn->prepare($call);
 
    // sanitize
    $this->id_rol=htmlspecialchars(strip_tags($this->id_rol));
    $this->name=htmlspecialchars(strip_tags($this->name));
 
    // bind new values
    $stmt->bindParam(":idr", $this->id_rol);
    $stmt->bindParam(":name", $this->name);
 
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
                IDRol, Nombre 
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
               IDRol, Nombre
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