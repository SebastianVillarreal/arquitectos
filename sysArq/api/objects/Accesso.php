<?php
class Accesso{
 
    // database connection and table name
    private $conn;
    private $table_name = "Accesso";
 
    // object properties
    public $id_accesso;
    public $id_usuario;
    public $id_rol; 
    public $id_estatus;
    
    public function __construct($db){
        $this->conn = $db;
    }
 // used by select drop-down list
public function read(){
 
    //select all data
    $query = "SELECT
                IDAcceso, IDUsuario, IDRol
            FROM
                " . $this->table_name;
 
    $stmt = $this->conn->prepare( $query );
    $stmt->execute();
 
    return $stmt;
}
    
function update(){ 
    
    //update procedure
    $call = 'CALL sp_Update_Accesso(:ida,:idu,:ide,:iduto,:idestatus)';
    
    // prepare query statement
    $stmt = $this->conn->prepare($call);
 
    // sanitize
    $this->id_accesso=htmlspecialchars(strip_tags($this->id_accesso));
    $this->id_estatus=htmlspecialchars(strip_tags($this->id_estatus));
    $this->id_usuario=htmlspecialchars(strip_tags($this->id_usuario));
    $this->id_encuesta=htmlspecialchars(strip_tags($this->id_encuesta));
    $this->id_usuarioto=htmlspecialchars(strip_tags($this->id_usuarioto));
 
    // bind new values
    $stmt->bindParam(':ida', $this->id_accesso);
    $stmt->bindParam(':idu', $this->id_usuario);
    $stmt->bindParam(':ide', $this->id_encuesta);
    $stmt->bindParam(':iduto', $this->id_usuarioto);
    $stmt->bindParam(':idestatus', $this->id_estatus);
 
    // execute the query
    if($stmt->execute()){
        return true;
    }
 
    return false;
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