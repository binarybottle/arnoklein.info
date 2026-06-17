<?php 
include("./shared/db.php");

$imageID = $_GET['imageID'];
$X = $_GET['X'];
$Y = $_GET['Y'];

$sql  = "INSERT INTO trials (";
$sql .= "imageID,";
$sql .= "x_L_head,y_L_head,";
$sql .= "x_L_exocanthion,y_L_exocanthion,";
$sql .= "x_L_endocanthion,y_L_endocanthion,";
$sql .= "x_R_endocanthion,y_R_endocanthion,";
$sql .= "x_R_exocanthion,y_R_exocanthion,";
$sql .= "x_R_head,y_R_head,";
$sql .= "x_nose,y_nose,";
$sql .= "x_chin,y_chin) VALUES(";
$sql .= $imageID.",";
$sql .= $X[0].",".$Y[0].",";
$sql .= $X[1].",".$Y[1].",";
$sql .= $X[2].",".$Y[2].",";
$sql .= $X[3].",".$Y[3].",";
$sql .= $X[4].",".$Y[4].",";
$sql .= $X[5].",".$Y[5].",";
$sql .= $X[6].",".$Y[6].",";
$sql .= $X[7].",".$Y[7].")";

mysql_query("$sql") or die(mysql_error());  

?>
 
