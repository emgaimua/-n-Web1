<?php     
    require_once "../source/connect.php";
    $show_alert = 0;

    if (!isset($_GET["id"])) {
        header('Location: TrangAdminCate.php');
    }

    if (isset($_POST["btnEdit"])) {
        $u_id = $_POST["txtID"];
        $u_name = $_POST["txtTenLoaiMayAnh"];
        $u_sql = "update san_pham set ten_san_pham = '$u_name' where id_san_pham = '$u_id'";
        mysql_query($u_sql);

        $show_alert = 1;
    }

    if (isset($_POST["btnDelete"])) {
        $d_id = $_POST["txtID"];
        $d_sql = "delete from san_pham where id_san_pham = $d_id";
        mysql_query($d_sql);
        header('Location: TrangAdminCate.php');
    }

    $id = $_GET["id"];
    $sql = "select * from san_pham where id_san_pham = $id";
    $rs = mysql_query($sql);
    $name = "";
    while ($row = mysql_fetch_array($rs)) {
        $name = $row["ten_san_pham"];
    }
 ?>


<div class="container-fluid">
    <div class="row">
        <br><br>
        <div class="col-md-5 col-md-offset-4">
            <?php if ($show_alert == 1) : ?>
            <div class="alert alert-success" role="alert">
                <strong>Bạn đã sữa thành công!</strong>
            </div>
            <?php endif; ?>
            <form method="post" action="" name="frmEdit">
                <div class="form-group">
                    <input type="text" class="form-control" id="txtID" name="txtID" readonly value="<?= $id ?>">
                </div>
                <div class="form-group">
                    <label for="txtTenNSX">Tên loại</label>
                    <input type="text" class="form-control" id="txtTenLoaiMayAnh" name="txtTenLoaiMayAnh" value="<?= $name ?>">
                </div>
                <a class="btn btn-primary" href="TrangAdminCate.php" role="button" title="Về thôi">
                    <span class="glyphicon glyphicon-backward"></span>
                </a>
                <button type="submit" class="btn btn-success" name="btnEdit">
                <span class="glyphicon glyphicon-check"></span>
                Chỉnh sửa
                </button>
                <button type="submit" class="btn btn-danger" name="btnDelete">
                <span class="glyphicon glyphicon-remove"></span>
                Xoá luôn
                </button>
            </form>
        </div>
    </div>
</div>
