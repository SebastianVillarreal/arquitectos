<?php
class detalle_cont{
 
    // database connection and table name
    private $conn;
    private $table_name = "detalle_contratos";
 
    // object properties
    public $id_contrato;
    public $concepto;
    public $tipo_concepto;
    public $clave_concepto;
    public $tipo_contrato;
    public $cantidad_nueva;
    public $costo_nuevo;
    public $id_detalle;
 
    public function __construct($db){
        $this->conn = $db;
    }

    
   // create product
function create(){
 
    // Procedure Insert Pregunta
    $call = "CALL sp_insert_detalle(:id_contrato, :concepto, :tipo_conc, :fecha, :tipo_contrato)";
    //$call = 'CALL sp_Alta_Encuesta(:nombre,:estatus,:fechalimite,:idarea,:idusuario)';
    
    $stmt = $this->conn->prepare($call);
     
    // sanitize
    $this->id_contrato=htmlspecialchars(strip_tags($this->id_contrato));
    $this->concepto=htmlspecialchars(strip_tags($this->concepto));  
    $this->tipo_concepto=htmlspecialchars(strip_tags($this->tipo_concepto));
    $this->fecha=htmlspecialchars(strip_tags($this->fecha));
    $this->tipo_contrato=htmlspecialchars(strip_tags($this->tipo_contrato));  
    
    // bind values
    $stmt->bindParam(":id_contrato", $this->id_contrato);
    $stmt->bindParam(":concepto", $this->concepto);
    $stmt->bindParam(":tipo_conc", $this->tipo_concepto);
    $stmt->bindParam(":fecha", $this->fecha);
    $stmt->bindParam(":tipo_contrato", $this->tipo_contrato);
 
    // execute query
    if($stmt->execute()){
        return true;
    }
 
    return false;
     
}

public function read(){
 
    //select all data
    $query = "SELECT
                detalle_contratos.id,
                detalle_contratos.tipo_concepto,
                consecutivo_contrato,
                consecutivo,
                familias.familia,
                conceptos.concepto,
                conceptos.descripcion_larga,
                conceptos.unidad,
                cantidad,
                conceptos.cantidad_original,
                FORMAT(costo_actual, 2),
                FORMAT(costo_tope,2),
                FORMAT(importe_renglon, 2),
                detalle_contratos.id_contrato,
                (SELECT FORMAT(total_lote,2) FROM totales_lotes WHERE id_contrato = detalle_contratos.id_contrato AND num_contrato = consecutivo)
            FROM
                detalle_contratos
                INNER JOIN conceptos ON  conceptos.id = detalle_contratos.concepto
                INNER JOIN familias ON familias.id_clave = conceptos.id_clave
                WHERE id_contrato = ".$this->id_contrato."
                ORDER BY detalle_contratos.consecutivo_contrato";
 
    $stmt = $this->conn->prepare( $query );
    $stmt->bindParam(1, $this->id_contrato);
    $stmt->execute();
 
    return $stmt;
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
    $call = 'CALL sp_update_cantidad_costo(:id_detalle, :cantidad_nueva)';
 
    // prepare query statement
    $stmt = $this->conn->prepare($call);
 
    // sanitize
    $this->id_detalle=htmlspecialchars(strip_tags($this->id_detalle));
    $this->cantidad=htmlspecialchars(strip_tags($this->cantidad_nueva));

    
 
    // bind new values
    $stmt->bindParam(':id_detalle', $this->id_detalle);
    $stmt->bindParam(':cantidad_nueva', $this->cantidad_nueva);
 
    // execute the query
    
    //print_r($stmt);
     $stmt->execute();
    return $stmt;
     
}

function update_costo(){
 
    
    //update procedure
    $call = 'CALL sp_update_costo(:id_detalle,:costo_nuevo)';
 
    // prepare query statement
    $stmt = $this->conn->prepare($call);
 
    // sanitize
    $this->id_detalle=htmlspecialchars(strip_tags($this->id_detalle));
    $this->costo_nuevo=htmlspecialchars(strip_tags($this->costo_nuevo));

    
 
    // bind new values
    $stmt->bindParam(':id_detalle', $this->id_detalle);
    $stmt->bindParam(':costo_nuevo', $this->costo_nuevo);
 
    // execute the query
    $stmt->execute();
    return $stmt;

     
}

function actualizar_importes(){
 
    
    //update procedure
    $call = 'CALL sp_totales_conceptos(:id_contrato, :tipo_concepto)';
 
    // prepare query statement
    $stmt = $this->conn->prepare($call);
 
    // sanitize
    $this->id_contrato=htmlspecialchars(strip_tags($this->id_contrato));

    // bind new values
    $stmt->bindParam(':id_contrato', $this->id_contrato);
    $stmt->bindParam(':tipo_concepto', $this->tipo_concepto);
 
    // execute the query
    if ($stmt->execute()) {

        return true;
    }else{
        return false;
    }


     
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