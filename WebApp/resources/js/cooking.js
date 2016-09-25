/**
 * 
 */

function moveRight(buttonObj) {

	var orderedRow = $(buttonObj).closest('tr');
	var orderingRow = orderedRow.clone(true);

	$(orderedRow).find('td').fadeOut(500, function() {
		$(this).parents('tr:first').remove();
	});
	
	var table2 = $('#table2');
	table2.append(orderingRow);
	
	$(orderingRow).effect("highlight",{},3000);
	
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
	
}

function callback() {
    setTimeout(function() {
      //$( "#effect:visible" ).removeAttr( "style" ).fadeOut();
    }, 1000 );
  };
  
  setInterval(function(){ 
	    //code goes here that will be run every 5 seconds.
	  
	  console.log("Method Called at : " + new Date());
	}, 30000);
  