<?php 
	class proyectos 
	{
		// database connection and table name
    	private $conn;
    	private $table_name = "proeyctos";

    	//object properties
    	public $nombre;
    	public $usuario;
    	public $fecha;
		
		function __construct($db)
		{
			$this->conn = $db;
		}

		public function create()
		{
			$call = "CALL sp_insert_proyectos(:nombre, :usuario)";
			$stmt = $this->conn->prepare($call);
			$this->nombre=htmlspecialchars(strip_tags($this->nombre));
			$stmt->bindParam(":nombre", $this->nombre);
			$stmt->bindParam(":usuario", $this->usuario);

			if ($stmt->execute()) {
				return true;
			}else{
				return false;
			}

		}
		public function create_date()
		{
			$call = "CALL sp_insert_fecha(:fecha, :descripcion, :usuario)";
			$stmt = $this->conn->prepare($call);
			$this->nombre=htmlspecialchars(strip_tags($this->nombre));
			$this->fecha=htmlspecialchars(strip_tags($this->fecha));
			$stmt->bindParam(':descripcion', $this->nombre);
			$stmt->bindParam(':fecha', $this->fecha);
			$stmt->bindParam(':usuario', $this->usuario);
			if ($stmt->execute()) {
				return true;
			}else{
				return false;
			}

		}

		public function select_fechas()
		{
			$call = "CALL sp_select_fechas()";
			$stmt = $this->conn->prepare($call);
			$stmt->execute();
			return $stmt;
		}
		public function read()
		{
			$call = "SELECT id, nombre FROM proyectos WHERE activo = 1 AND nombre <>''";
			$stmt = $this->conn->prepare($call);
			$stmt->execute();
			return $stmt;
		}
	}
 ?>