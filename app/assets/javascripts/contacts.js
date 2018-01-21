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
  contactId = id
  let contact = $.get(`/contacts/${id}`, function () {
    $('')
  })
