package gradadvising

import org.springframework.dao.DataIntegrityViolationException
class EnrollmentsController extends AdviserBaseController {
	
	def beforeInterceptor = [action:this.&auth,except:['login']]

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
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
        redirect(action: "show", id: enrollmentsInstance.id)
    }

    def show() {
        def enrollmentsInstance = Enrollments.get(params.id)
        if (!enrollmentsInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'enrollments.label', default: 'Enrollments'), params.id])
            redirect(action: "list")
            return
        }

        [enrollments: enrollmentsInstance]
    }

    def edit() {
        def enrollmentsInstance = Enrollments.get(params.id)
        if (!enrollmentsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'enrollments.label', default: 'Enrollments'), params.id])
            redirect(action: "list")
            return
        }

        [enrollmentsInstance: enrollmentsInstance]
    }

    def update() {
        def enrollmentsInstance = Enrollments.get(params.id)
        if (!enrollmentsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'enrollments.label', default: 'Enrollments'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
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

    def delete() {
        def enrollmentsInstance = Enrollments.get(params.id)
        if (!enrollmentsInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'enrollments.label', default: 'Enrollments'), params.id])
            redirect(action: "list")
            return
        }

        try {
            enrollmentsInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'enrollments.label', default: 'Enrollments'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'enrollments.label', default: 'Enrollments'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}


