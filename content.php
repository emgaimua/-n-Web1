<?php 
include('layout.php'); 
include('connect.php');
?>

<div class="container_fullwidth">
            <div class="container">
               <div class="hot-products">
                  <h3 class="title"><strong>New</strong> Products</h3>
                  <div class="control"><a id="prev_hot" class="prev" href="#">&lt;</a><a id="next_hot" class="next" href="#">&gt;</a></div>
                  <ul id="hot">
				     <li>
						<div class="row">
                  		<?php
                  		$sql = mysql_query("select * from san_pham order by ngay_tao DESC LIMIT 0,4" );
                  		while ($rows = mysql_fetch_array($sql)) {				  
                  		?>
                           <div class="col-md-3 col-sm-6">
                              <div class="products">
                                 <div class="offer">- %20</div>
                                 <div class="thumbnail"><a href='details.php?id=<?php echo $rows[0] ?>'><img src="hinh/<?php echo $rows['hinh_anh'] ?>" alt="Product Name"></a></div>
                                 <div class="productname"><?php echo $rows['ten_san_pham'] ?></div>
                                 <h4 class="price"><?php echo $rows['gia_tien'] ?></h4>
                                 <div class="button_group"><button class="button add-cart" type="button">Add To Cart</button><button class="button compare" type="button"><i class="fa fa-exchange"></i></button><button class="button wishlist" type="button"><i class="fa fa-heart-o"></i></button></div>
                                
                              </div>
                           </div>
                     <?php
                     }
                     ?>
					  	</div>
					 </li>
					 <li>
						<div class="row">
                  		<?php
                  		$sql = mysql_query("select * from san_pham order by ngay_tao DESC LIMIT 4, 4" );
                  		while ($rows = mysql_fetch_array($sql)) {				  
                  		?>
                           <div class="col-md-3 col-sm-6">
                              <div class="products">
                                 <div class="offer">- %20</div>
                                 <div class="thumbnail"><a href='details.php?id=<?php echo $rows[0] ?>'><img src="hinh/<?php echo $rows['hinh_anh'] ?>" alt="Product Name"></a></div>
                                 <div class="productname"><?php echo $rows['ten_san_pham'] ?></div>
                                 <h4 class="price"><?php echo $rows['gia_tien'] ?></h4>
                                 <div class="button_group"><button class="button add-cart" type="button">Add To Cart</button><button class="button compare" type="button"><i class="fa fa-exchange"></i></button><button class="button wishlist" type="button"><i class="fa fa-heart-o"></i></button></div>
                                
                              </div>
                           </div>
                     <?php
                     }
                     ?>
					  	</div>
					 </li>
					 <li>
						<div class="row">
                  		<?php
                  		$sql = mysql_query("select * from san_pham order by ngay_tao DESC LIMIT 8, 2" );
                  		while ($rows = mysql_fetch_array($sql)) {				  
                  		?>
                           <div class="col-md-3 col-sm-6">
                              <div class="products">
                                 <div class="offer">- %20</div>
                                 <div class="thumbnail"><a href='details.php?id=<?php echo $rows[0] ?>'><img src="hinh/<?php echo $rows['hinh_anh'] ?>" alt="Product Name"></a></div>
                                 <div class="productname"><?php echo $rows['ten_san_pham'] ?></div>
                                 <h4 class="price"><?php echo $rows['gia_tien'] ?></h4>
                                 <div class="button_group"><button class="button add-cart" type="button">Add To Cart</button><button class="button compare" type="button"><i class="fa fa-exchange"></i></button><button class="button wishlist" type="button"><i class="fa fa-heart-o"></i></button></div>
                                
                              </div>
                           </div>
                     <?php
                     }
                     ?>
					  	</div>
					 </li>
                  </ul> 
               </div>
			   
			   
			   
			   
			   
			   
			   
               <div class="clearfix"></div>
			   
			   <div class="clearfix"></div>
			   
			   
               <div class="featured-products">
                  <h3 class="title"><strong>Hot view</strong> Products</h3>
                  <div class="control"><a id="prev_featured" class="prev" href="#">&lt;</a><a id="next_featured" class="next" href="#">&gt;</a></div>
                  <ul id="featured">
                     <li>
                        <div class="row">
                           <?php
                  		$sql = mysql_query("select * from san_pham order by so_luong_ban DESC LIMIT 0,4" );
                  		while ($rows = mysql_fetch_array($sql)) {				  
                  		?>
                           <div class="col-md-3 col-sm-6">
                              <div class="products">
                                 <div class="offer">- %20</div>
                                 <div class="thumbnail"><a href='details.php?id=<?php echo $rows[0] ?>'><img src="hinh/<?php echo $rows['hinh_anh'] ?>" alt="Product Name"></a></div>
                                 <div class="productname"><?php echo $rows['ten_san_pham'] ?></div>
                                 <h4 class="price"><?php echo $rows['gia_tien'] ?></h4>
                                 <div class="button_group"><button class="button add-cart" type="button">Add To Cart</button><button class="button compare" type="button"><i class="fa fa-exchange"></i></button><button class="button wishlist" type="button"><i class="fa fa-heart-o"></i></button></div>
                                
                              </div>
                           </div>
                     <?php
                     }
                     ?>
					  	</div>
					 </li>
					 <li>
						<div class="row">
                  		<?php
                  		$sql = mysql_query("select * from san_pham order by so_luong_ban DESC LIMIT 4, 4" );
                  		while ($rows = mysql_fetch_array($sql)) {				  
                  		?>
                           <div class="col-md-3 col-sm-6">
                              <div class="products">
                                 <div class="offer">- %20</div>
                                 <div class="thumbnail"><a href='details.php?id=<?php echo $rows[0] ?>'><img src="hinh/<?php echo $rows['hinh_anh'] ?>" alt="Product Name"></a></div>
                                 <div class="productname"><?php echo $rows['ten_san_pham'] ?></div>
                                 <h4 class="price"><?php echo $rows['gia_tien'] ?></h4>
                                 <div class="button_group"><button class="button add-cart" type="button">Add To Cart</button><button class="button compare" type="button"><i class="fa fa-exchange"></i></button><button class="button wishlist" type="button"><i class="fa fa-heart-o"></i></button></div>
                                
                              </div>
                           </div>
                     <?php
                     }
                     ?>
					  	</div>
					 </li>
					 <li>
						<div class="row">
                  		<?php
                  		$sql = mysql_query("select * from san_pham order by so_luong_ban DESC LIMIT 8, 2" );
                  		while ($rows = mysql_fetch_array($sql)) {				  
                  		?>
                           <div class="col-md-3 col-sm-6">
                              <div class="products">
                                 <div class="offer">- %20</div>
                                 <div class="thumbnail"><a href='details.php?id=<?php echo $rows[0] ?>'><img src="hinh/<?php echo $rows['hinh_anh'] ?>" alt="Product Name"></a></div>
                                 <div class="productname"><?php echo $rows['ten_san_pham'] ?></div>
                                 <h4 class="price"><?php echo $rows['gia_tien'] ?></h4>
                                 <div class="button_group"><button class="button add-cart" type="button">Add To Cart</button><button class="button compare" type="button"><i class="fa fa-exchange"></i></button><button class="button wishlist" type="button"><i class="fa fa-heart-o"></i></button></div>
                                
                              </div>
                           </div>
                     <?php
                     }
                     ?>
                        </div>
                     </li>
                  </ul>
               </div>
			  
			   
               <div class="clearfix"></div>
               <div class="our-brand">
                  <h3 class="title"><strong>Our </strong> Brands</h3>
                  <div class="control"><a id="prev_brand" class="prev" href="#">&lt;</a><a id="next_brand" class="next" href="#">&gt;</a></div>
                  <ul id="braldLogo">
                     <li>
                        <ul class="brand_item">
                           <li>
                              <a href="#">
                                 <div class="brand-logo"><img src="images/envato.png" alt=""></div>
                              </a>
                           </li>
                           <li>
                              <a href="#">
                                 <div class="brand-logo"><img src="images/themeforest.png" alt=""></div>
                              </a>
                           </li>
                           <li>
                              <a href="#">
                                 <div class="brand-logo"><img src="images/photodune.png" alt=""></div>
                              </a>
                           </li>
                           <li>
                              <a href="#">
                                 <div class="brand-logo"><img src="images/activeden.png" alt=""></div>
                              </a>
                           </li>
                           <li>
                              <a href="#">
                                 <div class="brand-logo"><img src="images/envato.png" alt=""></div>
                              </a>
                           </li>
                        </ul>
                     </li>
                     <li>
                        <ul class="brand_item">
                           <li>
                              <a href="#">
                                 <div class="brand-logo"><img src="images/envato.png" alt=""></div>
                              </a>
                           </li>
                           <li>
                              <a href="#">
                                 <div class="brand-logo"><img src="images/themeforest.png" alt=""></div>
                              </a>
                           </li>
                           <li>
                              <a href="#">
                                 <div class="brand-logo"><img src="images/photodune.png" alt=""></div>
                              </a>
                           </li>
                           <li>
                              <a href="#">
                                 <div class="brand-logo"><img src="images/activeden.png" alt=""></div>
                              </a>
                           </li>
                           <li>
                              <a href="#">
                                 <div class="brand-logo"><img src="images/envato.png" alt=""></div>
                              </a>
                           </li>
                        </ul>
                     </li>
                  </ul>
               </div>
            </div>
         </div>