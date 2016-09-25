/**
 * 
 */

function moveRow(buttonObj) {

	var operation = $(buttonObj).val();
	alert(operation);
	
	var orderedRow = $(buttonObj).closest('tr');
	var orderingRow = orderedRow.clone(true);
	
	var orderMenuMapId = orderedRow.attr("id");
	
	var parameters = {
		"operation" : operation,
		"orderMenuMapId" : orderMenuMapId
	};
	
	var postData = {
			"action" : "updateCookingStatus",
			"data" : JSON.stringify(parameters)
	};
	
	
	$.ajax({
	      type: 'POST',
	      url: "/AgriTadka/pages/ajax/postAjaxData.jsp",
	      data: postData, 
	      dataType: 'json',
	      success: function(resultData) {
	    	  //alert("Save Complete" + resultData)
	    	  console.log('resultData = ' + resultData);
	    	  
	    	  $(orderedRow).find('td').fadeOut(500, function() {
	    			$(this).parents('tr:first').remove();
	    		});
	    		
	    	  if(operation == 'Cook'){
	    		  var table2 = $('#table2');
		    	  table2.append(orderingRow);
		    	  $(orderingRow).effect("highlight",{},3000);
	    	  }
	    	 },
	    	 error: function (xhr, status) { 
	    		 console.log('ajax error = ' + xhr.statusText);
	    		 	Lobibox.alert("error",{
	    				msg : 'Something went wrong.'
	    			});
	            } 
	});
	
}

function callback() {
    setTimeout(function() {
      //$( "#effect:visible" ).removeAttr( "style" ).fadeOut();
    }, 1000 );
  };
  
  var timestamp = '';
  
  function fetchCookingData(fetchType){
	  
	  console.log("Method Called at : " + new Date() + " for " + fetchType);
	  
	  var divId = fetchType == 'INPROGRESS' ? "divleft" : "divright";
	  $('#' + divId).LoadingOverlay("show");
	  
	  var parameters = {};
	  parameters.statusCode = fetchType;
	  parameters.timestamp = timestamp;
	  
	  
	  var postData = {
				"action" : "fetchCookingData",
				"data" : JSON.stringify(parameters)
		};
	  
	  $.ajax({
	      type: 'POST',
	      url: "/AgriTadka/pages/ajax/postAjaxData.jsp",
	      data: postData, 
	      dataType: 'json',
	      success: function(resultData) {
	    	  //alert("Save Complete" + resultData)
	    	  console.log('resultData = ' + resultData);
	    	  
	    	  var tableObj = $('#' + divId).find('table');
	    	  
	    	  $(tableObj).find("tr:gt(0)").remove();
	    	  
	    	  var buttonObj = $("<input></input>").attr("type", "button").attr("onClick", "moveRow(this)");
	    	  if(fetchType == 'INPROGRESS'){
	    		  buttonObj.attr("value", "Cook");
	    	  }else{
	    		  buttonObj.attr("value", "Finish");
	    	  }
	    	  
	    	  $.each(resultData, function(key, value) {
	    		  var rowObj = $("<tr align = 'center' id = '"+value.orderMenuMapId+"'></tr>");
	    		  
	    		  rowObj.append($("<td>"+value.orderData.orderId+"</td>"));
	    		  rowObj.append($("<td>"+value.subMenuName+"</td>"));
	    		  rowObj.append($("<td>"+value.quantity+"</td>"));
	    		  rowObj.append($("<td>"+value.createdOn+"</td>"));
	    		  rowObj.append($("<td>"+value.orderData.tableName+"</td>"));
	    		  rowObj.append($("<td>"+value.notes+"</td>"));
	    		  
	    		  var btnObj = buttonObj.clone(true);
	    		  rowObj.append($("<td></td>").append(btnObj));
	    		  
	    		  tableObj.append(rowObj);
	    	  });
	    	  
	    	  $('#' + divId).LoadingOverlay("hide");
	    	  
	    	 },
	    	 error: function (xhr, status) { 
	    		 $('#' + divId).LoadingOverlay("hide");
	    		 console.log('ajax error = ' + xhr.statusText);
	    		 	Lobibox.alert("error",{
	    				msg : 'Something went wrong.'
	    			});
	            } 
	});
  }
  
  fetchCookingData("INPROGRESS");
  fetchCookingData("COOKED");
  
  setInterval(function(){ 
	    //code goes here that will be run every 5 seconds.
	  //console.log("Inside Interval");
	  //fetchCookingData("INPROGRESS");
	}, 30000);
  
  
  
  /*var selectedEffect = "bounce";
	 
  // Most effect types need no options passed by default
  var options = {};
  // some effects have required parameters
  if ( selectedEffect === "scale" ) {
    options = { percent: 50 };
  } else if ( selectedEffect === "size" ) {
    options = { to: { width: 280, height: 185 } };
  }

  // Run the effect
  $(orderingRow).show( selectedEffect, options, 500, callback );
  table2.append(orderingRow);*/