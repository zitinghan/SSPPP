$(document).ready(function() {
	
	checkSession();
	
	$("#editFailAlert").hide();
	$("#editSuccessAlert").hide();
	
    $('#productEditBtn').click(function(){
    	//console.log($( "#productEditForm" ).serialize());
    	$.post( "../../AdminServlet", $( "#productEditForm" ).serialize() )
    	.done(function(data){
    		//console.log(data);
    		if(data){
    			$("#editSuccessAlert").show();
    			setTimeout(function(){
    				$("#editSuccessAlert").hide();
				}, 3000);
    		}
    	});
    });
    
    $('#orderEditBtn').click(function(){
    	//console.log($( "#productEditForm" ).serialize());
    	var orderStatus = $("#orderStatus").val();
    	var orderID = $("#orderID").text();
    	
    	$.post( "../../AdminServlet", {"mode":"orderEdit", "orderStatus": orderStatus, "orderID": orderID} )
    	.done(function(data){
    		//console.log(data);
    		if(data){
    			$("#editSuccessAlert").show();
    			supplier.backToListing();
    			setTimeout(function(){
    				$("#editSuccessAlert").hide();
				}, 3000);
    		}
    	});
    });
    
    
    
    var pageName = location.pathname.substring(location.pathname.lastIndexOf("/") + 1);
    if(pageName == "index.html"){
    	$.get('../../AdminServlet', {
            mode : 'getOrderListing'
    	}, function(responseText) {

    		var data = responseText.Datasets;	
    		var html = '';
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
    			html += '<td>'+(i+1)+'</td>';
    			html += '<td>'+data[i].userid+'</td>';
    			html += '<td>'+data[i].model+'</td>';
    			html += '<td>Category '+data[i].category+'</td>';
    			html += '<td>'+parseFloat(data[i].price).toFixed(2)+'</td>';
    			html += '<td>'+data[i].date+'</td>';
    			html += '<td class="text-center"><span class="label label-'+displayClass+'">'+data[i].status+'</span></td>';
    			html += '<td class="text-center"><a class="pointer" onclick="supplier.editOrder('+data[i].id+')"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span></a></td>';
    			html += "</tr>";
    		}
    		$("#listingOrderTable").append(html);
    		$('#dataTables-order').DataTable({
    	        responsive: true
    	    });
    	});
    }else{
    	$.get('../../AdminServlet', {
            mode : 'getAllProductListing'
    	}, function(responseText) {
    		var data = responseText.Datasets;	
    		var html = '';
    		for(var i=0; i<data.length;i++){
    			var displayClass = '';
    			if(data[i].display=='public'){
    				displayClass = "success";
    			}else{
    				displayClass = "warning";
    			}
    			
    			var featured = '';
    			if(data[i].featured=='on'){
    				featured = '<span style="color:green">Yes<span>';
    			}else{
    				featured = '<span style="color:red">No<span>';
    			}
    			
    			html += "<tr>";
    			html += '<td>'+data[i].id+'</td>';
    			html += '<td>'+data[i].model+'</td>';
    			html += '<td>Category '+data[i].category+'</td>';
    			html += '<td>'+parseFloat(data[i].price).toFixed(2)+'</td>';
    			html += '<td>'+data[i].update_time+'</td>';
    			html += '<td>'+featured+'</td>';
    			html += '<td class="text-center"><span class="label label-'+displayClass+'">'+titleCase(data[i].display)+'</span></td>';
    			html += '<td class="text-center"><a class="pointer" onclick="supplier.editProduct('+data[i].id+')"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span></a></td>';
    			html += "</tr>";
    		}
    		$("#listingTable").append(html);
    		$('#dataTables-example').DataTable({
    	        responsive: true
    	    });
    	});
    }

    function titleCase(string) {
        return string.charAt(0).toUpperCase() + string.slice(1);
    }
    
    function checkSession(){
    	$.get('../../LoginServlet', {mode:"checkSession"} , function(responseText) {
            if(responseText=="" || responseText=="false"){
            	window.location.href = "../Login.jsp";
            }else{
            	if(responseText=="suppliertrue"){
            		$("#adminTotalBrand").hide();
            	}
            	
            }

        });
    }
});

var supplier = {
    
	editProduct: function(id){

    	if(id){
    		$("#actionMode").text("Edit");
    		$.get('../../AdminServlet', {
                mode : 'getSelectedProductDetails',
                id : id,
        	}, function(responseText) {
        		$("#productID").val(responseText.id);
        		$.each( responseText, function( key, value ) {
        			if(key=="display"){
        				$("input[name=display][value='"+value+"']").prop("checked",true);
        			}else if(key=="featured"){
        				if(value=="on"){
        					$("input[name=featured]").attr('checked',true);
        				}
        			}else if(key=="specs"){
        				var obj = JSON.parse(value);
        				for(var i in obj){
        					$( '#' + i ).val( obj[i] );
        				}
        			}else if(key=="imageUrl"){
        				
        				var images = value.split(',');
        				for(var i in images){
        					var id = parseInt(i) + 1;
        					$("#image_"+id).val(images[i]);
        					
        				}
        			}else{
        				$( '#' + key ).val( value ); 
        			}
        		});
        	});
    	}else{
    		$("#actionMode").text("New");
    	}
    	
        $("#productListing").removeClass('show').addClass('hide');
        $("#productEdit").removeClass('hide').addClass('show');
    },

    backToListing:function(){
    	/*$('#productEditForm').trigger("reset");
        $("#productEdit").removeClass('show').addClass('hide');
        $("#productListing").removeClass('hide').addClass('show');*/
    	location.reload();
    },
    
    editOrder: function(id){
    	
		$.get('../../AdminServlet', {
            mode : 'getSelectedOrderDetails',
            id : id,
    	}, function(responseText) {
    		
    		$("#orderID").text(responseText.id);
    		$("#userID").text(responseText.userid);
    		$("#orderBrand").text(responseText.brand);
    		$("#orderPrice").text(responseText.price);
    		$("#orderModel").text(responseText.model);
    		$("#orderDate").text(responseText.date);
    		$("#orderStatus").val(responseText.status);
    		
    		
    	});
		
		$("#orderListing").removeClass('show').addClass('hide');
        $("#orderEdit").removeClass('hide').addClass('show');
    }
    	
};

//Flot Pie Chart
$(function() {
	
	$.get('../../AdminServlet', {
        mode : 'getTotalSellProductByBrand',
	}, function(responseText) {

	    var plotObj = $.plot($("#flot-pie-chart"), responseText.Datasets, {
	        series: {
	            pie: {
	                show: true
	            }
	        },
	        grid: {
	            hoverable: true
	        },
	        tooltip: true,
	        tooltipOpts: {
	            content: "%p.0%, %s", // show percentages, rounding to 2 decimal places
	            shifts: {
	                x: 20,
	                y: 0
	            },
	            defaultTheme: false
	        }
	    });
	});
	
	$.get('../../AdminServlet', {
        mode : 'getTotalSellProductByProduct',
	}, function(responseText) {

	    var plotObj = $.plot($("#flot-pie-chart-total-product"), responseText.Datasets, {
	        series: {
	            pie: {
	                show: true
	            }
	        },
	        grid: {
	            hoverable: true
	        },
	        tooltip: true,
	        tooltipOpts: {
	            content: "%p.0%, %s", // show percentages, rounding to 2 decimal places
	            shifts: {
	                x: 20,
	                y: 0
	            },
	            defaultTheme: false
	        }
	    });
	});
    

});

