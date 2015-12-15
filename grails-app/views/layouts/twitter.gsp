<html>
<head>
<title><g:layoutTitle default="Twitter Test" /></title>
<link rel="stylesheet" href="${createLinkTo(dir:'css',file:'main.css')}" />
<link rel="shortcut icon" href="${createLinkTo(dir:'images',file:'favicon.ico')}" type="image/x-icon" />

<g:layoutHead />

</head>

<body>

	<div id="spinner" class="spinner" style="display:none;">
		<img src="${createLinkTo(dir:'images',file:'spinner.gif')}" alt="Spinner" />
	</div>

	<div class="logo"><img src="${createLinkTo(dir:'images',file:'grails_logo.jpg')}" alt="Grails" /></div>

	<g:if test='${username}'>
		<br/>
		Logged in as <a href="http://twitter.com/${username}" target='_blank'>${username}</a><br/>
		<ul>
			<li><a href="${createLink(controller: 'twitter', action: 'index')}">Index page</a></li>
			<li><a href="${createLink(controller: 'twitter', action: 'friends')}">Friends</a></li>
			<li><a href="${createLink(controller: 'twitter', action: 'followers')}">Followers</a></li>
			<li><a href="${createLink(controller: 'twitter', action: 'logout')}">Logout</a><br/></li>
		</ul>
		<br/>
	</g:if>

	<g:javascript library="application" />				

<g:layoutBody />

<g:if test='${username}'>
<br/>Current Rate limit status: <twitter:rateLimitStatus /><br/>
</g:if>

		
</body>	
</html>
