<?php

	require_once 'xu_ly_cart.php';
	$id = $_GET['proId'];	
	$a = 0;
	if (isset($id)) {
		$proId = $_GET['proId'];
		$q = !empty($_GET['txtQuantity']) ? $_GET['txtQuantity'] : 1;
		
		add_item($proId, $q);

		//if (isset($_SERVER['HTTP_REFERER'])) {
		 //   $url = $_SERVER['HTTP_REFERER'];
		   // header("location: $url");
		//}
		
	}


echo get_total_items();
?>
