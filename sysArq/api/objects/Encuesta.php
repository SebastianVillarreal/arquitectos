<?php
class Encuesta{
 
    // database connection and table name
    private $conn;
    private $table_name = "Encuesta";
 
    // object properties
    public $id_encuesta;
    public $name;
    public $estatus;
    public $fecha_alta;
    public $fecha_limite;
    public $id_area;
    public $id_usuario;
    public $para;
 
    public function __construct($db){
        $this->conn = $db;
    }
 // used by select drop-down list
public function read(){
 
    //select all data
    $query = "SELECT
                IDEncuesta, Nombre, Estatus, IDArea, IDUsuario, Fecha_Alta, Fecha_Limite
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
    $call = 'CALL sp_Alta_Encuesta(:nombre,:estatus,:fechalimite,:idarea,:idusuario)';
    
    $stmt = $this->conn->prepare($call);
     
    // sanitize
    $this->name=htmlspecialchars(strip_tags($this->name));
    $this->estatus=htmlspecialchars(strip_tags($this->estatus));  
    $this->fecha_limite=htmlspecialchars(strip_tags($this->fecha_limite));
    $this->id_area=htmlspecialchars(strip_tags($this->id_area)); 
    $this->id_usuario=htmlspecialchars(strip_tags($this->id_usuario));
    
    // bind values
    $stmt->bindParam(":nombre", $this->name);
    $stmt->bindParam(":estatus", $this->estatus);
    $stmt->bindParam(":fechalimite", $this->fecha_limite);
    $stmt->bindParam(":idarea", $this->id_area);
    $stmt->bindParam(":idusuario", $this->id_usuario);
 
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
                e.IDEncuesta, e.Nombre, s.Estado as Estatus, e.Fecha_Alta, e.Fecha_Limite , e.IDUsuario , a.IDUsuarioTo , u.Nombre as Para , a.IDAccesso
            FROM
                " . $this->table_name . " e
                LEFT JOIN Accesso a
                ON a.IDEncuesta = e.IDEncuesta
                LEFT JOIN Cat_Estatus s
                ON a.IDEstatus = s.IDEstatus
                LEFT JOIN Usuario u
                ON u.IDUsuario = a.IDUsuarioTo
            WHERE
               a.IDUsuario = ? and (e.Fecha_Alta <= e.Fecha_Limite or Fecha_Limite = null) and e.Estatus = 1
               ORDER BY Estatus DESC";
 
    // prepare query statement
    $stmt = $this->conn->prepare( $query );
 
    // bind id of product to be updated
    $stmt->bindParam(1, $this->id_usuario);
 
    // execute query
    $stmt->execute();
 
    // get retrieved row
    return $stmt;
}
// update the product
function update(){
 
    
    //update procedure
    $call = 'CALL sp_Update_Encuesta(:ide,:nombre,:estatus,:fechalimite,idarea,idusuario)';
 
    // prepare query statement
    $stmt = $this->conn->prepare($call);
 
    // sanitize
    $this->id_encuesta=htmlspecialchars(strip_tags($this->id_encuesta));
    $this->name=htmlspecialchars(strip_tags($this->name));
    $this->estatus=htmlspecialchars(strip_tags($this->estatus));
    $this->fecha_limite=htmlspecialchars(strip_tags($this->fecha_limite));
    $this->id_area=htmlspecialchars(strip_tags($this->id_area));
    $this->id_usuario=htmlspecialchars(strip_tags($this->id_usuario));
    
 
    // bind new values
    $stmt->bindParam(':ide', $this->id_encuesta);
    $stmt->bindParam(':nombre', $this->name);
    $stmt->bindParam(':estatus', $this->estatus);
    $stmt->bindParam(':fechalimite', $this->fecha_limite);
    $stmt->bindParam(':idarea', $this->id_area);
    $stmt->bindParam(':idusuario', $this->id_usuario);
 
    // execute the query
    if($stmt->execute()){
        return true;
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
// search products
function search($keywords){
 
    // select all query
    $query = "SELECT
                c.Nombre as Area, p.IDEncuesta, p.Nombre, p.Estatus, p.Fecha_Alta, p.Fecha_Limite, p.IDArea, p.IDUsuario
            FROM
                " . $this->table_name . " p
                LEFT JOIN
                    Cat_Area c
                        ON p.IDArea = c.IDArea
            WHERE
                p.Pregunta LIKE ? OR c.Nombre LIKE ?  
            ORDER BY
                p.IDArea,p.IDEncuesta DESC";
 
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
                c.Nombre as Area, p.IDEncuesta, p.Nombre, p.Estatus, p.Fecha_Alta, p.Fecha_Limite, p.IDArea, p.IDUsuario
            FROM
                " . $this->table_name . " p
                LEFT JOIN
                    Cat_Area c
                        ON p.IDArea = c.IDArea
            ORDER BY p.IDArea,p.IDEncuesta DESC
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