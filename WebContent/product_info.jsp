    <%@ include file="header.html" %>   
    <%@page import="java.sql.*"%>    
	<%@page import="database.*" %>
	<%@page import="org.json.*" %>

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
		    			
		    			String model,price,desc,others_desc;
		    			JSONObject specsJson;
		    			
		    			while(rs.next()) {
		    				price = rs.getString("price");
		    				model = rs.getString("model");
		    				desc = rs.getString("product_desc");
		    				others_desc = rs.getString("others_desc");
		    				
		    				specsJson = new JSONObject(rs.getString("specs").toString());
                %>

                <div class="thumbnail">
                    <div class="carousel-holder">
                        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                            </ol>
                            <div class="carousel-inner productInfoCarousel">
                                <%=homeClass.getSliderInfoImage(rs.getString("imageUrl"), model) %>
                            </div>
                            <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left"></span>
                            </a>
                            <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right"></span>
                            </a>
                        </div>
                    </div>

                    <div class="productCaption">
                        <h4 class="pull-right">S$<%=price %> (w GST)</h4>
                        <h4><%=model %></h4>
                        <div class="text-right"><button type="button" class="btn btn-success" onclick="orderAction(<%=id%>)">Order Now <span class="glyphicon glyphicon-plus" aria-hidden="true"></span></button></div>
                        <p>
                            <%=desc %>
                        </p>
                    
                        <div class="ratings">
                            <p class="pull-right">25 reviews</p>
                            <p>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                                5 stars
                            </p>
                        </div>
                    </div>

                    <br/>
                    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                      <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingOne">
                          <h4 class="panel-title">
                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                              Specification
                            </a>
                          </h4>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                          <div class="panel-body">
                            <table class="table table-hover">
                                <tr>
                                    <td>Processor</td>
                                    <td><%=specsJson.getString("specs_processor") %></td>
                                </tr>
                                <tr>
                                    <td>Chipset</td>
                                    <td><%=specsJson.getString("specs_chipset") %></td>
                                </tr>
                                <tr>
                                    <td>RAM</td>
                                    <td><%=specsJson.getString("specs_memory") %></td>
                                </tr>
                                <tr>
                                    <td>Hard Disk Drive</td>
                                    <td><%=specsJson.getString("specs_harddiskdrive") %></td>
                                </tr>
                                <tr>
                                    <td>Display</td>
                                    <td><%=specsJson.getString("specs_sdisplay") %></td>
                                </tr>
                                <tr>
                                    <td>Graphics</td>
                                    <td><%=specsJson.getString("specs_graphics") %></td>
                                </tr>
                                <tr>
                                    <td>Communication</td>
                                    <td><%=specsJson.getString("specs_communication") %></td>
                                </tr>
                                <tr>
                                    <td>Optical Drive</td>
                                    <td><%=specsJson.getString("specs_opticaldrive") %></td>
                                </tr>
                                <tr>
                                    <td>I/O Interface</td>
                                    <td><%=specsJson.getString("specs_iointerface") %></td>
                                </tr>
                                <tr>
                                    <td>Audio</td>
                                    <td><%=specsJson.getString("specs_audio") %></td>
                                </tr>
                                <tr>
                                    <td>Operating System</td>
                                    <td><%=specsJson.getString("specs_operatingsystem") %></td>
                                </tr>
                                <tr>
                                    <td>Additional Software</td>
                                    <td><%=specsJson.getString("specs_additionalsoftware") %></td>
                                </tr>
                                <tr>
                                    <td>Mouse/Pointer</td>
                                    <td><%=specsJson.getString("specs_mousepointer") %></td>
                                </tr>
                                <tr>
                                    <td>Other</td>
                                    <td><%=specsJson.getString("specs_other") %></td>
                                </tr>
                                <tr>
                                    <td>Warranty</td>
                                    <td><%=specsJson.getString("specs_warranty") %></td>
                                </tr>
                                <tr>
                                    <td>Weight & Battery</td>
                                    <td><%=specsJson.getString("specs_weightbattery") %></td>
                                </tr>
                                <tr>
                                    <td>Supplier</td>
                                    <td><%=specsJson.getString("specs_supplier") %></td>
                                </tr>
                            </table>
                          </div>
                        </div>
                      </div>
                      <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingTwo">
                          <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                              Model Upgrade Options
                            </a>
                          </h4>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                          <div class="panel-body">
                            <!-- <table class="table table-hover">
                                <tr>
                                    <td>iPad Mini 4 Wi-Fi 128GB</td>
                                    <td>+ S$136.96</td>
                                </tr>
                                <tr>
                                    <td>iPad Mini 4 Wi-Fi+Cellular 32GB</td>
                                    <td>+ S$169.06</td>
                                </tr>
                                <tr>
                                    <td>iPad Mini 4 Wi-Fi+Cellular 128GB</td>
                                    <td>+ S$318.86</td>
                                </tr>
                                <tr>
                                    <td>AppleCare Protection Plan</td>
                                    <td>+ S$96.30</td>
                                </tr>
                            </table> -->
                            <%=homeClass.getOthersDesc(others_desc) %>
                          </div>
                        </div>
                      </div>
                      <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingThree">
                          <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                              Disclaimer
                            </a>
                          </h4>
                        </div>
                        <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                          <div class="panel-body">
                            <div>Note: All unit prices below are inclusive of 7% GST.</div><br/>
                            <div>
                                While all efforts are made to check pricing and other errors, inadvertent errors do occur from time to time, NTU and respective supplier reserve the right to decline orders arising from such errors.
                            </div>
                          </div>
                        </div>
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
                
            </div><!-- right Container -->
        </div>
        

    </div><!-- end container -->
    
	<%@ include file="footer.html" %>   