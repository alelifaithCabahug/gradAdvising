<%@ page import="gradadvising.Enrollments" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'enrollments.label', default: 'Enrollments')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		<script type="text/javascript">
			function selectAll(){//this function is used to check or uncheck all checkboxes
				var select = document.getElementById("select_all");
				var checkboxes = document.forms['enrollmentsForm'].elements['marked_subjects'];
				if (select.checked){
					for (i = 0; i < checkboxes.length; i++) checkboxes[i].checked = true;
				}else{
					for (i = 0; i < checkboxes.length; i++) checkboxes[i].checked = false;
				}
			}//this function works fine
</script>
	</head>
	
	<body>
		<div class="container-fluid">
		<div class="row-fluid">
		<div class="span2">
		</div>
		
		<div class="span8">
		
		<div id="create-student" class="content scaffold-create" role="main">
			<h1>New Enrollments</h1>
			
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<g:hasErrors bean="${enrollmentsInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${enrollmentsInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			
			<g:form name="enrollmentsForm" action="save" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
			
	</div>
	</body>
</html>
