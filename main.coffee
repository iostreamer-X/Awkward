vorpal = require 'vorpal'
chalk = vorpal().chalk
_ = require 'underscore'

awkward = vorpal()
       .delimiter process.env.USER+'@awk'
       .localStorage 'awkward@iostreamer'
       .history 'awkward@iostreamer/history'

global.chalk = chalk
global.awkward = awkward
global._ = _

require('./terminal/default.coffee')(awkward)

awkward.exec 'repl'

awkward.show().parse process.argv
