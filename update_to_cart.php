<?php  
	require_once 'xu_ly_cart.php';

	if (isset($_POST["txtCmd"])) {
	$cmd = $_POST["txtCmd"];
	$proId = $_POST["txtDProId"];
	$q = $_POST["txtUQ"];

	if ($cmd == "D") {
		delete_item($proId);
	} else { // $cmd == "U"
		update_item($proId, $q);
	}
	
	if (isset($_SERVER['HTTP_REFERER'])) {
	    $url = $_SERVER['HTTP_REFERER'];
	    header("location: $url");
	}
}

//header("Location: cart.php");
?>