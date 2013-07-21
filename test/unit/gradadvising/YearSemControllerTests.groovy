package gradadvising



import org.junit.*
import grails.test.mixin.*

@TestFor(YearSemController)
@Mock(YearSem)
class YearSemControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/yearSem/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.yearSemInstanceList.size() == 0
        assert model.yearSemInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.yearSemInstance != null
    }

    void testSave() {
        controller.save()

        assert model.yearSemInstance != null
        assert view == '/yearSem/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/yearSem/show/1'
        assert controller.flash.message != null
        assert YearSem.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/yearSem/list'

        populateValidParams(params)
        def yearSem = new YearSem(params)

        assert yearSem.save() != null

        params.id = yearSem.id

        def model = controller.show()

        assert model.yearSemInstance == yearSem
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/yearSem/list'

        populateValidParams(params)
        def yearSem = new YearSem(params)

        assert yearSem.save() != null

        params.id = yearSem.id

        def model = controller.edit()

        assert model.yearSemInstance == yearSem
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/yearSem/list'

        response.reset()

        populateValidParams(params)
        def yearSem = new YearSem(params)

        assert yearSem.save() != null

        // test invalid parameters in update
        params.id = yearSem.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/yearSem/edit"
        assert model.yearSemInstance != null

        yearSem.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/yearSem/show/$yearSem.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        yearSem.clearErrors()

        populateValidParams(params)
        params.id = yearSem.id
        params.version = -1
        controller.update()

        assert view == "/yearSem/edit"
        assert model.yearSemInstance != null
        assert model.yearSemInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/yearSem/list'

        response.reset()

        populateValidParams(params)
        def yearSem = new YearSem(params)

        assert yearSem.save() != null
        assert YearSem.count() == 1

        params.id = yearSem.id

        controller.delete()

        assert YearSem.count() == 0
        assert YearSem.get(yearSem.id) == null
        assert response.redirectedUrl == '/yearSem/list'
    }
}
