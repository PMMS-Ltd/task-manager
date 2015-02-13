<%@ page import="uk.org.pmms.task.Task" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="PMMS">
		<g:set var="entityName" value="${message(code: 'task.label', default: 'Task')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="list-task" class="content scaffold-list" role="main">
			<h1 class="page-header">
				<g:if test="${params.show == 'all' }">
					All Tasks
				</g:if>
				<g:else>
					My Tasks
				</g:else>
			</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:render template="taskTable" model="[tasks: taskInstanceList]"/>
		</div>
	</body>
</html>
