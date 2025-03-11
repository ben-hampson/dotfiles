#! /bin/bash

SUBJECT=$1

if [[ -z $2 ]]; then
    MESSAGE=" "
else 
    MESSAGE="$2"
fi

echo "$MESSAGE" | mutt -s "$SUBJECT" $THINGS_INBOX_EMAIL_ADDRESS

