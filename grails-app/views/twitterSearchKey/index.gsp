<%@ page import="isentia.TwitterSearchKey" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'twitterSearchKey.label', default: 'TwitterSearchKey')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-twitterSearchKey" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                       default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-twitterSearchKey" class="content scaffold-list" role="main">
    <h1>Search</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="searchTerm"
                              title="${message(code: 'twitterSearchKey.searchTerm.label', default: 'Search Term')}"/>

        </tr>
        </thead>
        <tbody>

        <fieldset class="form">
            <g:render template="form"/>
        </fieldset>
        <fieldset class="buttons">
            <button class="save" onclick="searchOnTwitter('${g.createLink(action:"pingTwitterRestApi")}')"
                    value="${message(code: 'default.button.create.label', default: 'Create')}" name="create"
                    class="save">Search</button>

        </fieldset>


        <p id="searchResults">

        </p>
        <g:each in="${twitterSearchKeyInstanceList}" status="i" var="twitterSearchKeyInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${twitterSearchKeyInstance.id}">${fieldValue(bean: twitterSearchKeyInstance, field: "searchTerm")}</g:link></td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${twitterSearchKeyInstanceCount ?: 0}"/>
    </div>
</div>
</body>
</html>
