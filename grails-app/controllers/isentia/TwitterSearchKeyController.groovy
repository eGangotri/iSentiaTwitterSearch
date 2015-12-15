package isentia

import grails.converters.JSON

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TwitterSearchKeyController {

    def twitterSearchService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TwitterSearchKey.list(params), model:[twitterSearchKeyInstanceCount: TwitterSearchKey.count()]
    }


    def pingTwitterRestApi() {
        String searchTerm = params.searchTerm
        println ("pingTwitterRestApi:searchTerm  $searchTerm")
        def res = twitterSearchService.search(searchTerm)
        println ("The Resultant JSON" + res.toString(true));
        render res
    }

    def show(TwitterSearchKey twitterSearchKeyInstance) {
        respond twitterSearchKeyInstance
    }

    def create() {
        respond new TwitterSearchKey(params)
    }

    @Transactional
    def save(TwitterSearchKey twitterSearchKeyInstance) {
        if (twitterSearchKeyInstance == null) {
            notFound()
            return
        }

        if (twitterSearchKeyInstance.hasErrors()) {
            respond twitterSearchKeyInstance.errors, view: 'create'
            return
        }

        twitterSearchKeyInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'twitterSearchKey.label', default: 'TwitterSearchKey'), twitterSearchKeyInstance.id])
                redirect twitterSearchKeyInstance
            }
            '*' { respond twitterSearchKeyInstance, [status: CREATED] }
        }
    }

    def edit(TwitterSearchKey twitterSearchKeyInstance) {
        respond twitterSearchKeyInstance
    }

    @Transactional
    def update(TwitterSearchKey twitterSearchKeyInstance) {
        if (twitterSearchKeyInstance == null) {
            notFound()
            return
        }

        if (twitterSearchKeyInstance.hasErrors()) {
            respond twitterSearchKeyInstance.errors, view: 'edit'
            return
        }

        twitterSearchKeyInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TwitterSearchKey.label', default: 'TwitterSearchKey'), twitterSearchKeyInstance.id])
                redirect twitterSearchKeyInstance
            }
            '*' { respond twitterSearchKeyInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(TwitterSearchKey twitterSearchKeyInstance) {

        if (twitterSearchKeyInstance == null) {
            notFound()
            return
        }

        twitterSearchKeyInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TwitterSearchKey.label', default: 'TwitterSearchKey'), twitterSearchKeyInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'twitterSearchKey.label', default: 'TwitterSearchKey'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
