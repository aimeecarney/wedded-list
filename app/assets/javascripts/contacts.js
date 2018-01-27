$(document).ready(function(){
  $('.load_events').on('click', function(e){
    e.preventDefault()
    debugger
    $.ajax({
      method: "GET",
      url: this.href
    }).done(function(data){
      $("div.events_list").html(data)
    })

  })
}
)
