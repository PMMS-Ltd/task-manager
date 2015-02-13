<%@ page import="uk.org.pmms.task.Task" %>

<div class="form-group ${hasErrors(bean: taskInstance, field: 'priority', 'has-error')} required">
	<label for="priority" class="control-label col-xs-4">
		<g:message code="task.priority.label" default="Priority" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:select class="form-control" name="priority" from="${taskInstance.constraints.priority.inList}" required="" value="${taskInstance?.priority}" valueMessagePrefix="task.priority"/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: taskInstance, field: 'status', 'has-error')} required">
	<label for="status" class="control-label col-xs-4">
		<g:message code="task.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:select class="form-control" name="status" from="${taskInstance.constraints.status.inList}" required="" value="${taskInstance?.status}" valueMessagePrefix="task.status"/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: taskInstance, field: 'percentComplete', 'has-error')} required">
	<label for="percentComplete" class="control-label col-xs-4">
		<g:message code="task.percentComplete.label" default="Percent Complete" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:field class="form-control" name="percentComplete" type="number" min="0" max="100" value="${taskInstance.percentComplete}" required=""/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: taskInstance, field: 'assignedToUID', 'has-error')} ">
	<label for="assignedToUID" class="control-label col-xs-4"><g:message code="task.assignedToUID.label" default="Assigned To UID" /></label>
	<div class="col-xs-8">
		<select class="form-control" name="assignedToUID">
			<g:each in="${users}" var="user">
				<g:if test="${user.uid == taskInstance?.assignedToUID }">
					<option value="${user.uid}" selected="selected">${user.displayName }</option>
				</g:if>
				<g:else>
					<option value="${user.uid}">${user.displayName }</option>
				</g:else>
			</g:each>
		</select>

	</div>
</div>

<div class="form-group ${hasErrors(bean: taskInstance, field: 'dueDate', 'has-error')} required">
	<label for="dueDate" class="control-label col-xs-4">
		<g:message code="task.dueDate.label" default="Due Date" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:datePicker name="dueDate" precision="day"  value="${taskInstance?.dueDate}"  />

	</div>
</div>

<div class="form-group ${hasErrors(bean: taskInstance, field: 'details', 'has-error')} required">
	<label for="details" class="control-label col-xs-4">
		<g:message code="task.details.label" default="Details" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:textField class="form-control" name="details" required="" value="${taskInstance?.details}"/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: taskInstance, field: 'dateCompleted', 'has-error')} ">
	<label for="dateCompleted" class="control-label col-xs-4">
		<g:message code="task.dateCompleted.label" default="Date Completed" />
		
	</label>
	<div class="col-xs-8">
		<g:datePicker name="dateCompleted" precision="day"  value="${taskInstance?.dateCompleted}" default="none" noSelection="['': '']" />

	</div>
</div>

<div class="form-group ${hasErrors(bean: taskInstance, field: 'parentTask', 'has-error')} ">
	<label for="parentTask" class="control-label col-xs-4">
		<g:message code="task.parentTask.label" default="Parent Task" />
		
	</label>
	<div class="col-xs-8">
		<g:select id="parentTask" name="parentTask.id" from="${uk.org.pmms.task.Task.list()}" optionKey="id" value="${taskInstance?.parentTask?.id}" class="many-to-one form-control" noSelection="['null': '']"/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: taskInstance, field: 'categories', 'has-error')} ">
	<label for="categories" class="control-label col-xs-4">
		<g:message code="task.categories.label" default="Categories" />
		
	</label>
	<div class="col-xs-8">
		<g:select name="categories" from="${uk.org.pmms.task.TaskCategory.list()}" multiple="multiple" optionKey="id" size="5" value="${taskInstance?.categories*.id}" class="many-to-many form-control"/>

	</div>
</div>

<div class="form-group ${hasErrors(bean: taskInstance, field: 'notes', 'has-error')} ">
	<label for="notes" class="control-label col-xs-4">
		<g:message code="task.notes.label" default="Notes" />
		
	</label>
	<div class="col-xs-8">
		
<ul class="one-to-many">
<g:each in="${taskInstance?.notes?}" var="n">
    <li><g:link controller="taskNote" action="show" id="${n.id}">${n?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="taskNote" action="create" params="['task.id': taskInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'taskNote.label', default: 'TaskNote')])}</g:link>
</li>
</ul>


	</div>
</div>

<div class="form-group ${hasErrors(bean: taskInstance, field: 'ownerUID', 'has-error')} required">
	<label for="ownerUID" class="control-label col-xs-4">
		<g:message code="task.ownerUID.label" default="Owner UID" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<select class="form-control" name="ownerUID">
			<g:each in="${users }" var="user">
				<g:if test="${user.uid == taskInstance?.ownerUID }">
					<option value="${user.uid }" selected="selected">${user.displayName }</option>
				</g:if>
				<g:else>
					<option value="${user.uid }">${user.displayName }</option>
				</g:else>
			</g:each>
		</select>
	</div>
</div>

<div class="form-group ${hasErrors(bean: taskInstance, field: 'subTasks', 'has-error')} ">
	<label for="subTasks" class="control-label col-xs-4">
		<g:message code="task.subTasks.label" default="Sub Tasks" />
		
	</label>
	<div class="col-xs-8">
		
<ul class="one-to-many">
<g:each in="${taskInstance?.subTasks?}" var="s">
    <li><g:link controller="task" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="task" action="create" params="['task.id': taskInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'task.label', default: 'Task')])}</g:link>
</li>
</ul>


	</div>
</div>

<div class="form-group ${hasErrors(bean: taskInstance, field: 'subject', 'has-error')} required">
	<label for="subject" class="control-label col-xs-4">
		<g:message code="task.subject.label" default="Subject" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-xs-8">
		<g:textField class="form-control" name="subject" required="" value="${taskInstance?.subject}"/>

	</div>
</div>

