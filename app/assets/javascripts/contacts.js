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
    url: this.href
  }).done(function(data){
    console.log(data)
  })
}
