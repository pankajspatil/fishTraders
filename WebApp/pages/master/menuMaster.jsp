<%@page import="com.org.agritadka.transfer.MenuMapper"%>
<%@page import="com.org.agritadka.transfer.SubMenu"%>
<%@page import="com.org.agritadka.master.Master"%>
<%@page import="com.org.agritadka.transfer.MainMenu"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="/pages/common/header.jsp"%>
<%@ include file="/pages/common/validateSession.jsp"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script>
  $( function() {
 
    // There's the gallery and the trash
    var $gallery = $( "#gallery" ),
      $trash = $( "#trash" );
 
    // Let the gallery items be draggable
    $( "li", $gallery ).draggable({
      cancel: "a.ui-icon", // clicking an icon won't initiate dragging
      revert: "invalid", // when not dropped, the item will revert back to its initial position
      containment: "document",
      helper: "clone",
      cursor: "move"
    });
 
    // Let the trash be droppable, accepting the gallery items
    $trash.droppable({
      accept: "#gallery > li",
      classes: {
        "ui-droppable-active": "ui-state-highlight"
      },
      drop: function( event, ui ) {
        deleteImage( ui.draggable );
      }
    });
 
    // Let the gallery be droppable as well, accepting items from the trash
    $gallery.droppable({
      accept: "#trash li",
      classes: {
        "ui-droppable-active": "custom-state-active"
      },
      drop: function( event, ui ) {
        recycleImage( ui.draggable );
      }
    });
 
    // Image deletion function
    var recycle_icon = "<a href='link/to/recycle/script/when/we/have/js/off' title='Recycle this image' class='ui-icon ui-icon-refresh'>Recycle image</a>";
    function deleteImage( $item ) {
      $item.fadeOut(function() {
        var $list = $( "ul", $trash ).length ?
          $( "ul", $trash ) :
          $( "<ul class='gallery ui-helper-reset'/>" ).appendTo( $trash );
 
        $item.find( "a.ui-icon-trash" ).remove();
        $item.append( recycle_icon ).appendTo( $list ).fadeIn(function() {
          $item
            .animate({ width: "48px" })
            .find( "img" )
              .animate({ height: "36px" });
        });
      });
    }
 
    // Image recycle function
    var trash_icon = "<a href='link/to/trash/script/when/we/have/js/off' title='Delete this image' class='ui-icon ui-icon-trash'>Delete image</a>";
    function recycleImage( $item ) {
      $item.fadeOut(function() {
        $item
          .find( "a.ui-icon-refresh" )
            .remove()
          .end()
          .css( "width", "96px")
          .append( trash_icon )
          .find( "img" )
            .css( "height", "72px" )
          .end()
          .appendTo( $gallery )
          .fadeIn();
      });
    }
 
    // Image preview function, demonstrating the ui.dialog used as a modal window
    function viewLargerImage( $link ) {
      var src = $link.attr( "href" ),
        title = $link.siblings( "img" ).attr( "alt" ),
        $modal = $( "img[src$='" + src + "']" );
 
      if ( $modal.length ) {
        $modal.dialog( "open" );
      } else {
        var img = $( "<img alt='" + title + "' width='384' height='288' style='display: none; padding: 8px;' />" )
          .attr( "src", src ).appendTo( "body" );
        setTimeout(function() {
          img.dialog({
            title: title,
            width: 400,
            modal: true
          });
        }, 1 );
      }
    }
 
    // Resolve the icons behavior with event delegation
    $( "ul.gallery > li" ).on( "click", function( event ) {
      var $item = $( this ),
        $target = $( event.target );
 
      if ( $target.is( "a.ui-icon-trash" ) ) {
        deleteImage( $item );
      } else if ( $target.is( "a.ui-icon-zoomin" ) ) {
        viewLargerImage( $target );
      } else if ( $target.is( "a.ui-icon-refresh" ) ) {
        recycleImage( $item );
      }
 
      return false;
    });
  } );
  </script>
