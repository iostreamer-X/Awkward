vorpal = require 'vorpal'
chalk = vorpal().chalk
_ = require 'underscore'
os = require 'os'

user = process.env.USER
user = process.env.USERNAME if os.platform() is "win32"

awkward = vorpal()
       .delimiter user + '@awk'
       .localStorage 'awkward@iostreamer'
       .history 'awkward@iostreamer/history'

global.chalk = chalk
global.awkward = awkward
global._ = _

require('./terminal/main')(awkward)

awkward.exec 'repl'

awkward.show().parse process.argv
