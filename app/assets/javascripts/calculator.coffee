# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

pointsChangeAudio = new Audio("/assets/points_change.mp3");
startingLp = 8000

showLpBtns = (player) ->
  if $("button#player-"+player+"-show-lp-btns").hasClass("plus")
    $("div#player-"+player+"-lp-minus-btns").css("display", "none")
    $("div#player-"+player+"-lp-plus-btns").css("display", "inline-flex")
    $("button#player-"+player+"-show-lp-btns").html("<i class='fas fa-cogs'></i>")
    $("button#player-"+player+"-show-lp-btns").removeClass("plus")
    $("button#player-"+player+"-show-lp-btns").addClass("other")
  else if $("button#player-"+player+"-show-lp-btns").hasClass("other")
    $("div#player-"+player+"-lp-plus-btns").css("display", "none")
    $("div#player-"+player+"-lp-other-btns").css("display", "inline-flex")
    $("button#player-"+player+"-show-lp-btns").html("<i class='fas fa-minus'></i>")
    $("button#player-"+player+"-show-lp-btns").removeClass("other")
    $("button#player-"+player+"-show-lp-btns").addClass("minus")
  else
    $("div#player-"+player+"-lp-other-btns").css("display", "none")
    $("div#player-"+player+"-lp-minus-btns").css("display", "inline-flex")
    $("button#player-"+player+"-show-lp-btns").removeClass("btn-success")
    $("button#player-"+player+"-show-lp-btns").html("<i class='fas fa-plus'></i>")
    $("button#player-"+player+"-show-lp-btns").removeClass("minus")
    $("button#player-"+player+"-show-lp-btns").addClass("plus")
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
  else if operator == "plus"
    lpChange += parseInt($(element).data("lp-plus"))
    lpChange = "+" + lpChange
  else if operator == "divide"
    lpChange = "-" + (currentLp / 2)
  else
    lpChange = "+" + currentLp
  $("div#player-"+player+"-lp-change-section").css("visibility", "visible")
  $("span#player-"+player+"-lp-change").html(lpChange)

cancelLpChange = (player) ->
  $("span#player-"+player+"-lp-change").html(0)
  $("div#player-"+player+"-lp-change-section").css("visibility", "hidden")

resetLp = ->
  playPointsChange()
  $("#duel-id").html("")
  $("p#player-one-lp").html(0) if $("p#player-one-lp").html() == startingLp.toString()
  $("p#player-two-lp").html(0) if $("p#player-two-lp").html() == startingLp.toString()
  $("p#player-one-lp").animateNumbers(startingLp, false, 1000);
  $("p#player-two-lp").animateNumbers(startingLp, false, 1000);
  $("div#player-one-lp-change-section").css("visibility", "hidden")
  $("div#player-two-lp-change-section").css("visibility", "hidden")

confirmLpChange = (player) ->
  currentLp = parseInt($("p#player-"+player+"-lp").html())
  if $("span#player-"+player+"-lp-change").html() < 0
    currentLp -= Math.abs($("span#player-"+player+"-lp-change").html())
    if currentLp > 0
      playPointsChange()
      $("p#player-"+player+"-lp").animateNumbers(currentLp, false, 1000);
    else
      # TODO: add AJAX call to update duel in DB
      duelId = parseInt($("#duel-id").html())
      playerOneLp = if player == "one" then currentLp else parseInt($("p#player-one-lp").html())
      playerTwoLp = if player == "two" then currentLp else parseInt($("p#player-two-lp").html())
      $.ajax "/calculator/duel/#{duelId}",
        type: 'POST'
        dataType: 'json'
        data: { "duel": { "player_one_lp": playerOneLp, "player_two_lp": playerTwoLp } }
        error: (jqXHR, textStatus, errorThrown) ->
          alert(errorThrown)
        success: (data, textStatus, jqXHR) ->
          if confirm "This duel has ended! Do you want to reset life points?"
            # TODO: create a new duel
            resetLp()
          else
            playPointsChange()
            $("p#player-"+player+"-lp").animateNumbers(0, false, 1000);
  else
    currentLp += parseInt($("span#player-"+player+"-lp-change").html())
    playPointsChange()
    $("p#player-"+player+"-lp").animateNumbers(currentLp, false, 1000);
  $("span#player-"+player+"-lp-change").html(0)
  $("div#player-"+player+"-lp-change-section").css("visibility", "hidden")

