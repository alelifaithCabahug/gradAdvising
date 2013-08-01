package gradadvising

import org.springframework.dao.DataIntegrityViolationException

class ProgramController {

	def searchableService
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	//ADDED METHODS
	
	//function for search - not yet done
	def searchProgramPlugin(){
		def query = params.program
		
		if(query){
			def srchResults = searchableService.search(query)
			//gsp file for view not yet available
			render(view: "", model: [programInstanceList: srchResults.results, programInstanceTotal:srchResults.total])	
		}else{
			//gsp file for view not yet available
			render (view: "")
			}
	}
	
	//--end
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [programInstanceList: Program.list(params), programInstanceTotal: Program.count()]
    }

    def create() {
        [programInstance: new Program(params)]
    }

    def save() {
        def programInstance = new Program(params)
        if (!programInstance.save(flush: true)) {
            render(view: "create", model: [programInstance: programInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'program.label', default: 'Program'), programInstance.id])
        redirect(action: "show", id: programInstance.id)
    }

    def show(Long id) {
        def programInstance = Program.get(id)
        if (!programInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'program.label', default: 'Program'), id])
            redirect(action: "list")
            return
        }

        [programInstance: programInstance]
    }

    def edit(Long id) {
        def programInstance = Program.get(id)
        if (!programInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'program.label', default: 'Program'), id])
            redirect(action: "list")
            return
        }

        [programInstance: programInstance]
    }

    def update(Long id, Long version) {
        def programInstance = Program.get(id)
        if (!programInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'program.label', default: 'Program'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (programInstance.version > version) {
                programInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'program.label', default: 'Program')] as Object[],
                          "Another user has updated this Program while you were editing")
                render(view: "edit", model: [programInstance: programInstance])
                return
            }
        }

        programInstance.properties = params

        if (!programInstance.save(flush: true)) {
            render(view: "edit", model: [programInstance: programInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'program.label', default: 'Program'), programInstance.id])
        redirect(action: "show", id: programInstance.id)
    }

    def delete(Long id) {
        def programInstance = Program.get(id)
        if (!programInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'program.label', default: 'Program'), id])
            redirect(action: "list")
            return
        }

        try {
            programInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'program.label', default: 'Program'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'program.label', default: 'Program'), id])
            redirect(action: "show", id: id)
        }
    }
}
