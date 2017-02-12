/**
 * 
 */
function openBoatPage(boatId, boatName){
	
	var form = $("<form></form>").attr('id', 'boatTransferForm')
				.attr("name", "boatTransferForm")
				.attr("action", contextPath + "/pages/boat/boatPlacement.jsp")
				.attr("method","post");
	
	if(boatId !== undefined && boatId != null){
		var boatIdObj = $("<input></input>")
		.attr("name","boatId")
		.attr("id","boatId")
		.attr("value", boatId);
		
		form.append(boatIdObj);
	}
	if(boatName !== undefined && boatName != null){
		var boatNameObj = $("<input></input>")
		.attr("name","boatName")
		.attr("id","boatName")
		.attr("value", boatName);
		
		form.append(boatNameObj);
	}
	
	form.submit();	
}

function setOldValue(selectObj){
	oldSelectVal = $(selectObj).val();
}


