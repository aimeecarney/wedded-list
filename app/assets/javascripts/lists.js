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
})
