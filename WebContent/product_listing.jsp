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
                        <div class="thumbnail pupularItemCarousel">
                            <%=homeClass.getFirstImage(rs.getString("imageUrl"), model, id) %>
                            <div class="caption">
                                <h4 class="pull-right">S$<%=price %></h4>
                                <h4><a href="product_info.jsp?id=<%=id %>"><%=model %></a>
                                </h4>
                                <p>
                                	<%=homeClass.getSpecs(rs.getString("specs")) %>
                                </p>
                            </div>
                            <div class="ratings">
                                <%=homeClass.getReview(id, false, false) %>
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