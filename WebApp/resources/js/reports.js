/**
 * 
 */

function validateStatusForm(){
	
	var paramMap = new Map();
	
	var fromDate = $('#fromDate').val();
	var toDate = $('#toDate').val();
	var reportType = $('input[name=reportType]:checked').val();
	
	if(fromDate === ''){
		paramMap.put(MSG, 'Please enter from date');
		displayNotification(paramMap);
		return false;
	}else if(toDate === ''){
		paramMap.put(MSG, 'Please enter to date');
		displayNotification(paramMap);
		return false;
	}else if(reportType === undefined){
		paramMap.put(MSG, 'Please select report type');
		displayNotification(paramMap);
		return false;
	}
	
}