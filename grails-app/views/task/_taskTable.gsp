
<table class="table table-striped">
	<thead>
		<tr>

			<g:sortableColumn property="id"
				title="${message(code: 'task.id.label', default: 'Task')}" style="width: 35px;"/>
			<g:sortableColumn property="priority"
				title="${message(code: 'task.priority.label', default: 'Priority')}" />

			<g:sortableColumn property="status"
				title="${message(code: 'task.status.label', default: 'Status')}" />

			<g:sortableColumn property="percentComplete"
				title="${message(code: 'task.percentComplete.label', default: 'Percent Complete')}"
				class="col-xs-2" />

			<g:if test="${params.show == 'all' }">
				<g:sortableColumn property="assignedToUID"
					title="${message(code: 'task.assignedToUID.label', default: 'Assigned To UID')}" />
			</g:if>


			<g:sortableColumn property="dueDate"
				title="${message(code: 'task.dueDate.label', default: 'Due Date')}" />
			<th>Subject</th>
			<th>Details</th>

		</tr>
	</thead>
	<tbody>
		<g:each in="${tasks}" status="i" var="taskInstance">
			<tr>
				<td><g:link action="show" id="${taskInstance.id}">
						${fieldValue(bean: taskInstance, field: "id")}
					</g:link></td>
				<td><g:if test="${taskInstance?.priority == 'Low' }">
						<i class="fa fa-flag text-info"></i>
					</g:if> <g:elseif test="${taskInstance?.priority == 'High' }">
						<i class="fa fa-flag text-danger"></i>
					</g:elseif> <g:else>
						<i class="fa fa-flag text-success"></i>
					</g:else></td>

				<td><span
					class="label label-${taskInstance.status.replace(' ','-').toLowerCase() }">
						${fieldValue(bean: taskInstance, field: "status")}
				</span></td>

				<td>
					<div class="progress">
						<g:if test="${taskInstance?.percentComplete <= 25 }">
							<div class="progress-bar progress-bar-danger" role="progressbar"
								aria-valuemin="0" aria-valuemax="100"
								style="width: ${taskInstance?.percentComplete}%;">
								${taskInstance?.percentComplete}%
							</div>
						</g:if>
						<g:elseif
							test="${taskInstance?.percentComplete >= 51 && taskInstance?.percentComplete <=74 }">
							<div class="progress-bar progress-bar-warning" role="progressbar"
								aria-valuemin="0" aria-valuemax="100"
								style="width: ${taskInstance?.percentComplete}%;">
								${taskInstance?.percentComplete}%
							</div>
						</g:elseif>
						<g:elseif test="${taskInstance?.percentComplete == 100 }">
							<div class="progress-bar progress-bar-success" role="progressbar"
								aria-valuemin="0" aria-valuemax="100"
								style="width: ${taskInstance?.percentComplete}%;">
								${taskInstance?.percentComplete}%
							</div>
						</g:elseif>
						<g:else>
							<div class="progress-bar progress-bar-info" role="progressbar"
								aria-valuemin="0" aria-valuemax="100"
								style="width: ${taskInstance?.percentComplete}%;">
								${taskInstance?.percentComplete}%
							</div>
						</g:else>
					</div>
				</td>

				<g:if test="${params.show == 'all' }">
					<td>
						${fieldValue(bean: taskInstance, field: "assignedToUID")}
					</td>
				</g:if>

				<td><g:formatDate date="${taskInstance.dueDate}" format="dd-MM-yyyy"/></td>
				<td>
					${taskInstance?.subject }
				</td>
				<td>
					${fieldValue(bean: taskInstance, field: "details")}
				</td>
			</tr>
		</g:each>
	</tbody>
</table>