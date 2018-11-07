showOffline = ->
  $("#snackbar").removeClass("show")
  $("#snackbar").css("background-color", "var(--danger)")
  $("#snackbar").html("You're offline, but it's okay! ;)")
  $("#snackbar").addClass("perm-show")

showOnline = ->
  $("#snackbar").removeClass("perm-show")
  $("#snackbar").css("background-color", "var(--success)")
  $("#snackbar").html("You're back online!")
  $("#snackbar").addClass("show")
  setTimeout (->
    $("#snackbar").removeClass("show")
  ), 3000

$(document).on "turbolinks:load", ->
  if !navigator.onLine
    showOffline()

  window.addEventListener "offline", ((e) ->
    showOffline()
  ), false

  window.addEventListener "online", ((e) ->
    showOnline()
  ), false
