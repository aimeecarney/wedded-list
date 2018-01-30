$(document).ready(function(){
  $('.load_events').on('click', function(e){
    e.preventDefault()
    $.ajax({
      method: "GET",
      url: this.href
    }).done(function(data){
      $("div.events_list").html(data)
    })
  })

  $('.new_comment').on('submit', function(e) {
    $.ajax({
      method: this.method,
      url: this.action,
      data: $(this).serialize()
    })
    e.preventDefault()
  })
})
