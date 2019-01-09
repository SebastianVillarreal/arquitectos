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
    public $perfil_user;
    public $id_user;
    public $tipo_sp;
    public $id_proyecto;

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

// update the product
function update(){
 
    
    //update procedure
    $call = 'CALL sp_update_status(:id_contrato, :tipo, :fecha)';
 
    // prepare query statement
    $stmt = $this->conn->prepare($call);
 
    // sanitize
    $this->id_contrato=htmlspecialchars(strip_tags($this->id_contrato));
    $this->tipo=htmlspecialchars(strip_tags($this->tipo));
    //$this->fecha=htmlspecialchars(strip_tags($this->tipo));
 
    // bind new values
    $stmt->bindParam(':id_contrato', $this->id_contrato);
    $stmt->bindParam(':tipo', $this->tipo);
    $stmt->bindParam(':fecha', $this->fecha);
 
    // execute the query
    if($stmt->execute()){
        return true;
    }else{
        return false;
    }
 
    return false;
}

function rechazar_contrato(){
 
    
    //update procedure
    $call = 'CALL sp_rechazar_contrato(:id_c, :fecha)';
 
    // prepare query statement
    $stmt = $this->conn->prepare($call);
 
    // sanitize
    $this->id_contrato=htmlspecialchars(strip_tags($this->id_contrato));
 
    // bind new values
    $stmt->bindParam(':id_c', $this->id_contrato);
    $stmt->bindParam(':fecha', $this->fecha);
 
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

// used when filling up the update product form
function readOne(){
 
    // query to read single record
    $query = "SELECT
                    contratos.id,
                    contratos.nombre,
                    contratos.contratista,
                    usuarios.nombre_usuario,
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
                    (
                    SELECT
                        CONCAT( nombre, ' ', ap_paterno, ' ', ap_materno ) 
                    FROM
                        personas
                        INNER JOIN usuarios ON usuarios.id_persona = personas.id 
                    WHERE
                        usuarios.id = contratos.residente 
                    ),
                    CONCAT( contratistas.nombre, ' ', contratistas.ap_paterno, ' ', contratistas.ap_materno ),
                    contratos.fecha 
                FROM
                    contratos
                    INNER JOIN proyectos ON proyectos.id = contratos.nombre
                    INNER JOIN usuarios ON usuarios.id = contratos.residente
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

public function read(){

    $query = "CALL sp_select_contratos(:perfil, :usr, :id_usr)";
 
    $stmt = $this->conn->prepare( $query );
    $stmt->bindParam(':perfil', $this->perfil_user);
    $stmt->bindParam(':usr', $this->User_r);
    $stmt->bindParam(':id_usr', $this->id_user);
    $stmt->execute();
    return $stmt;
}

public function read_desarrollo(){

    $query = "CALL sp_select_contratos_desarrollo(:perfil, :usr, :id_usr)";
 
    $stmt = $this->conn->prepare( $query );
    $stmt->bindParam(':perfil', $this->perfil_user);
    $stmt->bindParam(':usr', $this->User_r);
    $stmt->bindParam(':id_usr', $this->id_user);
    $stmt->execute();
    return $stmt;
}

public function read_agrupado(){

    $query = "CALL sp_select_contratos_agrupado(:perfil, :usr, :id_usr)";
 
    $stmt = $this->conn->prepare( $query );
    $stmt->bindParam(':perfil', $this->perfil_user);
    $stmt->bindParam(':usr', $this->User_r);
    $stmt->bindParam(':id_usr', $this->id_user);
    $stmt->execute();
    return $stmt;
}

public function read_historial(){

    $query = "CALL sp_select_historial(:perfil, :usr, :id_usr)";
 
    $stmt = $this->conn->prepare( $query );
    $stmt->bindParam(':perfil', $this->perfil_user);
    $stmt->bindParam(':usr', $this->User_r);
    $stmt->bindParam(':id_usr', $this->id_user);
    $stmt->execute();
    return $stmt;
}

public function read_historial_filtro(){

    $query = "CALL sp_select_historial_filtro(:perfil, :usr, :id_usr, :proyecto)";
 
    $stmt = $this->conn->prepare( $query );
    $stmt->bindParam(':perfil', $this->perfil_user);
    $stmt->bindParam(':usr', $this->User_r);
    $stmt->bindParam(':id_usr', $this->id_user);
    $stmt->bindParam(':proyecto', $this->id_proyecto);
    $stmt->execute();
    return $stmt;
}

public function read_autorizados(){

    $query = "CALL sp_filtros_sp(:t_sp,:perfil, :usr, :id_usr)";
 
    $stmt = $this->conn->prepare( $query );
    $stmt->bindParam(':perfil', $this->perfil_user);
    $stmt->bindParam(':usr', $this->User_r);
    $stmt->bindParam(':id_usr', $this->id_user);
    $stmt->bindParam(':t_sp', $this->tipo_sp);
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