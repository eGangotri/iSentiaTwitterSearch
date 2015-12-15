<meta name='layout' content='twitter' />
<title>Friends</title>

<table class='twitter_table'>
<thead>
<tr>
	<th>ID</th>
	<th>Description</th>
	<th>Location</th>
	<th>Display Name</th>
	<th>Image</th>
	<th>Login Name</th>
	<th>Send message</th>
	<th>Remove</th>
</tr>
</thead>
<tbody>
<g:each in='${friends}' var='user'>
	<tr>
		<td>${user.id}</td>
		<td>${user.description}</td>
		<td>${user.location}</td>
		<td>${user.name}</td>
		<td><img src="${user.profileImageUrl}" alt="${user.screenName}" border='0' /></td>
		<td><a href="http://twitter.com/${user.screenName}" target='_blank'>${user.screenName}</a></td>
		<td><a href="${createLink(action: 'sendMessage', id: user.id)}">Send</a></td>
		<td><a href="${createLink(action: 'unfriend', id: user.id)}">Remove</a></td>
	</tr>
</g:each>
</tbody>
</table>

<hr />
Add Friend<br/>

<g:form action='addFriend'>
	Friend ID or username: <input type='text' name='id' /><br/>
	<input type='submit' value='Add Friend' />
</g:form>
