<%@ page import="gradadvising.Enrollments" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'enrollments.label', default: 'Enrollments')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
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
		<	<div class="container-fluid">
		<div class="row-fluid">
		<div class="span2">
		</div>
		
		<div class="span8">
		
		<div id="edit-subject" class="content scaffold-edit" role="main">
			<h1>Update Enrollments</h1>
			
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
			
			<g:form name="enrollmentsForm" method="post" >
				<g:hiddenField name="id" value="${enrollmentsInstance?.id}" />
				<g:hiddenField name="version" value="${enrollmentsInstance?.version}" />
				<fieldset class="form">
					<g:render template="formForEdit"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
			
	</div>
	</body>
</html>
