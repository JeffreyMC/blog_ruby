$(document).on "ajax:success", "form#comments-form", (ev, data) ->
    console.log data
    $(this).find("textarea").val("")
    $("#comments-box").append("<li>#{data.body} - #{}</li>")