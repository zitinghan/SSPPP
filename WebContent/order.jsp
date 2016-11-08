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
            
            	<jsp:useBean id="homeClass" class="controller.HomeServlet"/>
               	<%
	                try{
		                Connection con;
		            	DB db = new DB();
		            	con = db.getConnection();
		            	
		            	String id = request.getParameter("id");
		            	String sqlStr = "select * from product where id = '"+id+"'";
		            	
		    			PreparedStatement pstmt = con.prepareStatement(sqlStr);
		    			ResultSet rs = pstmt.executeQuery();
		    			
		    			String model,price;
		    			
		    			while(rs.next()) {
		    				price = rs.getString("price");
		    				model = rs.getString("model");
                %>
                <input type="hidden" id="productid" value="<%=id %>" />
				<input type="hidden" id="price" value="<%=price %>" />
				
				
                <table class="table">
                	<tr>
                    	<td class="orderTableTitle" colspan=3><h4>PC Info</h4></td>
                    </tr>
                	<tr>
                    	<td>Computer name</td>
                        <td>:</td>
                        <td><%=model %></td>
                    </tr>
                    <tr>
                    	<td>Price</td>
                        <td>:</td>
                        <td>S$<%=price %> (w GST)</td>
                    </tr>
                    <tr>
                    	<td>Date</td>
                        <td>:</td>
                        <td><%=homeClass.getDate(0) %></td>
                    </tr>
                    <tr>
                    	<td>Collection Date</td>
                        <td>:</td>
                        <td><%=homeClass.getDate(2) %></td>
                    </tr>
                    <tr>
                    	<td>Collect Location</td>
                        <td>:</td>
                        <td>
                        	<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3988.7224660135375!2d103.6800377152186!3d1.3429115990205693!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31da0fa400001c93%3A0x51073ab775358b4f!2sEight+Flags!5e0!3m2!1sen!2ssg!4v1478621044638" width="400" height="300" frameborder="0" style="border:0" allowfullscreen></iframe>
                        </td>
                    </tr>
                    <tr>
                    	<td class="orderTableTitle" colspan=3><h4>Buyer Info</h4></td>
                    </tr>
                    <tr>
                    	<td>Name</td>
                        <td>:</td>
                        <td><input type="text" class="form-control" placeholder="Name" id="orderName"></td>
                    </tr>
                    <tr>
                    	<td>ID</td>
                        <td>:</td>
                        <td><input type="text" class="form-control" placeholder="ID as per card" id="orderID"></td>
                    </tr>
                    
                    <tr>
                    	<td colspan="3" class="text-right"><button type="button" class="btn btn-primary" id="orderAction">Confirm</button></td>
                    </tr>
                    <tr>
                    	<td colspan="3" class="text-right"><span id="showMsg"></span></td>
                    </tr>
                </table>
                <img src="" alt="" id="urlQR" />
                <div id="my_first_image"></div>
  				<!--<img src="https://chart.googleapis.com/chart?chs=50x50&cht=qr&chl=Hello+world&chld=L|1&choe=UTF-8" />-->
  				
  				<%
		    			}
		           	rs.close();
	  	         	pstmt.close();
	  	         	con.close();
		  	         	
		  	      } catch (Exception e) {
		
		  			out.println(e.getMessage());
		  		  } 
	           	%>
                            
            </div><!-- right Container -->
        </div>
        

    <%@ include file="footer.html" %>   