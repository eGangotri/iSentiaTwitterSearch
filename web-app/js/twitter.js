function searchOnTwitter(url){
    var searchTerm = $("#searchTerm").val()

    $.ajax({
        url:url,
        dataType: 'json',
        data: {
            searchTerm: searchTerm

        },
        success: function(data) {
           console.log("success: ")
            var totalCount = data.statuses ? data.statuses.length : 0;

            if( data.statuses){
                console.log(data.statuses.length)

                if( data.statuses[0] && data.statuses[0].text) {
                    console.log(data.statuses[0].text)
                }
                if(data.statuses.length > 0){
                    var cntr = 0
                    var rows = "<br>"
                    for(cntr = 0; cntr < totalCount; cntr++){

                        if(data.statuses[cntr]){
                            var row = (cntr+1) + "). " + data.statuses[cntr].text + "<br>";
                            rows += row;
                            console.log("row ->"  + row)
                        }
                    }
                }

                if(data.resultAlreadyExists){
                    console.log("data.resultAlreadyExists ->"  + data.resultAlreadyExists);

                }
            }
            $("#searchResults").html("Search Over. <br>" + totalCount + " Rows Returned.<br>" + rows + ".");
        },
        error: function(request, status, error) {
            console.log("error: " +error)
        },
        complete: function() {
            console.log("complete: ");
            return false;
        }
    });

    return false;
}