# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "turbolinks:load", ->
  $("button.player-one-lp-minus").click (e) ->
    currentLp = $("p#player-one-lp").html()
    currentLp -= $(this).data("lp-minus")
    if currentLp > 0
      $("p#player-one-lp").html(currentLp)
    else
      $("p#player-one-lp").html(0)

  $("button#lp-reset").click (e) ->
    if confirm "Are you sure you want to reset life points?"
      $("p#player-one-lp").html(8000)
      $("p#player-two-lp").html(8000)

  $("button.player-one-lp-plus").click (e) ->
    currentLp = parseInt($("p#player-one-lp").html())
    currentLp += parseInt($(this).data("lp-plus"))
    $("p#player-one-lp").html(currentLp)

  $("button.player-two-lp-minus").click (e) ->
    currentLp = $("p#player-two-lp").html()
    currentLp -= $(this).data("lp-minus")
    if currentLp > 0
      $("p#player-two-lp").html(currentLp)
    else
      $("p#player-two-lp").html(0)

  $("button.player-two-lp-plus").click (e) ->
    currentLp = parseInt($("p#player-two-lp").html())
    currentLp += parseInt($(this).data("lp-plus"))
    $("p#player-two-lp").html(currentLp)

  $("button#add-player-two").click (e) ->
    $("div#player-two-section").css('display', 'block')
