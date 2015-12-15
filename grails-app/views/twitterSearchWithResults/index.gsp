<%@ page import="isentia.TwitterSearchWithResults" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(code: 'twitterSearchWithResults.label', default: 'TwitterSearchWithResults')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-twitterSearchWithResults" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                               default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-twitterSearchWithResults" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <th><g:message code="twitterSearchWithResults.searchKey.label" default="Search Key"/></th>

            <g:sortableColumn property="searchResult"
                              title="${message(code: 'twitterSearchWithResults.searchResult.label', default: 'Search Result')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${twitterSearchWithResultsInstanceList}" status="i" var="twitterSearchWithResultsInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${twitterSearchWithResultsInstance.id}">${fieldValue(bean: twitterSearchWithResultsInstance, field: "searchKey")}</g:link></td>

                <td>${fieldValue(bean: twitterSearchWithResultsInstance, field: "searchResult")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${twitterSearchWithResultsInstanceCount ?: 0}"/>
    </div>
</div>
</body>
</html>
