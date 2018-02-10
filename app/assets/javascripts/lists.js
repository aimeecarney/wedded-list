$(function(){
  $('.load_contacts').on('click', function(e){
    $.ajax({
      method: "GET",
      url: this.href
    }).done(function(data){
      $("div.local_contacts_list").html(data)
    })

    e.preventDefault()
  })

    $(".js-next").on("click", function() {
      var nextId = parseInt($(".js-next").attr("data-id")) + 1;
      $.getJSON("/lists/" + nextId + "/list_data", function(data) {
        $(".listName").text(data["name"]);
        $(".listDate").text(data["date"]);
        $(".listCity").text(data["city"]);
        $(".listState").text(data["state"]);
        $(".guestlist").text("");
        $.each(data.contacts, function(index){
            $(".guestlist").append(this.name + "<BR>")
          });
        url = this.url
        cleanUrl = url.substring(0, url.lastIndexOf("/") + 1)
        editUrl = cleanUrl + "edit"
        contactUrl = cleanUrl + "add_contact"
        localUrl = cleanUrl + "local_contact"
        $("#editLink").attr("href", editUrl);
        $("#contactLink").attr("href", contactUrl);
        $(".local_contacts_list").text("");
        $(".load_contacts").attr("href", localUrl);
        // re-set the id to current on the link
        $(".js-next").attr("data-id", data["id"]);
      });
    });

})
