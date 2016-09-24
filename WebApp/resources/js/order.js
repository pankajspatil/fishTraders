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
    
    var newRow = $("<tr id='"+menuId+"' align='center'></tr>");
    
    newRow.append($(clonedRow).find('td:nth-child(1)').removeAttr('width').attr("align","left"));
    newRow.append(quantityCell);
    newRow.append("<td>"+unitPrice+"</td>");
    newRow.append("<td>"+finalPrice+"</td>");
    newRow.append($("<input type='button'></input>").attr('value', "Del"));
    /*
	    		$(clonedRow).find('td:nth-child(0)') +
	    		"<td>" + combo + "</td>" +
	    		$(clonedRow).find('td:nth-child(1)') +
	    		$(clonedRow).find('td:nth-child(0)') +
	    		"</tr>");*/
    console.log(newRow);
	
	var table2 = $('#orderedTable');
	table2.append(newRow);
	
	$(newRow).effect("highlight",{},3000);
	
	console.log(menuList);
}

function updatePrice(selectObj){
	
	var rowObj = $(selectObj).closest('tr');
	var id = $(selectObj).attr("id");	
	var orderMenuMapId;
	
	if(id === undefined){
		orderMenuMapId = rowObj.find("input:hidden").attr("id");		
		id = (Math.floor(1000 + Math.random() * 9000)).toString();
		id = id.substring(-2);
		
		$(selectObj).attr("id", id);
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
	
	$(cellObj).effect("highlight",{},3000);
	
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
	    	  $('#rightCell').LoadingOverlay("hide");
	    	  if(resultData == 0){
	    		  Lobibox.alert("success",{
	    				msg : 'Record saved successfully!!'
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

function openOrderPage(tableId, tableName){
	
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
	
	form.append(tableIdObj);
	form.append(tableNameObj);
	
	form.submit();	
}

jQuery(function ($) {
	  var target = $('#rightCell');

	  $('#saveOrder').click(function () {
		target.LoadingOverlay("show");
		saveOrder();	    
	  });
	});