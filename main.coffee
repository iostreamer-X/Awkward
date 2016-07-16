vorpal = require 'vorpal'
chalk = vorpal().chalk

awkward = vorpal()
       .delimiter process.env.USER+'@awk'
       .localStorage 'awkward@iostreamer'
       .history 'awkward@iostreamer/history'

global.chalk = chalk
global.awkward = awkward

require('./terminal/default.coffee')(awkward)

awkward.exec 'repl'

awkward.show().parse process.argv
