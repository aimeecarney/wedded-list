$(document).ready(function(){
  $('.load_events').on('click', function(e){
    e.preventDefault()
    $.ajax({
      method: "GET",
      url: this.href
    }).done(function(data){
      $("div.events_list").html(data)
      debugger
    })
  })

  $('.new_comment').on('click', function(e) {
    data = {
      'authenticity_token': $("input[name='authenticity_token']").val(),
        'comment': {
          'content': $("#comment_content").val()
          }
        }

    $.ajax({
      type: "POST",
      url: this.action,
      data: data,
      success: function(response){
        var $ol = $("div.comments")
        $ol.append(response);
        $("#comment_content").val("");
      }
    })
    e.preventDefault()
  })
})
