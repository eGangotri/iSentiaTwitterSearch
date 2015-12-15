package isentia

class TwitterSearchWithResults implements Serializable {

    TwitterSearchKey searchKey
    String searchResult

    static mapping = {
        searchKey index: true
    }

    static mapWith = "mongo"

    static constraints = {
    }
}
