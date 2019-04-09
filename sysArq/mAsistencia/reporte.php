<?php 
//include("conexion.php");
error_reporting(E_ALL ^ E_NOTICE);
include"../global_settings/conexion.php";
include"../PHPExcel/Classes/PHPExcel/IOFactory.php";
	include_once '../api/config/database.php';
	include_once '../api/objects/rayas.php';
	include_once 'funciones.php';
date_default_timezone_set('America/Monterrey');
	// instantiate database and product object
setlocale (LC_TIME, "es_ES");
$fecha = date('Y-m-d');
$hora = date('H:i:s');
$fecha_inicial = $_POST['fecha_inicial'];
$fecha_final = $_POST['fecha_final'];
$contratista = $_POST['contratista'];
	$database = new Database();
	$db = $database->getConnection();
	$rayas = new rayas($db);
	$rayas->obra = 1;
	$rayas->contratista = $contratista;
	$rayas->fecha_i = $fecha_inicial;
	$rayas->fecha_fin = $fecha_final;
	$stmt = $rayas->datos_reportes();
	$sql = "SELECT
			proyectos.id,
			proyectos.nombre 
		FROM
			empleados_contratistas
		INNER JOIN asistencias_contratistas ON asistencias_contratistas.id_usuario = empleados_contratistas.id
		INNER JOIN proyectos ON proyectos.id = asistencias_contratistas.id_obra 
		GROUP BY
			proyectos.id";
$exSql = mysqli_query($conexion, $sql);

