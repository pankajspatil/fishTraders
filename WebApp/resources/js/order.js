/**
 * 
 */
var menuList = {};
var oldSelectVal = 0;

function addMenuToOrder(buttonObj){	
	var menuRow = $(buttonObj).closest('tr');
	var clonedRow = menuRow.clone(true);
	
	var menuId = menuRow.attr('id');
	var quantity = 1;
	var unitPrice = $(menuRow).find('td:nth-child(2)').text();
	if (unitPrice==' '){
		unitPrice = document.getElementById('input'+menuId).value;
	}
	var finalPrice = parseFloat(quantity * unitPrice);
	
	var menu = {};
	menu.menuId = menuId;
	menu.quantity = quantity;
	menu.unitPrice = unitPrice;
	menu.finalPrice = finalPrice;
	menu.notes = '';
	menu.orderId = $('#orderId').val();
	
	var randomNumber = (Math.floor(1000 + Math.random() * 9000)).toString();
	randomNumber = randomNumber.substring(-2);
	
	menuList[randomNumber] = menu;

	var combo = $("<select onClick='setOldValue(this)' onChange='updatePrice(this)'></select>").attr("id", randomNumber).attr("name", randomNumber);

    for(var i=1; i <= 30; i++){
    	combo.append("<option value='" + i + "'>" + i + "</option>");
    }
    
    var quantityCell = $("<td></td>");
    quantityCell.append(combo);
    
    var newRow = $("<tr id='"+randomNumber+"' align='center'></tr>");
    
    newRow.append($(clonedRow).find('td:nth-child(1)').removeAttr('width').attr("align","left"));
    newRow.append(quantityCell);
    newRow.append("<td>"+unitPrice+"</td>");
    newRow.append("<td>"+finalPrice+"</td>");
    newRow.append($("<img class='deleteIcon' src='/AgriTadka/resources/images/Delete.png' onclick='deleteRecord(this)'>"));
   
    console.log(newRow);
	
	var table2 = $('#orderedTable');
	table2.append(newRow);
	
	$(newRow).effect("highlight",{},3000);
	
	var subTotal = parseFloat($('#priceTotal').text()) + parseFloat(finalPrice);
	$('#priceTotal').text(subTotal.toFixed(2));
	
	console.log($('#priceTotal').is(':animated'));
	if(!$('#priceTotal').is(':animated')){
		$('#priceTotal').effect("bounce",{},3000);
	}
	
	//console.log(menuList);
}

function updatePrice(selectObj){
	
	var rowObj = $(selectObj).closest('tr');
	var id = $(rowObj).attr("id");	
	var orderMenuMapId = rowObj.find("input:hidden").attr("id");
	
	var status = orderMenuMapId === undefined ? 0 : checkIfProcessed(orderMenuMapId);
	
	if(status == 0){
		if(id === undefined){
			id = (Math.floor(1000 + Math.random() * 9000)).toString();
			id = id.substring(-2);
			
			$(rowObj).attr("id", id);
		}
		
		var quantity = $(selectObj).find("option:selected").val();
		
		var menu = menuList[id] === undefined ? {} : menuList[id];
		var unitPrice = $(rowObj).find('td:nth-child(3)').text();	
		var finalPrice = parseFloat(quantity * unitPrice);
		
		var existingFinalPrice = parseFloat($(rowObj).find('td:nth-child(4)').text());
		var subTotal = parseFloat($('#priceTotal').text());
		
		subTotal = (subTotal - existingFinalPrice) + finalPrice;
		$('#priceTotal').text(subTotal.toFixed(2));
		$('#priceTotal').effect("bounce",{},3000);
		
		menu.quantity = quantity;
		menu.finalPrice = finalPrice;
		menu.orderMenuMapId = orderMenuMapId;
		menu.notes = menu.notes === undefined ? '' : menu.notes;
		menuList[id] = menu;
		
		var cellObj = $(rowObj).find('td:nth-child(4)').text(finalPrice);
		$(cellObj).effect("highlight",{},3000);
	}else if(status == 2){
		Lobibox.alert("error",{
			msg : 'Can not update quantity. Menu is in progress.'
		});
		$(selectObj).val(oldSelectVal);
	}else{
		Lobibox.alert("error",{
			msg : 'Something went wrong.'
		});
		$(selectObj).val(oldSelectVal);
	}
	
}

function checkIfProcessed(orderMenuMapId){
	
	var data = {
			"orderMenuMapId" : orderMenuMapId
	};
	
	var postData = {
			"action" : "checkIfMenuProcessed",
			"data" : JSON.stringify(data)
	};
	
	var status = 1;
	
	$.ajax({
	      type: 'POST',
	      url: "/AgriTadka/pages/ajax/postAjaxData.jsp",
	      data: postData, 
	      dataType: 'json',
	      async : false,
	      success: function(resultData) {
	    	  //alert("Save Complete" + resultData)
	    	  status =  resultData;
	    	 },
	    	 error: function (xhr, status) { 
	    		 console.log('ajax error = ' + xhr.statusText);
	            } 
	});
	
	return status;
}

