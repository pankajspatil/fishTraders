/**
 * 
 */

/*$("#projects").multipleSelect({
    filter: true,
    single : true
});

$("#project").multipleSelect({
    filter: true,
    width:'96%',
    placeholder : 'Select Project'
});

$( "#fromDate" ).datepicker({
	changeMonth: true,
    changeYear: true,
    dateFormat:'yy-mm-dd'
});

$( "#toDate" ).datepicker({
	changeMonth: true,
    changeYear: true,
    dateFormat:'yy-mm-dd'
});*/


function openURL(paramsMap){
	
	var methodType = paramsMap.hasKey(METHOD_TYPE) ? paramsMap.get(METHOD_TYPE) : 'post';
	var dataMap = paramsMap.get(DATA);
	var winURL = paramsMap.get(URL);
	
	//console.log("dataMap == >" + dataMap + "==>" + winURL);
	
	var formObj = $(document.createElement('form'));
	formObj.attr("method", methodType);
	formObj.attr("action", winURL);
	
	if(dataMap && !dataMap.isEmpty()){
		  dataMap.each(function(key, value){
			  var input = document.createElement('input');
		      input.type = 'hidden';
		      input.name = key;
		      input.id = key;
		      input.value = value;
		      formObj.append(input);
		  });
	  }
	formObj.submit();
}

function displayNotification(paramMap){
	
	var msg = paramMap.get(MSG);
	
	Lobibox.notify('error', {
        size: 'mini',
        rounded: false,
        delayIndicator: false,
        position: 'center top',
        msg: msg,
        //img:'/AgriTadka/resources/images/1.png',
        //delay:500,
        iconSource:'fontAwesome'
    });
}

function isValidEmailAddress(emailAddress) {
    var pattern = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
    return pattern.test(emailAddress);
}

function somethingWentWrong(){
	Lobibox.alert("error",{
		msg : 'Something Went Wrong.'
	});
}

function alredyExist(){
	Lobibox.alert("info",{
		msg : 'Record Alredy Exist.'
	});
}

function infoMessage(msg){
	Lobibox.alert("info",{
		msg : msg
	});
}

function validPassword(str)
{
  // at least one number, one lowercase and one uppercase letter
  // at least six characters
  var re = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}/;
  return re.test(str);
}