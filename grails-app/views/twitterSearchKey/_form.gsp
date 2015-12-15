<%@ page import="isentia.TwitterSearchKey" %>



<div class="fieldcontain ${hasErrors(bean: twitterSearchKeyInstance, field: 'searchTerm', 'error')} ">
    <label for="searchTerm">
        <g:message code="twitterSearchKey.searchTerm.label" default="Search Term"/>

    </label>
    <g:textField name="searchTerm" value="${twitterSearchKeyInstance?.searchTerm}" id="searchTerm"/>

</div>

