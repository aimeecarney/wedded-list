$(document).ready(function(){
  $('.load_events').on('click', function(e){
    e.preventDefault()
    $.ajax({
      method: "GET",
      url: this.href
    }).done(function(data){
      var url = this.url
      var splitUrl = url.split("/")
      var id = splitUrl[4]
      $("div.events_list-" + id).html(data)
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
