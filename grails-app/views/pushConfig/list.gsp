
<%@ page import="org.jboss.aerogear.unifiedpush.client.PushConfig" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pushConfig.label', default: 'PushConfig')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-pushConfig" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-pushConfig" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="description" title="${message(code: 'pushConfig.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="masterSecret" title="${message(code: 'pushConfig.masterSecret.label', default: 'Master Secret')}" />
					
						<g:sortableColumn property="pushApplicationId" title="${message(code: 'pushConfig.pushApplicationId.label', default: 'Push Application Id')}" />
					
						<g:sortableColumn property="serverURL" title="${message(code: 'pushConfig.serverURL.label', default: 'Server URL')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${pushConfigInstanceList}" status="i" var="pushConfigInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${pushConfigInstance.id}">${fieldValue(bean: pushConfigInstance, field: "description")}</g:link></td>
					
						<td>${fieldValue(bean: pushConfigInstance, field: "masterSecret")}</td>
					
						<td>${fieldValue(bean: pushConfigInstance, field: "pushApplicationId")}</td>
					
						<td>${fieldValue(bean: pushConfigInstance, field: "serverURL")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${pushConfigInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
