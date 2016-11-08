$(document).ready(function(){
	$("#name").text('here');

	var mainPage = {
		
	}
	
	/*$("#urlQR").loadQRUrl("http://google.com");
	$("#my_first_image").loadQRUrl("brauliovaldivielso.eu");*/
	
	$("#orderAction").click(function(){
		var productID = $("#productid").val();
		var price = $("#price").val();
		var orderName = $("#orderName").val();
		var orderID = $("#orderID").val();
		var sendData = {
				id:productID,
				userid: orderID,
				name: orderName,
				price: price
		}
		$.post( "HomeServlet", sendData )
    	.done(function(data){
    		console.log(data);
    		if(data==true){
    			$("#showMsg").html("<div class='alert alert-success'>Order Success. Please collect your order on the collection date. Thank you.</div>");
    		}else{
    			
    			$("#showMsg").html("<div class='alert alert-danger'><span class='glyphicon glyphicon-exclamation-sign' aria-hidden='true'></span> Wong ID and Name. Please re-try</div>");
    		}
    	});
		
	});
});

function orderAction(id){
	window.location.href = "order.jsp?id="+id;
}
