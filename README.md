I wanted to understand the CLI example from the [Dropbox SDK](https://www.dropbox.com/developers/reference/sdk) 
better, so I rewrote it to use IRB instead of the DIY REPL.

Example:

    ruby console.rb


    > @session
    > @client
    > irb @client
    > help
    > mkdir 'foo'
    > ls
    > ls 'foo'
    > info
    >