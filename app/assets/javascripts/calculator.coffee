# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

showLpBtns = (player) ->
  if $("button#player-"+player+"-show-lp-btns").hasClass("minus")
    $("p#player-"+player+"-lp-plus-btns").css("display", "none")
    $("p#player-"+player+"-lp-minus-btns").css("display", "inline-block")
    $("button#player-"+player+"-show-lp-btns").html("+")
  else
    $("p#player-"+player+"-lp-minus-btns").css("display", "none")
    $("p#player-"+player+"-lp-plus-btns").css("display", "inline-block")
    $("button#player-"+player+"-show-lp-btns").html("-")
  $("button#player-"+player+"-show-lp-btns").toggleClass("minus")

showlpChange = (player, element, operator) ->
  lpChange = parseInt($("p#player-"+player+"-lp-change").html())
  if operator == "minus"
    lpChange -= $(element).data("lp-minus")
  else
    lpChange += parseInt($(element).data("lp-plus"))
    lpChange = "+" + lpChange
  $("div#player-"+player+"-lp-change-section").css("display", "inline-block")
  $("p#player-"+player+"-lp-change").html(lpChange)

cancelLpChange = (player) ->
  $("p#player-"+player+"-lp-change").html(0)
  $("div#player-"+player+"-lp-change-section").css("display", "none")

confirmLpChange = (player) ->
  currentLp = parseInt($("p#player-"+player+"-lp").html())
  if $("p#player-"+player+"-lp-change").html() < 0
    currentLp -= Math.abs($("p#player-"+player+"-lp-change").html())
    if currentLp > 0
      $("p#player-"+player+"-lp").html(currentLp)
    else
      $("p#player-"+player+"-lp").html(0)
  else
    currentLp += parseInt($("p#player-"+player+"-lp-change").html())
    $("p#player-"+player+"-lp").html(currentLp)
  $("p#player-"+player+"-lp-change").html(0)
  $("div#player-"+player+"-lp-change-section").css("display", "none")

$(document).on "turbolinks:load", ->
  $("button#player-one-show-lp-btns").click (e) ->
    showLpBtns("one")

  $("button#player-two-show-lp-btns").click (e) ->
    showLpBtns("two")

  $("button.player-one-lp-minus").click (e) ->
    showlpChange("one", this, "minus")
  
  $("button.player-two-lp-minus").click (e) ->
    showlpChange("two", this, "minus")

  $("button.player-one-lp-plus").click (e) ->
    showlpChange("one", this, "plus")

  $("button.player-two-lp-plus").click (e) ->
    showlpChange("two", this, "plus")

  $("button#player-one-lp-cancel").click (e) ->
    cancelLpChange("one")
  
  $("button#player-two-lp-cancel").click (e) ->
    cancelLpChange("two")

  $("button#player-one-lp-confirm").click (e) ->
    confirmLpChange("one")
  
  $("button#player-two-lp-confirm").click (e) ->
    confirmLpChange("two")

  $("button#lp-reset").click (e) ->
    if confirm "Are you sure you want to reset life points?"
      $("p#player-one-lp").html(8000)
      $("p#player-two-lp").html(8000)

  $("button#add-player-two").click (e) ->
    $(this).css("display", "none")
    $("button#remove-player-two").css("display", "inline-block")
    $("div#player-two-section").css("display", "inline-block")
    $("p#player-two-lp").html(8000)

  $("button#remove-player-two").click (e) ->
    if confirm "Are you sure you want to remove Player Two?"
      $(this).css("display", "none")
      $("button#add-player-two").css("display", "inline-block")
      $("div#player-two-section").css("display", "none")
