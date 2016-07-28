# Awkward
[![Build Status](https://travis-ci.org/iostreamer-X/Awkward.png)](https://travis-ci.org/iostreamer-X/Awkward)

A NodeJS based shell. Everything is an Object!

# Install

`npm install -g awkward`

# Whuuut?
To me, awk is powerful but really weird. Often times I want to get some information
out of a command which gives a structured output but I get discouraged because
I am really lazy.

Enter, awkward. It's a NodeJS based shell. It lets you run
javascript functions on system commands.

For example:
`ls().forEach(a => console.log(a[0], a[0].length))`

One can also use flags and piped commands like this:
<br/>
`(ps -ef)().map(a => [a[0], a[7]]).forEach(a => console.log(a))`

### Update:

Underscore added as a dependency and now you can use it in the awkward terminal


# Philosophy

Every structured data given as an output by shell commands or other
binaries can be represented as a JS array and one should be able apply
`Array` methods like `map`, `forEach`, `filter` on the data in a functional style.


# How it works
Once the program notices that the user wants to run js functions, it runs the command
and stores the result in an array. Let's take the example of `ps`:

### Shell output
``` shell
PID TTY          TIME CMD
13750 pts/14   00:00:00 bash
25193 pts/14   00:00:03 node
25271 pts/14   00:00:00 sh
25272 pts/14   00:00:00 ps
```

### Corresponding array
``` js
[ [ 'PID', 'TTY', 'TIME', 'CMD' ],
[ '13750', 'pts/14', '00:00:00', 'bash' ],
[ '25193', 'pts/14', '00:00:03', 'node' ],
[ '25283', 'pts/14', '00:00:00', 'sh' ],
[ '25284', 'pts/14', '00:00:00', 'ps' ] ]
```

And the functions you pass are `eval`uated as:
<br/>
 `resulting_array.<functions_you_pass>`.

Which actually is the only supported syntax, for now. One can only chain
commands and functions like this:
<br/>
`(command).function((elem)=>{})`

So, doing `console.log(ls())` won't work, for now.  

# Demo

<a href="https://asciinema.org/a/df856vl97no487ax0ykb39vzq" target="_blank"><img src="https://asciinema.org/a/df856vl97no487ax0ykb39vzq.png" /></a>
