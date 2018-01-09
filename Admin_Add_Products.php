<?php  
    require_once "../source/connect.php";

    $show_alert = 0;

    if (isset($_POST["btnAdd"])) {
        $name = $_POST["txtTenNSX"];
        $sql = "insert into nha_sx(ten_nsx) values('$name')";

        mysql_query($sql);

        $show_alert = 1;
    }


 ?>

<div class="container-fluid">
    <div class="row">
        <br><br>
        <div class="col-md-5 col-md-offset-4">
        <?php if ($show_alert == 1) : ?>
            <div class="alert alert-success" role="alert">
                <strong>Bạn đã thêm thành công!</strong>
            </div>
        <?php endif; ?>
            <form method="post" action="" name="frmAdd">
                <div class="form-group">
                    <label for="txtTenNSX">Tên sản phẩm</label>
                    <input type="text" class="form-control" id="txtTenNSX" name="txtTenNSX">
                    <div class="form-group">
                        <label for="exampleFormControlSelect1">Mã loại sản phẩm</label>
                        <select class="form-control" id="exampleFormControlSelect1">
                            <?php
                                $sql = "select * from nha_sx";
                                $rs = mysql_query($sql);
                                while ($row = mysql_fetch_array($rs)) :
                            ?>
                                <option><?= $row["ten_nsx"] ?></option>
                            <?php endwhile ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlSelect1">Mã loại sản phẩm</label>
                        <select class="form-control" id="exampleFormControlSelect1">
                            <?php
                                $sql = "select * from danh_muc";
                                $rs = mysql_query($sql);
                                while ($row = mysql_fetch_array($rs)) :
                            ?>
                                <option><?= $row["ten_danh_muc"] ?></option>
                            <?php endwhile ?>
                        </select>
                    </div>
                </div>
                <a class="btn btn-primary" href="TrangAdmin.php" role="button" title="Về thôi">
                    <span class="glyphicon glyphicon-backward"></span>
                </a>
                <button type="submit" class="btn btn-success" name="btnAdd">
                    <span class="glyphicon glyphicon-check"></span>
                    Thêm mới
                </button>
            </form>
        </div>
    </div>
</div>

<script type="text/javascript">
    
</script>