/**
 * 
 * This file contains methods for all the master pages
 */

$(document).ready(function() {
	$('#foodMenu-container').easytabs({
		uiTabs: true, 
		 collapsible: true ,
		 defaultTab: 'li#mainMenuTab'
		 });
	
	   var mainMenuTable = $('#mainMenuTable').DataTable({
	    	"bSort" : true,
	    	"paging" : true/*,
	    	"pageLength": 15,
	    	"aLengthMenu": [[10, 15, 25, 35, 50, 100], [10, 15, 25, 35, 50, 100]]*/	
	    });
	   
	   var subMenuTable = $('#subMenuTable').DataTable({
	    	"bSort" : true,
	    	"paging" : true/*,
	    	"pageLength": 15,
	    	"aLengthMenu": [[10, 15, 25, 35, 50, 100], [10, 15, 25, 35, 50, 100]]*/	
	    });
	   
	   $('#mainMenuBtn').click(function(){
		   openMenuFancyBox(0, 'mainMenu', this);
		});
	   
	   $('#subMenuBtn').click(function(){
		   openMenuFancyBox(0, 'subMenu', this);
		});
	   
	   $('img[name=editMenu]').click(function(e){
		   updateMenuRecord(this);
		});
	   
	   $('img[name=deleteMenu]').click(function(e){
		   deleteMenuRecord(this);
		});
});

function openMenuFancyBox(menuId, menuType, obj){
	
	var paramMap = new Map();
	
	var url, btnObj;
	if(menuType == 'mainMenu'){
		url = '/AgriTadka/pages/master/addFoodCategories.jsp?menuRequired=false&mainMenuId=' + menuId;
	}else{
		url = '/AgriTadka/pages/master/addFoodDishes.jsp?menuRequired=false&menuMapperId=' + menuId;
	}
	
	paramMap.put(URL, url);
	paramMap.put(WIDTH, '70%');
	paramMap.put(HEIGHT, '80%');
	
	openFancyBox(obj, paramMap);
}

function updateMenuRecord(imgObj){
	
	var menuId =  imgObj.id.split('_')[1];
	var menuType = imgObj.id.split('_')[0];
	
	openMenuFancyBox(menuId, menuType, imgObj);
}

function deleteMenuRecord(imgObj){
	var menuId =  imgObj.id.split('_')[1];
	var menuType = imgObj.id.split('_')[0];
	//openMenuFancyBox(menuId, menuType, imgObj);
	
	
}

function displaySuccess(){
	
}
