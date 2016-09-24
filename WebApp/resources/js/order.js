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
	
	var menu = {};
	menu.menuId = menuId;
	menu.quantity = quantity;
	menu.unitPrice = unitPrice;
	menu.notes = '';
	
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
    newRow.append("<td>"+unitPrice+"</td>");
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
	
	var id = $(selectObj).attr("id");
	var quantity = $(selectObj).find("option:selected").val();
	
	var menu = menuList[id];
	var unitPrice = menu.unitPrice;
	
	var finalPrice = parseFloat(quantity * unitPrice);
	
	menu.quantity = quantity;
	menu.finalPrice = finalPrice;
	menuList[id] = menu;
	
	var rowObj = $(selectObj).closest('tr');
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
	    	  if(resultData == 0){
	    		  $(obj.parentElement.parentElement).hide();
	    		  Lobibox.alert("success",{
	    				msg : 'Record Deleted Successfully!!'
	    			});
	    	  	}
	    	 }
	});
	
}

function openOrderPage(tableId){
	
	var form = $("<form></form>").attr('id', 'tableTransferForm')
				.attr("name", "tableTransferForm")
				.attr("action", "/AgriTadka/pages/order/orderPlacement.jsp")
				.attr("method","post");
	var input = $("<input></input>")
				.attr("name","tableId")
				.attr("id","tableId")
				.attr("value", tableId);
	form.append(input);
	
	form.submit();	
}