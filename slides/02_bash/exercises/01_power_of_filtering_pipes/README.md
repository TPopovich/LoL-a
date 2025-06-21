## Power of doing simple filters

```
johny@asus501:/mnt/c/Users/johny$ md5sum .git*
037980509125820a6fa7597d21bbec99  .gitconfig
f6143232eb822954a3028fa27eea573c  .gitconfig-lunchonlinux
1ca1981b91c2eb71bf33ea20e027d8c7  .gitconfig-prj
037980509125820a6fa7597d21bbec99  .gitconfig-prj-used-2026-06-20
1ca1981b91c2eb71bf33ea20e027d8c7  .gitconfig-older
44970dff872ba9b7bf50248d570c5f45  .gitconfig.swp
2de0549bd6e400177b38524c5d1bce03  .gitconfig~
```

Now lets get to work sort/filtering

```
johny@asus501:/mnt/c/Users/johny$ md5sum .git* | sort
037980509125820a6fa7597d21bbec99  .gitconfig
037980509125820a6fa7597d21bbec99  .gitconfig-prj-used-2026-06-20
1ca1981b91c2eb71bf33ea20e027d8c7  .gitconfig-prj
1ca1981b91c2eb71bf33ea20e027d8c7  .gitconfig-older
2de0549bd6e400177b38524c5d1bce03  .gitconfig~
44970dff872ba9b7bf50248d570c5f45  .gitconfig.swp
f6143232eb822954a3028fa27eea573c  .gitconfig-lunchonlinux
```

That makes finding sets of files to diff easier.

Later on when we now `AWK` we will use it to find scripts to diff
the various bundles against each other, 
e.g. we would like to make `buckets` of matching files and then
do `vim -d file1 file2` where we choose any file from `bucket1` as
`file1`  ... and any from `bucket2` so we can work out differences
in a fast way.



