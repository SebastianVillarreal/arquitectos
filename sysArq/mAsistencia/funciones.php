<?php 
	function letras_numeros($numero)
	{
		if ($numero >= 65 && $numero <=90 ) {
			$valor = chr($numero);
		}elseif($numero >= 91 && $numero<= 116){
			$valor = "A".chr(($numero-90)+64);
		}elseif($numero >=117 && $numero <=142){
			$valor = "B".chr(($numero-90)+38);
		}elseif($numero >=143 && $numero <=168){
			$valor = "C".chr(($numero -90) + 12);
		}elseif($numero >= 169 && $numero <= 194){
			$valor = "D".chr(($numero - 90) - 14);
		}elseif($numero >= 195 && $numero <= 220){
			$valor = "E".chr(($numero - 90) -40);
		}elseif ($numero >=221 && $numero<=246) {
			$valor = "F".chr(($numero-90) -66);
		}elseif($numero >=247 && $numero <= 272){
			$valor = "G".chr(($numero-90) - 92);
		}
		return $valor;
	}


 ?>			