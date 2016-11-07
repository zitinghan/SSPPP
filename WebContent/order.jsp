    <%@ include file="header.html" %>   

    <div class="container">

        <div class="row">
             <div class="col-md-3"><!-- left nav -->
                <p class="lead">Categories</p>
                <div class="list-group">
                    <a href="#" class="list-group-item">Tablet</a>
                    <a href="#" class="list-group-item">Laptop</a>
                    <a href="#" class="list-group-item">Desktop</a>
                </div>

                <p class="lead">Brand</p>
                <div class="list-group leftNav">
                    <a href="product_listing.jsp?name=Acer" class="list-group-item">
                        <img src="images/brand/logo.svg" alt="Acer" />
                    </a>

                    <a href="#" class="list-group-item">
                        <img src="images/brand/Apple-logo-grey.png" alt="Apple" />
                    </a>

                    <a href="#" class="list-group-item">
                        <img src="images/brand/LogoAsus.png" alt="Asus" />
                    </a>

                    <a href="#" class="list-group-item">
                        <img src="images/brand/Dell_Logo.svg.png" alt="Dell" />
                    </a>

                    <a href="#" class="list-group-item">
                        <img src="images/brand/HP_New_Logo_2D.svg.png" alt="HP" />
                    </a>

                    <a href="#" class="list-group-item">
                        <img src="images/brand/Lenovo-Logos.jpg" alt="Lenovo" />
                    </a>

                    <a href="#" class="list-group-item">
                        <img src="images/brand/Microsoft-Logo-PNG.png" alt="Microsoft" />
                    </a>
                    
                </div>
            </div><!-- left nav --> 

            <div class="col-md-9"><!-- right Container -->
				
                <table class="table">
                	<tr>
                    	<td class="orderTableTitle" colspan=3><h4>PC Info</h4></td>
                    </tr>
                	<tr>
                    	<td>Computer name</td>
                        <td>:</td>
                        <td>Apple iPad Mini 4 32GB Wifi</td>
                    </tr>
                    <tr>
                    	<td>Price</td>
                        <td>:</td>
                        <td>S$537.14 (w GST)</td>
                    </tr>
                    <tr>
                    	<td>Date</td>
                        <td>:</td>
                        <td>01/10/2016</td>
                    </tr>
                    <tr>
                    	<td>Collection Date</td>
                        <td>:</td>
                        <td>05/10/2016</td>
                    </tr>
                    <tr>
                    	<td class="orderTableTitle" colspan=3><h4>Buyer Info</h4></td>
                    </tr>
                    <tr>
                    	<td>Name</td>
                        <td>:</td>
                        <td><input type="text" class="form-control" placeholder="Name"></td>
                    </tr>
                    <tr>
                    	<td>ID</td>
                        <td>:</td>
                        <td><input type="text" class="form-control" placeholder="ID as per card"></td>
                    </tr>
                    <tr>
                    	<td colspan="3" class="text-right"><button type="button" class="btn btn-primary">Confirm</button></td>
                    </tr>
                </table>
                <img src="" alt="" id="urlQR" />
                <div id="my_first_image"></div>
  				<!--<img src="https://chart.googleapis.com/chart?chs=50x50&cht=qr&chl=Hello+world&chld=L|1&choe=UTF-8" />-->
                            
            </div><!-- right Container -->
        </div>
        

    <%@ include file="footer.html" %>   