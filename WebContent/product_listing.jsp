    <%@ include file="header.html" %>   
    
    <%@page import="java.sql.*"%>    
	<%@page import="database.*" %>

    <div class="container">

        <div class="row">
            <div class="col-md-3"><!-- left nav -->
                <p class="lead">Categories</p>
                <div class="list-group">
                    <a href="product_listing.jsp?category=1" class="list-group-item">Tablet</a>
                    <a href="product_listing.jsp?category=2" class="list-group-item">Laptop</a>
                    <a href="product_listing.jsp?category=6" class="list-group-item">Desktop</a>
                </div>

                <p class="lead">Brand</p>
                <div class="list-group leftNav">
                    <a href="product_listing.jsp?brand=Acer" class="list-group-item">
                        <img src="images/brand/logo.svg" alt="" />
                    </a>

                    <a href="product_listing.jsp?brand=Apple" class="list-group-item">
                        <img src="images/brand/Apple-logo-grey.png" alt="" />
                    </a>

                    <a href="product_listing.jsp?brand=Asus" class="list-group-item">
                        <img src="images/brand/LogoAsus.png" alt="" />
                    </a>

                    <a href="product_listing.jsp?brand=Dell" class="list-group-item">
                        <img src="images/brand/Dell_Logo.svg.png" alt="" />
                    </a>

                    <a href="product_listing.jsp?brand=HP" class="list-group-item">
                        <img src="images/brand/HP_New_Logo_2D.svg.png" alt="" />
                    </a>

                    <a href="product_listing.jsp?brand=Lenovo" class="list-group-item">
                        <img src="images/brand/Lenovo-Logos.jpg" alt="" />
                    </a>

                    <a href="product_listing.jsp?brand=Microsoft" class="list-group-item">
                        <img src="images/brand/Microsoft-Logo-PNG.png" alt="" />
                    </a>
                    
                </div>
            </div><!-- left nav -->

            <div class="col-md-9"><!-- right Container -->
                <div class="row" id="productListingContainer"> <!-- Product listing container -->
                	<jsp:useBean id="homeClass" class="controller.HomeServlet"/>
                	<%
		                try{
			                Connection con;
			            	DB db = new DB();
			            	con = db.getConnection();
			            	
			            	String brand = request.getParameter("brand");
			            	String category = request.getParameter("category");
			            	
			            	String sqlStr = "";
			            	
			            	if(brand!=null){
			            		sqlStr = "select * from product where brand = '"+brand+"' and display = 'public'";
			            	}else{
			            		if(category.equals("2")){
			            			sqlStr = "select * from product where category in ('2','3','4','5') and display = 'public'";
			            		}else{
			            			sqlStr = "select * from product where category = '"+category+"' and display = 'public'";
			            		}
			            	}
			    			PreparedStatement pstmt = con.prepareStatement(sqlStr);
			    			ResultSet rs = pstmt.executeQuery();
			    			
			    			String model,price;
			    			int id;
		
			    			while(rs.next()) {
			    				id = rs.getInt("id");
			    				price = rs.getString("price");
			    				model = rs.getString("model");
	                %>

                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                            <%=homeClass.getFirstImage(rs.getString("imageUrl"), model) %>
                            <div class="caption">
                                <h4 class="pull-right">S$<%=price %></h4>
                                <h4><a href="product_info.jsp?id=<%=id %>"><%=model %></a>
                                </h4>
                                <p>
                                	<%=homeClass.getSpecs(rs.getString("specs")) %>
                                </p>
                            </div>
                            <div class="ratings">
                                <p class="pull-right">10 reviews</p>
                                <p>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star-empty"></span>
                                </p>
                            </div>
                        </div>
                    </div>
                    
                    <%
			    			}
			           	rs.close();
		  	         	pstmt.close();
		  	         	con.close();
			  	         	
			  	      } catch (Exception e) {
			
			  			out.println(e.getMessage());
			  		  } 
		           	%>

                    <!-- <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                            <img src="images/product/ipadair2.jpg" alt="">
                            <div class="caption">
                                <h4 class="pull-right">S$517.88</h4>
                                <h4><a href="#">iPad Air 2 32GB</a>
                                </h4>
                                <p>
                                    <div>A8X chip with 64-bit architecture</div>
                                    <div>M8 motion coprocessor</div>
                                    <div>9.7" LED 2048x1536</div>
                                </p>
                            </div>
                            <div class="ratings">
                                <p class="pull-right">8 reviews</p>
                                <p>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                            <img src="images/product/ipadmini4.jpg" alt="">
                            <div class="caption">
                                <h4 class="pull-right">S$537.14</h4>
                                <h4><a href="#">iPad Mini 4 32GB Wifi</a>
                                </h4>
                                <p>
                                    <div>A8X chip with 64-bit architecture</div>
                                    <div>M8 motion coprocessor</div>
                                    <div>7.9" LED 2048x1536</div>
                                </p>
                            </div>
                            <div class="ratings">
                                <p class="pull-right">25 reviews</p>
                                <p>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                            <img src="images/product/elite.jpg" alt="">
                            <div class="caption">
                                <h4 class="pull-right">S$1,719.00</h4>
                                <h4><a href="#">Elite x2 1012 G1</a>
                                </h4>
                                <p>
                                    <div>Intel Core M5-6Y54</div>
                                    <div>8GB DDR3 RAM </div>
                                    <div><small>12" LED WUXGA+UWVA BrightView Touchscreen</small></div>
                                </p>
                            </div>
                            <div class="ratings">
                                <p class="pull-right">10 reviews</p>
                                <p>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star-empty"></span>
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                            <img src="images/product/surfacepro4.jpg" alt="">
                            <div class="caption">
                                <h4 class="pull-right">S$1,605.00</h4>
                                <h4><a href="#">Surface Pro 4</a>
                                </h4>
                                <p>
                                    <div>Intel Core m3</div>
                                    <div>4GB RAM </div>
                                    <div>12.3" PixelSense 2763x1824 Multi-touch</div>
                                </p>
                            </div>
                            <div class="ratings">
                                <p class="pull-right">4 reviews</p>
                                <p>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star-empty"></span>
                                </p>
                            </div>
                        </div>
                    </div> -->

                </div><!-- Product listing container-->
                            
            </div><!-- right Container -->
        </div>
        

    </div><!-- end container -->
    
	<%@ include file="footer.html" %>   