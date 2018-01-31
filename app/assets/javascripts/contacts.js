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
    data = {
      'authenticity_token': $("input[name='authenticity_token']").val(),
        'comment': {
          'content': $("#comment").val()
          }
        }

    $.ajax({
      type: "POST",
      url: this.action,
      data: data,
      success: function(response){
        debugger
      }
    })
    e.preventDefault()
  })
})
