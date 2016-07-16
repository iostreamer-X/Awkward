vorpal = require 'vorpal'
chalk = vorpal().chalk

awkward = vorpal()
       .delimiter process.env.USER+'@awkward:~$'
       .localStorage 'awkward@iostreamer'
       .history 'awkward@iostreamer/history'

require('./terminal/default.coffee')(awkward)

awkward.show().parse process.argv
