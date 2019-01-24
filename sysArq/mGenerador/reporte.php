<?php 
//include("conexion.php");
error_reporting(E_ALL ^ E_NOTICE);
include"../global_settings/conexion.php";
include"../PHPExcel/Classes/PHPExcel/IOFactory.php";
date_default_timezone_set('America/Monterrey');
$fecha = date('Y-m-d');
$hora = date('H:i:s');




$consulta_principal  = "SELECT proyectos.nombre, contratistas.persona_moral, personas.nombre, personas.ap_paterno, 					   contratos.id, contratos.descripcion, contratos.fecha, 
						usuarios.nombre_usuario
						FROM contratos 
						INNER JOIN proyectos ON contratos.nombre = proyectos.id 
						INNER JOIN contratistas ON contratos.contratista = contratistas.id
						INNER JOIN usuarios ON contratos.usuario_modifica = usuarios.nombre_usuario	
						INNER JOIN personas ON usuarios.id_persona = personas.id
						WHERE contratos.id = 1 " ;

$consulta_sec			= "SELECT conceptos.id, conceptos.concepto, conceptos.descripcion_larga, conceptos.unidad, 						   detalle_contratos.cantidad, conceptos.cantidad_original, CONCAT('$',detalle_contratos.costo_actual), CONCAT('$',detalle_contratos.importe_renglon), CONCAT('$',detalle_contratos.costo_tope), detalle_contratos.id_contrato
							FROM detalle_contratos
							INNER JOIN conceptos ON detalle_contratos.concepto = conceptos.id
							WHERE detalle_contratos.id_contrato = 1";

$consulta_ter 			= "SELECT tipo_concepto, CONCAT('$',importe_renglon), CONCAT('$',FORMAT(SUM(								  	   importe_renglon),2)) FROM detalle_contratos WHERE id_contrato = 1 
						   GROUP BY tipo_concepto";

