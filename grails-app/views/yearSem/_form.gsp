<%@ page import="gradadvising.YearSem" %>



<div class="fieldcontain ${hasErrors(bean: yearSemInstance, field: 'year', 'error')} required">
	<label for="year">
		<g:message code="yearSem.year.label" default="Year" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="year" required="" value="${yearSemInstance?.year}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: yearSemInstance, field: 'sem', 'error')} ">
	<label for="sem">
		<g:message code="yearSem.sem.label" default="Sem" />
		
	</label>
	<g:select name="sem" from="${yearSemInstance.constraints.sem.inList}" value="${yearSemInstance?.sem}" valueMessagePrefix="yearSem.sem" noSelection="['': '']"/>
</div>

