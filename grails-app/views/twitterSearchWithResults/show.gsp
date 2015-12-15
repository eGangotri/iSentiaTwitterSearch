<%@ page import="isentia.TwitterSearchWithResults" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(code: 'twitterSearchWithResults.label', default: 'TwitterSearchWithResults')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-twitterSearchWithResults" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                               default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-twitterSearchWithResults" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list twitterSearchWithResults">

        <g:if test="${twitterSearchWithResultsInstance?.searchKey}">
            <li class="fieldcontain">
                <span id="searchKey-label" class="property-label"><g:message
                        code="twitterSearchWithResults.searchKey.label" default="Search Key"/></span>

                <span class="property-value" aria-labelledby="searchKey-label"><g:link controller="twitterSearchKey"
                                                                                       action="show"
                                                                                       id="${twitterSearchWithResultsInstance?.searchKey?.id}">${twitterSearchWithResultsInstance?.searchKey?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${twitterSearchWithResultsInstance?.searchResult}">
            <li class="fieldcontain">
                <span id="searchResult-label" class="property-label"><g:message
                        code="twitterSearchWithResults.searchResult.label" default="Search Result"/></span>

                <span class="property-value" aria-labelledby="searchResult-label"><g:fieldValue
                        bean="${twitterSearchWithResultsInstance}" field="searchResult"/></span>

            </li>
        </g:if>

    </ol>
    <g:form url="[resource: twitterSearchWithResultsInstance, action: 'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${twitterSearchWithResultsInstance}"><g:message
                    code="default.button.edit.label" default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
