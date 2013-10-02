<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'login.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'animate.css')}" type="text/css">
		<title>Log in</title>
		<style type="text/css">
		
		</style>
		<script src="${resource(dir:'js', file:'jquery-2.0.0.js')}"</script>
		<script src="${resource(dir:'js', file:'jquery-2.0.0.min.js')}"</script>
		
		<script type="text/JavaScript">
			<!--
			// PRELOADING IMAGES
			$(document).ready(function() {
				
				 window.setTimeout("fadeMyDiv();", 3000); //call fade in 3 seconds
				
			}
			)
			function fadeMyDiv() {
			   $("#fade").fadeOut("slow");
			}
		</script>
	</head>
	
	<body>
	<g:if test="${flash.message}">
		<div id="fade" class="animated fadeInDown">
			<div class="message" align="center">
					${flash.message}
			</div>
		</div>
	</g:if>
		<div class="loginContent">
		<h2>STUDENT </h2>
			<h2>This page is for Students only.</h2>		
				<g:hasErrors bean="${studentProfile}">
					<div class="errors">
					<g:renderErrors bean="${studentProfile}" as="list" />
					</div>
				</g:hasErrors>
				<g:form controller="studentProfile" method="post" >
					<div class="dialog" >
						<table  >
							<tr class='prop'>
								<td valign='top' class='name'>
								<h3>Username:</h3>
								</td>
								<td valign='top' class='value '>
									<input type="text" 
										name='sUsername'
										value='${student?.Susername}'>
									</input>
								</td>
							</tr>
							<tr class='prop'>
								<td valign='top' class='name'>
								<h3>Password:</h3>
								</td>
								<td valign='top' class='value '>
									<input type="password" 
									name='sPassword'
									value='${student?.Spassword}'>
									</input>
								
								</td>
							</tr>
						</table>
					</div>

					<div  align="center">
						<g:actionSubmit class="btn btn-small btn-info" value="Log in" />
						<a href="http://localhost:8080/gradAdvising"><i class="icon-home"></i></a>
						<!-- <g:link class="" action="index" controller="program">HOME</g:link> -->
						<g:link class="" action="login" controller="adviser">Log in as ADVISER</g:link>
					</div>
			</g:form>
		</div>
</body>
</html>