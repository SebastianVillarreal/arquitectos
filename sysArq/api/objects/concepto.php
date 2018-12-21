<?php
class concepto{
 
    // database connection and table name
    private $conn;
    private $table_name = "conceptos";
 
    // object properties
    public $id_proyecto;
    public $clave;
    public $descripcion;
    public $unidad;
    public $cantidad_original;
    public $costo_maximo_subcontrato;
    public $costo_maximo_destajo;
    public $id_clave;
    public $generador;
    public $id_concepto;

 
    public function __construct($db){
        $this->conn = $db;
    }

   // create product
function create(){
 
    // Procedure Insert Pregunta
    $call = "CALL sp_insert_conceptos(:concepto, :descripcion, :unidad, :cantidad, :max_subcontrato, :max_destajo, :clave_fam, :proyecto, :gen)";
    //$call = 'CALL sp_Alta_Encuesta(:nombre,:estatus,:fechalimite,:idarea,:idusuario)';
    
    $stmt = $this->conn->prepare($call);
     
    // sanitize
    $this->concepto=htmlspecialchars(strip_tags($this->concepto));
    $this->descripcion=htmlspecialchars(strip_tags($this->descripcion));  
    $this->unidad=htmlspecialchars(strip_tags($this->unidad));
    $this->cantidad=htmlspecialchars(strip_tags($this->cantidad));
    $this->max_subcontrato=htmlspecialchars(strip_tags($this->max_subcontrato));
    $this->max_destajo=htmlspecialchars(strip_tags($this->max_destajo));
    $this->clave_fam=htmlspecialchars(strip_tags($this->clave_fam));
    $this->proyecto=htmlspecialchars(strip_tags($this->proyecto));
    $this->gen=htmlspecialchars(strip_tags($this->gen));

    
    // bind values
    $stmt->bindParam(":concepto", $this->concepto);
    $stmt->bindParam(":descripcion", $this->descripcion);
    $stmt->bindParam(":unidad", $this->unidad);
    $stmt->bindParam(":cantidad", $this->cantidad);
    $stmt->bindParam(":max_subcontrato", $this->max_subcontrato);
    $stmt->bindParam(":max_destajo", $this->max_destajo);
    $stmt->bindParam(":clave_fam", $this->clave_fam);
    $stmt->bindParam(":proyecto", $this->proyecto);
    $stmt->bindParam(":gen", $this->gen);
 
    // execute query
    if($stmt->execute()){
        return true;
    }
 
    return false;
     
}
// update the product
function update(){
 
    
    //update procedure
    $call = 'CALL sp_update_status(:id_contrato, :tipo)';
    return $call;
 
    // prepare query statement
    $stmt = $this->conn->prepare($call);
 
    // sanitize
    $this->id_contrato=htmlspecialchars(strip_tags($this->id_contrato));
    $this->tipo=htmlspecialchars(strip_tags($this->tipo));
    
 
    // bind new values
    $stmt->bindParam(':id_contrato', $this->id_contrato);
    $stmt->bindParam(':tipo', $this->tipo);
 
    // execute the query
    if($stmt->execute()){
        return true;
    }else{
        return false;
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
                    conceptos.id,
                    conceptos.concepto,
                    conceptos.descripcion_larga,
                    conceptos.unidad,
                    conceptos.cantidad_original,
                    FORMAT(conceptos.costo_maximo_subcontrato,2),
                    FORMAT(conceptos.costo_maximo_destajo,2),
                    proyectos.nombre
                FROM
                    conceptos
                INNER JOIN proyectos ON proyectos.id = conceptos.id_proyecto";
 
    $stmt = $this->conn->prepare( $query );
    $stmt->execute();
    return $stmt;
}

public function read_supervisor(){
 
    //select all data
    $query = "SELECT
                contratos.id,
                contratistas.persona_moral AS contratista,
                residentes.persona_moral AS residente,
                proyectos.nombre,
                contratos.descripcion,
                FORMAT(contratos.total_contrato, 2),
                contratos.usuario_modifica 
            FROM
                contratos
                INNER JOIN contratistas ON contratistas.id = contratos.contratista
                INNER JOIN residentes ON residentes.id = contratos.residente
                INNER JOIN proyectos ON proyectos.id = contratos.nombre 
            WHERE
                ( CASE 1 WHEN 2 THEN IdUserRegistro = usuario ELSE 1 = 1 END ) 
            AND `status` = 2";
 
    $stmt = $this->conn->prepare( $query );
    $stmt->execute();
 
    return $stmt;
}

public function read_residentes(){
 
    //select all data
    $query = "SELECT
                contratos.id,
                contratistas.persona_moral AS contratista,
                residentes.persona_moral AS residente,
                proyectos.nombre,
                contratos.descripcion,
                FORMAT(contratos.total_contrato, 2),
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

public function read_costos(){
 
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
            AND `status` = 3";
 
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