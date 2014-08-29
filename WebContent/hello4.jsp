<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-2.1.1.js" ></script>
<script type="text/javascript">
var waitSeconds = 0;
window.setInterval(function () {
	 waitSeconds += 1;
	 $("#timer").text(waitSeconds);
}, 1000);

(function poll() {
	$.ajax({
		url: "http://10.1.100.128:88/", 
		success: function(data) {
			$("#container").html($("#container").html() + "<br />" + data);
			waitSeconds = 0;
		},
		error: function(jqXHR, textStatus, errorThrown ){
			$("#container").html($("#container").html() + "<br />" + textStatus);
			waitSeconds = 0;
		},
		timeout: 5000,
		complete: poll 
	});
})();
</script>
</head>
<body>
<div id="timer"></div>
<div id="container">
</div>
</body>
</html>