/**
 * 
 * This file contains methods for all the master pages
 */

$(document).ready(function() {
	  
	   /***Methods for vendor master screen***/
	   
	   $('#newVendor').click(function(){
		   openVendorFancyBox(0, 'newVendor', this);
		});
	   
	   var vendorTable = $('#vendorTable').DataTable({
	    	"bSort" : true,
	    	"paging" : true,
	    	"order": [[ 0, "asc" ]]/*,
	    	"pageLength": 15,
	    	"aLengthMenu": [[10, 15, 25, 35, 50, 100], [10, 15, 25, 35, 50, 100]]*/	
	    });
	   
	   $('img[name=editVendor]').click(function(e){
		   updateVendorRecord(this);
		});
	   
	   /***Methods for fish master screen***/
	   
	   $('#newFish').click(function(){
		   openFishFancyBox(0, 'newFish', this);
		});
	   
	   var fishTable = $('#fishTable').DataTable({
	    	"bSort" : true,
	    	"paging" : true,
	    	"order": [[ 0, "asc" ]]/*,
	    	"pageLength": 15,
	    	"aLengthMenu": [[10, 15, 25, 35, 50, 100], [10, 15, 25, 35, 50, 100]]*/	
	    });
	   
	   $('img[name=editFish]').click(function(e){
		   updateFishRecord(this);
		});
	   
	   /***Methods for boat master screen***/
	   
	   $('#newBoat').click(function(){
		   openBoatFancyBox(0, 'newBoat', this);
		});
	   
	   var boatTable = $('#boatTable').DataTable({
	    	"bSort" : true,
	    	"paging" : true,
	    	"order": [[ 0, "asc" ]]/*,
	    	"pageLength": 15,
	    	"aLengthMenu": [[10, 15, 25, 35, 50, 100], [10, 15, 25, 35, 50, 100]]*/	
	    });
	   
	   $('img[name=editBoat]').click(function(e){
		   updateBoatRecord(this);
		});
	   
	   /***Methods for customer master screen***/
	   
	   var customerData = $('#customerData').DataTable({
	    	"bSort" : true,
	    	"paging" : true,
	    	"order": [[ 0, "asc" ]]/*,
	    	"pageLength": 15,
	    	"aLengthMenu": [[10, 15, 25, 35, 50, 100], [10, 15, 25, 35, 50, 100]]*/	
	    });
	   
	   $('#newCustomer').click(function(){
			openCustomerFancyBox(0, 'newCustomer', this);
		});
		
		$('img[name=editCustomer]').click(function(e){
				openCustomerFancyBox($(this).id, 'updateCustomer', this);
		});
		
		$( "#dob" ).datepicker({
			changeMonth: true,
		    changeYear: true,
		    dateFormat: 'yy-mm-dd',
		    maxDate: new Date()
		});
});

/**Methods for vendor master screen**/

function openVendorFancyBox(vendorId, menuType, obj){
	
	var paramMap = new Map();
	
	var url, btnObj;
	
	url = contextPath + '/pages/master/createVendor.jsp?menuRequired=false&vendorId=' + vendorId;
	
	paramMap.put(URL, url);
	paramMap.put(WIDTH, '70%');
	paramMap.put(HEIGHT, '80%');
	
	openFancyBox(obj, paramMap);
}

function updateVendorRecord(imgObj){
	
	var vendorId =  imgObj.id;
	openVendorFancyBox(vendorId, 'updateVendor', imgObj);
}

/**Methods for fish master screen**/


function validateVendorForm(){
	
	var vendorName = $('#vendorName').val();
	var contactNo = $('#contactNo').val();
	
	var paramMap = new Map();
	if(vendorName.trim() == ''){
		paramMap.put(MSG, 'Please enter vendor name.');
		displayNotification(paramMap);
		
		return false;
	}
	
	if(contactNo.trim() == ''){
		paramMap.put(MSG, 'Please enter contact number.');
		displayNotification(paramMap);
		
		return false;
	}
	
	if(vendorName.toLowerCase() !== oldVendorName.toLowerCase()){
		var vendorNameArray = parent.$('#vendorTable').DataTable().column(0).data();	
		vendorNameArray = convertCaseArray(vendorNameArray, LOWER_CASE);
		
		if(vendorNameArray.includes(vendorName.toLowerCase())){
			paramMap.put(MSG, 'Duplicate vendor name.');
			displayNotification(paramMap);
			return false;
		}
	}
	
}

function openFishFancyBox(fishId, menuType, obj){
	
	var paramMap = new Map();
	
	var url, btnObj;
	
	url = contextPath + '/pages/master/createFish.jsp?menuRequired=false&fishId=' + fishId;
	
	paramMap.put(URL, url);
	paramMap.put(WIDTH, '70%');
	paramMap.put(HEIGHT, '80%');
	
	openFancyBox(obj, paramMap);
}

function updateFishRecord(imgObj){
	
	var fishId =  imgObj.id;
	openFishFancyBox(fishId, 'updateFish', imgObj);
}

