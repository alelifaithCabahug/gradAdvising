<!doctype html>
<html>
	<head>
		<!-- <meta name="layout" content="main"/> -->
		<!-- <title>S C S</title> -->
	</head>
	
	
	<body>
		<!-- added this bit 09/01 -->
	
	<div class="jumbotron">
	
	<div class="container">
	<div class="row">
    <div class="span12">
      <div class="hero-content">
	  <h3>School of Computer Studies</h3>
        <h1>Graduate Studies</h1>
        
        	<br></br>
		
        <div class="actions">
		
		<g:if test="${session.username}">
		<a class="btn btn-large btn-github" href="http://localhost:8080/gradAdvising/Student"
			<i class=""></i>
           Enroll <br>Student</a>
			
		<a class="btn btn-large btn-github" href="http://localhost:8080/gradAdvising/program/list"
			<i class=""></i>
            Programme <br> <br> </a>
	
			
		<a class="btn btn-large btn-github" href="http://localhost:8080/gradAdvising/grade"
			<i class=""></i>
            Add <br> Grade<br> </a>
		</g:if>
		
		<g:if test="${!session.username}">
		<a class="btn btn-large btn-github" href="http://localhost:8080/gradAdvising/adviser/login"
			<i class=""></i>
           LOGIN</a>
		</g:if>
		<!-- xxx 09/01/13 --->
	
		<!-- </div>
		   <div class="shameless-self-promotion">
          &copy; C C D V
        </div>
		</div> -->
		

<!-- js for carousel -->

<script src="js/jquery-1.7.1.min.js"></script>
<script src="js/underscore.min.js"></script>
<script src="js/backbone.min.js"></script>
<script src="js/prettify.min.js"></script>
<script src="js/bootstrap-222.min.js"></script>
<script src="js/index/index.js"></script>
 
	</body>
</html>
