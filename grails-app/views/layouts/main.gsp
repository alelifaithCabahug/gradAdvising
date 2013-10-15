<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'Pixel-Wolf_icon.png')}" type="image/x-icon">
		
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'site.css')}" type="text/css">  <!--  THIS LINE IS THE ACTIVE CSS -->
		
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'prettify.css')}" type="text/css"> 
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'font-awesome.css')}" type="text/css">
		
		<g:layoutHead/>
		<r:layoutResources />
		<style type="text/css">
			.searchBox{
				margin-left: 10em;
				float: right;
			}
		</style>
	</head>
	
	<body>
	
		<g:render template="/layouts/support-nav" />
		
		<g:layoutBody/>
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		<g:javascript library="application"/>
		<r:layoutResources />
	</body>
</html>
