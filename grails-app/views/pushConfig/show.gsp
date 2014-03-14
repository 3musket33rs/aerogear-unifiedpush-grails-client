
<%@ page import="org.jboss.aerogear.unifiedpush.client.PushConfig" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pushConfig.label', default: 'PushConfig')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
        <g:javascript library="jquery" />
	</head>
	<body>
		<a href="#show-pushConfig" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-pushConfig" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list pushConfig">
			
				<g:if test="${pushConfigInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="pushConfig.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${pushConfigInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pushConfigInstance?.masterSecret}">
				<li class="fieldcontain">
					<span id="masterSecret-label" class="property-label"><g:message code="pushConfig.masterSecret.label" default="Master Secret" /></span>
					
						<span class="property-value" aria-labelledby="masterSecret-label"><g:fieldValue bean="${pushConfigInstance}" field="masterSecret"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pushConfigInstance?.pushApplicationId}">
				<li class="fieldcontain">
					<span id="pushApplicationId-label" class="property-label"><g:message code="pushConfig.pushApplicationId.label" default="Push Application Id" /></span>
					
						<span class="property-value" aria-labelledby="pushApplicationId-label"><g:fieldValue bean="${pushConfigInstance}" field="pushApplicationId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pushConfigInstance?.serverURL}">
				<li class="fieldcontain">
					<span id="serverURL-label" class="property-label"><g:message code="pushConfig.serverURL.label" default="Server URL" /></span>
					
						<span class="property-value" aria-labelledby="serverURL-label"><g:fieldValue bean="${pushConfigInstance}" field="serverURL"/></span>
					
				</li>
                <li class="fieldcontain">
                    <g:formRemote name="sendForm" on404="alert('not found!')" update="updateMe"
                                  url="[controller: 'pushConfig', action:'sendMessage']">
                        <input type="hidden" name="id" value="${pushConfigInstance?.id}"/>
                        Message: <input name="testMessage" type="text" />
                        <g:submitButton name="Send" />
                    </g:formRemote>
                    <div id="updateMe"></div>

                </li>
				</g:if>
			
			</ol>

			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${pushConfigInstance?.id}" />
					<g:link class="edit" action="edit" id="${pushConfigInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
