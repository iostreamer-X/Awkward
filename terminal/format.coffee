util = (require '../util')
tryParseJSON = util.tryParseJSON
cliff = util.cliff

module.exports = (data)->
  if json = tryParseJSON data
    awkward.log ''
    awkward.log cliff.inspect json
    return
  lines = data.split '\n'
  if lines[1].length < 40
    formatted_op = []
    step = 10
    while lines.length
      formatted_op.push lines.splice 0,step
    formatted_op = (_.zip.apply _,formatted_op).map (a)->
      _.compact a

    awkward.log ''
    awkward.log cliff.stringifyRows formatted_op
  else
    awkward.log ''
    awkward.log data
