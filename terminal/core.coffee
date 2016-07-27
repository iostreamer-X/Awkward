child_process = require 'child_process'
exec = child_process.exec
getStructured = require './structure'
displayFormatted = require './format'

formatted_commands = ['ls','cat']
run = (command,cb)->
  cp = exec(command, maxBuffer:200*200*1024, (e,r,b)->
    if e
      awkward.log chalk.red e
      return
    )
  cp.stdout.on('data', (data)->
    data = data.toString()
    cb data
    )

mode_shell = (command)->
  run command, (data)->
    if _.find(formatted_commands, (for_command)->command.startsWith for_command)
      displayFormatted data
    else
      awkward.log ''
      awkward.log data

mode_js = (command, fn) ->
  run command, (data)->
    structured_op = getStructured data
    fn = fn.replace 'console.log', 'awkward.log.bind(awkward)'
    try
      eval 'structured_op.'+fn
    catch error
      awkward.log chalk.red error


module.exports = (command) ->
  if command.indexOf('().') > -1
    mode_js command.split('().')[0], command.split('().')[1]
  else
    mode_shell command
