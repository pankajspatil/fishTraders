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
