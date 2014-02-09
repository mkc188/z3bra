#!/bin/sh

TMPFILE=/tmp/dotfiles.list

R=`tput setaf 1`
G=`tput setaf 2`
B=`tput setaf 6`
N=`tput sgr0`
b=`tput bold`

OK="[${G} OK ${N}]"
NOPE="[${R}FAIL${N}]"

cat <<EOF > $TMPFILE
##
## Here is an auto-generated file for linking
## config file to your $home directory
##
## The $0 script will read filenames from that
## file in order to create ONLY the links you
## want.
##
## The following list lists every. single. file
## or directory. Just remove the line that you
## don't want to be linked.
## Then, save that file, and watch the magic happen...
##
EOF

echo "listing the whole directory"
ls $PWD >> $TMPFILE

test -z "$EDITOR" && vi $TMPFILE || $EDITOR $TMPFILE

echo "simulating..."
for f in `grep -v '^#' $TMPFILE`; do
  echo "~/.$f -> ${B}${PWD}/$f${N}"
done

echo "attempting to link config file"
echo
read -p "Hit <Enter> to continue, <Ctrl-C> to abort..."
for f in `grep -v '^#' $TMPFILE`; do
  ln -s $PWD/$f ~/.$f 2>/dev/null
  echo -n "${f} ... "
  test -L ~/.$f && echo $OK || echo $NOPE
done

echo "removing temporary files"
rm $TMPFILE

echo "finished."

