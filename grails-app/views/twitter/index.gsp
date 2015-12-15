<meta name='layout' content='twitter' />
<title>Twitter</title>

<hr/>
<br/>
My Status:<br/>
<twitter:status><twitter:markup text='${it?.text}'/></twitter:status>
<br/>
<br/>

My Details:<br/>
<twitter:user userId='${username}'>
ID: ${it?.id}<br/>
Description: ${it?.description}<br/>
Location: ${it?.location}<br/>
Display Name: ${it?.name}<br/>
Image: <twitter:profileImage user='${it}' alt='${it?.screenName}' /><br/>
Protected: ${it?.protectedUser}<br/>
Login Name: <twitter:userLink name='${it?.screenName}' text='${it?.screenName}'/><br/>
Website: <twitter:url url='${it?.website}'/><br/>
Followers Count: ${it?.followersCount}<br/>
</twitter:user>

<br/>
Set status:<br/>
<g:form action='setStatus'>
	<input type='text' name='message' maxlength='140' />
	<input type='submit' value='Update' />
</g:form>
<br/>

<hr/>

Direct messages:<br/>
<table class='twitter_table'>
<thead>
<tr>
	<th>ID</th>
	<th>From</th>
	<th>Body</th>
	<th>Favorited</th>
	<th>Truncated</th>
	<th>When</th>
</tr>
</thead>
<tbody>
<twitter:directMessages>
<tr>
	<td>${it.id}</td>
	<td><twitter:userLink name='${it.sender.screenName}' text='${it.sender.name}'/></td>
	<td><twitter:markup text='${it.text}'/></td>
	<td>${it.favorited}</td>
	<td>${it.truncated}</td>
	<td><g:formatDate format='MM/dd/yyyy h:mm:ss a' date='${it.createdAt}'/></td>
</tr>
</twitter:directMessages>
</tbody>
</table>

<hr/>
<br/>

Recent direct messages:<br/>
<table class='twitter_table'>
<thead>
<tr>
	<th>ID</th>
	<th>From</th>
	<th>Body</th>
	<th>Favorited</th>
	<th>Truncated</th>
	<th>When</th>
</tr>
</thead>
<tbody>
<twitter:recentDirectMessages>
<tr>
	<td>${it.id}</td>
	<td><twitter:userLink name='${it.sender.screenName}' text='${it.sender.name}'/></td>
	<td><twitter:markup text='${it.text}'/></td>
	<td>${it.favorited}</td>
	<td>${it.truncated}</td>
	<td><g:formatDate format='MM/dd/yyyy h:mm:ss a' date='${it.createdAt}'/></td>
</tr>
</twitter:recentDirectMessages>
</tbody>
</table>
<br/>

<hr/>

Replies:<br/>
<table class='twitter_table'>
<thead>
<tr>
	<th>ID</th>
	<th>From</th>
	<th>Body</th>
	<th>Public</th>
	<th>Favorited</th>
	<th>Reply-to Status ID</th>
	<th>Truncated</th>
	<th>When</th>
</tr>
</thead>
<tbody>
<twitter:replies>
<tr>
	<td><twitter:tweetLink name='${it.sender.screenName}' id='${it.id}' /></td>
	<td><twitter:userLink name='${it.sender.screenName}' text='${it.sender.name}'/></td>
	<td><twitter:markup text='${it.text}'/></td>
	<td>${it.isPublic()}</td>
	<td>${it.favorited}</td>
	<td><twitter:tweetLink name='${username}' id='${it.inReplyToStatusId}' /></td>
	<td>${it.truncated}</td>
	<td><g:formatDate format='MM/dd/yyyy h:mm:ss a' date='${it.createdAt}'/></td>
</tr>
</twitter:replies>
</tbody>
</table>
<br/>

<hr/>

Followers:<br/>
<table class='twitter_table'>
<thead>
<tr>
	<th>ID</th>
	<th>Description</th>
	<th>Location</th>
	<th>Display Name</th>
	<th>Image</th>
	<th>Protected</th>
	<th>Login Name</th>
	<th>Status</th>
	<th>Website</th>
	<th>Followers Count</th>
</tr>
</thead>
<tbody>
<twitter:followers>
<tr>
	<td>${it.id}</td>
	<td>${it.description}</td>
	<td>${it.location}</td>
	<td>${it.name}</td>
	<td><twitter:profileImage user='${it}' alt='${it.screenName}' /></td>
	<td>${it.protectedUser}</td>
	<td><twitter:userLink name='${it.screenName}' text='${it.screenName}'/></td>
	<td><twitter:markup text='${it.status.text}'/></td>
	<td><twitter:url url='${it.website}'/></td>
	<td>${it.followersCount}</td>
</tr>
</twitter:followers>
</tbody>
</table>
<br/>

<hr/>

Friends:<br/>
<table class='twitter_table'>
<thead>
<tr>
	<th>ID</th>
	<th>Description</th>
	<th>Location</th>
	<th>Display Name</th>
	<th>Image</th>
	<th>Protected</th>
	<th>Login Name</th>
	<th>Status</th>
	<th>Website</th>
	<th>Followers Count</th>
</tr>
</thead>
<tbody>
<twitter:friends>
<tr>
	<td>${it.id}</td>
	<td>${it.description}</td>
	<td>${it.location}</td>
	<td>${it.name}</td>
	<td><twitter:profileImage user='${it}' alt='${it.screenName}' /></td>
	<td>${it.protectedUser}</td>
	<td><twitter:userLink name='${it.screenName}' text='${it.screenName}'/></td>
	<td><twitter:markup text='${it.status.text}'/></td>
	<td><twitter:url url='${it.website}'/></td>
	<td>${it.followersCount}</td>
