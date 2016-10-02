/**
 * 
 */
var menuList = {};

function addMenuToOrder(buttonObj){	
	var menuRow = $(buttonObj).closest('tr');
	var clonedRow = menuRow.clone(true);
	
	var menuId = menuRow.attr('id');
	var quantity = 1;
	var unitPrice = $(menuRow).find('td:nth-child(2)').text();
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

	var combo = $("<select onChange='updatePrice(this)'></select>").attr("id", randomNumber).attr("name", randomNumber);

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
    newRow.append($("<input type='button'></input>").attr('value', "Del"));
   
    console.log(newRow);
	
	var table2 = $('#orderedTable');
	table2.append(newRow);
	
	$(newRow).effect("highlight",{},3000);
	
	//console.log(menuList);
}

function updatePrice(selectObj){
	
	var rowObj = $(selectObj).closest('tr');
	var id = $(rowObj).attr("id");	
	var orderMenuMapId = rowObj.find("input:hidden").attr("id");
	
	if(id === undefined){
		id = (Math.floor(1000 + Math.random() * 9000)).toString();
		id = id.substring(-2);
		
		$(rowObj).attr("id", id);
	}
	
	var quantity = $(selectObj).find("option:selected").val();
	
	var menu = menuList[id] === undefined ? {} : menuList[id];
	var unitPrice = $(rowObj).find('td:nth-child(3)').text();	
	var finalPrice = parseFloat(quantity * unitPrice);
	
	menu.quantity = quantity;
	menu.finalPrice = finalPrice;
	menu.orderMenuMapId = orderMenuMapId;
	menu.notes = menu.notes === undefined ? '' : menu.notes;
	menuList[id] = menu;
	
	var cellObj = $(rowObj).find('td:nth-child(4)').text(finalPrice);
	$(cellObj).effect("highlight",{},30000);
	
}
function saveOrder(){
	
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
	    		  
	    		  $('#saveOrder').hide();
	    		  $('#cancelOrder').hide();
	    		  $('#checkoutOrder').hide();
	    		  
	    		  var rtRow = $('#divBottom').find('table').find('tr:gt(0)');
	    		  $(rtRow).append("<td></td>").append($('<input type="button" value="Print" name="page4" id="printOrder"></input>'));
	    		  
	    		  Lobibox.alert("success",{
	    				msg : 'Order cheked out successfully!!'
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

function openOrderPage(tableId, tableName, priceType){
	
	var form = $("<form></form>").attr('id', 'tableTransferForm')
				.attr("name", "tableTransferForm")
				.attr("action", "/AgriTadka/pages/order/orderPlacement.jsp")
				.attr("method","post");
	
	var tableIdObj = $("<input></input>")
				.attr("name","tableId")
				.attr("id","tableId")
				.attr("value", tableId);
	
	var tableNameObj = $("<input></input>")
	.attr("name","tableName")
	.attr("id","tableName")
	.attr("value", tableName);
	
	var tablePriceTypeObj = $("<input></input>")
	.attr("name","priceType")
	.attr("id","priceType")
	.attr("value", priceType);
	
	form.append(tableIdObj);
	form.append(tableNameObj);
	form.append(tablePriceTypeObj);
	
	form.submit();	
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
	  
	});