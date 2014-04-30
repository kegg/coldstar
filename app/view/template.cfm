<cfparam name="content.title" default="">
<cfparam name="content.html" default="">
<cfoutput>
<html>
	<head>
		<title>MVC</title>
	</head>
	<body>
		<p>#anchor('site/index', 'Home')# |
		#anchor('site/about', 'About')#</p>		
		<h1>#content.title#</h1>
		#content.html#
	</body>
</html>
</cfoutput>