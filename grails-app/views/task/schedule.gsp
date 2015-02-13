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
			<h1 class="page-header">Schedule</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<h3>Todays Tasks</h3>
			<g:if test="${today.size() > 0}">
				<g:render template="taskTable" model="[tasks: today]"/>
			</g:if>
			<g:else>
				<h4 class="text-muted">No Tasks due Today</h4>
			</g:else>
			<h3>This Weeks Tasks</h3>
			<g:if test="${thisWeek.size() > 0}">
				<g:render template="taskTable" model="[tasks: thisWeek]"/>
			</g:if>
			<g:else>
				<h4 class="text-muted">No Tasks due This Week</h4>
			</g:else>
			<h3>Next Weeks Tasks</h3>
			<g:if test="${nextWeek.size() > 0}">
				<g:render template="taskTable" model="[tasks: nextWeek]"/>
			</g:if>
			<g:else>
				<h4 class="text-muted">No Tasks due Next Week</h4>
			</g:else>
		</div>
	</body>
</html>