</tr>
</twitter:friends>
</tbody>
</table>
<br/>

<hr/>

Friends Timeline:<br/>
<table class='twitter_table'>
<thead>
<tr>
	<th>ID</th>
	<th>User</th>
	<th>Image</th>
	<th>Status</th>
	<th>Favorited</th>
	<th>Reply-to User</th>
	<th>Reply-to Status ID</th>
	<th>Truncated</th>
	<th>When</th>
</tr>
</thead>
<tbody>
<twitter:friendsTimeline>
<tr>
	<td><twitter:tweetLink name='${it.user.screenName}' id='${it.id}' /></td>
	<td><twitter:userLink name='${it.user.screenName}' text='${it.user.name}'/></td>
	<td><twitter:profileImage user='${it.user}' alt='${it.user.screenName}' /></td>
	<td><twitter:markup text='${it.text}'/></td>
	<td>${it.favorited}</td>
	<g:if test='${it.inReplyToScreenName}'>
		<td><twitter:userLink name='${it.inReplyToScreenName}' text='${it.inReplyToScreenName}'/></td>
		<td><twitter:tweetLink name='${it.inReplyToScreenName}' id='${it.inReplyToStatusId}' /></td>
	</g:if>
	<g:else>
		<td colspan='2'>&nbsp;</td>
	</g:else>
	<td>${it.truncated}</td>
	<td><g:formatDate format='MM/dd/yyyy h:mm:ss a' date='${it.createdAt}'/></td>
</tr>
</twitter:friendsTimeline>
</tbody>
</table>
<br/>
<hr/>

User Timeline:<br/>
<table class='twitter_table'>
<thead>
<tr>
	<th>ID</th>
	<th>Status</th>
	<th>Favorited</th>
	<th>Reply-to User</th>
	<th>Reply-to Status ID</th>
	<th>Truncated</th>
	<th>When</th>
</tr>
</thead>
<tbody>
<twitter:userTimeline>
<tr>
	<td><twitter:tweetLink name='${it.user.screenName}' id='${it.id}' /></td>
	<td><twitter:markup text='${it.text}'/></td>
	<td>${it.favorited}</td>
	<g:if test='${it.inReplyToScreenName}'>
		<td><twitter:userLink name='${it.inReplyToScreenName}' text='${it.inReplyToScreenName}'/></td>
		<td><twitter:tweetLink name='${it.inReplyToScreenName}' id='${it.inReplyToStatusId}' /></td>
	</g:if>
	<g:else>
		<td colspan='2'>&nbsp;</td>
	</g:else>
	<td>${it.truncated}</td>
	<td><g:formatDate format='MM/dd/yyyy h:mm:ss a' date='${it.createdAt}'/></td>
</tr>
</twitter:userTimeline>
</tbody>
</table>
<br/>

<hr/>

Public Timeline:<br/>
<table class='twitter_table'>
<thead>
<tr>
	<th>ID</th>
	<th>User</th>
	<th>Image</th>
	<th>Status</th>
	<th>Favorited</th>
	<th>Reply-to User</th>
	<th>Reply-to Status ID</th>
	<th>Truncated</th>
	<th>When</th>
</tr>
</thead>
<tbody>
<twitter:publicTimeline>
<tr>
	<td><twitter:tweetLink name='${it.user.screenName}' id='${it.id}' /></td>
	<td><twitter:userLink name='${it.user.screenName}' text='${it.user.name}'/></td>
	<td><twitter:profileImage user='${it.user}' alt='${it.user.screenName}' /></td>
	<td><twitter:markup text='${it.text}'/></td>
	<td>${it.favorited}</td>
	<g:if test='${it.inReplyToScreenName}'>
		<td><twitter:userLink name='${it.inReplyToScreenName}' text='${it.inReplyToScreenName}'/></td>
		<td><twitter:tweetLink name='${it.inReplyToScreenName}' id='${it.inReplyToStatusId}' /></td>
	</g:if>
	<g:else>
		<td colspan='2'>&nbsp;</td>
	</g:else>
	<td>${it.truncated}</td>
	<td><g:formatDate format='MM/dd/yyyy h:mm:ss a' date='${it.createdAt}'/></td>
</tr>
</twitter:publicTimeline>
</tbody>
</table>
<br/>

<hr/>

Featured users:<br/>
<table class='twitter_table'>
<thead>
<tr>
	<th>ID</th>
	<th>Description</th>
	<th>Location</th>
	<th>Display Name</th>
	<th>Image</th>
	<th>Protected</th>
	<th>Login Name</th>
	<th>Status</th>
	<th>Website</th>
	<th>Followers Count</th>
</tr>
</thead>
<tbody>
<twitter:featured>
<tr>
	<td>${it.id}</td>
	<td>${it.description}</td>
	<td>${it.location}</td>
	<td>${it.name}</td>
	<td><twitter:profileImage user='${it}' alt='${it.screenName}' /></td>
	<td>${it.protectedUser}</td>
	<td><twitter:userLink name='${it.screenName}' text='${it.screenName}'/></td>
	<td><twitter:markup text='${it.status.text}'/></td>
	<td><twitter:url url='${it.website}'/></td>
	<td>${it.followersCount}</td>
</tr>
</twitter:featured>
</tbody>
</table>
<br/>
