<?php 
//include("conexion.php");
error_reporting(E_ALL ^ E_NOTICE);
include"../global_settings/conexion.php";
include"../PHPExcel/Classes/PHPExcel/IOFactory.php";
	include_once '../api/config/database.php';
	include_once '../api/objects/rayas.php';
date_default_timezone_set('America/Monterrey');
	// instantiate database and product object
setlocale (LC_TIME, "es_ES");
$fecha = date('Y-m-d');
$hora = date('H:i:s');
$fecha_inicial = $_POST['fecha_inicial'];
$fecha_final = $_POST['fecha_final'];
$sql = "SELECT id, nombre FROM proyectos WHERE activo = 1";
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

	
	/** Include PHPExcel */
	require_once '../PHPExcel/Classes/PHPExcel.php';

	// Create new PHPExcel object
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
		$objPHPExcel->getActiveSheet()->getStyle('A1:E1')->applyFromArray($styleArray);
		unset($styleArray);

	$styleArray = array(
		  'borders' => array(
		    'allborders' => array(
		      'style' => PHPExcel_Style_Border::BORDER_THIN
				    )
				  )
				);
		$objPHPExcel->getActiveSheet()->getStyle('A2:E2')->applyFromArray($styleArray);
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
	//junta celdas
	$objPHPExcel->getActiveSheet()->mergeCells('A1:E1');

	//relleno columnas
	$objPHPExcel->getActiveSheet()->getStyle('A2:E2')->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID);
	$objPHPExcel->getActiveSheet()->getStyle('A2:E2')->getFill()->getStartColor()->setARGB('A4A4A4');
	//aplica negritas
	$objPHPExcel->getActiveSheet()->getStyle('A2:E2')->getFont()->setSize(12)->setBold(true);
	//ENCABEZADOS
	$objPHPExcel->getActiveSheet()->setCellValue('A2', 'Proyecto');
	$objPHPExcel->getActiveSheet()->setCellValue('B2', 'Contratista');
	$objPHPExcel->getActiveSheet()->setCellValue('C2', 'Concepto');
	$objPHPExcel->getActiveSheet()->setCellValue('D2', 'Subtotal');
	$objPHPExcel->getActiveSheet()->setCellValue('E2', 'Total');


     $fila = 3;
     while ($row_proyecto = mysqli_fetch_row($exSql)) {
     		$fila_inicio = $fila;
     		$objPHPExcel->setActiveSheetIndex(0)
		   			->setCellValue('A'.$fila, $row_proyecto[1]);
		   			
   			$objPHPExcel->getActiveSheet()->getStyle('A'.$fila.':E'.$fila)->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID);
			$objPHPExcel->getActiveSheet()->getStyle('A'.$fila.':E'.$fila)->getFill()->getStartColor()->setARGB('70db70');
			$objPHPExcel->getActiveSheet()->mergeCells('A'.$fila.':C'.$fila);
		     		$database = new Database();
					$db = $database->getConnection();
					$rayas = new rayas($db);
      				$rayas->obra = $row_proyecto[0];
					$rayas->fecha_i = $fecha_inicial;
					$rayas->fecha_fin = $fecha_final;
				 	$stmt = $rayas->seleccionar_rayas();
					$fila = $fila + 1;
			while($row = $stmt->fetch(PDO::FETCH_NUM))
			{
				$objPHPExcel->setActiveSheetIndex(0)
		   			->setCellValue('A'.$fila, $row[1])
					->setCellValue('B'.$fila, $row[2])
					->setCellValue('C'.$fila, '')
					->setCellValue('D'.$fila, $row[3])
					->setCellValue('E'.$fila, $row[3]);
		  		$fila = $fila + 1;
			}
		     		$database = new Database();
					$db = $database->getConnection();
					$rayas = new rayas($db);
      				$rayas->obra = $row_proyecto[0];
					$rayas->fecha_i = $fecha_inicial;
					$rayas->fecha_fin = $fecha_final;
				 	$stmt = $rayas->seleccionar_anticipos();
		 	while ($row_anticipos = $stmt->fetch(PDO::FETCH_NUM)) {
		 		$objPHPExcel->setActiveSheetIndex(0)
		   			->setCellValue('A'.$fila, $row_anticipos[0])
					->setCellValue('B'.$fila, $row_anticipos[1])
					->setCellValue('C'.$fila, $row_anticipos[2])
					->setCellValue('D'.$fila, $row_anticipos[3])
					->setCellValue('E'.$fila, $row_anticipos[3]);
					$fila = $fila + 1;
		 	}

			$fila_fin = $fila- 1;
			$fila_i = $fila_inicio + 1;
			$objPHPExcel->setActiveSheetIndex(0)
     		->setCellValue('D'.$fila_inicio, '=SUM(D'.$fila_i.':D'.$fila_fin.')');
     }
     		$objPHPExcel->setActiveSheetIndex(0)
     			->setCellValue('A'.$fila, 'Extras');
 			$objPHPExcel->getActiveSheet()->getStyle('A'.$fila.':E'.$fila)->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID);
			$objPHPExcel->getActiveSheet()->getStyle('A'.$fila.':E'.$fila)->getFill()->getStartColor()->setARGB('70db70');
			$objPHPExcel->getActiveSheet()->mergeCells('A'.$fila.':C'.$fila);
			$fila = $fila + 1;
		 	$qry  = "SELECT
						folio_erp,
						SUM( total ) 
					FROM
						captura_rayas_extras
					WHERE fecha BETWEEN '$fecha_inicial' AND '$fecha_final'	
					GROUP BY
						folio_erp";
			$exQry = mysqli_query($conexion, $qry);
		 	while ($row_extras = mysqli_fetch_row($exQry)) {
		 		$objPHPExcel->setActiveSheetIndex(0)
		   			->setCellValue('A'.$fila, "N/A")
					->setCellValue('B'.$fila, "N/A")
					->setCellValue('C'.$fila, "Estimacion capturada. Folio ERP: ". $row_extras[0])
					->setCellValue('D'.$fila, $row_extras[1])
					->setCellValue('E'.$fila, $row_extras[1]);
					$fila = $fila + 1;
		 	}

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
	$objWriter->save('php://output');
	exit;
?>