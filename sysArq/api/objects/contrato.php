<?php
class contrato{
 
    // database connection and table name
    private $conn;
    private $table_name = "contratos";
 
    // object properties
    public $id_contrato;
    public $grupo;
    public $nombre;
    public $contratista;
    public $fecha;
    public $tipo;
    public $residente;
    public $Usuario_m;
    public $User_r;
 
    public function __construct($db){
        $this->conn = $db;
    }

   // create product
function create(){
 
    // Procedure Insert Pregunta
    $call = "CALL sp_insert_contrato(:id_proyecto, :contratista, :fecha, :tipo, :residente, :usuario_m, :UserRegistro, :descripcion)";
    //$call = 'CALL sp_Alta_Encuesta(:nombre,:estatus,:fechalimite,:idarea,:idusuario)';
    
    $stmt = $this->conn->prepare($call);
     
    // sanitize
    $this->nombre=htmlspecialchars(strip_tags($this->nombre));
    $this->contratista=htmlspecialchars(strip_tags($this->contratista));  
    $this->fecha=htmlspecialchars(strip_tags($this->fecha));
    $this->tipo=htmlspecialchars(strip_tags($this->tipo));
    $this->residente=htmlspecialchars(strip_tags($this->residente));
    $this->Usuario_m=htmlspecialchars(strip_tags($this->Usuario_m));
    $this->User_r=htmlspecialchars(strip_tags($this->User_r));
    $this->descripcion=htmlspecialchars(strip_tags($this->descripcion));

    
    // bind values
    $stmt->bindParam(":id_proyecto", $this->nombre);
    $stmt->bindParam(":contratista", $this->contratista);
    $stmt->bindParam(":fecha", $this->fecha);
    $stmt->bindParam(":tipo", $this->tipo);
    $stmt->bindParam(":residente", $this->residente);
    $stmt->bindParam(":usuario_m", $this->Usuario_m);
    $stmt->bindParam(":UserRegistro", $this->User_r);
    $stmt->bindParam(":descripcion", $this->descripcion);
 
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
                    contratos.id,
                    contratos.nombre, 
                    contratos.contratista,
                    contratos.residente,
                    contratos.descripcion,
                    contratos.`status`,
                    contratos.tipo_contrato,
                    contratos.monto_anticipo,
                    contratos.monto_fondo_garantia,
                    contratos.monto_iva,
                    contratos.total_a,
                    contratos.total_b,
                    contratos.total_c,
                    contratos.total_c,
                    contratos.total_d,
                    contratos.total_e,
                    contratos.monto_pendiente,
                    contratos.total_contrato,
                    contratos.total_contrato_impuestos,
                    proyectos.nombre,
                    CONCAT(residentes.nombre,' ', residentes.ap_paterno, ' ', residentes.ap_materno),
                    CONCAT(contratistas.nombre,' ', contratistas.ap_paterno, ' ', contratistas.ap_materno),
                    contratos.fecha
                FROM
                    contratos 
                    INNER JOIN proyectos ON proyectos.id = contratos.nombre
                    INNER JOIN residentes ON residentes.id = contratos.residente
                    INNER JOIN contratistas ON contratistas.id = contratos.contratista
                WHERE
                    contratos.id = '".$this->id_contrato."'";
 
    // prepare query statement
    $stmt = $this->conn->prepare( $query );
 
    // bind id of product to be updated
    $stmt->bindParam(1, $this->id_contrato);
 
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

public function read(){
 
    //select all data
    $query = "SELECT
                contratos.id,
                contratistas.persona_moral AS contratista,
                residentes.persona_moral AS residente,
                proyectos.nombre,
                contratos.descripcion,
                contratos.total_contrato,
                contratos.usuario_modifica 
            FROM
                contratos
                INNER JOIN contratistas ON contratistas.id = contratos.contratista
                INNER JOIN residentes ON residentes.id = contratos.residente
                INNER JOIN proyectos ON proyectos.id = contratos.nombre 
            WHERE
                ( CASE 1 WHEN 2 THEN IdUserRegistro = usuario ELSE 1 = 1 END ) 
            AND `status` = 1";
 
    $stmt = $this->conn->prepare( $query );
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