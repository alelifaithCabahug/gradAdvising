<%@ page import="gradadvising.Grade" %>
<!DOCTYPE html>
<html>
<head>
	<title>Search Student</title>
</head>
<body>
<hr/>
<br/>
<br/>
<p><center>
	<g:form action="searchStudent" controller="student" class="">
			<g:textField name="idNumber" value="${params.input}" size="15" placeholder="Student Id No."/>
			<g:submitButton name="search" class="buttons" value="Search" />
	</g:form> 
</center></p>

</body>
</html>