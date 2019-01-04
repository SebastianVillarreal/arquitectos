<?php 
	class lista_contrato
	{
		// database connection and table name
    	private $conn;
    	private $table_name = "lista_contratos";

    	//propiedades del objeto
    	public $nombre;
 
	    public function __construct($db){
	        $this->conn = $db;
	    }

	    function create(){
	    	$call = "CALL sp_insert_lista(:n)";
		    //$call = 'CALL sp_Alta_Encuesta(:nombre,:estatus,:fechalimite,:idarea,:idusuario)';
		    
		    $stmt = $this->conn->prepare($call);
		     
		    // sanitize
		    $this->nombre=htmlspecialchars(strip_tags($this->nombre));

		    
		    // bind values
		    $stmt->bindParam(":n", $this->nombre);
		 
		    // execute query
		    if($stmt->execute()){
		        return true;
		    }else{
		    	return false;
		    }
	    }
	    function read(){
	    	$call = "CALL sp_select_lista_contratos()";		    
		    $stmt = $this->conn->prepare($call);
		 	$stmt->execute();
		 	return $stmt;
	    }
	}
 ?>