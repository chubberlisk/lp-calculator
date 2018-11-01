# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

showLpBtns = (player) ->
  if $("button#player-"+player+"-show-lp-btns").hasClass("minus")
    $("div#player-"+player+"-lp-plus-btns").css("display", "none")
    $("div#player-"+player+"-lp-minus-btns").css("display", "inline-flex")
    $("button#player-"+player+"-show-lp-btns").removeClass("btn-success")
    $("button#player-"+player+"-show-lp-btns").html("<i class='fas fa-plus'></i>")
  else
    $("div#player-"+player+"-lp-minus-btns").css("display", "none")
    $("div#player-"+player+"-lp-plus-btns").css("display", "inline-flex")
    $("button#player-"+player+"-show-lp-btns").html("<i class='fas fa-minus'></i>")
  $("button#player-"+player+"-show-lp-btns").toggleClass("minus")
  $("div#player-"+player+"-lp-change-section").css("visibility", "hidden")
  $("span#player-"+player+"-lp-change").html(0)

showlpChange = (player, element, operator) ->
  lpChange = parseInt($("span#player-"+player+"-lp-change").html())
  currentLp = parseInt($("p#player-"+player+"-lp").html())
  if operator == "minus"
    btnAmount = Math.abs($(element).data("lp-minus"))
    if btnAmount > currentLp || Math.abs(lpChange) + btnAmount > currentLp
      lpChange = "-" + currentLp
    else
      lpChange -= $(element).data("lp-minus")
  else
    lpChange += parseInt($(element).data("lp-plus"))
    lpChange = "+" + lpChange
  $("div#player-"+player+"-lp-change-section").css("visibility", "visible")
  $("span#player-"+player+"-lp-change").html(lpChange)

cancelLpChange = (player) ->
  $("span#player-"+player+"-lp-change").html(0)
  $("div#player-"+player+"-lp-change-section").css("visibility", "hidden")

resetLp = ->
  $("p#player-one-lp").animateNumbers(8000, false, 500);
  $("p#player-two-lp").animateNumbers(8000, false, 500);
  $("div#player-one-lp-change-section").css("visibility", "hidden")
  $("div#player-two-lp-change-section").css("visibility", "hidden")

confirmLpChange = (player) ->
  currentLp = parseInt($("p#player-"+player+"-lp").html())
  if $("span#player-"+player+"-lp-change").html() < 0
    currentLp -= Math.abs($("span#player-"+player+"-lp-change").html())
    if currentLp > 0
      $("p#player-"+player+"-lp").animateNumbers(currentLp, false, 500);
    else
      $("p#player-"+player+"-lp").html(0);
      if confirm "Player #{player}'s life points have been reduced to 0! Do you want to reset life points?"
        resetLp()

  else
    currentLp += parseInt($("span#player-"+player+"-lp-change").html())
    $("p#player-"+player+"-lp").animateNumbers(currentLp, false, 500);
  $("span#player-"+player+"-lp-change").html(0)
  $("div#player-"+player+"-lp-change-section").css("visibility", "hidden")

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
      resetLp()

  $("button#add-player-two").click (e) ->
    $(this).css("display", "none")
    $("button#remove-player-two").css("display", "inline-block")
    $("div#player-two-section").css("display", "inline-block")
    $("p#player-two-lp").animateNumbers(8000, false, 500);

  $("button#remove-player-two").click (e) ->
    if confirm "Are you sure you want to remove Player Two?"
      $(this).css("display", "none")
      $("button#add-player-two").css("display", "inline-block")
      $("div#player-two-section").css("display", "none")
