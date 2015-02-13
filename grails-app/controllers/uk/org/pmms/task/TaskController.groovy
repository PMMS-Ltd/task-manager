package uk.org.pmms.task

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import joda.time.*
import grails.converters.JSON
import java.text.DateFormat
import java.text.SimpleDateFormat

@Transactional(readOnly = true)
class TaskController {
	def springSecurityService
	def TaskService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	def directoryService
	DateFormat df = new SimpleDateFormat("yyyy-MM-dd")
	
	
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
		def c = Task.createCriteria()
		def results = c.list(params) {
			if(params.show !='all'){
				eq('assignedToUID', springSecurityService.principal.username)
			}
		}
        respond results, model:[taskInstanceCount: Task.count()]
    }
	
	def mySchedule() {
		def today = TaskService.getTodaysTasks(springSecurityService.principal.username)
		//def thisWeek = Task.findAllByAssignedToUIDAndDueDateBetween(springSecurityService.principal.username, new Date(), new Date().plus(7))
		def thisWeek = TaskService.getThisWeeksTasks(springSecurityService.principal.username)
		def nextWeek = TaskService.getNextWeeksTasks(springSecurityService.principal.username)
		
		render (view:'schedule', model:[today: today, thisWeek: thisWeek, nextWeek: nextWeek])
		//render nextWeek as JSON
	}

    def show(Task taskInstance) {
        respond taskInstance
    }
	
	def create() {
		def people = directoryService.findPeopleWhere(objectClass:'inetOrgPerson')
		render (view:'create', model:[taskInstance: new Task(params),users: people])
	}

    @Transactional
    def save(Task taskInstance) {
	
        if (taskInstance == null) {
            notFound()
            return
        }

        if (taskInstance.hasErrors()) {
			
            respond taskInstance.errors, view:'create'
            return
        }
		taskInstance.percentComplete = Integer.parseInt(params.percentComplete)
        taskInstance.save flush:true 

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'task.label', default: 'Task'), taskInstance.id])
                redirect taskInstance
            }
            '*' { respond taskInstance, [status: CREATED] }
        }
    }

    def edit(Task taskInstance) {
		def people = directoryService.findPeopleWhere(objectClass:'inetOrgPerson')
        render (view:'edit', model:[taskInstance: taskInstance, users: people])
    }

    @Transactional
    def update(Task taskInstance) {
        if (taskInstance == null) {
            notFound()
            return
        }

        if (taskInstance.hasErrors()) {
            respond taskInstance.errors, view:'edit'
            return
        }

        taskInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Task.label', default: 'Task'), taskInstance.id])
                redirect taskInstance
            }
            '*'{ respond taskInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Task taskInstance) {

        if (taskInstance == null) {
            notFound()
            return
        }

        taskInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Task.label', default: 'Task'), taskInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'task.label', default: 'Task'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
