<cfheader statusCode="403" statusText="Access Denied">
<!DOCTYPE html>
<html lang="en">
<head>
<title>Access Denied</title>
<style type="text/css">
body {
	background-color: #fff;
	margin: 5%;
	font-family: Arial, Helvetica, sans-serif;
	color: #666;
}

#page h1 {
	border:1px solid #888;
	font-size:18pt;
	padding:10px;
}

#page div {
	border:1px solid #888;
	padding:10px;
}

#page div p {
	font-size:12pt;
}
</style>
</head>
<body>
	<div id="page">
		<h1>Access Denied</h1>
		<div>
			<p>You don't have access to these files directly.</p>
		</div>
	</div>
</body>
</html>
<cfabort>