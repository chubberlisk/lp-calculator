# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("button[data-lp-minus]").click (e) ->
    currentLp = $("p#player-one-lp").html()
    currentLp -= $(this).data("lp-minus")
    if currentLp > 0
      $("p#player-one-lp").html(currentLp)
    else
      $("p#player-one-lp").html(0)

  $("button#lp-reset").click (e) ->
    if confirm "Are you sure you want to reset life points?"
      $("p#player-one-lp").html(8000)

  $("button[data-lp-plus]").click (e) ->
    currentLp = parseInt($("p#player-one-lp").html())
    currentLp += parseInt($(this).data("lp-plus"))
    $("p#player-one-lp").html(currentLp)
