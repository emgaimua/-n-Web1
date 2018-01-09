<?php     
    require_once "../source/connect.php";
    $show_alert = 0;

    if (!isset($_GET["id"])) {
        header('Location: Admin.php');
    }

    if (isset($_POST["btnEdit"])) {
        $u_id = $_POST["txtID"];
        $u_name = $_POST["txtTenNSX"];
        $u_sql = mysql_query("update nha_sx set ten_nsx = '$u_name' where id_nsx = '$u_id'");
        

        $show_alert = 1;
    }

    if (isset($_POST["btnDelete"])) {
        $d_id = $_POST["txtID"];
        $d_sql = "delete from nha_sx where id_nsx = $d_id";
        mysql_query($d_sql);
        header('Location: TrangAdminCate.php');
    }

    $id = $_GET["id"];
    $sql = "select * from nha_sx where id_nsx = $id";
    $rs = mysql_query($sql);
    $name = "";
    while ($row = mysql_fetch_array($rs)) {
        $name = $row["ten_nsx"];
    }
 ?>


<div class="container-fluid">
    <div class="row">
        <br><br>
        <div class="col-md-5 col-md-offset-4">
            <?php if ($show_alert == 1) : ?>
            <div class="alert alert-success" role="alert">
                <strong>Bạn đã sửa thành công!</strong>
            </div>
            <?php endif; ?>
            <form method="post" action="" name="frmEdit">
                <div class="form-group">
                    <input type="text" class="form-control" id="txtID" name="txtID" readonly value="<?= $id ?>">
                </div>
                <div class="form-group">
                    <label for="txtTenNSX">Tên danh mục</label>
                    <input type="text" class="form-control" id="txtTenNSX" name="txtTenNSX" value="<?= $name ?>">
                </div>
                <a class="btn btn-primary" href="TrangAdmin.php" role="button" title="Về thôi">
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

<script type="text/javascript">
    $(function(){
    $('txtTenNSX').focus();
    })
</script>