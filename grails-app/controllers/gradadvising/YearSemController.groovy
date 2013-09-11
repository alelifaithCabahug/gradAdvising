package gradadvising

import org.springframework.dao.DataIntegrityViolationException

class YearSemController extends AdviserBaseController{

	def beforeInterceptor = [action:this.&auth,except:['login']]

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [yearSemInstanceList: YearSem.list(params), yearSemInstanceTotal: YearSem.count()]
    }

    def create() {
        [yearSemInstance: new YearSem(params)]
    }

    def save() {
        def yearSemInstance = new YearSem(params)
        if (!yearSemInstance.save(flush: true)) {
            render(view: "create", model: [yearSemInstance: yearSemInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'yearSem.label', default: 'YearSem'), yearSemInstance.id])
        redirect(action: "show", id: yearSemInstance.id)
    }

    def show(Long id) {
        def yearSemInstance = YearSem.get(id)
        if (!yearSemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'yearSem.label', default: 'YearSem'), id])
            redirect(action: "list")
            return
        }

        [yearSemInstance: yearSemInstance]
    }

    def edit(Long id) {
        def yearSemInstance = YearSem.get(id)
        if (!yearSemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'yearSem.label', default: 'YearSem'), id])
            redirect(action: "list")
            return
        }

        [yearSemInstance: yearSemInstance]
    }

    def update(Long id, Long version) {
        def yearSemInstance = YearSem.get(id)
        if (!yearSemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'yearSem.label', default: 'YearSem'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (yearSemInstance.version > version) {
                yearSemInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'yearSem.label', default: 'YearSem')] as Object[],
                          "Another user has updated this YearSem while you were editing")
                render(view: "edit", model: [yearSemInstance: yearSemInstance])
                return
            }
        }

        yearSemInstance.properties = params

        if (!yearSemInstance.save(flush: true)) {
            render(view: "edit", model: [yearSemInstance: yearSemInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'yearSem.label', default: 'YearSem'), yearSemInstance.id])
        redirect(action: "show", id: yearSemInstance.id)
    }

    def delete(Long id) {
        def yearSemInstance = YearSem.get(id)
        if (!yearSemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'yearSem.label', default: 'YearSem'), id])
            redirect(action: "list")
            return
        }

        try {
            yearSemInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'yearSem.label', default: 'YearSem'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'yearSem.label', default: 'YearSem'), id])
            redirect(action: "show", id: id)
        }
    }
}
