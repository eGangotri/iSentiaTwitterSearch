class TwitterController {

    def beforeInterceptor = [action: this.&checkLogin, except: ['login', 'logout']]

    void checkLogin() {
        if (!twitterService.loggedIn) {
            redirect action: login
        }
    }

    /**
     * Dependency injection for <code>TwitterService</code>.
     */
    def twitterService

    def index = {}

    def login = {
        if (!request.post) {
            // show the login page
            return
        }

        String username = params.j_username
        String password = params.j_password

        if (twitterService.login(username, password, request, response)) {
            redirect action: index
            return
        }

        flash.message = "Sorry, authentication failed"
        redirect action: login
    }

    def logout = {
        twitterService.logout request, response
    }

    def friends = {
        [friends: twitterService.getFriends()]
    }

    def unfriend = {
        twitterService.breakFriendship params.id
        redirect action: friends
    }

    def addFriend = {
        twitterService.befriend params.id
        redirect action: friends
    }

    def sendMessage = {
        if (!request.post) {
            def user = twitterService.show(params.id)
            return [user: user]
        }

        twitterService.sendMessage params.id, params.message
        redirect action: friends
    }

    def setStatus = {
        twitterService.setStatus params.message
        redirect action: index
    }

    def followers = {
        [followers: twitterService.getFollowers()]
    }
}
