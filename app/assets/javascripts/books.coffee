# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'ready page:load', ->
  $('#book_isbn').keydown ->
    presskey = String.fromCharCode(event.keyCode);
    event.returnValue = test

  $('#info_search_button').click ->
    isbncode = $('#book_isbn').val()
    $.ajax
      async:    true
      url:      "/books/new/get_info/"
      type:     "GET"
      data:     {isbn: isbncode}
      dataType: "json"
      context:  this
      error: (jqXHR, textStatus, errorThrown) ->
        $("#msg").css("color","#ff0000").html(errorThrown)
      success:  (data, textStatus, jqXHR) ->
        if data?
          $("#book_title").val(data.Title)
          $("#book_image").val(data.MediumImage)
        else
          $("#msg").css("color","#ff0000").html("書籍情報が見つかりませんでした。")
  $("#book_isbn").change -> $("#msg").html("")