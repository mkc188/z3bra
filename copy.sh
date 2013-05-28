#!/bin/sh

TMPFILE=/tmp/dotfiles.list

OK="[$(tput setaf 3)OK$(tput sgr0)]"
NOPE="[$(tput setaf 1)FAIL$(tput sgr0)]"

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

$EDITOR $TMPFILE

echo "simulating..."
for f in $(grep -v '^#' $TMPFILE); do
  echo "$f -> ~/.$f"
done

echo "attempting to link config file to ~ ..."
read -p "Hit <Enter> to continue, <Ctrl-C> to abort..."
for f in $(grep -v '^#' $TMPFILE); do
  ln -s $PWD/$f ~/.$f
  if [ -L ~/.$f ] ; then
    echo "$OK   -> $f"
  else
    echo "$NOPE -> $f"
  fi
done

echo "removing temporary files"
rm $TMPFILE

echo "finished."

