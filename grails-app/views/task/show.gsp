
<%@ page import="uk.org.pmms.task.Task" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="PMMS">
		<g:set var="entityName" value="${message(code: 'task.label', default: 'Task')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-task" class="col-lg-8 col-md-10 col-sm-12 hidden-xs" role="main">
			<h1 class="page-header"><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="alert alert-warning" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list task">
			
				<g:if test="${taskInstance?.priority}">
				<li class="fieldcontain">
					<span id="priority-label" class="property-label"><g:message code="task.priority.label" default="Priority" /></span>
					
						<span class="property-value" aria-labelledby="priority-label"><g:fieldValue bean="${taskInstance}" field="priority"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${taskInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="task.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${taskInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${taskInstance?.percentComplete}">
				<li class="fieldcontain">
					<span id="percentComplete-label" class="property-label"><g:message code="task.percentComplete.label" default="Percent Complete" /></span>
					
						<span class="property-value" aria-labelledby="percentComplete-label"><g:fieldValue bean="${taskInstance}" field="percentComplete"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${taskInstance?.assignedToUID}">
				<li class="fieldcontain">
					<span id="assignedToUID-label" class="property-label"><g:message code="task.assignedToUID.label" default="Assigned To UID" /></span>
					
						<span class="property-value" aria-labelledby="assignedToUID-label"><g:fieldValue bean="${taskInstance}" field="assignedToUID"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${taskInstance?.dueDate}">
				<li class="fieldcontain">
					<span id="dueDate-label" class="property-label"><g:message code="task.dueDate.label" default="Due Date" /></span>
					
						<span class="property-value" aria-labelledby="dueDate-label"><g:formatDate date="${taskInstance?.dueDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${taskInstance?.details}">
				<li class="fieldcontain">
					<span id="details-label" class="property-label"><g:message code="task.details.label" default="Details" /></span>
					
						<span class="property-value" aria-labelledby="details-label"><g:fieldValue bean="${taskInstance}" field="details"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${taskInstance?.dateCompleted}">
				<li class="fieldcontain">
					<span id="dateCompleted-label" class="property-label"><g:message code="task.dateCompleted.label" default="Date Completed" /></span>
					
						<span class="property-value" aria-labelledby="dateCompleted-label"><g:formatDate date="${taskInstance?.dateCompleted}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${taskInstance?.parentTask}">
				<li class="fieldcontain">
					<span id="parentTask-label" class="property-label"><g:message code="task.parentTask.label" default="Parent Task" /></span>
					
						<span class="property-value" aria-labelledby="parentTask-label"><g:link controller="task" action="show" id="${taskInstance?.parentTask?.id}">${taskInstance?.parentTask?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${taskInstance?.categories}">
				<li class="fieldcontain">
					<span id="categories-label" class="property-label"><g:message code="task.categories.label" default="Categories" /></span>
					
						<g:each in="${taskInstance.categories}" var="c">
						<span class="property-value" aria-labelledby="categories-label"><g:link controller="taskCategory" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${taskInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="task.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${taskInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${taskInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="task.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${taskInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${taskInstance?.notes}">
				<li class="fieldcontain">
					<span id="notes-label" class="property-label"><g:message code="task.notes.label" default="Notes" /></span>
					
						<g:each in="${taskInstance.notes}" var="n">
						<span class="property-value" aria-labelledby="notes-label"><g:link controller="taskNote" action="show" id="${n.id}">${n?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${taskInstance?.ownerUID}">
				<li class="fieldcontain">
					<span id="ownerUID-label" class="property-label"><g:message code="task.ownerUID.label" default="Owner UID" /></span>
					
						<span class="property-value" aria-labelledby="ownerUID-label"><g:fieldValue bean="${taskInstance}" field="ownerUID"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${taskInstance?.subTasks}">
				<li class="fieldcontain">
					<span id="subTasks-label" class="property-label"><g:message code="task.subTasks.label" default="Sub Tasks" /></span>
					
						<g:each in="${taskInstance.subTasks}" var="s">
						<span class="property-value" aria-labelledby="subTasks-label"><g:link controller="task" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${taskInstance?.subject}">
				<li class="fieldcontain">
					<span id="subject-label" class="property-label"><g:message code="task.subject.label" default="Subject" /></span>
					
						<span class="property-value" aria-labelledby="subject-label"><g:fieldValue bean="${taskInstance}" field="subject"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:taskInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${taskInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
