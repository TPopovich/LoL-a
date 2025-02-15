We will use tmux if we are using a training VM that is hosted on AWS.

Sometimes you might not be able to install anything on a machine, and
need to just use a "browser" to `access your shell`.

E.g. you can use a `free AWS micro VM running linux` for the course
and access from the web.  But that will leave you open to lost work
if the browser dies.

Solution is to use tmux.  That can easily setup detached `tmux sessions`.
See our video that shows how to use it.

Synopsis of use.

In AWS shell you do something like this:

```

sudo apt install tmux

tmux new -s my_session -d
```

Then do a `tmux attach` to attach to it.  It should be detached and you can
easily reconnect by doing the `attach`.

If you forget to specify `-d` then in the tmux session window do the
command  `C-b d` (meaning control-b  followed by `d` to detach).

Then tomorrow, when you log back on the web terminal do:

```
tmux ls

# that will show sessions available to attach

tmux attach  # if you have 1 session it will auto select it!
```
