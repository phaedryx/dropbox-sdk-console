I wanted to understand the CLI example from the [Dropbox SDK](https://www.dropbox.com/developers/reference/sdk) better, so I rewrote it to use IRB.

Example:
    ruby console.rb
    > @session
    > @client
    > irb @client
    > ls
    > info
    > mv 'src', 'dest'
    > @dropbox_client
    >