$consulta_for		    = "SELECT CONCAT('$',FORMAT(SUM(importe_renglon),2)) FROM detalle_contratos;";



							//echo "$consulta_principal";

	$stmt = mysqli_query($conexion, $consulta_principal);
	$stmt2 = mysqli_query($conexion, $consulta_sec);
	$stmt3 = mysqli_query($conexion, $consulta_ter);
	$stmt4 =mysqli_query($conexion, $consulta_for);
	
	/** Error reporting */
	//error_reporting(E_ALL);
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
		$objPHPExcel->getActiveSheet()->getStyle('A1:B1')->applyFromArray($styleArray);
		unset($styleArray);

	$styleArray = array(
		  'borders' => array(
		    'allborders' => array(
		      'style' => PHPExcel_Style_Border::BORDER_THIN
				    )
				  )
				);
		$objPHPExcel->getActiveSheet()->getStyle('A2:B8')->applyFromArray($styleArray);
		unset($styleArray);

		$styleArray = array(
		  'borders' => array(
		    'allborders' => array(
		      'style' => PHPExcel_Style_Border::BORDER_THIN
				    )
				  )
				);
		$objPHPExcel->getActiveSheet()->getStyle('J1:N6')->applyFromArray($styleArray);
		unset($styleArray);

		$styleArray = array(
		  'borders' => array(
		    'allborders' => array(
		      'style' => PHPExcel_Style_Border::BORDER_THIN
				    )
				  )
				);
		$objPHPExcel->getActiveSheet()->getStyle('A12:K37')->applyFromArray($styleArray);
		unset($styleArray);

		$styleArray = array(
		  'borders' => array(
		    'allborders' => array(
		      'style' => PHPExcel_Style_Border::BORDER_THIN
				    )
				  )
				);
		$objPHPExcel->getActiveSheet()->getStyle('E42:J42')->applyFromArray($styleArray);
		unset($styleArray);

		$styleArray = array(
		  'borders' => array(
		    'allborders' => array(
		      'style' => PHPExcel_Style_Border::BORDER_THIN
				    )
				  )
				);
		$objPHPExcel->getActiveSheet()->getStyle('E44:J50')->applyFromArray($styleArray);
		unset($styleArray);




		
	$objPHPExcel->getActiveSheet()->setCellValue('A1', 'CONTRATOS DE PROVEEDORES');
	$objPHPExcel->getActiveSheet()->getStyle("A1", 'CONTRATOS DE PROVEEDORES')->getFont()->setSize(16)->setBold(true);
	$objPHPExcel->getActiveSheet()->getStyle('A1')->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID);
	$objPHPExcel->getActiveSheet()->getStyle('A1')->getFill()->getStartColor()->setARGB('70db70');
	//junta celdas
	$objPHPExcel->getActiveSheet()->mergeCells('A1:B1');
	$objPHPExcel->getActiveSheet()->mergeCells('E42:I42');
	$objPHPExcel->getActiveSheet()->mergeCells('E44:J44');
	$objPHPExcel->getActiveSheet()->mergeCells('E45:J45');
	$objPHPExcel->getActiveSheet()->mergeCells('E46:H46');
	$objPHPExcel->getActiveSheet()->mergeCells('E47:H47');
	$objPHPExcel->getActiveSheet()->mergeCells('E48:I48');
	$objPHPExcel->getActiveSheet()->mergeCells('E49:H49');
	$objPHPExcel->getActiveSheet()->mergeCells('E50:I50');
	$objPHPExcel->getActiveSheet()->mergeCells('K6:L6');


	//relleno columnas
	$objPHPExcel->getActiveSheet()->getStyle('A2:A8')->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID);
	$objPHPExcel->getActiveSheet()->getStyle('A2:A8')->getFill()->getStartColor()->setARGB('e5e5cc');

	$objPHPExcel->getActiveSheet()->getStyle('G13:G37')->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID);
	$objPHPExcel->getActiveSheet()->getStyle('G13:G37')->getFill()->getStartColor()->setARGB('e5e5cc');

	$objPHPExcel->getActiveSheet()->getStyle('I13:I37')->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID);
	$objPHPExcel->getActiveSheet()->getStyle('I13:I37')->getFill()->getStartColor()->setARGB('e5e5cc');

	$objPHPExcel->getActiveSheet()->getStyle('J13:J37')->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID);
	$objPHPExcel->getActiveSheet()->getStyle('J13:J37')->getFill()->getStartColor()->setARGB('e5e5cc');

	$objPHPExcel->getActiveSheet()->getStyle('A12:K12')->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID);
	$objPHPExcel->getActiveSheet()->getStyle('A12:K12')->getFill()->getStartColor()->setARGB('70db70');

	$objPHPExcel->getActiveSheet()->getStyle('J1:N1')->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID);
	$objPHPExcel->getActiveSheet()->getStyle('J1:N1')->getFill()->getStartColor()->setARGB('70db70');

	$objPHPExcel->getActiveSheet()->getStyle('E42:J42')->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID);
	$objPHPExcel->getActiveSheet()->getStyle('E42:J42')->getFill()->getStartColor()->setARGB('70db70');

	$objPHPExcel->getActiveSheet()->getStyle('E44:J44')->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID);
	$objPHPExcel->getActiveSheet()->getStyle('E44:J44')->getFill()->getStartColor()->setARGB('70db70');

	$objPHPExcel->getActiveSheet()->getStyle('J5:M5')->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID);
	$objPHPExcel->getActiveSheet()->getStyle('J5:M5')->getFill()->getStartColor()->setARGB('ff6666');
	
	//aplica negritas
	$objPHPExcel->getActiveSheet()->setCellValue('A2', 'Proyecto');
	$objPHPExcel->getActiveSheet()->getStyle("A2", 'Proyecto')->getFont()->setSize(12)->setBold(true);

	$objPHPExcel->getActiveSheet()->setCellValue('A3', 'Contratista');
	$objPHPExcel->getActiveSheet()->getStyle("A3", 'Contratista')->getFont()->setSize(12)->setBold(true);

	$objPHPExcel->getActiveSheet()->setCellValue('A4', 'Residente');
	$objPHPExcel->getActiveSheet()->getStyle("A4", 'Residente')->getFont()->setSize(12)->setBold(true);

	$objPHPExcel->getActiveSheet()->setCellValue('A5', 'Folio');
	$objPHPExcel->getActiveSheet()->getStyle("A5", 'Folio')->getFont()->setSize(12)->setBold(true);

	$objPHPExcel->getActiveSheet()->setCellValue('A6', 'Descripción');
	$objPHPExcel->getActiveSheet()->getStyle("A6", 'Descripción')->getFont()->setSize(12)->setBold(true);

	$objPHPExcel->getActiveSheet()->setCellValue('A7', 'Fecha');
	$objPHPExcel->getActiveSheet()->getStyle("A7", 'Fecha')->getFont()->setSize(12)->setBold(true);

	$objPHPExcel->getActiveSheet()->setCellValue('A8', 'Usuario');
	$objPHPExcel->getActiveSheet()->getStyle("A8", 'Usuario')->getFont()->setSize(12)->setBold(true);

	$objPHPExcel->getActiveSheet()->setCellValue('J1', 'TIPO');
	$objPHPExcel->getActiveSheet()->getStyle("J1", 'TIPO')->getFont()->setSize(14)->setBold(true);

	$objPHPExcel->getActiveSheet()->setCellValue('J2', 'A');
	$objPHPExcel->getActiveSheet()->getStyle("J2", 'A')->getFont()->setBold(true);

	$objPHPExcel->getActiveSheet()->setCellValue('J3', 'B');
	$objPHPExcel->getActiveSheet()->getStyle("J3", 'B')->getFont()->setBold(true);

	$objPHPExcel->getActiveSheet()->setCellValue('J4', 'C');
	$objPHPExcel->getActiveSheet()->getStyle("J4", 'C')->getFont()->setBold(true);

	$objPHPExcel->getActiveSheet()->setCellValue('J5', 'D');
	$objPHPExcel->getActiveSheet()->getStyle("J5", 'D')->getFont()->setBold(true);

	$objPHPExcel->getActiveSheet()->setCellValue('K1', 'CONTRATOS');
	$objPHPExcel->getActiveSheet()->getStyle("K1", 'CONTRATOS')->getFont()->setSize(14)->setBold(true);

	$objPHPExcel->getActiveSheet()->setCellValue('M1', 'SALDO');
	$objPHPExcel->getActiveSheet()->getStyle("M1", 'SALDO')->getFont()->setSize(14)->setBold(true);

	$objPHPExcel->getActiveSheet()->setCellValue('A12', 'Renglon(Contrato)');
	$objPHPExcel->getActiveSheet()->getStyle("A12", 'Renglon(Contrato)')->getFont()->setSize(14)->setBold(true);

	$objPHPExcel->getActiveSheet()->setCellValue('D12', 'Descripción Larga');
	$objPHPExcel->getActiveSheet()->getStyle("D12", 'Descripción Larga')->getFont()->setSize(14)->setBold(true);

	$objPHPExcel->getActiveSheet()->setCellValue('F12', 'Cantidad');
	$objPHPExcel->getActiveSheet()->getStyle("F12", 'Cantidad')->getFont()->setSize(14)->setBold(true);

	$objPHPExcel->getActiveSheet()->setCellValue('I12', 'Costo');
	$objPHPExcel->getActiveSheet()->getStyle("I12", 'Costo')->getFont()->setSize(14)->setBold(true);

	$objPHPExcel->getActiveSheet()->setCellValue('J12', 'Importe');
	$objPHPExcel->getActiveSheet()->getStyle("J12", 'Importe')->getFont()->setSize(14)->setBold(true);

	$objPHPExcel->getActiveSheet()->setCellValue('K12', 'Total Contratos');
	$objPHPExcel->getActiveSheet()->getStyle("K12", 'Total Contratos')->getFont()->setSize(14)->setBold(true);

	$objPHPExcel->getActiveSheet()->setCellValue('I39', 'SUB TOTAL');
	$objPHPExcel->getActiveSheet()->getStyle("I39", 'SUB TOTAL')->getFont()->setSize(14)->setBold(true);

	$objPHPExcel->getActiveSheet()->setCellValue('I40', 'IVA');
	$objPHPExcel->getActiveSheet()->getStyle("I40", 'IVA')->getFont()->setSize(14)->setBold(true);

	$objPHPExcel->getActiveSheet()->setCellValue('E42', 'GRAN TOTAL PRESUPUESTO');
	$objPHPExcel->getActiveSheet()->getStyle("E42", 'GRAN TOTAL PRESUPUESTO')->getFont()->setSize(14)->setBold(true);

	$objPHPExcel->getActiveSheet()->setCellValue('E44', 'RESUMEN');
	$objPHPExcel->getActiveSheet()->getStyle("E44", 'RESUMEN')->getFont()->setSize(14)->setBold(true);


	//Add some data
	$objPHPExcel->setActiveSheetIndex(0)
				          

	            //tabla superior derecha
	            ->setCellValue('K2', 'CTO. NORMAL')
	            ->setCellValue('K3', 'CTO. EXTRA CLIENTE')
	            ->setCellValue('K4', 'CTO. EXTRA OF.')
	            ->setCellValue('K5', 'CTO.EXCEDIDO')

	            //tabla centro
	            //renglones del contrato
	            ->setCellValue('A13', '1')
	            ->setCellValue('A14', '2')
	            ->setCellValue('A15', '3')
	            ->setCellValue('A16', '4')
	            ->setCellValue('A17', '5')
	            ->setCellValue('A18', '6')
	            ->setCellValue('A19', '7')
	            ->setCellValue('A20', '8')
	            ->setCellValue('A21', '9')
	            ->setCellValue('A22', '10')
	            ->setCellValue('A23', '11')
	            ->setCellValue('A24', '12')
	            ->setCellValue('A25', '13')
	            ->setCellValue('A26', '14')
	            ->setCellValue('A27', '15')
	            ->setCellValue('A28', '16')
	            ->setCellValue('A29', '17')
	            ->setCellValue('A30', '18')
	            ->setCellValue('A31', '19')
	            ->setCellValue('A32', '20')
	            ->setCellValue('A33', '21')
	            ->setCellValue('A34', '22')
	            ->setCellValue('A35', '23')
	            ->setCellValue('A36', '24')
	            ->setCellValue('A37', '25')


	            ->setCellValue('B12', 'Descripción Partida')
	            ->setCellValue('C12', 'Concepto')
	            ->setCellValue('E12', 'Unidad')
	            ->setCellValue('G12', 'Cantidad O.C.')
	            ->setCellValue('H12', 'Costo Actual(Presupuesto)')
	            ->setCellValue('N1', '%')
	            

	            //Subtotal,IVA y GRAN TOTAL PRESUPUESTO
	            
	            ->setCellValue('J39', '$0.00')
	            ->setCellValue('J40', '$0.00')
	            
	            ->setCellValue('J42', '$')
	            
	            //resumen
	            ->setCellValue('E46', 'ANTICIPO')
	            ->setCellValue('J46', '$')
	            ->setCellValue('E47', 'ESTIMADO')
	            ->setCellValue('J47', '$')
	            ->setCellValue('E48', 'AMORTIZADO')
	            ->setCellValue('J48', '$')
	            ->setCellValue('E49', 'RETENCIÓN')
	            ->setCellValue('J49', '$')
	            ->setCellValue('E50', 'SUBTOTAL')
	            ->setCellValue('J50', '$');


 $row_principal = mysqli_fetch_row($stmt);
 $objPHPExcel->setActiveSheetIndex(0)
	           ->setCellValue('B2', $row_principal[0])
	           ->setCellValue('B3', $row_principal[1])
	           ->setCellValue('B4', $row_principal[2] .=' ' . $row_principal[3])
	           ->setCellValue('B5', $row_principal[4])
	           ->setCellValue('B6', $row_principal[5])
	           ->setCellValue('B7', $row_principal[6])
	           ->setCellValue('B8', $row_principal[7]);

	         $fila = 13;
			while($row_sec = mysqli_fetch_row($stmt2))
			{
		  			 $objPHPExcel->setActiveSheetIndex(0)
		   			   ->setCellValue('C'.$fila, $row_sec[1])
		   			   ->setCellValue('D'.$fila, $row_sec[2])
		   			   ->setCellValue('E'.$fila, $row_sec[3])
		   			   ->setCellValue('F'.$fila, $row_sec[4])
		   			   ->setCellValue('G'.$fila, $row_sec[5])
		   			   ->setCellValue('H'.$fila, $row_sec[6])
		   			   ->setCellValue('I'.$fila, $row_sec[7])
		   			   ->setCellValue('J'.$fila, $row_sec[8]);

					  $fila = $fila + 1;
			}


            $fila =2;
			while($row_ter = mysqli_fetch_row($stmt3)) {
			 $objPHPExcel->setActiveSheetIndex(0)
			 			 ->setCellValue('M'.$fila, $row_ter[2]);
 			 $fila = $fila + 1;
			}

			$row_for = mysqli_fetch_row($stmt4);
 			$objPHPExcel->setActiveSheetIndex(0)
	           ->setCellValue('M6', $row_for[0]);


	


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

    	$objPHPExcel->getActiveSheet()
    		->getColumnDimension('F')
    		->setAutoSize(true); 

    	$objPHPExcel->getActiveSheet()
    		->getColumnDimension('G')
    		->setAutoSize(true);

    	$objPHPExcel->getActiveSheet()
    		->getColumnDimension('H')
    		->setAutoSize(true);

    	$objPHPExcel->getActiveSheet()
    		->getColumnDimension('I')
    		->setAutoSize(true);

    	$objPHPExcel->getActiveSheet()
    		->getColumnDimension('J')
    		->setAutoSize(true);  

    	$objPHPExcel->getActiveSheet()
    		->getColumnDimension('K')
    		->setAutoSize(true); 

    	$objPHPExcel->getActiveSheet()
    		->getColumnDimension('M')
    		->setAutoSize(true); 

    	$objPHPExcel->getActiveSheet()
    		->getColumnDimension('N')
    		->setAutoSize(false);  

    	$objPHPExcel->getActiveSheet()
    		->getColumnDimension('O')
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