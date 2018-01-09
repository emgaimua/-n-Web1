<?php 
session_start();
include ('source/connect.php');
include ('source/layout.php');
$id = $_GET['id'] ;
include ('source/header2.php');
?>
  <div class="page-index">
          <div class="container">
            <p>
              Home - Products List
            </p>
          </div>
        </div>
      </div>
      <div class="clearfix">
      </div>
      <div class="clearfix">
      </div>
      <div class="container_fullwidth">
        <div class="container">
          <div class="row">
            <div class="col-md-3">
              <div class="branch leftbar">
                <h3 class="title">
                  Danh Mục
                </h3>
                <ul>
                 <?php $sql= mysql_query("select * from danh_muc");  
                  while ($rows = mysql_fetch_array($sql)){
                  ?>
                                       <li><a href='productlist.php?id=<?php echo $rows[0] ?>'><?php echo $rows['ten_danh_muc'] ?></a></li>
                     <?php } ?>
                </ul>
              </div>
              <div class="branch leftbar">
                <h3 class="title">
                  Nhà Sản Xuất
                </h3>
                <ul>
                 <?php $sql= mysql_query("select * from nha_sx");  
                  while ($rows = mysql_fetch_array($sql)){
                  ?>
                                       <li><a href='manufacturerlist.php?id=<?php echo $rows[0] ?>'><?php echo $rows['ten_nsx'] ?></a></li>
                     <?php } ?>
                </ul>
              </div>
            </div>
            <div class="col-md-9">
              
              <div class="clearfix">
              </div>
              <div class="products-list">
                <div class="toolbar">
                  
                  
                </div>
                <?php
                $limit = 4;
                $current_page = 1;
                if (isset($_GET["page"])) {
                $current_page = $_GET["page"];
                }

                $next_page = $current_page + 1;
                $prev_page = $current_page - 1;
                $num_sql = mysql_query("select count(*) as num_rows from san_pham where id_nhasx = '$id' " );
                $c_rows = mysql_fetch_array($num_sql);
                $num_rows = $c_rows['num_rows'];
                $num_pages = ceil($num_rows / $limit);

                if ($current_page < 1 || $current_page > $num_pages) {
                $current_page = 1;
                }

                $offset = ($current_page - 1) * $limit;
                ?>
                <ul class="products-listItem">
        <?php
                  $sql = mysql_query("select * from san_pham where id_nhasx = '$id' limit $offset, $limit ");
                while ($rows = mysql_fetch_array($sql)) {

                  ?>
                  <li class="products">
          <?php 
          if($rows['giam_gia'] != null)
          {?>
                    <div class="offer">
                      <?php echo '-'.$rows['giam_gia'].'%'?>
                    </div>
          <?php }
          ?>
          
                    <div class="thumbnail"><a href='details.php?id=<?php echo $rows[0] ?>'>
                      <img src="hinh/<?php echo $rows['hinh_anh'] ?>" alt="Product Name">
                    </div>
                    <div class="product-list-description">
                      <div class="productname">
                        <?php echo $rows['ten_san_pham'] ?>
                      </div>
                      <p>
                        <img src="images/star.png" alt="">
                        <a href="#" class="review_num">
                          <?php echo $rows['luot_xem'] ?> Review(s)
                        </a>
                      </p>
                      <p>
                        <?php echo $rows['mo_ta'] ?>
                      </p>
                      <div class="list_bottom">
                        <div class="price">
                          <span class="new_price">
                            <?php $gia_cu = $rows['gia_tien'];
                $sale = $rows['giam_gia'];
                $giam_gia = $gia_cu * $sale/100;
                $gia_moi = $gia_cu - $giam_gia;
                if ($rows['giam_gia'] == null)
                {
                $gia_moi = $gia_cu;
                }
                echo number_format($gia_moi); ?>
                            <sup>
                              $
                            </sup>
                          </span>
                          <span class="old_price">
                            <?php echo number_format($rows['gia_tien']);
              $proId = $rows['id_san_pham'];
              ?>
                            <sup>
                              $
                            </sup>
                          </span>
                        </div>
                        <div class="button_group">
                          <?php 
              if (isset($_SESSION['username']) == true) {
                  ?>
                          <button class="button add-cart" data-prodid = "<?php echo $proId?>" type="button" name="btnAddToCart" > Add To Cart </button>
                          <button class="button compare">
                            <i class="fa fa-exchange">
                            </i>
                          </button>
                          <button class="button favorite">
                            <i class="fa fa-heart-o">
                            </i>
                          </button>
              <?php } ?>
                        </div>
                      </div>
                    </div>
                  </li>
                  <?php }?>
                </ul>
                <div class="toolbar">
                  
                  <div class="pager">
                    <a href="productlist.php?id=<?php echo"$id"; ?>&page= <?php echo"$prev_page" ?>" class="prev-page" >
                      <i class="fa fa-angle-left">
                      </i>
                    </a>
                    <?php for ($i = 1; $i <= $num_pages; $i++) : ?> 
                    <li><a href="productlist.php?id=<?php echo"$id"; ?>&page= <?php echo"$i" ?>"><?php echo"$i"; ?></a></li>
                    <?php endfor; ?>
                    <a href="productlist.php?id=<?php echo"$id"; ?>&page= <?php echo"$next_page" ?>" class="next-page">
                      <i class="fa fa-angle-right">
                      </i>
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="clearfix">
          </div>
          <div class="our-brand">
            <h3 class="title">
              <strong>
                Our 
              </strong>
              Brands
            </h3>
            <div class="control">
              <a id="prev_brand" class="prev" href="#">
                &lt;
              </a>
              <a id="next_brand" class="next" href="#">
                &gt;
              </a>
            </div>
            <ul id="braldLogo">
              <li>
                <ul class="brand_item">
                  <li>
                    <a href="#">
                      <div class="brand-logo">
                        <img src="images/envato.png" alt="">
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <div class="brand-logo">
                        <img src="images/themeforest.png" alt="">
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <div class="brand-logo">
                        <img src="images/photodune.png" alt="">
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <div class="brand-logo">
                        <img src="images/activeden.png" alt="">
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <div class="brand-logo">
                        <img src="images/envato.png" alt="">
                      </div>
                    </a>
                  </li>
                </ul>
              </li>
              <li>
                <ul class="brand_item">
                  <li>
                    <a href="#">
                      <div class="brand-logo">
                        <img src="images/envato.png" alt="">
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <div class="brand-logo">
                        <img src="images/themeforest.png" alt="">
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <div class="brand-logo">
                        <img src="images/photodune.png" alt="">
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <div class="brand-logo">
                        <img src="images/activeden.png" alt="">
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <div class="brand-logo">
                        <img src="images/envato.png" alt="">
                      </div>
                    </a>
                  </li>
                </ul>
              </li>
            </ul>
          </div>
        </div>
      </div>
      <div class="clearfix">
      </div>
      <div class="footer">
        <div class="footer-info">
          <div class="container">
            <div class="row">
              <div class="col-md-3">
                <div class="footer-logo">
                  <a href="#">
                    <img src="images/logo.png" alt="">
                  </a>
                </div>
              </div>
              <div class="col-md-3 col-sm-6">
                <h4 class="title">
                  Contact 
                  <strong>
                    Info
                  </strong>
                </h4>
                <p>
                  No. 08, Nguyen Trai, Hanoi , Vietnam
                </p>
                <p>
                  Call Us : (084) 1900 1008
                </p>
                <p>
                  Email : michael@leebros.us
                </p>
              </div>
              <div class="col-md-3 col-sm-6">
                <h4 class="title">
                  Customer
                  <strong>
                    Support
                  </strong>
                </h4>
                <ul class="support">
                  <li>
                    <a href="#">
                      FAQ
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      Payment Option
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      Booking Tips
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      Infomation
                    </a>
                  </li>
                </ul>
              </div>
              <div class="col-md-3">
                <h4 class="title">
                  Get Our 
                  <strong>
                    Newsletter 
                  </strong>
                </h4>
                <p>
                  Lorem ipsum dolor ipsum dolor.
                </p>
                <form class="newsletter">
                  <input type="text" name="" placeholder="Type your email....">
                  <input type="submit" value="SignUp" class="button">
                </form>
              </div>
            </div>
          </div>
        </div>
        <div class="copyright-info">
          <div class="container">
            <div class="row">
              <div class="col-md-6">
                <p>
                  Copyright © 2012. Designed by 
                  <a href="#">
                    Michael Lee
                  </a>
                  . All rights reseved
                </p>
              </div>
              <div class="col-md-6">
                <ul class="social-icon">
                  <li>
                    <a href="#" class="linkedin">
                    </a>
                  </li>
                  <li>
                    <a href="#" class="google-plus">
                    </a>
                  </li>
                  <li>
                    <a href="#" class="twitter">
                    </a>
                  </li>
                  <li>
                    <a href="#" class="facebook">
                    </a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Bootstrap core JavaScript==================================================-->
    <script type="text/javascript" src="js/jquery-1.10.2.min.js">
    </script>
    <script type="text/javascript" src="js/jquery.easing.1.3.js">
    </script>
    <script type="text/javascript" src="js/bootstrap.min.js">
    </script>
    <script defer src="js/jquery.flexslider.js">
    </script>
    <script type="text/javascript" src="js/jquery.sequence-min.js">
    </script>
    <script type="text/javascript" src="js/jquery.carouFredSel-6.2.1-packed.js">
    </script>
    <script type="text/javascript" src="js/script.min.js" >
    </script>
  </body>
</html>