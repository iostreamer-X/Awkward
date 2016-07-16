default_catch = (args,cb)->
  require('./handler') args.words
  cb()

module.exports = (awkward)->
  awkward.catch('[words...]')
         .action default_catch
