module.exports = (command)->
  if !command
    awkward.log chalk.green 'Well that\'s awkward!'
    return
  if (command.indexOf 'cd ') > -1 or command is 'cd'
    location = command.split(' ')[1] ? '/home/'+process.env.USER
    try
      process.chdir location
    catch error
      awkward.log chalk.red 'No such directory!'
      return
    awkward.log chalk.green "Changed directory to #{location}"
    return

  (require './core') command
