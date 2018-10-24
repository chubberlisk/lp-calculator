# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "turbolinks:load", ->
  # Player one
  $("button.player-one-lp-minus").click (e) ->
    lpChange = $("p#player-one-lp-change").html()
    lpChange -= $(this).data("lp-minus")
    $("div#player-one-lp-change-section").css("display", "inline-block")
    $("p#player-one-lp-change").html(lpChange)
  
  $("button.player-one-lp-plus").click (e) ->
    lpChange = parseInt($("p#player-one-lp-change").html())
    lpChange += parseInt($(this).data("lp-plus"))
    $("div#player-one-lp-change-section").css("display", "inline-block")
    $("p#player-one-lp-change").html("+"+lpChange)

  $("button#player-one-lp-cancel").click (e) ->
    $("p#player-one-lp-change").html(0)
    $("div#player-one-lp-change-section").css("display", "none")
  
  $("button#player-one-lp-confirm").click (e) ->
    currentLp = parseInt($("p#player-one-lp").html())
    if $("p#player-one-lp-change").html() < 0
      currentLp -= Math.abs($("p#player-one-lp-change").html())
      if currentLp > 0
        $("p#player-one-lp").html(currentLp)
      else
        $("p#player-one-lp").html(0)
    else
      currentLp += parseInt($("p#player-one-lp-change").html())
      $("p#player-one-lp").html(currentLp)
    $("p#player-one-lp-change").html(0)
    $("div#player-one-lp-change-section").css("display", "none")
  
  $("button#lp-reset").click (e) ->
    if confirm "Are you sure you want to reset life points?"
      $("p#player-one-lp").html(8000)
      $("p#player-two-lp").html(8000)

  # Player two
  $("button.player-two-lp-minus").click (e) ->
    lpChange = $("p#player-two-lp-change").html()
    lpChange -= $(this).data("lp-minus")
    $("div#player-two-lp-change-section").css("display", "inline-block")
    $("p#player-two-lp-change").html(lpChange)

  $("button#player-two-lp-cancel").click (e) ->
    $("p#player-two-lp-change").html(0)
    $("div#player-two-lp-change-section").css("display", "none")

  $("button#player-two-lp-confirm").click (e) ->
    currentLp = parseInt($("p#player-two-lp").html())
    if $("p#player-two-lp-change").html() < 0
      currentLp -= Math.abs($("p#player-two-lp-change").html())
      if currentLp > 0
        $("p#player-two-lp").html(currentLp)
      else
        $("p#player-two-lp").html(0)
    else
      currentLp += parseInt($("p#player-two-lp-change").html())
      $("p#player-two-lp").html(currentLp)
    $("p#player-two-lp-change").html(0)
    $("div#player-two-lp-change-section").css("display", "none")

  $("button.player-two-lp-plus").click (e) ->
    lpChange = parseInt($("p#player-two-lp-change").html())
    lpChange += parseInt($(this).data("lp-plus"))
    $("div#player-two-lp-change-section").css("display", "inline-block")
    $("p#player-two-lp-change").html("+"+lpChange)

  $("button#add-player-two").click (e) ->
    $("button#add-player-two").css("display", "none")
    $("button#remove-player-two").css("display", "inline-block")
    $("div#player-two-section").css("display", "inline-block")
    $("p#player-two-lp").html(8000)

  $("button#remove-player-two").click (e) ->
    if confirm "Are you sure you want to remove Player Two?"
      $("button#remove-player-two").css("display", "none")
      $("button#add-player-two").css("display", "inline-block")
      $("div#player-two-section").css("display", "none")
