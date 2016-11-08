<%@ include file="header.html" %> 

<%@page import="java.sql.*"%>    
<%@page import="database.*" %>

<div class="container">

    <div class="row">
        <div class="col-md-12"><!-- right Container -->
            <div class="carousel-holder">
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="item active">
                            <img class="slide-image" src="https://compass-ssl.surface.com/assets/82/f0/82f05f0e-cd38-4f1e-80a0-d78411452dba.png?n=Desktop_Surface-Hero_en-US.png" alt="">
                        </div>
                        <div class="item">
                            <img class="slide-image" src="http://rog.asus.com/wp-content/uploads/2015/01/G501_lighting_02-copy.jpg" alt="">
                        </div>
                        <div class="item">
                            <img class="slide-image" src="https://cdn1.macworld.co.uk/cmsdata/features/3605337/MacbookAir11_lifestyle_15_thumb800.jpg" alt="">
                        </div>
                    </div>
                    <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                    </a>
                    <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                    </a>
                </div>
            </div>

            <div class="panel panel-default"> <!-- brand -->
              <div class="panel-body row">
                    <div class="col-xs-4 col-md-3 brandLogo">
                        <a href="product_listing.jsp?brand=Acer" class="thumbnail">
                          <img src="images/brand/logo.svg" alt="" >
                        </a>
                    </div>
                    <div class="col-xs-4 col-md-3 brandLogo">
                        <a href="product_listing.jsp?brand=Apple" class="thumbnail">
                          <img src="images/brand/Apple-logo-grey.png" alt="" >
                        </a>
                    </div>
                    <div class="col-xs-4 col-md-3 brandLogo">
                        <a href="product_listing.jsp?brand=Asus" class="thumbnail">
                          <img src="images/brand/LogoAsus.png" alt="" >
                        </a>
                    </div>
                    <div class="col-xs-4 col-md-3 brandLogo">
                        <a href="product_listing.jsp?brand=Dell" class="thumbnail">
                          <img src="images/brand/Dell_Logo.svg.png" alt="" >
                        </a>
                    </div>
                    <div class="col-xs-4 col-md-3 brandLogo">
                        <a href="product_listing.jsp?brand=HP" class="thumbnail">
                          <img src="images/brand/HP_New_Logo_2D.svg.png" alt="" >
                        </a>
                    </div>
                    <div class="col-xs-4 col-md-3 brandLogo">
                        <a href="product_listing.jsp?brand=Lenovo" class="thumbnail">
                          <img src="images/brand/Lenovo-Logos.jpg" alt="" >
                        </a>
                    </div>
                    <div class="col-xs-4 col-md-3 brandLogo">
                        <a href="product_listing.jsp?brand=Microsoft" class="thumbnail">
                          <img src="images/brand/Microsoft-Logo-PNG.png" alt="" >
                        </a>
                    </div>

              </div>
            </div> <!-- brand end -->

            <div class="row" id="productListingContainer"> <!-- Product listing container -->

                <h3>Most Popular</h3>
                <jsp:useBean id="homeClass" class="controller.HomeServlet"/>
                <%
                try{
	                Connection con;
	            	DB db = new DB();
	            	con = db.getConnection();
	            	
	            	
	    			String sqlStr = "select * from product where featured = 'on' and display = 'public'";
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
	                        <div id="popularItem1" class="carousel slide pupularItemCarousel" data-ride="carousel">
	                          <!-- Wrapper for slides -->
	                          <div class="carousel-inner" role="listbox">
	                            <%=homeClass.getImage(rs.getString("imageUrl"), model) %>
	                          </div>
	                        </div>
	                        <div class="caption">
	                            <h4 class="pull-right">S$<%=price %></h4>
	                            <h4><a href="product_info.jsp?id=<%=id%>"><%=model %></a>
	                            </h4>
	                            <p>
	                                <%=homeClass.getSpecs(rs.getString("specs")) %>
	                            </p>
	                        </div>
	                        <div class="ratings">
	                            <p class="pull-right">15 reviews</p>
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
	           <%
		    			}
		           	rs.close();
	  	         	pstmt.close();
	  	         	con.close();
		  	         	
		  	      } catch (Exception e) {
		
		  			out.println(e.getMessage());
		  		  } 
	           %>
                
                
            </div><!-- Product listing container-->
                        
        </div><!-- right Container -->
    </div>
    

</div><!-- end container -->
    
<%@ include file="footer.html" %>   