function saveOrder(){
	
	var waiterId = $('#waiterName').val();
	
	/*if($(menuList).length > 0){
		if(waiterId != '-1'){
			var key = Object.keys($(menuList)[0])[0];
			$(menuList)[0][key].waiterId = waiterId;
		}
	}*/
	
	if(waiterId != '-1'){
		$(menuList)[0].waiterId = waiterId;
		$(menuList)[0].orderId = $('#orderId').val();
	}
	
	
	var postData = {
			"action" : "saveOrder",
			"data" : JSON.stringify(menuList)
	};
	
	$.ajax({
	      type: 'POST',
	      url: "/AgriTadka/pages/ajax/postAjaxData.jsp",
	      data: postData, 
	      dataType: 'json',
	      success: function(resultData) {
	    	  //alert("Save Complete" + resultData)
	    	  
	    	  $.each(resultData, function(key, value) {
	    		  
	    		  var trRow = ('#'+key);
	    		  var inputObj = $(trRow).find('input:hidden');
	    		  
	    		  if(inputObj === undefined || inputObj.length === 0){
	    			  $(trRow).find('td:nth-child(1)').append($("<input></input>").attr("type","hidden").attr("id",value.orderMenuMapId));
	    		  }
	    		  delete menuList[key];
	    		  
	    		  });
	    	  
	    	  if(waiterId != '-1'){
	    		  $("#waiterName").parent().find("input.ui-autocomplete-input").autocomplete("option", "disabled", true).prop("disabled",true);
	    		  $("#waiterName").parent().find("a.ui-button").button("disable");
	    	  }
	    	  
	    	  $('#rightCell').LoadingOverlay("hide");
	    	    Lobibox.alert("success",{
	    				msg : 'Record saved successfully!!'
	    			});
	    	 },
	    	 error: function (xhr, status) { 
	    		 console.log('ajax error = ' + xhr.statusText);
	    		 $('#rightCell').LoadingOverlay("hide");	    		 
	    		 	Lobibox.alert("error",{
	    				msg : 'Something went wrong.'
	    			});
	            } 
	});
	
}

function checkoutOrder(){
	
	var data = {
			"orderId" : $('#orderId').val()
	};
	
	var postData = {
			"action" : "checkoutOrder",
			"data" : JSON.stringify(data)
	};
	
	$.ajax({
	      type: 'POST',
	      url: "/AgriTadka/pages/ajax/postAjaxData.jsp",
	      data: postData, 
	      dataType: 'json',
	      success: function(resultData) {
	    	  //alert("Save Complete" + resultData)
	    	  
	    	  $('#rightCell').LoadingOverlay("hide");
	    	  if(resultData == 0){
	    		  
	    		  var rtRow = $('#divBottom').find('table').find('tr:gt(0)');
	    		  $(rtRow).append("<td></td>").append($('<input type="button" value="Print" name="page4" id="printOrder"></input>'));
	    		  
	    		  Lobibox.alert("success",{
	    				msg : 'Order cheked out successfully!!',
	    				beforeClose: function(lobibox){
	    					//window.open('/AgriTadka/pages/order/printReceipt.jsp', '_blank');
	    					//wait(2000);
	    					printOrder($('#orderId').val());
	    					window.location.href = '/AgriTadka';
	    		        }
	    			});
	    	  }else if(resultData == 2){
	    		  Lobibox.alert("error",{
	    				msg : 'Order is still in progress!!'
	    			});
	    	  }
	    	 },
	    	 error: function (xhr, status) { 
	    		 console.log('ajax error = ' + xhr.statusText);
	    		 $('#rightCell').LoadingOverlay("hide");	    		 
	    		 	Lobibox.alert("error",{
	    				msg : 'Something went wrong.'
	    			});
	            } 
	});
	
}

function wait(ms){
	   var start = new Date().getTime();
	   var end = start;
	   while(end < start + ms) {
	     end = new Date().getTime();
	  }
	}

function printOrder(orderId){
	
	var paramsMap = new Map();
	var dataMap = new Map();

	dataMap.put("orderId", orderId);
	paramsMap.put(WIN_URL, '/AgriTadka/pages/order/printReceipt.jsp');
	paramsMap.put(DATA, dataMap);
	
	openWindow(paramsMap);
}

