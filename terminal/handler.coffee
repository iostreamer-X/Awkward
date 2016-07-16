child_process = require 'child_process'
exec = child_process.exec
module.exports = (words)->
  if !words
    awkward.log chalk.green 'Well that\'s awkward!'
    return
  command = words.join ' '
  cp = exec(command, (e,r,b)->
    if e
      awkward.log chalk.red e
      return
    )
  cp.stdout.on('data', (data)->
    awkward.log data
    )
