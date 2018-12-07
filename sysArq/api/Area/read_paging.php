<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
 
// include database and object files
include_once '../config/core.php';
include_once '../shared/utilities.php';
include_once '../config/database.php';
include_once '../objects/Area.php';
 
// utilities
$utilities = new Utilities();
 
// instantiate database and product object
$database = new Database();
$db = $database->getConnection();
 
// initialize object
$area = new Area($db);
 
// query products
$stmt = $area->readPaging($from_record_num, $records_per_page);
$num = $stmt->rowCount();
 
// check if more than 0 record found
if($num>0){
 
    // products array
    $area_arr=array();
    $area_arr["records"]=array();
    $area_arr["paging"]=array();
 
    // retrieve our table contents
    // fetch() is faster than fetchAll()
    // http://stackoverflow.com/questions/2770630/pdofetchall-vs-pdofetch-in-a-loop
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
        // extract row
        // this will make $row['name'] to
        // just $name only
        extract($row);
 
        $area_item=array(
            "IDArea" => $IDArea,
            "Area" => $Area,
            "Estatus" => $Estatus
 
        );
 
        array_push($area_arr["records"], $area_item);
    }
 
 
    // include paging
    $total_rows=$area->count();
    $page_url="{$home_url}Area/read_paging.php?";
    $paging=$utilities->getPaging($page, $total_rows, $records_per_page, $page_url);
    $area_arr["paging"]=$paging;
 
    echo json_encode($area_arr);
}
 
else{
    echo json_encode(
        array("message" => "No area found.")
    );
}
?>