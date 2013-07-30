package gradadvising

import org.springframework.dao.DataIntegrityViolationException

class GradeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [gradeInstanceList: Grade.list(params), gradeInstanceTotal: Grade.count()]
    }

    def create() {
        [gradeInstance: new Grade(params)]
    }

    def save() {
        def gradeInstance = new Grade(params)
        if (!gradeInstance.save(flush: true)) {
            render(view: "create", model: [gradeInstance: gradeInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'grade.label', default: 'Grade'), gradeInstance.id])
        redirect(action: "show", id: gradeInstance.id)
    }

    def show(Long id) {
        def gradeInstance = Grade.get(id)
        if (!gradeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'grade.label', default: 'Grade'), id])
            redirect(action: "list")
            return
        }

        [gradeInstance: gradeInstance]
    }

    def edit(Long id) {
        def gradeInstance = Grade.get(id)
        if (!gradeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'grade.label', default: 'Grade'), id])
            redirect(action: "list")
            return
        }

        [gradeInstance: gradeInstance]
    }

    def update(Long id, Long version) {
        def gradeInstance = Grade.get(id)
        if (!gradeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'grade.label', default: 'Grade'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (gradeInstance.version > version) {
                gradeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'grade.label', default: 'Grade')] as Object[],
                          "Another user has updated this Grade while you were editing")
                render(view: "edit", model: [gradeInstance: gradeInstance])
                return
            }
        }

        gradeInstance.properties = params

        if (!gradeInstance.save(flush: true)) {
            render(view: "edit", model: [gradeInstance: gradeInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'grade.label', default: 'Grade'), gradeInstance.id])
        redirect(action: "show", id: gradeInstance.id)
    }

    def delete(Long id) {
        def gradeInstance = Grade.get(id)
        if (!gradeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'grade.label', default: 'Grade'), id])
            redirect(action: "list")
            return
        }

        try {
            gradeInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'grade.label', default: 'Grade'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'grade.label', default: 'Grade'), id])
            redirect(action: "show", id: id)
        }
    }
}