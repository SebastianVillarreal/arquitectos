<?php
class importes{
 
    // database connection and table name
    private $conn;
    private $table_name = "detalle_contratos";
 
    // object properties
    public $id_contrato;
    public $p_anticipo;
    public $p_iva;
    public $p_fondo;
    public $p_pendiente;
    public $m_anticipo;
    public $m_iva;
    public $m_fondo;
    public $m_pendiente;
    public function __construct($db){
        $this->conn = $db;
    }

    
   // create product
function create(){
 
    // Procedure Insert Pregunta
    $call = "CALL sp_insert_importes(:id_contrato, :p_ant, :p_gara, :p_iva, :t_ant, :t_fondo, :t_iva, :p_pend, :t_pend)";
    
    $stmt = $this->conn->prepare($call);
     
    // sanitize
    $this->id_contrato=htmlspecialchars(strip_tags($this->id_contrato));
    $this->p_anticipo=htmlspecialchars(strip_tags($this->p_anticipo));  
    $this->p_iva=htmlspecialchars(strip_tags($this->p_iva));
    $this->p_fondo=htmlspecialchars(strip_tags($this->p_fondo));
    $this->p_pendiente=htmlspecialchars(strip_tags($this->p_pendiente));
    $this->m_anticipo=htmlspecialchars(strip_tags($this->m_anticipo)); 
    $this->m_iva=htmlspecialchars(strip_tags($this->m_iva)); 
    $this->m_fondo=htmlspecialchars(strip_tags($this->m_fondo));
    $this->m_pendiente=htmlspecialchars(strip_tags($this->m_pendiente)); 
    
    // bind values
    $stmt->bindParam(":id_contrato", $this->id_contrato);
    $stmt->bindParam(":p_ant", $this->p_anticipo);
    $stmt->bindParam(":p_gara", $this->p_fondo);
    $stmt->bindParam(":p_iva", $this->p_iva);
    $stmt->bindParam(":t_ant", $this->m_anticipo);
    $stmt->bindParam(":t_fondo", $this->m_fondo);
    $stmt->bindParam(":t_iva", $this->m_iva);
    $stmt->bindParam(":p_pend", $this->p_pendiente);
    $stmt->bindParam(":t_pend", $this->m_pendiente);
 
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
                costo_actual,
                costo_tope,
                importe_renglon,
                detalle_contratos.id_contrato
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
    $call = 'CALL sp_update_cantidad_costo(:id_detalle,:cantidad_nueva)';
 
    // prepare query statement
    $stmt = $this->conn->prepare($call);
 
    // sanitize
    $this->id_detalle=htmlspecialchars(strip_tags($this->id_detalle));
    $this->cantidad=htmlspecialchars(strip_tags($this->cantidad_nueva));

    
 
    // bind new values
    $stmt->bindParam(':id_detalle', $this->id_detalle);
    $stmt->bindParam(':cantidad_nueva', $this->cantidad_nueva);
 
    // execute the query
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