We will also have a course on practical powershell and this ties
into our lectures on `pipelines` as we will be using pipes and
our usual unix editors in windows as well.

E.g. one example is:

```
 cmd /c "dir /OD" | select -last 10
```

This in powershell runs the powerful `dos command dir` that makes
find operations easy to do on windows.  It looks at a sorted list
of directory content and we look at the last 10 elements.

This is a direct match for our standard recommended `lth` alias
that does this in unix/linux:

```
alias lth-="ls -rlt| tail "

so doing lth  or the actual pipeline that it represents does the same thing
```

See that entry in this file in `LoL`:
`aliases\bashrc\dot_bashrc.txt`
