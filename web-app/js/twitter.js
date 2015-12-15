function searchOnTwitter(url){
    var searchTerm = $("#searchTerm").val()

    $.ajax({
        url:url,
        dataType: 'json',
        data: {
            searchTerm: searchTerm

        },
        success: function(data) {
            alert("success: " )
            if(data && data.statuses){
                alert("success: " + data.statuses)
                var cnter = 0
                for(cnter = 0 ; cntr = data.statuses.length; cntr++){
                    console.log( data.statuses[cntr])
                }
            }
            $("#searchResults").innerHTML="Results Out<br>" + JSON.stringify(data)
        },
        error: function(request, status, error) {
            alert("error: " +error)
        },
        complete: function() {
            alert("completed: ")
            return false;
        }
    });

    return false;
}