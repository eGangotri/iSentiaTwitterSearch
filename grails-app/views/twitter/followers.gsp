<meta name='layout' content='twitter' />
<title>Followers</title>

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
</tr>
</thead>
<tbody>
<g:each in='${followers}' var='user'>
	<tr>
		<td>${user.id}</td>
		<td>${user.description}</td>
		<td>${user.location}</td>
		<td>${user.name}</td>
		<td><img src="${user.profileImageUrl}" alt="${user.screenName}" border='0' /></td>
		<td><a href="http://twitter.com/${user.screenName}" target='_blank'>${user.screenName}</a></td>
		<td><a href="${createLink(action: 'sendMessage', id: user.id)}">Send</a></td>
	</tr>
</g:each>
</tbody>
</table>
