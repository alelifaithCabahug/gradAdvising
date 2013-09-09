package gradadvising

import org.springframework.dao.DataIntegrityViolationException
class EnrollmentsController {

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

	def academic_transcript_pdf

    enrollment = Enrollment.find(params[:id])

    pdf = Prawn::Document.new(:left_margin => 20, :right_margin => 20, :top_margin => 30, :bottom_margin => 30)

    x_start_position = 5
    default_margin = 22
    default_margin_x = 40
    current_x = x_start_position
    font_width = 5.7

    pdf.image("", :at => [pdf.bounds.right - 65, pdf.cursor],
              :vposition => :top,
              :scale => 0.3
    )
    pdf.bounding_box([0, pdf.cursor], :width => pdf.bounds.right - 85, :height => 50) do
      pdf.font('Arial', :size => 14) do
        pdf.text('Mindanao State University
                Iligan Institute if Technology
                School of Computer Studies', :align => :center)
      end


