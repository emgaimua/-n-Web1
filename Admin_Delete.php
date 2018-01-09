<?php 
	require_once "../source/connect.php";

	if (isset($_GET["id"])) {
		$id = $_GET["id"];
		$sql = "delete from nha_sx where id_nsx = $id";
		mysql_query($sql);
		header('Location: TrangAdmin.php');
	}
 ?>