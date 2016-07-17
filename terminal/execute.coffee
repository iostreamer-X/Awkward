parser = (string, result)->
  if (string.indexOf '$') == -1
    return result
  else
    found = string.substring(string.lastIndexOf("$")+1,string.lastIndexOf("()"));
    if (found.search(/[^A-Za-z\s]/)) != -1
      throw new Error 'Invalid JS'
    string = string.replace "$"+found+"()", "_"
    result.push found
    toJs string, result

module.exports = (command, e) ->
  context = {}
  functions = parser command,[]
  awkward.log functions
