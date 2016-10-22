<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="/pages/common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
	<div id="tab-container" class="tab-container">
		<ul class='etabs'>
			<li class='tab'><a href="#tabs1-html">HTML Markup</a></li>
			<li class='tab' id="tab2"><a href="#tabs1-js">Required JS</a></li>
			<li class='tab'><a href="#tabs1-css">Example CSS</a></li>
		</ul>
		<div id="tabs1-html">
			<h2>HTML Markup for these tabs</h2>
			<!-- content -->
		</div>
		<div id="tabs1-js">
			<h2>JS for these tabs</h2>
			<!-- content -->
		</div>
		<div id="tabs1-css">
			<!-- <h2>CSS Styles for these tabs</h2> -->
			<!-- content -->
			
			<center><div id="chartContainer">FusionCharts XT will load here!</div></center>
			
		</div>
	</div>
<script>
/* $("#tab-container").easytabs({
	  uiTabs: true,
	  animate: true,
	  animationSpeed: 1000,
	  defaultTab: "tabs1-html",
	  panelActiveClass: "active-content-div",
	  tabActiveClass: "selected-tab",
	  tabs: "> div > span",
	  updateHash: false,
	  cycle: 2000
	}); */

 $('#tab-container').easytabs({
	uiTabs: true, 
	 collapsible: true/* ,
	 defaultTab: 'li#tab2' */
	 }); 
	
	FusionCharts.ready(function () {
	    var myChart = new FusionCharts({
	      "type": "column2d",
	      "renderAt": "chartContainer",
	      "width": "70%",
	      "height": "300",
	      "dataFormat": "xml",
	      "dataSource": "<chart caption='Harrys SuperMart' subcaption='Monthly revenue for last year' xaxisname='Month' yaxisname='Amount' numberprefix='$' palettecolors='#008ee4' bgalpha='0' borderalpha='20' canvasborderalpha='0' theme='fint' useplotgradientcolor='0' plotborderalpha='10' placevaluesinside='1' rotatevalues='1' valuefontcolor='#ffffff' captionpadding='20' showaxislines='1' axislinealpha='25' divlinealpha='10'><set label='Jan' value='420000' /><set label='Feb' value='810000' /><set label='Mar' value='720000' /><set label='Apr' value='550000' /><set label='May' value='910000' /><set label='Jun' value='510000' /><set label='Jul' value='680000' /><set label='Aug' value='620000' /><set label='Sep' value='610000' /><set label='Oct' value='490000' /><set label='Nov' value='900000' /><set label='Dec' value='730000' /></chart>"
	    });

	  myChart.render();
	});
</script>
</body>
</html>