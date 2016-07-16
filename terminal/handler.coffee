child_process = require 'child_process'

exec = child_process.exec
module.exports = (command)->
  if !command
    awkward.log chalk.green 'Well that\'s awkward!'
    return
  if (command.indexOf 'cd ') > -1 or command is 'cd'
    location = ((loc)->
      loc = loc.split(' ')[1]
      if loc
        loc
      else
        '/home/'+process.env.USER
      )(command)
    process.chdir location
    awkward.log chalk.green "Changed directory to #{location}"
    return
  cp = exec(command, (e,r,b)->
    if e
      awkward.log chalk.red e
      return
    )
  cp.stdout.on('data', (data)->
    awkward.log ''
    awkward.log data
    )