<style>
  #gallery { float: left; width: 65%; min-height: 12em; }
  .gallery.custom-state-active { background: #eee; }
  .gallery li { float: left; width: 96px; padding: 0.4em; margin: 0 0.4em 0.4em 0; text-align: center; }
  .gallery li h5 { margin: 0 0 0.4em; cursor: move; }
  .gallery li a { float: right; }
  .gallery li a.ui-icon-zoomin { float: left; }
  .gallery li img { width: 100%; cursor: move; }
 
  #trash { float: right; width: 32%; min-height: 18em; padding: 1%; }
  #trash h4 { line-height: 16px; margin: 0 0 0.4em; }
  #trash h4 .ui-icon { float: left; }
  #trash .gallery h5 { display: none; }
  </style>
</head>
<body>
<h1 align="center">Food Menu Master</h1>
<%
	Master master = new Master();
	List<MainMenu> mainMenuList = master.getAllMainMenus(false);
	List<MenuMapper> menuMapperList = master.getAllSubMenus(false);
%>

<div style="float: right; margin-right: 1%">
	Add : 
	<button class="btn btn-main btn-2g" name="mainMenuBtn" id="mainMenuBtn" onclick="openMenuFancyBox(0, 'mainMenu', this);">Main Menu</button>
	<button class="btn btn-main btn-2g" name="subMenuBtn" id="subMenuBtn">Sub Menu</button>&nbsp;&nbsp;
</div><br/><br/><br/>
	<div id="foodMenu-container" class="tab-container">
		<ul class='etabs'>
			<li class='tab' id="mainMenuTab"><a href="#mainMenuMaster">Food Menu Categories</a></li>
			<li class='tab' id="subMenuTab"><a href="#subMenuMaster">Food Dishes</a></li>
			<li class='tab' id="menuMappingTab"><a href="#menuMapping">Menu Mapping</a></li>
			
		</ul>

		<div id="mainMenuMaster">
			<table id="mainMenuTable" border="0" width="100%">
				<thead>
					<tr class="headerTR">
						<td width="25%">Menu Name</td>
						<td width="40%">Description</td>
						<td width="15%">V/NV</td>
						<td width="10%">Active</td>
						<td width="10%">Action</td>
					</tr>
				</thead>
				<tbody>
					<%
						for(MainMenu mainMenu : mainMenuList){
							%><tr style="font-size: 15px;">
								<td><%=mainMenu.getMainMenuName() %></td>
								<td><%=mainMenu.getMenuDescription() %></td>
								<td align="center"><%=mainMenu.isVeg() ? "Veg" : "Non Veg" %></td>
								<td align="center"><%=mainMenu.isActive() ? "True" : "False" %></td>
								<td>
									<img style="margin-left: 40%" height="22%" src="/AgriTadka/resources/images/edit.png" 
									id="mainMenu_<%=mainMenu.getMainMenuId()%>" name="editMenu">
									<img class="deleteIcon" src="/AgriTadka/resources/images/Delete.png" 
									id="mainMenu_<%=mainMenu.getMainMenuId()%>" name="deleteMenu">
								</td>		
							</tr><%
						}
					%>
					
				</tbody>	
			</table>
		</div>
		<div id="subMenuMaster">
			<table id="subMenuTable" border="0" width="100%">
				<thead>
					<tr class="headerTR">
						<td width="15%">Category</td>
						<td width="15%">Menu Name</td>
						<td width="25%">Description</td>
						<td width="10%">Veg/Non Veg</td>
						<td width="10%">AC</td>
						<td width="10%">Non AC</td>
						<td width="5%">Active</td>
						<td width="10%">Action</td>
					</tr>
				</thead>
				<tbody>
					<%
						for(MenuMapper menuMapper : menuMapperList){
							%><tr style="font-size: 15px;">
								<td><%=menuMapper.getMainMenu().getMainMenuName() %></td>
								<td><%=menuMapper.getSubMenu().getSubMenuName() %></td>
								<td><%=menuMapper.getSubMenu().getMenuDescription() %></td>
								<td align="center"><%=menuMapper.getSubMenu().isVeg() ? "Veg" : "Non Veg" %></td>
								<td align="center"><%=menuMapper.getSubMenu().getAcUnitPrice() %></td>
								<td align="center"><%=menuMapper.getSubMenu().getNonAcUnitPrice() %></td>
								<td align="center"><%=menuMapper.getSubMenu().isActive() ? "True" : "False" %></td>
								<td>
									<img style="margin-left: 40%" height="22%" src="/AgriTadka/resources/images/edit.png" 
									id="subMenu_<%=menuMapper.getMainSubMenuId()%>" name="editMenu">
									<img class="deleteIcon" src="/AgriTadka/resources/images/Delete.png" 
									id="subMenu_<%=menuMapper.getMainSubMenuId()%>" name="deleteMenu">
								</td>		
							</tr><%
						}
					%>
					
				</tbody>	
			</table>
		</div>
		<div id="menuMapping">
			<div class="ui-widget ui-helper-clearfix">
 
<ul id="gallery" class="gallery ui-helper-reset ui-helper-clearfix">
  <li class="ui-widget-content ui-corner-tr">
    <h5 class="ui-widget-header">High Tatras</h5>
    <img src="images/high_tatras_min.jpg" alt="The peaks of High Tatras" width="96" height="72">
    <a href="images/high_tatras.jpg" title="View larger image" class="ui-icon ui-icon-zoomin">View larger</a>
    <a href="link/to/trash/script/when/we/have/js/off" title="Delete this image" class="ui-icon ui-icon-trash">Delete image</a>
  </li>
  <li class="ui-widget-content ui-corner-tr">
    <h5 class="ui-widget-header">High Tatras 2</h5>
    <img src="images/high_tatras2_min.jpg" alt="The chalet at the Green mountain lake" width="96" height="72">
    <a href="images/high_tatras2.jpg" title="View larger image" class="ui-icon ui-icon-zoomin">View larger</a>
    <a href="link/to/trash/script/when/we/have/js/off" title="Delete this image" class="ui-icon ui-icon-trash">Delete image</a>
  </li>
  <li class="ui-widget-content ui-corner-tr">
    <h5 class="ui-widget-header">High Tatras 3</h5>
    <img src="images/high_tatras3_min.jpg" alt="Planning the ascent" width="96" height="72">
    <a href="images/high_tatras3.jpg" title="View larger image" class="ui-icon ui-icon-zoomin">View larger</a>
    <a href="link/to/trash/script/when/we/have/js/off" title="Delete this image" class="ui-icon ui-icon-trash">Delete image</a>
  </li>
  <li class="ui-widget-content ui-corner-tr">
    <h5 class="ui-widget-header">High Tatras 4</h5>
    <img src="images/high_tatras4_min.jpg" alt="On top of Kozi kopka" width="96" height="72">
    <a href="images/high_tatras4.jpg" title="View larger image" class="ui-icon ui-icon-zoomin">View larger</a>
    <a href="link/to/trash/script/when/we/have/js/off" title="Delete this image" class="ui-icon ui-icon-trash">Delete image</a>
  </li>
</ul>
 
<div id="trash" class="ui-widget-content ui-state-default">
  <h4 class="ui-widget-header"><span class="ui-icon ui-icon-trash">Trash</span> Trash</h4>
</div>
 
</div>
		</div>
	</div>
<script src="<%=contextPath%>/resources/js/masters.js" type="text/javascript"></script>
</body>
</html>