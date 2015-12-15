package isentia

class TwitterSearchKey implements Serializable{
    String searchTerm

    static mapWith = "mongo"

    static constraints = {
        searchTerm(unique: true)
    }
}
