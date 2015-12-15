<%@ page import="isentia.TwitterSearchWithResults" %>



<div class="fieldcontain ${hasErrors(bean: twitterSearchWithResultsInstance, field: 'searchKey', 'error')} ">
    <label for="searchKey">
        <g:message code="twitterSearchWithResults.searchKey.label" default="Search Key"/>

    </label>
    <g:select id="searchKey" name="searchKey.id" from="${isentia.TwitterSearchKey.list()}" optionKey="id" required=""
              value="${twitterSearchWithResultsInstance?.searchKey?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: twitterSearchWithResultsInstance, field: 'searchResult', 'error')} ">
    <label for="searchResult">
        <g:message code="twitterSearchWithResults.searchResult.label" default="Search Result"/>

    </label>
    <g:textField name="searchResult" value="${twitterSearchWithResultsInstance?.searchResult}"/>

</div>

