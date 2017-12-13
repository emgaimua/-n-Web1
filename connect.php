<?php 
$connect = mysql_pconnect('127.0.0.1', 'root', '') or die ("khong the ket noi") ;
mysql_select_db('web',$connect);
mysql_query ("SET NAMES 'UTF8'");
?> 