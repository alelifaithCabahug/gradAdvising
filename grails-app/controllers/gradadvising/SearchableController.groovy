package gradadvising

import org.compass.core.engine.SearchEngineQueryParseException

/*
*	This controller is taken from the searchable plugin
*/

class SearchableController {
    def searchableService

    def index = {
        if (!params.q?.trim()) {
            return [:]
        }
        try {
            return [searchResult: searchableService.search(params.q, params)]
        } catch (SearchEngineQueryParseException ex) {
            return [parseException: true]
        }
    }

}