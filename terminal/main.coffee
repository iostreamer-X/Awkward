handler_action = (args,cb)->
  require('./handler') args
  cb()

module.exports = (awkward)->
  awkward.mode 'repl'
         .delimiter 'ward:~$'
         .description 'Enter the awkward zone.'
         .action handler_action
