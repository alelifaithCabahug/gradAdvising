<%@ page import="gradadvising.Adviser" %>



<div class="fieldcontain ${hasErrors(bean: adviserInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="adviser.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${adviserInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: adviserInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="adviser.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required="" value="${adviserInstance?.password}"/>
</div>

