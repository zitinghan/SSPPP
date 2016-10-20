var customer = {
	checkOrder: function(order){
		if(order=='0011241'){
			$("#orderDetails_id").text('0011241');
			$("#orderDetails_model").text('iPad Mini 4 32GB Wifi');
			$("#orderDetails_purchase").text('12/10/2016');
			$("#orderDetails_status").html('<span class="label label-success">Success</span>');
			$("#orderDetails_price").text('S$537.14');
			$("#orderDetails_warrenty").text('12/10/2019 (1095 days left)');
			$(".orderDetailsImg").attr('src', '../images/product/ipadmini4.jpg');

			$("#orderDetails_rating").val('4');
			$("#orderDetails_star").html('<span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span>');
			$("#orderDetails_comment").val('Very Good');
			$("#orderDetails_rating").prop("disabled", false);
			$("#orderDetails_comment").prop("disabled", false);

		}else if(order=='0011243'){
			$("#orderDetails_id").text('0011243');
			$("#orderDetails_model").text('G501');
			$("#orderDetails_status").html('<span class="label label-warning">Pending</span>');
			$("#orderDetails_purchase").text('-');
			$("#orderDetails_price").text('S$1,770.85');
			$("#orderDetails_warrenty").text('-');
			$(".orderDetailsImg").attr('src', 'http://www3.ntu.edu.sg/CITS2/computerdeals/images/2016/asus-g501.jpg');

			$("#orderDetails_rating").val('-');
			$("#orderDetails_star").html('-');
			$("#orderDetails_comment").val('');
			$("#orderDetails_rating").attr('disabled', 'disabled');
			$("#orderDetails_comment").attr('disabled', 'disabled');

		}else if(order=='0011252'){
			$("#orderDetails_id").text('0011252');
			$("#orderDetails_model").text('G501');
			$("#orderDetails_status").html('<span class="label label-danger">Cancel</span>');
			$("#orderDetails_purchase").text('-');
			$("#orderDetails_price").text('S$1,770.85');
			$("#orderDetails_warrenty").text('-');
			$(".orderDetailsImg").attr('src', 'http://www3.ntu.edu.sg/CITS2/computerdeals/images/2016/asus-g501.jpg');

			$("#orderDetails_rating").val('-');
			$("#orderDetails_star").html('-');
			$("#orderDetails_comment").val('');
			$("#orderDetails_rating").attr('disabled', 'disabled');
			$("#orderDetails_comment").attr('disabled', 'disabled');
		}
	},
}