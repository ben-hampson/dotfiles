#! /bin/bash

sendemail -l ~/log/email.log \
      -f "$PERSONAL_EMAIL_USER" \
      -t "$THINGS_INBOX_EMAIL_ADDRESS" \
      -s "smtp.gmail.com:587" \
      -o tls=yes \
      -xu "$PERSONAL_EMAIL_USER" \
      -xp "$PERSONAL_EMAIL_PASSWORD" \
      -u "$1" \
      -m "$2"
