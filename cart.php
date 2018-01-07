<?php
session_start();
include ('source/permission.php');
include ('source/connect.php');
include ('source/header2.php');
include ('source/layout.php');	
require_once 'xu_ly_cart.php';
?>

        <div class="clearfix">
        </div>
        <div class="page-index">
          <div class="container">
            <p>
              Home - Shopping Cart
            </p>
          </div>
        </div>
      </div>
      <div class="clearfix">
      </div>
      <div class="container_fullwidth">
        <div class="container shopping-cart">
          <div class="row">
            <div class="col-md-12">
              <h3 class="title">
                Shopping Cart
              </h3>
              <div class="clearfix">
              </div>
            <form id="f" method="post" action="update_to_cart.php">
              <input type="hidden" id="txtCmd" name="txtCmd">
              <input type="hidden" id="txtDProId" name="txtDProId">
              <input type="hidden" id="txtUQ" name="txtUQ">
            </form>
              <table class="shop-table">
                <thead>
                  <tr>
                    <th>
                      Image
                    </th>
                    <th>
                      Details
                    </th>
                    <th>
                      Price
                    </th>
                    <th>
                      Quantity
                    </th>
                    <th>
                      Total
                    </th>
                    <th>
                      Delete
                    </th>
                    <th>
                      Update
                    </th>
                  </tr>
                </thead>
                <tbody>

				
					<?php

					$total = 0;
					foreach ($_SESSION["cart"] as $proId => $q) :
							$sql = mysql_query("select * from san_pham where id_san_pham = $proId");
							
							while ($rows = mysql_fetch_array($sql)){
							$tien = $q * $rows["gia_tien"];
							$total += $tien;
              $quan = $q;
              $proid = $rows[0];
					?>
                  <tr>
                    <td>
                      <img src="hinh/<?php echo $rows['hinh_anh']; ?>" alt="">
                    </td>
                    <td>
					
                      <div class="shop-details">
                        <div class="productname">
                          <?php echo $rows['ten_san_pham']; ?>
                        </div>
                        <p>
                    	<?php echo $rows['mo_ta']; ?>
                  		</p>
                        
                      </div>
                    </td>
                    <td>
                      <h5>
                        <?php echo number_format($rows['gia_tien']); ?> VND
                      </h5>
                    </td>
                    <td>
                      <input class="quantity-textfield" type="text" size="2" name="" id="" value="<?= $q ?>">
                    </td>
                    <td>
                      <h5>
                        <strong class="red ">
                          <?php echo number_format($tien); ?> VND
                        </strong>
                      </h5>
                    </td>
                    <td>
                      <a class="btn btn-xs btn-danger cart-remove" data-id="<?= $proId ?>" href="javascript:;" role="button">
                      <span class="glyphicon glyphicon-remove"></span>
                    </a>                        

                    </td>
                    <td>
                    
                      <a class="btn btn-xs btn-primary cart-update" data-id="<?= $proId ?>" href="javascript:;" role="button">
                      <span class="glyphicon glyphicon-ok"></span>
                      </a>
                    </td>
                  </tr>
				  <?php
				  }
				  endforeach;
				  ?>
                </tbody>
                <tfoot>
                  <tr>
                    <td colspan="6">
                      <button class="pull-left">
					            <a href="index.php">
                        Continue Shopping
						          </a>
                      </button>
                       
                    </td>

                  </tr>
                </tfoot>
              </table>
            </form>
              <div class="clearfix">
              </div>
              <div class="row">
                
                  
                
                <div class="col-md-4 col-sm-6">
                  <div class="shippingbox">
                    <div class="grandtotal">
                      <h5>
                        Thành ti?n 
                      </h5>
                      <span>
                        <?php echo number_format($total); ?> VND
                      </span>
                    </div>
                    <button>
                      Thanh toán
                    </button>
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
      <?php
	  include ('source/footer.php');
	  ?>
    </div>
    <!-- Bootstrap core JavaScript==================================================-->
    <script type="text/javascript" src="js/jquery-1.10.2.min.js">
    </script>
    <script type="text/javascript" src="js/bootstrap.min.js">
    </script>
    <script defer src="js/jquery.flexslider.js">
    </script>
    <script type="text/javascript" src="js/jquery.carouFredSel-6.2.1-packed.js">
    </script>
    <script type="text/javascript" src="js/script.min.js" >
    </script>
    <script type="text/javascript">
    $('.cart-remove').on('click', function() {
      var id = $(this).data('id');
      $('#txtDProId').val(id);
        $('#txtCmd').val('D');
        $('#f').submit();
    });

    $('.cart-update').on('click', function() {

      var q = $(this).closest('tr').find('.quantity-textfield').val();
      $('#txtUQ').val(q);

      var id = $(this).data('id');
      $('#txtDProId').val(id);
        $('#txtCmd').val('U');

        $('#f').submit();
    });

    $('.quantity-textfield').TouchSpin({
          min: 1,
          max: 69,
          verticalbuttons: true,
            // step: 1,
            // decimals: 0,
            // boostat: 5,
            // maxboostedstep: 10,
            // postfix: '%'
      });
  </script>
  </body>
</html>