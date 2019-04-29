<?php 
	/**
	 * 
	 */
	class Contratistas 
	{
		private $conn;
		private $table_name = "contratistas";

		//object properties
		public $nombre;
		public $ap_paterno;
		public $ap_materno;
		public $codigo;
		public $persona_moral;
		public $razon_social;
		public $usr;


		public function __construct($db)
		{
			$this->conn = $db;
		}

		public function create()
		{
			$call = "CALL sp_insert_contratista(:nombre, :ap_paterno, :ap_materno, :codigo, :razon, :id_usr, :p_moral)";
			$stmt = $this->conn->prepare($call);
			//sanitize
			$this->nombre=htmlspecialchars(strip_tags($this->nombre));
			$this->ap_paterno=htmlspecialchars(strip_tags($this->ap_paterno));
			$this->ap_materno=htmlspecialchars(strip_tags($this->ap_materno));
			$this->codigo=htmlspecialchars(strip_tags($this->codigo));
			$this->persona_moral=htmlspecialchars(strip_tags($this->persona_moral));
			$this->razon_social=htmlspecialchars(strip_tags($this->razon_social));
			
			//bind
			$stmt->bindParam(":nombre", $this->nombre);
			$stmt->bindParam(":ap_paterno", $this->ap_paterno);
			$stmt->bindParam(":ap_materno", $this->ap_materno);
			$stmt->bindParam(":codigo", $this->codigo);
			$stmt->bindParam(":razon", $this->razon_social);
			$stmt->bindParam(":id_usr", $this->usr);
			$stmt->bindParam(":p_moral", $this->persona_moral);
			//execute
			if ($stmt->execute()) {
				return true;
			}else{
				return false;
			}
		}

		public function read()
		{
			$call = "SELECT
						id,
						CONCAT( nombre, ' ', IFNULL( ap_paterno, '' ), ' ', IFNULL( ap_materno, '' ) ) 
					FROM
						contratistas 
					WHERE
						activo = 1";
			$stmt = $this->conn->prepare($call);
			$stmt->execute();
			return $stmt;
		}
	}
 ?>