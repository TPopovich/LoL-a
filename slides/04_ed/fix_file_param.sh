:
ed "${1?'USAGE: fix_file_param.sh filename'}" <<EOF
,p
1
s/regular expression/regex/g
w
q
EOF

