<div class="navbar navbar-default navbar-static-top">
    <div class="navbar-inner">
      <div class="container">
	  
		<a class="brand" href="http://localhost:8080/gradAdvising"><img width="110" height="40" src="${resource(dir: 'images', file: 'scs-logo.png')}"></a>
		<g:if test="${session.username}">
        <ul class="nav">
		  <li><a href="http://localhost:8080/gradAdvising/student">Student</a></li>
          <li><a href="http://localhost:8080/gradAdvising/subject">Courses</a></li>
		  <li><a href="http://localhost:8080/gradAdvising/program">Programs &raquo</a></li>
		  <li></li>
		 <li></li>
		
			<!--link for adviser log-out -->
		<li><g:link class="text" action="logout" controller="adviser">LOGOUT</g:link></li>	
		</g:if>
		
		
		<!--link for student log-out -->
		 <g:if test="${session.sUsername}">
				<g:link class="text" action="logout" controller="studentProfile">LOGOUT</g:link>	
				</g:if>
		  
		  
		 <g:form url='[controller: "searchable", action: "index"]' id="searchableForm" name="searchableForm" method="get">
			<g:textField name="q" value="${params.q}" size="50"/> <input type="submit" value="Search" />
		</g:form>
		  
        </ul>
		
      </div>
    </div>
  </div>
  
  <!-- bottom navigation-->

  <center>
  <nav class="navbar navbar-default navbar-fixed-bottom" role="navigation">
	<ol class="breadcrumb">
		 <g:if test="${session.username}">
		<a href="http://localhost:8080/gradAdvising/adviser/list">Adviser</a> |
		<a href="http://localhost:8080/gradAdvising/student/list">Enrollee</a> |
		<a href="http://localhost:8080/gradAdvising/yearSem/list">Year & Sem</a> |
		<a href="http://localhost:8080/gradAdvising/grade/list">Grade</a> |
		<a href="http://localhost:8080/gradAdvising/enrollments/list">Enrollments</a> |
		<a href="http://localhost:8080/gradAdvising/program/list">Programs</a> |
		<a href="http://localhost:8080/gradAdvising/subject/list">Subject</a> |
		</g:if>
		<a href="http://www.msuiit.edu.ph/academics/schools/sgs/admissions.php">Requirements</a> |
		&copy; C C D V
	</ol>
  </nav>
  </center>
  

  
	
	