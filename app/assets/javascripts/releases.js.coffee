updateStats = () ->
  $.get $(location).attr('href') + '.json', (data) ->
    $("span#stats").text "WEEEEEE Downloaded: #{data['downloaded']} Seeds: #{data['complete']} Leechers: #{data['incomplete']}"
  setTimeout updateStats, 60000

jQuery ->
  setTimeout updateStats, 60000
