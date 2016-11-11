var customer = {
	checkOrder: function(id, model, price, status, date, rating, rating_desc, images){
		
		var warranty = '';
		var displayClass;
		
		var daysDiff = daydiff(parseDate(changeDateFormat(date, false, 'formatUS')), parseDate(changeDateFormat(date, true, 'formatUS')));

		if(status=="Ordered"){
			displayClass = "info";
		}else if(status=="Deliver"){
			displayClass = "primary";
			warranty = changeDateFormat(date, true)+' '+daysDiff+ ' Days';
		}
		else if(status=="Collect"){
			displayClass = "success";
			warranty = changeDateFormat(date, true)+' '+daysDiff+ ' Days';
		}
		else if(status=="Cancel"){
			displayClass = "default";
		}
		else if(status=="Reject"){
			displayClass = "danger";
		}
		
		var getFirstImage = images.split(",")[0];

		$("#orderDetails_id").text("");
		$("#orderDetails_model").text("");
		$("#orderDetails_purchase").text("");
		$("#orderDetails_status").html("");
		$("#orderDetails_price").text("");
		$("#orderDetails_warrenty").text("");
		$(".orderDetailsImg").attr('src', '');
		$("#orderDetails_rating").val('');
		$("#orderDetails_star").html('');
		$("#orderDetails_comment").val('');
		
		$("#orderDetails_id").text(id);
		$("#orderDetails_model").text(model);
		$("#orderDetails_purchase").text(changeDateFormat(date));
		$("#orderDetails_status").html('<span class="label label-'+displayClass+'">'+status+'</span>');
		$("#orderDetails_price").text('S$'+price);
		$("#orderDetails_warrenty").text(warranty);
		$(".orderDetailsImg").attr('src', getFirstImage);
		
		if(rating!="undefined"){
			$("#orderDetails_rating").val(rating);
			var stars = '';
			for(var i=0; i<rating; i++){
				stars += '<span class="glyphicon glyphicon-star"></span>';
			}
			$("#orderDetails_star").html(stars);
		}
		
		if(rating_desc!="undefined"){
			$("#orderDetails_comment").val(rating_desc);
		}
		
		console.log(status);
		if(status=="Deliver" || status=="Collect"){
			$("#orderDetails_rating").prop("disabled", false);
			$("#orderDetails_comment").prop("disabled", false);
		}else{
			$("#orderDetails_rating").prop("disabled", true);
			$("#orderDetails_comment").prop("disabled", true);
		}

	},
}

function changeDateFormat(date, warranty, formatUS){
	var date = new Date(date);
	var year = date.getFullYear();
	if(warranty == true){
		year += 3;
	}
	if(formatUS=="formatUS"){
		var newDate = (date.getMonth() + 1) + '/' + date.getDate() + '/' +  year;
	}else{
		var newDate = date.getDate() + '/' + (date.getMonth() + 1) + '/' +  year;
	}
	
	
	return newDate;
}

function parseDate(str) {
    var mdy = str.split('/');
    return new Date(mdy[2], mdy[0]-1, mdy[1]);
}

function daydiff(first, second) {
    return Math.round((second-first)/(1000*60*60*24));
}

$(document).ready(function(){
	
	$("#orderDetails_rating").val("");
	$("#orderDetails_rating").prop("disabled", true);
	$("#orderDetails_comment").prop("disabled", true);
	
	$.get('../CustomerServlet', {
        //mode : 'getOrderListing'
	}, function(responseText) {

		var data = responseText.Datasets;	
		var html = '';
		var displayClass = '';
		for(var i=0; i<data.length;i++){
			
			if(data[i].status=="Ordered"){
				displayClass = "info";
			}else if(data[i].status=="Deliver"){
				displayClass = "primary";
			}
			else if(data[i].status=="Collect"){
				displayClass = "success";
			}
			else if(data[i].status=="Cancel"){
				displayClass = "default";
			}
			else if(data[i].status=="Reject"){
				displayClass = "danger";
			}
			
			

			html += "<tr>";
			html += '<td>'+(i+1)+'</td>'; // ,\''+data[i].price+'\', \''+data[i].status+'\',\''+data[i].date+'\',\''+data[i].review_rating+'\', \''+data[i].review_desc+'\'
			html += '<td><a class="pointer" onclick="customer.checkOrder('+data[i].id+',\''+data[i].model+'\',\''+data[i].price+'\', \''+data[i].status+'\',\''+data[i].date+'\',\''+data[i].review_rating+'\', \''+data[i].review_desc+'\', \''+data[i].imageUrl+'\')">'+data[i].id+'</a></td>';
			html += '<td>'+data[i].model+'</td>';
			html += '<td>Category '+data[i].brand+'</td>';
			html += '<td><b>S$'+parseFloat(data[i].price).toFixed(2)+'</b></td>';
			html += '<td>'+changeDateFormat(data[i].date)+'</td>';
			html += '<td>'+changeDateFormat(data[i].date)+'</td>';
			html += '<td class="text-center"><span class="label label-'+displayClass+'">'+data[i].status+'</span></td>';
			html += '';
			html += "</tr>";
		}
		$("#customerOrderList").append(html);
	});
	
	$("#orderDetails_rating").change(function(){
		
		var stars = '';
		for(var i=0; i<$("#orderDetails_rating").val(); i++){
			stars += '<span class="glyphicon glyphicon-star"></span>';
		}
		$("#orderDetails_star").html(stars);
	});
	
	$("#reviewEditBtn").click(function(){
		var review = $("#orderDetails_comment").val();
		var review_rating = $("#orderDetails_rating").val();
		var id = $("#orderDetails_id").text();
		
		$.post( "../CustomerServlet", {"id":id, "review": review, "review_rating": review_rating} )
    	.done(function(data){
    		//console.log(data);
    		if(data){
    			$("#editSuccessAlert").show();
    			location.reload();
    			setTimeout(function(){
    				$("#editSuccessAlert").hide();
				}, 3000);
    		}
    	});
	})
    
});