function openOrderPage(tableId, tableName, priceType, orderId){
	
	var form = $("<form></form>").attr('id', 'tableTransferForm')
				.attr("name", "tableTransferForm")
				.attr("action", "/AgriTadka/pages/order/orderPlacement.jsp")
				.attr("method","post");
	
	if(tableId !== undefined && tableId != null){
		var tableIdObj = $("<input></input>")
		.attr("name","tableId")
		.attr("id","tableId")
		.attr("value", tableId);
		
		form.append(tableIdObj);
	}
	if(tableName !== undefined && tableName != null){
		var tableNameObj = $("<input></input>")
		.attr("name","tableName")
		.attr("id","tableName")
		.attr("value", tableName);
		
		form.append(tableNameObj);
	}
	
	if(priceType !== undefined && priceType != null){
		var tablePriceTypeObj = $("<input></input>")
		.attr("name","priceType")
		.attr("id","priceType")
		.attr("value", priceType);
		
		form.append(tablePriceTypeObj);
	}
	
	if(orderId != null){
		var orderIdObj = $("<input></input>")
		.attr("name","orderId")
		.attr("id","orderId")
		.attr("value", orderId);
		
		form.append(orderIdObj);
	}
	
	form.submit();	
}

function setOldValue(selectObj){
	oldSelectVal = $(selectObj).val();
}

function deleteRecord(imgObj){
	var lobibox = Lobibox.confirm({
		msg: "Are you sure you want to delete this record?",
		callback: function ($this, type) {
            if (type === 'yes') {
            	
            	$('#rightCell').LoadingOverlay("show");
            	
            	var rowObj = $(imgObj).closest('tr');
            	var id = $(rowObj).attr("id");	
            	var orderMenuMapId = rowObj.find("input:hidden").attr("id");            	
            	
            	if(orderMenuMapId === undefined){
            		
            		var finalPrice = parseFloat($(rowObj).find('td:nth-child(4)').text());
            		var subTotal = parseFloat($('#priceTotal').text());
            		
            		subTotal = (subTotal - finalPrice);
            		$('#priceTotal').text(subTotal.toFixed(2));
            		$('#priceTotal').effect("bounce",{},3000);
            		
            		$(rowObj).find('td').fadeOut(500, function() {
            			$(this).parents('tr:first').remove();
            		});
            		
            		Lobibox.alert("success",{
	    				msg : 'Record deleted successfully!!'
	    			});
            		$('#rightCell').LoadingOverlay("hide");
            		
            	}else {
            		var data = {
            				"orderMenuMapId" : orderMenuMapId
            		};
            		
            		var postData = {
            				"action" : "deleteRecord",
            				"data" : JSON.stringify(data)
            		};
            		
            		$.ajax({
            		      type: 'POST',
            		      url: "/AgriTadka/pages/ajax/postAjaxData.jsp",
            		      data: postData, 
            		      dataType: 'json',
            		      async : false,
            		      success: function(resultData) {
            		    	  
            		    	  if(resultData == 0){
            		    		  
            		    		  var finalPrice = parseFloat($(rowObj).find('td:nth-child(4)').text());
            	            		var subTotal = parseFloat($('#priceTotal').text());
            	            		
            	            		subTotal = (subTotal - finalPrice);
            	            		$('#priceTotal').text(subTotal.toFixed(2));
            	            		$('#priceTotal').effect("bounce",{},3000);
            		    		  
            		    		  $(rowObj).find('td').fadeOut(500, function() {
            	            			$(this).parents('tr:first').remove();
            	            		});
            	            		
            	            		Lobibox.alert("success",{
            		    				msg : 'Record deleted successfully!!'
            		    			});
            		    		  
            		    	  }else if(resultData == 2){
            		    		  Lobibox.alert("error",{
            		    				msg : 'Can not delete record. Menu is in progress.'
            		    			});
            		    	  }
            		    	  $('#rightCell').LoadingOverlay("hide");
            		    	 },
            		    	 error: function (xhr, status) { 
            		    		 console.log('ajax error = ' + xhr.statusText);
            		    		 Lobibox.alert("error",{
            		    				msg : 'Something went wrong.'
            		    			});
            		    		 
            		    		 $('#rightCell').LoadingOverlay("hide");
            		            } 
            		});
            	}
            	
            } else if (type === 'no') {
                return false;
            }
        }
		});
	
}

