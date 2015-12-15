package isentia

import grails.converters.JSON
import grails.transaction.Transactional

@Transactional
class TwitterSearchService {

    final String TWITTER_SEARCH_URL = "https://api.twitter.com/1.1/search/tweets.json?q="
    def grailsApplication
    def restClientBuilder

    def search(String searchTerm) {
        //Search in Mongo DB
        TwitterSearchKey searchKey = TwitterSearchKey.findBySearchTerm(searchTerm, [])
        println("pingTwitterRestApi:searchKey $searchKey")

        def result
        if (searchKey) {
            TwitterSearchWithResults searchWithResults = TwitterSearchWithResults.findBySearchKey(searchKey)
            if (searchWithResults) {
                result = searchWithResults.searchResult
            } else {
                result = pingTwitter(searchTerm)
            }
        } else {
            searchKey = new TwitterSearchKey(searchTerm: searchTerm)
            searchKey.save( failOnError: true)
            result = pingTwitter(searchTerm)
            TwitterSearchWithResults searchWithResults = new TwitterSearchWithResults(searchKey: searchKey, searchResult: result as String)
            searchWithResults.save(flush:true, failOnError: true)
            println ("done with saving: searchWithResults")
            if(searchWithResults){
                println (searchWithResults.id)
                println (searchWithResults.searchResult)
            }
        }

        return result
    }

    def pingTwitter(String searchItem) {
        String url = TWITTER_SEARCH_URL + searchItem
        println("***pingTwitter:url $url")

        String bearerAccessToken = grailsApplication.config.grails.twitter.tokens.bearer_access_token
        println("***search:bearerAccessToken $bearerAccessToken")
        def resp = restClientBuilder.get(url) {
            delegate.headers.'Authorization' = bearerAccessToken
        }
        def myJson = resp.json;
        println("***pingTwitter:myJson: $myJson")
        return myJson
    }
}
