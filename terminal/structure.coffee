util = (require '../util')
tryParseJSON = util.tryParseJSON

module.exports = (data) ->
  array = []
  if json = tryParseJSON data
    array.push json
    return array
  lines = data.split '\n'
  lines = lines.filter (line)->
    line.length > 0
  lines.forEach (line)->
    cleaned_data = (value for value in line.split(' ') when value isnt '')
    if json = tryParseJSON data
      array.push json
    else
      array.push cleaned_data  
  return array
