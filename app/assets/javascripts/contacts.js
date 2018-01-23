$(document).ready(function() {
    attachListeners()
  })

function attachListeners() {
  $('.events').on('click', function(e){
    debugger
    e.preventDefault()
    loadEvents()
  })
}

function loadEvents() {
  $.ajax({
    method: "GET",
    url: this.href
  }).done(function(data){
    debugger
    let events = $('data').find('.contactEvents')
    $("div.events").html(events)
  })
}