function validateFishForm(){
	
	var fishName = $('#fishName').val();
	
	var paramMap = new Map();
	if(fishName.trim() == ''){
		paramMap.put(MSG, 'Please enter fish name.');
		displayNotification(paramMap);
		
		return false;
	}
	
	if(fishName.toLowerCase() !== oldFishName.toLowerCase()){
		var fishNameArray = parent.$('#fishTable').DataTable().column(0).data();	
		fishNameArray = convertCaseArray(fishNameArray, LOWER_CASE);
		
		if(fishNameArray.includes(fishName.toLowerCase())){
			paramMap.put(MSG, 'Duplicate fish name.');
			displayNotification(paramMap);
			return false;
		}
	}
	
}

function openBoatFancyBox(boatId, menuType, obj){
	
	var paramMap = new Map();
	
	var url, btnObj;
	
	url = contextPath + '/pages/master/createBoat.jsp?menuRequired=false&boatId=' + boatId;
	
	paramMap.put(URL, url);
	paramMap.put(WIDTH, '70%');
	paramMap.put(HEIGHT, '80%');
	
	openFancyBox(obj, paramMap);
}

function updateBoatRecord(imgObj){
	
	var boatId =  imgObj.id;
	openBoatFancyBox(boatId, 'updateBoat', imgObj);
}

function validateBoatForm(){
	
	var boatName = $('#boatName').val();
	var vendorId = $('#vendorId').val();
	
	var paramMap = new Map();
	if(boatName.trim() === ''){
		paramMap.put(MSG, 'Please enter boat name.');
		displayNotification(paramMap);
		
		return false;
	}
	if(vendorId === '-1'){
		paramMap.put(MSG, 'Please select vendor.');
		displayNotification(paramMap);
		
		return false;
	}
	
	if(boatName.toLowerCase() !== oldBoatName.toLowerCase()){
		var boatNameArray = parent.$('#boatTable').DataTable().column(0).data();	
		boatNameArray = convertCaseArray(boatNameArray, LOWER_CASE);
		
		if(boatNameArray.includes(boatName.toLowerCase())){
			paramMap.put(MSG, 'Duplicate boat name.');
			displayNotification(paramMap);
			return false;
		}
	}
	
}


/****Methods for Customer master screen****/

function openCustomerFancyBox(customerId, operation, obj){
	
	var paramMap = new Map();
	
	var url = contextPath + '/pages/master/createCustomer.jsp?menuRequired=false&customerId=' + customerId;
	
	paramMap.put(URL, url);
	paramMap.put(WIDTH, '70%');
	paramMap.put(HEIGHT, '80%');
	
	openFancyBox(obj, paramMap);
}

function validateCustomerForm(){
	
	var elementIds = [
		                  ['firstName','first name'], ['lastName','last name'], ['gender', 'gender'], ['dob','DOB'],
		                  ['contact', 'contact no'], ['address', 'address']
	                 ];
	var errorFound = false;
	var paramMap = new Map();
	$.each(elementIds, function( index, value ) {
		if(value[0] == 'gender' && $('#' + value[0]).val() == -1){
			paramMap.put(MSG, 'Please select ' + value[1]);
			errorFound = true;
			return false;
		}else if($('#' + value[0]).val() == ''){
			  paramMap.put(MSG, 'Please enter ' + value[1]);
			  errorFound = true;
			  return false;
		  }
		});
	if(errorFound){
		displayNotification(paramMap);
		return false;
	}else if($('#email').val() != '' && !isValidEmailAddress($('#email').val())){
		paramMap.put(MSG, 'Please enter valid email.');
		displayNotification(paramMap);
		return false;
	}
	
	var customerId = customerObj.customerId;
	if(customerId !== undefined){
		var oldFirstName = customerObj.firstName;
		var oldLastName = customerObj.lastName;
		var oldDob = customerObj.dob;
		
		var firstName = $('#firstName').val();
		var lastName = $('#lastName').val()
		var dob = $('#dob').val();
		
		var oldCombineText = (oldFirstName+oldLastName+oldDob).toLowerCase();
		var combineText = (firstName+lastName+dob).toLowerCase();
		
		if(oldCombineText != combineText){
			var customerTable = parent.$('#customerData');
			
			var firstNameArray = $(customerTable).DataTable().column(0).data();	
			firstNameArray = convertCaseArray(firstNameArray, LOWER_CASE);
			
			var lastNameArray = $(customerTable).DataTable().column(2).data();	
			lastNameArray = convertCaseArray(lastNameArray, LOWER_CASE);
			
			var dobArray = $(customerTable).DataTable().column(4).data();	
			
			$.each(firstNameArray, function( index, value ) {
				var cmbText = value + lastNameArray[index] + dobArray[index];
				if(combineText == cmbText){
					errorFound = true;
					paramMap.put(MSG, 'Duplicate combination of first name, last name and dob.');
					return false;
				}				
			});
		}
		
		if(errorFound){
			displayNotification(paramMap);
			return false;
		}
	}
}

