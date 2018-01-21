$(document).ready(function() {
    attachListeners()
  })

function attachListeners() {
  $('#events').on('click', function(e){
    e.preventDefault()
    loadEvents()
  })
}

function loadEvents(id) {
  alert("success")
}
