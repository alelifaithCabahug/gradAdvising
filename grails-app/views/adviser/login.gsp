<!doctype html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'Pixel-Wolf_icon.png')}" type="image/x-icon">
		
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.css')}" type="text/css"> <!--  THIS LINE IS THE ACTIVE CSS -->
		
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'site.css')}" type="text/css">  
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'prettify.css')}" type="text/css"> 
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'font-awesome.css')}" type="text/css">
		<!-- <link rel="stylesheet" href="${resource(dir: 'css', file: 'login.css')}" type="text/css"> -->
		<!-- <link rel="stylesheet" href="${resource(dir: 'css', file: 'animate.css')}" type="text/css"> -->
		
		<title>Adviser's</title>
		
		<style type="text/css">
      /* Override some defaults */
      html, body {
        background-color: #eee;
      }
      body {
        padding-top: 40px; 
      }
      .container {
        width: 300px;
      }

      /* The white background content wrapper */
      .container > .content {
        background-color: #fff;
        padding: 20px;
        margin: 0 -20px; 
        -webkit-border-radius: 10px 10px 10px 10px;
           -moz-border-radius: 10px 10px 10px 10px;
                border-radius: 10px 10px 10px 10px;
        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.15);
           -moz-box-shadow: 0 1px 2px rgba(0,0,0,.15);
                box-shadow: 0 1px 2px rgba(0,0,0,.15);
      }

	  .login-form {
		margin-left: 65px;
	  }
	
	  legend {
		margin-right: -50px;
		font-weight: bold;
	  	color: #404040;
	  }
    </style>

	</head>
	
	<!--scripts-->
		
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
	
	<!-- end of scripts -->

	<body>

	<div class="container">
	<div class="content">
    <div class="row">
        
		<div class="login-form">
	
	<g:if test="${flash.message}">
		<div id="fade" class="animated fadeInDown">
			<div class="message" align="center">
					${flash.message}
			</div>
		</div>
	</g:if>
	

		<h2>Adviser's Log</h2>
			This page is restricted for system School Adviser's only.
			
				<g:hasErrors bean="${adviser}">
					<div class="errors">
					<g:renderErrors bean="${adviser}" as="list" />
					</div>
				</g:hasErrors>
				
				<g:form controller="adviser" method="post" >
				
					<div class="dialog" >
					
								<div class="clearfix">
									<input type="text" maxlength='8'
										name='username'
										value='${adviser?.username}'
										placeholder='username'>
									</input>
								</div>
							
								<div class="clearfix">
									<input type="password" maxlength='8'
									name='password'
									value='${adviser?.password}'
									placeholder='password'>
								</div>
					
					<div  align="center">
						<g:actionSubmit class="btn btn-small btn-info" value="Log in" />
						<!-- <g:link class="" action="index" controller="program">HOME</g:link> -->
					</div>
					
			</g:form>
		</div>
		
 </div>
 </div>
 </div> 
	
	
</body>
</html>