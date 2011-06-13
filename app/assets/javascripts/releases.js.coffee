updateStats = () ->
  $.get $(location).attr('href') + '.json', (data) ->
    $("span#stats").text "Downloaded: #{data['downloaded']} Seeds: #{data['complete']} Leechers: #{data['incomplete']}"
  setTimeout updateStats, 60000

jQuery ->
  setTimeout updateStats, 60000 if $("span#stats").length > 0
