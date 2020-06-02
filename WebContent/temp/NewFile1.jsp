<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀</title>
<script src="../common/jquery/jquery-3.5.1.js"></script>
<script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$( function() {
  $( "#datepicker" ).datepicker();
  $( "#anim" ).on( "change", function() {
    $( "#datepicker" ).datepicker( "option", "showAnim", $( this ).val() );
  });
} );
</script>


</script>
</head>
<body>
	<p>Date: <input type="text" id="datepicker" size="30"></p>

<p>Animations:<br>
<select id="anim">
  <option value="show">Show (default)</option>
  <option value="slideDown">Slide down</option>
  <option value="fadeIn">Fade in</option>
  <option value="blind">Blind (UI Effect)</option>
  <option value="bounce">Bounce (UI Effect)</option>
  <option value="clip">Clip (UI Effect)</option>
  <option value="drop">Drop (UI Effect)</option>
  <option value="fold">Fold (UI Effect)</option>
  <option value="slide">Slide (UI Effect)</option>
  <option value="">None</option>
</select>
</p>
</body>
</html>