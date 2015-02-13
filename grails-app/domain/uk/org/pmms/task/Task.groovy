package uk.org.pmms.task

import org.joda.time.*

class Task {
	String priority = 'Normal'
	String subject
	String ownerUID
	String assignedToUID
	String status = 'Not Started'
	Date dueDate
	Integer percentComplete = 0
	String details
	Date dateCompleted
	Date lastUpdated
	Date dateCreated
	
	Task parentTask
	
	static hasMany=[subTasks: Task, categories: TaskCategory, notes: TaskNote ]
    static constraints = {
		priority inList: ['Low','Normal','High']
		status inList: ['Not Started', 'In Progress', 'Completed', 'Waiting on someone else', 'Deferred']
		percentComplete min:0, max:100
		assignedToUID nullable: true
		dueDate min: new Date(new LocalDate(new DateTime()).toDateTimeAtStartOfDay().getMillis())
		//details range: 0..255
		dateCompleted nullable:true
		parentTask nullable: true
    }
	
	def beforeUpdate() {
		if (percentComplete > 0 && status == 'Not Started')
		status = 'In Progress'
	 }
}
