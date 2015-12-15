package isentia


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TwitterSearchWithResultsController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TwitterSearchWithResults.list(params), model: [twitterSearchWithResultsInstanceCount: TwitterSearchWithResults.count()]
    }

    def show(TwitterSearchWithResults twitterSearchWithResultsInstance) {
        respond twitterSearchWithResultsInstance
    }

    def create() {
        respond new TwitterSearchWithResults(params)
    }

    @Transactional
    def save(TwitterSearchWithResults twitterSearchWithResultsInstance) {
        if (twitterSearchWithResultsInstance == null) {
            notFound()
            return
        }

        if (twitterSearchWithResultsInstance.hasErrors()) {
            respond twitterSearchWithResultsInstance.errors, view: 'create'
            return
        }

        twitterSearchWithResultsInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'twitterSearchWithResults.label', default: 'TwitterSearchWithResults'), twitterSearchWithResultsInstance.id])
                redirect twitterSearchWithResultsInstance
            }
            '*' { respond twitterSearchWithResultsInstance, [status: CREATED] }
        }
    }

    def edit(TwitterSearchWithResults twitterSearchWithResultsInstance) {
        respond twitterSearchWithResultsInstance
    }

    @Transactional
    def update(TwitterSearchWithResults twitterSearchWithResultsInstance) {
        if (twitterSearchWithResultsInstance == null) {
            notFound()
            return
        }

        if (twitterSearchWithResultsInstance.hasErrors()) {
            respond twitterSearchWithResultsInstance.errors, view: 'edit'
            return
        }

        twitterSearchWithResultsInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TwitterSearchWithResults.label', default: 'TwitterSearchWithResults'), twitterSearchWithResultsInstance.id])
                redirect twitterSearchWithResultsInstance
            }
            '*' { respond twitterSearchWithResultsInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(TwitterSearchWithResults twitterSearchWithResultsInstance) {

        if (twitterSearchWithResultsInstance == null) {
            notFound()
            return
        }

        twitterSearchWithResultsInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TwitterSearchWithResults.label', default: 'TwitterSearchWithResults'), twitterSearchWithResultsInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'twitterSearchWithResults.label', default: 'TwitterSearchWithResults'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
