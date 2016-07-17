cliff = require 'cliff'
cliff.inspect = (require 'eyes').inspector(
  styles: {
      all:     'red',
      label:   'underline',
      other:   'inverted',
      key:     'bold',
      special: 'grey',
      string:  'green',
      number:  'magenta',
      bool:    'blue',
      regexp:  'green'
  })

module.exports.cliff = cliff

module.exports.tryParseJSON = tryParseJSON = (jsonString) ->
  try
    o = JSON.parse(jsonString)
    if o and typeof o == 'object'
      return o
  catch e
  false
