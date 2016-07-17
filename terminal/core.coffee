child_process = require 'child_process'
exec = child_process.exec
displayFormatted = require './format'
execute = require './execute'

run = (command,cbe,cb)->
  cp = exec(command, (e,r,b)->
    if e
      cbe e
    )
  cp.stdout.on('data', (data)->
    cb data
    )

module.exports = (command) ->
  run command, (e)->
    execute command,e
  ,(data)->
    if command.startsWith 'ls'
      displayFormatted data
    else
      awkward.log ''
      awkward.log data