playPointsChange = ->
  $(pointsChangeAudio)[0].playbackRate = 1.5
  $(pointsChangeAudio)[0].currentTime = 1
  $(pointsChangeAudio)[0].play()

$(document).on "turbolinks:load", ->
  $("div#player-one-lp-change-section").css("visibility", "hidden")
  $("div#player-two-lp-change-section").css("visibility", "hidden")
  $("div#player-one-lp-plus-btns").css("display", "none")
  $("div#player-two-lp-plus-btns").css("display", "none")
  $("div#player-one-lp-other-btns").css("display", "none")
  $("div#player-two-lp-other-btns").css("display", "none")
  $("button#remove-player-two").css("display", "none")
  $("div#player-two-section").css("display", "none")

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

  $("button#player-one-lp-divide-two").click (e) ->
    showlpChange("one", this, "divide")

  $("button#player-two-lp-divide-two").click (e) ->
    showlpChange("two", this, "divide")

  $("button#player-one-lp-double").click (e) ->
    showlpChange("one", this, "double")

  $("button#player-two-lp-double").click (e) ->
    showlpChange("two", this, "double")

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

  $("button#add-player-two-guest").click (e) ->
    $("#add-player-two-modal").modal("hide")
    $("button#add-player-two").css("display", "none")
    $("button#remove-player-two").css("display", "inline-block")
    $("div#player-one-section, div#player-two-section").addClass("col-lg-4")
    $("div#duel-btns-section").addClass("col-lg-4")
    $("div#player-two-section").css("display", "flex")
    $("p#player-two-lp").animateNumbers(startingLp, false, 500)

  $("button#remove-player-two").click (e) ->
    if confirm "Are you sure you want to remove Player Two?"
      $(this).css("display", "none")
      $("#duel-id").html("")
      $("h2#player-two").html("PLAYER TWO")
      $("button#add-player-two").css("display", "inline-block")
      $("div#player-two-section").css("display", "none")
      $("div#player-one-section, div#player-two-section").removeClass("col-lg-4")
      $("div#duel-btns-section").removeClass("col-lg-4")

  $("button#lp-rotate").click (e) ->
    if $("div#player-one-section .container, div#player-one-section .container").hasClass("rotated")
      $(this).rotate({angle: 90, animateTo: 0})
      $("button#lp-reset").rotate({angle: 90, animateTo: 0})
      $("button#add-player-two").rotate({angle: 90, animateTo: 0})
      $("button#remove-player-two").rotate({angle: 90, animateTo: 0})
      $("button#lp-starting").rotate({angle: 90, animateTo: 0})
      $("div#player-one-section .container").rotate({angle: 90, animateTo: 0})
      $("div#player-two-section .container").rotate({angle: -90, animateTo: 0})
    else
      $(this).rotate({angle: 0, animateTo: 90})
      $("button#lp-reset").rotate({angle: 0, animateTo: 90})
      $("button#add-player-two").rotate({angle: 0, animateTo: 90})
      $("button#remove-player-two").rotate({angle: 0, animateTo: 90})
      $("button#lp-starting").rotate({angle: 0, animateTo: 90})
      $("div#player-one-section .container").rotate({angle: 0, animateTo: 90})
      $("div#player-two-section .container").rotate({angle: 0, animateTo: -90})
    $("div#player-one-section .container, div#player-one-section .container").toggleClass("rotated")

  $("input[name=lp-starting-radio-options]").change (e) ->
    $("#lp-starting-modal").modal("hide")
    startingLp = parseInt(this.value)
    $("input#starting-lp").val(startingLp)

  $("#add-player-two-modal").on "hidden.bs.modal", (e) ->
    $("#add-player-two-account-form").collapse("hide")