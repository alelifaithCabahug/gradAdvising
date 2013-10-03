package gradadvising

import org.springframework.dao.DataIntegrityViolationException

class EnrollmentsController extends AdviserBaseController{

	def beforeInterceptor = [action:this.&auth,except:['list', 'index', 'show']]
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [enrollmentsInstanceList: Enrollments.list(params), enrollmentsInstanceTotal: Enrollments.count()]
    }

    def create() {
        [enrollmentsInstance: new Enrollments(params)]
    }

    def save() {
        def enrollmentsInstance = new Enrollments(params)
        if (!enrollmentsInstance.save(flush: true)) {
            render(view: "create", model: [enrollmentsInstance: enrollmentsInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'enrollments.label', default: 'Enrollments'), enrollmentsInstance.id])
        redirect(controller: "student", action: "list")
    }

    def show(Long id) {
        def enrollmentsInstance = Enrollments.get(id)
        if (!enrollmentsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'enrollments.label', default: 'Enrollments'), id])
            redirect(action: "list")
            return
        }

        [enrollmentsInstance: enrollmentsInstance]
    }

    def edit(Long id) {
        def enrollmentsInstance = Enrollments.get(id)
        if (!enrollmentsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'enrollments.label', default: 'Enrollments'), id])
            redirect(action: "list")
            return
        }

        [enrollmentsInstance: enrollmentsInstance]
    }

    def update(Long id, Long version) {
        def enrollmentsInstance = Enrollments.get(id)
        if (!enrollmentsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'enrollments.label', default: 'Enrollments'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (enrollmentsInstance.version > version) {
                enrollmentsInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'enrollments.label', default: 'Enrollments')] as Object[],
                          "Another user has updated this Enrollments while you were editing")
                render(view: "edit", model: [enrollmentsInstance: enrollmentsInstance])
                return
            }
        }

        enrollmentsInstance.properties = params

        if (!enrollmentsInstance.save(flush: true)) {
            render(view: "edit", model: [enrollmentsInstance: enrollmentsInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'enrollments.label', default: 'Enrollments'), enrollmentsInstance.id])
        redirect(action: "show", id: enrollmentsInstance.id)
    }

    def delete(Long id) {
        def enrollmentsInstance = Enrollments.get(id)
        if (!enrollmentsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'enrollments.label', default: 'Enrollments'), id])
            redirect(action: "list")
            return
        }

        try {
            enrollmentsInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'enrollments.label', default: 'Enrollments'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'enrollments.label', default: 'Enrollments'), id])
            redirect(action: "show", id: id)
        }
    }
}
