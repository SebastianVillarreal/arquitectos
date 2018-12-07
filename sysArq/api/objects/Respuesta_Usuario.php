<?php
class Respuesta_Usuario{

    // database connection and table name
    private $conn;
    private $table_name = "Respuesta_Usuario";

    // object properties
    public $id_respuesta_usuario;
    public $id_encuesta;
    public $id_pregunta;
    public $id_respuesta;
    public $id_usuario;
    public $id_usuario_to;
    public $respuesta;

    public function __construct($db){
        $this->conn = $db;
    }
 // used by select drop-down list
public function read(){

    //select all data
    $query = "SELECT
                e.IDEncuesta, e.Nombre as Encuesta, p.IDPregunta, p.Pregunta, r.IDRespuesta, r.Respuesta, ru.IDRespuestaUsuario, ru.IDUsuario, ru.IDUsuarioTo
            FROM
                " . $this->table_name . " ru
                LEFT JOIN Respuesta r
                ON ru.IDEncuesta = r.IDEncuesta and ru.IDPregunta = r.IDPregunta and ru.IDRespuesta = r.IDRespuesta
                LEFT JOIN Pregunta p
                ON ru.IDEncuesta = p.IDEncuesta and ru.IDPregunta = p.IDPregunta
                LEFT JOIN Encuesta e
                ON ru.IDEncuesta = e.IDEncuesta
            ORDER BY
                ru.IDEncuesta,ru.IDPregunta,ru.IDRespuesta,ru.IDRespuestaUsuario DESC";

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
    $call = 'CALL sp_Alta_Respuesta_Usuario(:idu,:ide,:idp,:idr,:iduto,:resp)';

    $stmt = $this->conn->prepare($call);

    // sanitize
    $this->id_usuario=htmlspecialchars(strip_tags($this->id_usuario));
    $this->id_encuesta=htmlspecialchars(strip_tags($this->id_encuesta));
    $this->id_pregunta=htmlspecialchars(strip_tags($this->id_pregunta));
    $this->id_respuesta=htmlspecialchars(strip_tags($this->id_respuesta));
    $this->id_usuario_to=htmlspecialchars(strip_tags($this->id_usuario_to));
    $this->respuesta=htmlspecialchars(strip_tags($this->respuesta));

    // bind values
    $stmt->bindParam(":idu", $this->id_usuario);
    $stmt->bindParam(":ide", $this->id_encuesta);
    $stmt->bindParam(":idp", $this->id_pregunta);
    $stmt->bindParam(":idr", $this->id_respuesta);
    $stmt->bindParam(":iduto", $this->id_usuario_to);
    $stmt->bindParam(":resp", $this->respuesta);
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
                e.IDEncuesta, e.Nombre as Encuesta, p.IDPregunta, p.Pregunta, r.IDRespuesta, r.Respuesta, ru.IDRespuestaUsuario, ru.RIDUsuario, ru.IDUsuarioTo
            FROM
                " . $this->table_name . " ru
                LEFT JOIN Respuesta r
                ON ru.IDEncuesta = r.IDEncuesta and ru.IDPregunta = r.IDPregunta and ru.IDRespuesta = r.IDRespuesta
                LEFT JOIN Pregunta p
                ON ru.IDEncuesta = p.IDEncuesta and ru.IDPregunta = p.IDPregunta
                LEFT JOIN Encuesta e
                ON ru.IDEncuesta = e.IDEncuesta
            WHERE
                ru.IDRespuestaUsuario = :idru and ru.IDRespuesta = :idr and ru.IDEncuesta = :ide and ru.IDPregunta = :idp and ru.IDUsuario = :idu and ru.IDUsuarioTo = :idto
            LIMIT
                0,1";

    // prepare query statement
    $stmt = $this->conn->prepare( $query );


        // sanitize
    $this->id_pregunta=htmlspecialchars(strip_tags($this->id_pregunta));
    $this->id_encuesta=htmlspecialchars(strip_tags($this->id_encuesta));
    $this->id_usuario=htmlspecialchars(strip_tags($this->id_usuario));
    $this->id_usuario_to=htmlspecialchars(strip_tags($this->id_usuario_to));
    $this->id_respuesta=htmlspecialchars(strip_tags($this->id_respuesta));
    $this->id_respuesta_usuario=htmlspecialchars(strip_tags($this->id_respuesta_usuario));

    // bind new values
    $stmt->bindParam(':ide', $this->id_pregunta);
    $stmt->bindParam(':idp', $this->id_encuesta);
    $stmt->bindParam(':idu', $this->id_usuario);
    $stmt->bindParam(':iduto', $this->id_usuario_to);
    $stmt->bindParam(':idr', $this->id_respuesta);
    $stmt->bindParam(':idru', $this->id_respuesta_usuario);

    // execute query
    $stmt->execute();

    // get retrieved row
    $row = $stmt->fetch(PDO::FETCH_ASSOC);

    // set values to object properties
    $this->id_respuesta_usuario = $row['IDRespuestaUsuario'];
    $this->id_respuesta = $row['IDRespuesta'];
    $this->id_pregunta = $row['IDPregunta'];
    $this->id_encuesta = $row['IDEncuesta'];
    $this->id_usuario = $row['IDUsuario'];
    $this->id_usuario_to = $row['IDUsuarioTo'];
}
// update the product
function update(){


    //update procedure
    $call = 'CALL sp_Update_Respuesta_Usuario(:idu,:ide,:idp,:idr,:idru,iduto)';

    // prepare query statement
    $stmt = $this->conn->prepare($call);

    // sanitize
    $this->id_usuario=htmlspecialchars(strip_tags($this->id_usuario));
    $this->id_encuesta=htmlspecialchars(strip_tags($this->id_encuesta));
    $this->id_pregunta=htmlspecialchars(strip_tags($this->id_pregunta));
    $this->id_respuesta=htmlspecialchars(strip_tags($this->id_respuesta));
    $this->id_respuesta_usuario=htmlspecialchars(strip_tags($this->id_respuesta_usuario));
    $this->id_usuario_to=htmlspecialchars(strip_tags($this->id_usuario_to));

    // bind values
    $stmt->bindParam(":idu", $this->id_usuario);
    $stmt->bindParam(":ide", $this->id_encuesta);
    $stmt->bindParam(":idp", $this->id_pregunta);
    $stmt->bindParam(":idr", $this->id_respuesta);
    $stmt->bindParam(":idru", $this->id_respuesta_usuario);
    $stmt->bindParam(":iduto", $this->id_usuario_to);

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
                e.IDEncuesta, e.Nombre as Encuesta, p.IDPregunta, p.Pregunta, r.IDRespuesta, r.Respuesta, ru.IDRespuestaUsuario, ru.IDUsuario, ru.IDUsuarioTo
            FROM
                " . $this->table_name . " ru
                LEFT JOIN Respuesta r
                ON ru.IDEncuesta = r.IDEncuesta and ru.IDPregunta = r.IDPregunta and ru.IDRespuesta = r.IDRespuesta
                LEFT JOIN Pregunta p
                ON ru.IDEncuesta = p.IDEncuesta and ru.IDPregunta = p.IDPregunta
                LEFT JOIN Encuesta e
                ON ru.IDEncuesta = e.IDEncuesta
            WHERE
                r.Respuesta LIKE ? OR p.Pregunta LIKE ? OR e.Nombre LIKE ? OR ru.RespuestaUsuario LIKE ?
            ORDER BY
                ru.IDEncuesta,ru.IDPregunta,ru.IDRespuesta,ru.IDRespuestaUsuario DESC";

    // prepare query statement
    $stmt = $this->conn->prepare($query);

    // sanitize
    $keywords=htmlspecialchars(strip_tags($keywords));
    $keywords = "%{$keywords}%";

    // bind
    $stmt->bindParam(1, $keywords);
    $stmt->bindParam(2, $keywords);
    $stmt->bindParam(3, $keywords);
    $stmt->bindParam(4, $keywords);

    // execute query
    $stmt->execute();

    return $stmt;
}
// read products with pagination
public function readPaging($from_record_num, $records_per_page){

    // select query
    $query = "SELECT
                e.IDEncuesta, e.Nombre as Encuesta, p.IDPregunta, p.Pregunta, r.IDRespuesta, r.Respuesta, ru.IDRespuestaUsuario, ru.IDUsuario, ru.IDUsuarioTo
            FROM
                " . $this->table_name . " ru
                LEFT JOIN Respuesta r
                ON ru.IDEncuesta = r.IDEncuesta and ru.IDPregunta = r.IDPregunta and ru.IDRespuesta = r.IDRespuesta
                LEFT JOIN Pregunta p
                ON ru.IDEncuesta = p.IDEncuesta and ru.IDPregunta = p.IDPregunta
                LEFT JOIN Encuesta e
                ON ru.IDEncuesta = e.IDEncuesta
            ORDER BY ru.IDEncuesta,ru.IDPregunta,ru.IDRespuesta,ru.IDRespuestaUsuario DESC
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
