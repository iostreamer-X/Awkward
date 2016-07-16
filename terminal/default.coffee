default_catch = (args,cb)->
  this.log args
  cb()

module.exports = (awkward)->
  awkward.catch('[words...]')
         .action default_catch
