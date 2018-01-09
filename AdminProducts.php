<?php
require_once "../source/connect.php";
?>
<div class="container-fluid">
    <div class="row">
        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <a href="TrangAdmin.php">
                        Danh sách các nhà sản xuất
                    </a>
                </div>
                <div class="panel-heading">
                    <a href="TrangAdmin_Add.php">
                        Thêm nhà sản xuất
                    </a>
                </div>
                <div class="panel-heading">
                    <a href="TrangAdminCate.php">
                        Danh sách các loại
                    </a>
                </div>
                <div class="panel-heading">
                    <a href="TrangAdmin_Add_Cate.php">
                        Thêm loại 
                    </a>
                </div>
                <div class="panel-heading">
                    <a href="TrangAdminProducts.php">
                        Danh sách các sản phẩm
                    </a>
                </div>
                <div class="panel-heading">
                    <a href="TrangAdmin_Add_Products.php">
                        Thêm sản phẩm
                    </a>
                </div>
            </div>
        </div>
        <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
            <table class="table table-hover">
                <tbody>
                    <?php
                    $limit = 10;
                    $current_page = 1;
                    if (isset($_GET["page"])) {
                    $current_page = $_GET["page"];
                    }
                    $next_page = $current_page + 1;
                    $prev_page = $current_page - 1;
                    $c_sql = "select count(*) as num_rows from san_pham";
                    $c_rs = mysql_query($c_sql);
                    $c_row = mysql_fetch_assoc($c_rs);
                    $num_rows = $c_row["num_rows"];
                    $num_pages = ceil($num_rows / $limit);
                    if ($current_page < 1 || $current_page > $num_pages) {
                    $current_page = 1;
                    }
                    $offset = ($current_page - 1) * $limit;
                    $sql = "select * from san_pham limit $offset, $limit ";
                    $rs = mysql_query($sql);
                    if (mysql_num_rows($rs) > 0) :
                    while ($row = mysql_fetch_array($rs)) :
                    ?>
                    <tr>
                        <td><?= $row["ten_san_pham"] ?></td>
                        <td><a><img src="../hinh/<?= $row["hinh_anh"] ?>" height="80" width="80"/></a></td>
                        <td class="text-right">
                            <a class="btn btn-default btn-xs" href="TrangAdminPro_Edit.php?id=<?= $row["id_san_pham"] ?>" role="button">
                                <span class="glyphicon glyphicon-pencil"></span>
                            </a>
                            <a class="btn btn-danger btn-xs" href="Admin_Delete.php?id=<?= $row["id"] ?>" role="button">
                                <span class="glyphicon glyphicon-remove"></span>
                            </a>
                        </td>
                    </tr>
                    <?php
                    endwhile;
                    endif;
                    ?>
                </tbody>
            </table>
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <?php for ($i = 1; $i <= $num_pages; $i++) : ?> 
                        <li><a href="TrangAdminProducts.php?page= <?php echo"$i" ?>"><?php echo"$i"; ?></a></li>
                    <?php endfor; ?>
                </ul>
            </nav>
        </div>   
    </div>
</div>