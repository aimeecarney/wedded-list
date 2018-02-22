$(document).ready(function(){
  $('.load_events').on('click', function(e){
    e.preventDefault()
    $.ajax({
      method: "GET",
      url: this.href
    }).done(function(data){
      const id = this.url.split("/")[4]
      const sortedList = data.lists.sort((list1, list2) => {
        if (list1.name < list2.name) {
          return -1;
        } if (list1.name > list2.name) {
          return 1;
        }
        return 0
      })
      sortedList.forEach(function(element){
          const list = `<li> ${element.name} </li>`
          $("div.events_list-" + id).append(list)
      })
    })
  })

  $('#submitButton').on('click', function(e) {
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
        const comment = new Comment(response)
        const commentRendered = comment.renderComment()
        $("div.comments").append(commentRendered)
        $("#comment_content").val("");
      }
    })
    e.preventDefault()
  })

  function Comment(attributes){
    this.content = attributes;
  }

  Comment.prototype.renderComment = function(comment){
    const today = new Date();
    const dd = today.getDate();
    const mm = today.getMonth()+1; //January is 0!
    const yyyy = today.getFullYear();

    if(dd<10) {
        dd = '0'+dd
    }

    if(mm<10) {
        mm = '0'+mm
    }

    today = mm + '/' + dd + '/' + yyyy;

    const appendedComment = "<p>" + this.content + " created on: " + today + "</p>"
    return appendedComment
    }
})
