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
        var comment = new Comment(response)
        var commentRendered = comment.renderComment()
        $("div.comments").append(commentRendered)
        $("#comment_content").val("");
      }
    })
    e.preventDefault()
  })

  function Comment(attributes){
    this.comments = attributes;
  }

  Comment.prototype.renderComment = function(comment){
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth()+1; //January is 0!
    var yyyy = today.getFullYear();

    if(dd<10) {
        dd = '0'+dd
    }

    if(mm<10) {
        mm = '0'+mm
    }

    today = mm + '/' + dd + '/' + yyyy;

    return "<p>" + comment + " created on: " + today + "</p>"
    }
})
