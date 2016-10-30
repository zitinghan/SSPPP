$(document).ready(function() {
	
	$("#editFailAlert").hide();
	$("#editSuccessAlert").hide();
	
    $('#productEditBtn').click(function(){
    	$.post( "../../AdminServlet", $( "#productEditForm" ).serialize() )
    	.done(function(data){
    		console.log(data);
    		if(data){
    			$("#editSuccessAlert").show();
    			setTimeout(function(){
    				$("#editSuccessAlert").hide();
				}, 3000);
    		}
    	});
    });
    
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
			
			html += "<tr>";
			html += '<td>'+data[i].id+'</td>';
			html += '<td>'+data[i].model+'</td>';
			html += '<td>Category '+data[i].category+'</td>';
			html += '<td>'+parseFloat(data[i].price).toFixed(2)+'</td>';
			html += '<td>'+data[i].update_time+'</td>';
			html += '<td class="text-center"><span class="label label-'+displayClass+'">'+titleCase(data[i].display)+'</span></td>';
			html += '<td class="text-center"><a class="pointer" onclick="supplier.editProduct('+data[i].id+')"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span></a></td>';
			html += "</tr>";
		}
		$("#listingTable").append(html);
		$('#dataTables-example').DataTable({
	        responsive: true
	    });

       
        
	});
    
    function titleCase(string) {
        return string.charAt(0).toUpperCase() + string.slice(1);
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
};


//Flot Pie Chart
/*$(function() {

    var data = [{
        label: "Series 0",
        data: 1
    }, {
        label: "Series 1",
        data: 3
    }, {
        label: "Series 2",
        data: 9
    }, {
        label: "Series 3",
        data: 20
    }];

    var plotObj = $.plot($("#flot-pie-chart"), data, {
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

//Flot Line Chart
$(document).ready(function() {

    var offset = 0;
    plot();

    function plot() {
        var sin = [],
            cos = [];
        for (var i = 0; i < 12; i += 0.2) {
            sin.push([i, Math.sin(i + offset)]);
            cos.push([i, Math.cos(i + offset)]);
        }

        var options = {
            series: {
                lines: {
                    show: true
                },
                points: {
                    show: true
                }
            },
            grid: {
                hoverable: true //IMPORTANT! this is needed for tooltip to work
            },
            yaxis: {
                min: -1.2,
                max: 1.2
            },
            tooltip: true,
            tooltipOpts: {
                content: "'%s' of %x.1 is %y.4",
                shifts: {
                    x: -60,
                    y: 25
                }
            }
        };

        var plotObj = $.plot($("#flot-line-chart"), [{
                data: sin,
                label: "sin(x)"
            }, {
                data: cos,
                label: "cos(x)"
            }],
            options);
    }

    
});*/