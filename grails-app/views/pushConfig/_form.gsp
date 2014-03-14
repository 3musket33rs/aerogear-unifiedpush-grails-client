<%@ page import="org.jboss.aerogear.unifiedpush.client.PushConfig" %>



<div class="fieldcontain ${hasErrors(bean: pushConfigInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="pushConfig.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${pushConfigInstance?.description}" />
</div>

<div class="fieldcontain ${hasErrors(bean: pushConfigInstance, field: 'masterSecret', 'error')} ">
	<label for="masterSecret">
		<g:message code="pushConfig.masterSecret.label" default="Master Secret" />
		
	</label>
	<g:textField name="masterSecret" value="${pushConfigInstance?.masterSecret}" />
</div>

<div class="fieldcontain ${hasErrors(bean: pushConfigInstance, field: 'pushApplicationId', 'error')} ">
	<label for="pushApplicationId">
		<g:message code="pushConfig.pushApplicationId.label" default="Push Application Id" />
		
	</label>
	<g:textField name="pushApplicationId" value="${pushConfigInstance?.pushApplicationId}" />
</div>

<div class="fieldcontain ${hasErrors(bean: pushConfigInstance, field: 'serverURL', 'error')} ">
	<label for="serverURL">
		<g:message code="pushConfig.serverURL.label" default="Server URL" />
		
	</label>
	<g:textField name="serverURL" value="${pushConfigInstance?.serverURL}" />
</div>

