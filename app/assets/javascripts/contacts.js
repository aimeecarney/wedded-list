$(document).ready(function() {
    attachListeners()
  })

function attachListeners() {
  $('.events').on('click', function(e){
    e.preventDefault()
    loadEvents()
  })
}

function loadEvents() {
  $.ajax({
    method: "GET",
    url: "contacts/3"
  }).done(function(data){
    debugger
    let events = $('data').find('.contactEvents')
    $("div.events").html(events)
  })
}
