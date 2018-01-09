<?php
session_start();
    // Nếu không phải là sự kiện đăng ký thì không xử lý
    if (!isset($_POST['oldpass'])){
      die();
      }  
    
    //Khai báo utf-8 để hiển thị được tiếng việt
    header('Content-Type: text/html; charset=UTF-8');
  $oldpass       = addslashes($_POST['oldpass']);
  $newpass       = addslashes($_POST['newpass']);
  $newpass2      = addslashes($_POST['newpass2']);
  $id_kh         = addslashes($_POST['id_KH']);
  $pass          = addslashes($_POST['pass_KH']);
  if (!$newpass || !$newpass2 || !$oldpass )
    {
        echo "Vui lòng nhập đầy đủ thông tin. <a href='javascript: history.go(-1)'>Trở lại</a> <a href= 'index.php'> Về trang chủ </a>";
        exit;
    } 
  if ($oldpass != $pass)
    {
        echo "Mật khẩu cũ không đúng. <a href='javascript: history.go(-1)'>Trở lại</a> <a href= 'index.php'> Về trang chủ </a>";
        exit;
    }
  if ($newpass != $newpass2  )
    {
        echo "Mật khẩu xác nhận không đúng. <a href='javascript: history.go(-1)'>Trở lại</a> <a href= 'index.php'> Về trang chủ </a>";
        exit;
    }
    @$updatemember = mysql_query("
        UPDATE khach_hang 
        set mat_khau = '$newpass'
        where id_khach_hang = $id_kh;

    ");

    if ($updatemember)
        echo "Quá trình đổi mật khẩu thành công. <a href='index.php'>Về trang chủ</a>";
    else
        echo "Có lỗi xảy ra trong quá trình đổi mật khẩu. <a href='doi_mat_khau.php'>Thử lại</a>";
  
?>