## howto create an ISO file from unix for windows

Linux has some tools to create an .ISO file.

Here is a case study, and notes off the web.

### Need an ISO file created with contents of a folder

Install tool to create iso

#### prereq

```
sudo apt update
sudo apt install genisoimage
```

#### stage contents

```
mkdir -p ~/iso_build/my_files
copy any files and folders there
```

#### create folder with content

```
genisoimage -o ~/my_cdrom.iso -V "MY_CDROM" -R -J ~/iso_build/my_files

Notes on Options:
-o: output ISO path
-V: volume label
-R: Rock Ridge extensions (long filenames/unix support)
-J: Joliet extensions (Windows support)
```