$ddate = $fecha_inicial;
$date = new DateTime($ddate);
$week = $date->format("W");
$month = $date->format("F");
$dia = $date->format("d");
$df =  new DateTime($fecha_final);
$dia_fin = $df->format("d");
$month_fin =$df->format("F");

 	// initialize object



	/** Error reporting */
	error_reporting(E_ALL);
	 ini_set('max_execution_time', 1000); 
	ini_set('display_errors', TRUE);
	ini_set('display_startup_errors', TRUE);
	date_default_timezone_set('Europe/London');
	ini_set('memory_limit', '-1');

	
	// /** Include PHPExcel */
	require_once '../PHPExcel/Classes/PHPExcel.php';

	// // Create new PHPExcel object
	$objPHPExcel = new PHPExcel();

	// // Set document properties
	$objPHPExcel->getProperties()->setCreator("Origen")
								 ->setLastModifiedBy("Origen")
								 ->setTitle("Reporte de Contratos")
								 ->setSubject("Contratos")
								 ->setDescription("Reporte de Contratos")
								 ->setKeywords("office PHPExcel php")
								 ->setCategory("Reportes");

	//Bordes de las celdas
		$styleArray = array(
		  'borders' => array(
		    'allborders' => array(
		      'style' => PHPExcel_Style_Border::BORDER_THIN
				    )
				  )
				);
		$objPHPExcel->getActiveSheet()->getStyle('A1:D1')->applyFromArray($styleArray);
		unset($styleArray);

	$styleArray = array(
		  'borders' => array(
		    'allborders' => array(
		      'style' => PHPExcel_Style_Border::BORDER_THIN
				    )
				  )
				);
		$objPHPExcel->getActiveSheet()->getStyle('A2:D2')->applyFromArray($styleArray);
		unset($styleArray);

		$styleArray = array(
		  'borders' => array(
		    'allborders' => array(
		      'style' => PHPExcel_Style_Border::BORDER_THIN
				    )
				  )
				);




		
	// $objPHPExcel->getActiveSheet()->setCellValue('A1', 'SEM-' . $week. ' RAYAS DEL '.$dia. ' de '.$month.' hasta el '. $dia_fin.' de '.$month_fin);
	 $objPHPExcel->getActiveSheet()->setCellValue('A1', 'SEM-' . $week. ' RAYAS DEL '.$fecha_inicial. ' hasta el '. $fecha_final);
	$objPHPExcel->getActiveSheet()->getStyle("A1")->getFont()->setSize(12)->setBold(true);
	$objPHPExcel->getActiveSheet()->getStyle('A1')->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID);
	$objPHPExcel->getActiveSheet()->getStyle('A1')->getFill()->getStartColor()->setARGB('5FB404');
	//$objPHPExcel->getActiveSheet()->getStyle('D2')->getFill()->getStartColor()->setARGB('40FF00');
	//junta celdas
	$objPHPExcel->getActiveSheet()->mergeCells('A1:F1');

	// //relleno columnas
	$objPHPExcel->getActiveSheet()->getStyle('A2:E2')->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID);
	$objPHPExcel->getActiveSheet()->getStyle('A2:C2')->getFill()->getStartColor()->setARGB('A4A4A4');
	//aplica negritas
	$objPHPExcel->getActiveSheet()->getStyle('A2:E2')->getFont()->setSize(12)->setBold(true);
	//ENCABEZADOS
	$objPHPExcel->getActiveSheet()
		->setCellValue('A2', 'Nombre')
		->setCellValue('B2', 'Puesto')
		->setCellValue('C2', 'Sueldo');
		$fila = 4;
		while ($row_datos = $stmt->fetch(PDO::FETCH_NUM)) {
				$objPHPExcel->getActiveSheet()
					->setCellValue('A'.$fila, $row_datos[0])
					->setCellValue('B'.$fila, $row_datos[1])
					->setCellValue('C'.$fila, $row_datos[2]);
					if ($row_datos[10] != 0) {
						$objPHPExcel->getActiveSheet()->getStyle('A'.$fila)->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID);
					$objPHPExcel->getActiveSheet()->getStyle('A'.$fila)->getFill()->getStartColor()->setARGB('DF0101');
					}
				$fila = $fila +1;
		}
		
		
 		 	$i = 68;
		 	$j = 68;
		 	$letra = letras_numeros($i);
		while ($row_obras = mysqli_fetch_row($exSql)) {
			$objPHPExcel->getActiveSheet()
    		->getColumnDimension($letra)
    		->setAutoSize(true);
			$database = new Database();
			$db = $database->getConnection();
			$rayas = new rayas($db);
			$rayas->obra = $row_obras[0];
			$rayas->contratista = $contratista;
			$rayas->fecha_i = $fecha_inicial;
			$rayas->fecha_fin = $fecha_final;
			$stmt = $rayas->datos_reportes();

		 	$objPHPExcel->getActiveSheet()
					->setCellValue($letra.'3', 'J');
					$li = $letra;
					$i = $i + 1;
					$letra = letras_numeros($i);
			$objPHPExcel->getActiveSheet()
    		->getColumnDimension($letra)
    		->setAutoSize(true);
			$objPHPExcel->getActiveSheet()
					->setCellValue($letra.'3', 'V');
					$i = $i + 1;
					$letra = letras_numeros($i);
						$objPHPExcel->getActiveSheet()
    		->getColumnDimension($letra)
    		->setAutoSize(true);
			$objPHPExcel->getActiveSheet()
					->setCellValue($letra.'3', 'L');
					$i = $i + 1;
					$letra = letras_numeros($i);
			$objPHPExcel->getActiveSheet()
    		->getColumnDimension($letra)
    		->setAutoSize(true);
			$objPHPExcel->getActiveSheet()
					->setCellValue($letra.'3', 'M');
					$i = $i + 1;
					$letra = letras_numeros($i);
			$objPHPExcel->getActiveSheet()
    		->getColumnDimension($letra)
    		->setAutoSize(true);
			$objPHPExcel->getActiveSheet()
					->setCellValue($letra.'3', 'M');
					$lf = $letra;
					$i = $i + 1;
					$letra = letras_numeros($i);
					$objPHPExcel->getActiveSheet()
    				->getColumnDimension($letra)
    				->setAutoSize(true);
					
					$letter = letras_numeros($j);
					$fila = 4;
					$objPHPExcel->getActiveSheet()->mergeCells($li.'2:'.$lf.'2');
					$objPHPExcel->getActiveSheet()
					->setCellValue($li.'2', $row_obras[1]);

			while ($row_cantidad = $stmt->fetch(PDO::FETCH_NUM)) {
				$qry = "SELECT
							COUNT( * ) 
						FROM
							asistencias_contratistas 
						WHERE
							id_usuario = $row_cantidad[9]
							AND asistencia = 1 
							AND id_obra IS NOT NULL
							AND fecha BETWEEN '$fecha_inicial' AND '$fecha_final'";
				$exQry = mysqli_query($conexion, $qry);
				$row_total = mysqli_fetch_row($exQry);
				$li = $letter;
				
				//jueves
				if ($row_cantidad[3] == 1) {
					//asistencia
					$valor = 1;
					
				}elseif ($row_cantidad[3] == 0.5) {
					//retardo
					$valor = 1;
					$objPHPExcel->getActiveSheet()->getStyle($letter.$fila)->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID);
					$objPHPExcel->getActiveSheet()->getStyle($letter.$fila)->getFill()->getStartColor()->setARGB('DF0101');
				}elseif($row_cantidad[3] == 0){
					//falta
					$valor = 0;
				}
				$objPHPExcel->getActiveSheet()
					->setCellValue($letter.$fila, $valor);
				 $j = $j + 1;
				 $letter = letras_numeros($j);

				 //Viernes
				if ($row_cantidad[4] == 1) {
					//asistencia
					$valor = 1;
					
				}elseif ($row_cantidad[4] == 0.5) {
					//retardo
					$valor = 1;
					$objPHPExcel->getActiveSheet()->getStyle($letter.$fila)->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID);
					$objPHPExcel->getActiveSheet()->getStyle($letter.$fila)->getFill()->getStartColor()->setARGB('DF0101');
				}elseif($row_cantidad[4] == 0){
					//falta
					$valor = 0;
				}
				$objPHPExcel->getActiveSheet()
					->setCellValue($letter.$fila, $valor);
				$j = $j + 1;
				 $letter = letras_numeros($j);

				 //Lunes
				if ($row_cantidad[5] == 1) {
					//asistencia
					$valor = 1;
					
				}elseif ($row_cantidad[5] == 0.5) {
					//retardo
					$valor = 1;
					$objPHPExcel->getActiveSheet()->getStyle($letter.$fila)->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID);
					$objPHPExcel->getActiveSheet()->getStyle($letter.$fila)->getFill()->getStartColor()->setARGB('DF0101');
				}elseif($row_cantidad[5] == 0){
					//falta
					$valor = 0;
				}
				$objPHPExcel->getActiveSheet()
					
					->setCellValue($letter.$fila, $valor);
				$j = $j + 1;
				 $letter = letras_numeros($j);

				 //Martes
				if ($row_cantidad[6] == 1) {
					//asistencia
					$valor = 1;
					
				}elseif ($row_cantidad[6] == 0.5) {
					//retardo
					$valor = 1;
					$objPHPExcel->getActiveSheet()->getStyle($letter.$fila)->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID);
					$objPHPExcel->getActiveSheet()->getStyle($letter.$fila)->getFill()->getStartColor()->setARGB('DF0101');
				}elseif($row_cantidad[6] == 0){
					//falta
					$valor = 0;
				}
				$objPHPExcel->getActiveSheet()
					
					->setCellValue($letter.$fila, $valor);
				$j = $j + 1;
				 $letter = letras_numeros($j);


				 //Miercoles
				if ($row_cantidad[7] == 1) {
					//asistencia
					$valor = 1;
					
				}elseif ($row_cantidad[7] == 0.5) {
					//retardo
					$valor = 1;
					$objPHPExcel->getActiveSheet()->getStyle($letter.$fila)->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID);
					$objPHPExcel->getActiveSheet()->getStyle($letter.$fila)->getFill()->getStartColor()->setARGB('DF0101');
				}elseif($row_cantidad[7] == 0){
					//falta
					$valor = 0;
				}
				$objPHPExcel->getActiveSheet()
					->setCellValue($letter.$fila, $valor);
					$lf = $letter;
				 $j = $j + 1;
				  $letter = letras_numeros($j);
				  $objPHPExcel->getActiveSheet()
					//->setCellValue($letter.$fila, "=SUMA("."D".$fila.":".$lf.$fila.")");
					->setCellValue($letter.$fila, $row_total[0]);

					$j = $j + 1;
					$letter = letras_numeros($j);
					 $k = $j-1;
					 $ll = letras_numeros($k);
						
					 $objPHPExcel->getActiveSheet()
					 ->setCellValue($letter.$fila, "=(C".$fila."*".$ll.$fila.")");
					 $j = $j + 1;
					$letter = letras_numeros($j);
				 $j = $j -7;
				 $fila = $fila +1;
				 $letter = letras_numeros($j);
			}
			//$fila = $fila +1;
			$j = $j + 5;
			$letter = letras_numeros($j);
		}

		$objPHPExcel->getActiveSheet()
		->setCellValue($letra.'2', 'Total');
		$i = $i +1;
		$letra = letras_numeros($i);
		$objPHPExcel->getActiveSheet()
		->setCellValue($letra.'2', 'Pagar');
		//$objPHPExcel->getActiveSheet(0)->getCell('X4')->getCalculatedValue();

   //   $fila = 3;
   //   while ($row_proyecto = mysqli_fetch_row($exSql)) {
   //   		$fila_inicio = $fila;
   //   		$objPHPExcel->setActiveSheetIndex(0)
		 //   			->setCellValue('A'.$fila, $row_proyecto[1]);
		   			
   // 			$objPHPExcel->getActiveSheet()->getStyle('A'.$fila.':E'.$fila)->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID);
			// $objPHPExcel->getActiveSheet()->getStyle('A'.$fila.':E'.$fila)->getFill()->getStartColor()->setARGB('70db70');
			// $objPHPExcel->getActiveSheet()->mergeCells('A'.$fila.':C'.$fila);
		 //     		$database = new Database();
			// 		$db = $database->getConnection();
			// 		$rayas = new rayas($db);
   //    				$rayas->obra = $row_proyecto[0];
			// 		$rayas->fecha_i = $fecha_inicial;
			// 		$rayas->fecha_fin = $fecha_final;
			// 	 	$stmt = $rayas->seleccionar_rayas();
			// 		$fila = $fila + 1;
			// while($row = $stmt->fetch(PDO::FETCH_NUM))
			// {
			// 	$objPHPExcel->setActiveSheetIndex(0)
		 //   			->setCellValue('A'.$fila, $row[1])
			// 		->setCellValue('B'.$fila, $row[2])
			// 		->setCellValue('C'.$fila, '')
			// 		->setCellValue('D'.$fila, $row[3])
			// 		->setCellValue('E'.$fila, $row[3]);
		 //  		$fila = $fila + 1;
			// }
		 //     		$database = new Database();
			// 		$db = $database->getConnection();
			// 		$rayas = new rayas($db);
   //    				$rayas->obra = $row_proyecto[0];
			// 		$rayas->fecha_i = $fecha_inicial;
			// 		$rayas->fecha_fin = $fecha_final;
			// 	 	$stmt = $rayas->seleccionar_anticipos();
		 // 	while ($row_anticipos = $stmt->fetch(PDO::FETCH_NUM)) {
		 // 		$objPHPExcel->setActiveSheetIndex(0)
		 //   			->setCellValue('A'.$fila, $row_anticipos[0])
			// 		->setCellValue('B'.$fila, $row_anticipos[1])
			// 		->setCellValue('C'.$fila, $row_anticipos[2])
			// 		->setCellValue('D'.$fila, $row_anticipos[3])
			// 		->setCellValue('E'.$fila, $row_anticipos[3]);
			// 		$fila = $fila + 1;
		 // 	}
			// $fila_fin = $fila- 1;
			// $fila_i = $fila_inicio + 1;
			// $objPHPExcel->setActiveSheetIndex(0)
   //   		->setCellValue('D'.$fila_inicio, '=SUM(D'.$fila_i.':D'.$fila_fin.')');
   //   }
     





			


	 $objPHPExcel->getActiveSheet()
    		->getColumnDimension('A')
    		->setAutoSize(true);

    	$objPHPExcel->getActiveSheet()
    		->getColumnDimension('B')
    		->setAutoSize(true);

    	$objPHPExcel->getActiveSheet()
    		->getColumnDimension('C')
    		->setAutoSize(true);

    	$objPHPExcel->getActiveSheet()
    		->getColumnDimension('D')
    		->setAutoSize(true);

    	$objPHPExcel->getActiveSheet()
    		->getColumnDimension('E')
    		->setAutoSize(true);


	
	//Rename worksheet
	$objPHPExcel->getActiveSheet()->setTitle('Reporte');

	// // Set active sheet index to the first sheet, so Excel opens this as the first sheet
	$objPHPExcel->setActiveSheetIndex(0);

	// // Redirect output to a client’s web browser (Excel2007)
	header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
	header('Content-Disposition: attachment;filename="Reporte" '.$fecha.' ".xlsx"');
	header('Cache-Control: max-age=0');
	// If you're serving to IE 9, then the following may be needed
	header('Cache-Control: max-age=1');

	// If you're serving to IE over SSL, then the following may be needed
	header ('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
	header ('Last-Modified: '.gmdate('D, d M Y H:i:s').' GMT'); // always modified
	header ('Cache-Control: cache, must-revalidate'); // HTTP/1.1
	header ('Pragma: public'); // HTTP/1.0
	ob_clean();
	$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
	//$objWriter->writeAttribute('forceFullCalc', ($recalcRequired) ? 0 : 1);
	//$objWriter->setPreCalculateFormulas(true);
	//$objWriter->setPreCalculateFormulas(); 
	$objWriter->save('php://output');
	exit;
?>