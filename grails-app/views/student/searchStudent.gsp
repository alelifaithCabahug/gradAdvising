
<html>
<head>
	<title>Search Student</title>
</head>


<body>
<hr/>
<br/>
<br/>

<p><center>
	<g:form controller="Student" action="${}">
	<input type="text" name="id" placeholder="${}">
	<button type="submit" class="btn btn-primary" data-loading-text="Loading...">Submit</button>
	</g:form>
</center></p>

</body>
</html>