function cancelOrder(buttonObj){
	var lobibox = Lobibox.confirm({
		msg: "Are you sure you want to cancel this order?",
		callback: function ($this, type) {
            if (type === 'yes') {
            	
            	$('#rightCell').LoadingOverlay("show");
            	
            	var data = {
            			"orderId" : $('#orderId').val()
            	};
            		
            		var postData = {
            				"action" : "cancelOrder",
            				"data" : JSON.stringify(data)
            		};
            		
            		$.ajax({
            		      type: 'POST',
            		      url: "/AgriTadka/pages/ajax/postAjaxData.jsp",
            		      data: postData, 
            		      dataType: 'json',
            		      async : false,
            		      success: function(resultData) {
            		    	  
            		    	  if(resultData == 0){
            		    		  
            		    		  Lobibox.alert("success",{
            		    				msg : 'Order cancelled successfully!!',
            		    				beforeClose: function(lobibox){
            		    		        	location.href = '/AgriTadka';
            		    		        }
            		    			});
            		    		  
            		    	  }else if(resultData == 2){
            		    		  Lobibox.alert("error",{
            		    				msg : 'Can not cancel order. Menu is in progress.'
            		    			});
            		    	  }
            		    	  $('#rightCell').LoadingOverlay("hide");
            		    	 },
            		    	 error: function (xhr, status) { 
            		    		 console.log('ajax error = ' + xhr.statusText);
            		    		 Lobibox.alert("error",{
            		    				msg : 'Something went wrong.'
            		    			});
            		    		 $('#rightCell').LoadingOverlay("hide");
            		            } 
            		});
            	
            } else if (type === 'no') {
                return false;
            }
        }
		});
	
}

function updateCustomer(orderId, custName, mobile, custAddress){
	$('body').LoadingOverlay("show");
	
	var data = {
			"orderId" : orderId,
			"custName" : custName,
			"mobile" : mobile,
			"custAddress" : custAddress
			
	};
		
		var postData = {
				"action" : "updateCustomer",
				"data" : JSON.stringify(data)
		};
		
		$.ajax({
		      type: 'POST',
		      url: "/AgriTadka/pages/ajax/postAjaxData.jsp",
		      data: postData, 
		      dataType: 'json',
		      async : false,
		      success: function(resultData) {
		    	  
		    	  if(resultData == 0){
		    		  
		    		  Lobibox.alert("success",{
		    				msg : 'Customer added successfully!!',
		    				beforeClose: function(lobibox){
		    					if(parent.$.fancybox){
		    						parent.$.fancybox.close();
		    		        	}
		    		        }
		    			});
		    		  
		    	  }
		    	  $('body').LoadingOverlay("hide");
		    	 },
		    	 error: function (xhr, status) { 
		    		 console.log('ajax error = ' + xhr.statusText);
		    		 Lobibox.alert("error",{
		    				msg : 'Something went wrong.'
		    			});
		    		 $('body').LoadingOverlay("hide");
		            } 
		});
}


jQuery(function ($) {
	  var target = $('#rightCell');

	  $('#saveOrder').click(function () {
		target.LoadingOverlay("show");
		saveOrder();	    
	  });
	  
	  $('#checkoutOrder').click(function () {
			target.LoadingOverlay("show");
			checkoutOrder();	    
		});
	  
	  $('#cancelOrder').click(function () {
			cancelOrder(this);	    
		});
	  
	  if($('#addCustomer') && $("#addCustomer").length > 0){
			$('#addCustomer').click(function(){
				var paramMap = new Map();
				
				paramMap.put(URL, '/AgriTadka/pages/order/addCustomer.jsp?menuRequired=false&orderId=' + $("#orderId").val());
				paramMap.put(WIDTH, '70%');
				paramMap.put(HEIGHT, '80%');
				
				openFancyBox($("#addCustomer"), paramMap);
			});
		}
	  
	  $('.updateExistingCustomer').click(function () {
			var rowObj = this.closest('tr');
			var orderId = $('#orderId').val();
			
			var custName = $(rowObj).find('td').eq(0).text();
			var mobile = $(rowObj).find('td').eq(1).text();
			var custAddress = $(rowObj).find('td').eq(2).text();
			
			updateCustomer(orderId, custName, mobile, custAddress);
		});
	  $('#addNewCustomer').click(function () {
		  
		  var orderId = $('#orderId').val();
		  var custName = $('#custName').val();
		  var mobile = $('#mobile').val();
		  var custAddress = $('#custAddress').val();
		  
		  var paramMap = new Map();
		  if(custName == ''){
			  paramMap.put(MSG, 'Please Enter Customer Name.');
				displayNotification(paramMap);
			  return false;
		  }else if(mobile == ''){
			  paramMap.put(MSG, 'Please Enter Customer Mobile Number.');
				displayNotification(paramMap);
			  return false;
		  }
		  
		  updateCustomer(orderId, custName, mobile, custAddress);
		  
	  });
	  
	});

$(document).ready(function() {
	   var orderDashboard = $('#orderDashboard').DataTable({
	    	"bSort" : true,
	    	"paging" : true/*,
	    	"pageLength": 15,
	    	"aLengthMenu": [[10, 15, 25, 35, 50, 100], [10, 15, 25, 35, 50, 100]]*/	
	    });
	   
	   var orderDashboard = $('#custTable').DataTable({
	    	"bSort" : true,
	    	"paging" : true/*,
	    	"pageLength": 15,
	    	"aLengthMenu": [[10, 15, 25, 35, 50, 100], [10, 15, 25, 35, 50, 100]]*/	
	    });
	   
	} );