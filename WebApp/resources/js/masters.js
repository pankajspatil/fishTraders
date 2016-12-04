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

var options = {
		  valueNames: [ 'name' ],
		  // Since there are no elements in the list, this will be used as template.
		  item: '<li><h3 class="name ui-widget-content" style="font-size:large"></h3></li>'
		};

var userList = new List('allSubMenu', options);
userList.clear();

function updateSubMenus(divObj){
	//console.log(divObj);
	$('#allSubMenu').LoadingOverlay("show");
	
	/*var allSubMenu = $('#allSubMenu');
	allSubMenu.find('ul').empty();*/
	
	userList.clear();
	
	if(!$(divObj).hasClass('theme-blue-title-active')){
		
	var divId = divObj.id.split('_')[1];
	var addedMenus = new Array();
	
	var listFound = false;
	
	$.each(menuMap, function(key, value) {
		if(listFound){
			return false;
		}
		$.each(value, function(key, value) {
			var mainMenuId = value.mainMenu.mainMenuId;
			if(divId == mainMenuId){
				//console.log('ID found == >' + mainMenuId);
				addedMenus.push(value.subMenu.subMenuId);
				listFound = true;
			}
		}); 
	});
	
	var ulObj = $("<ul class='selectable bwl_acc_container list' style='font-weight:normal;'></ul>");
	
	$.each(subMenuList, function(key, value) {
		if(!addedMenus.includes(value.subMenuId)){
			//console.log('Not Found' + value.subMenuName);
			//ulObj.append('<li class="ui-widget-content">' + value.subMenuName + '</li>');
			
			userList.add({
				  name: value.subMenuName
				});
		}
	});
	
	//allSubMenu.append(ulObj);
	}
	$('#allSubMenu').LoadingOverlay("hide");
}		
