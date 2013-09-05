<%@ page import="gradadvising.YearSem" %>



<div class="fieldcontain ${hasErrors(bean: yearSemInstance, field: 'year', 'error')} required">
	<label for="year">
		<g:message code="yearSem.year.label" default="Year" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="year" type="number" min="2000" max="2050" value="${yearSemInstance.year}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: yearSemInstance, field: 'sem', 'error')} required">
	<label for="sem">
		<g:message code="yearSem.sem.label" default="Sem" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="sem" type="number" min="1" max="3" value="${yearSemInstance.sem}" required=""/>
</div>

