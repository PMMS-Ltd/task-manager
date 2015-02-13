package uk.org.pmms.task

class TaskNote {
	
	String noteBody
	String noteUserUID
	Date dateCreated
	
	static belongsTo = [task: Task]
    static constraints = {
		dateCreated display: false
    }
}
