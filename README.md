# Awkward
A NodeJS based terminal emulator. Everything is an Object!

#Whuuut?
To me, awk is powerful but really weird. Often times I want to get some information
out of a command which gives a structured output but I get discouraged because
I am really lazy.

Enter, awkward. It's a NodeJS based terminal emulator. It lets you run
javascript functions on system commands.

For example:
`ls().forEach((a)=>{console.log(a[0], a[0].length)})`

#How it works
Once the program notices that the user wants to run js functions, it runs the command
and stores the result in an array. Let's take the example of `ps`:

###Shell output

PID TTY          TIME CMD
<br/>
13750 pts/14   00:00:00 bash
<br/>
25193 pts/14   00:00:03 node
<br/>
25271 pts/14   00:00:00 sh
<br/>
25272 pts/14   00:00:00 ps


###Corresponding array

[ [ 'PID', 'TTY', 'TIME', 'CMD' ],
<br/>
[ '13750', 'pts/14', '00:00:00', 'bash' ],
<br/>
[ '25193', 'pts/14', '00:00:03', 'node' ],
<br/>
[ '25283', 'pts/14', '00:00:00', 'sh' ],
<br/>
[ '25284', 'pts/14', '00:00:00', 'ps' ] ]


And the functions you pass are evaluated
<br/>
and run as `resulting_array.<functions_you_pass>`

#Demo

![](http://i.imgur.com/yGgzNWQ.png)
