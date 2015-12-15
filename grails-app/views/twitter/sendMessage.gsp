<meta name='layout' content='twitter' />
<title>Send Message</title>

Send a message to ${user.name} <img src="${user.profileImageUrl}" alt="${user.screenName}" border='0' />:<br/>

<g:form action='sendMessage'>
	<input type='hidden' name='id' value='${user.id}' />
	<input type='text' name='message' maxlength='140' /><br/>
	<input type='submit' value='Send' />
</g:form>
