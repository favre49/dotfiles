#!/bin/bash

#####################################################
# Script to update and tag my notmuch mail database #
#####################################################

# Notmuch checks for new messages
notmuch new

# See if we have new messages
j=$(notmuch count -- tag:new)

# retag all "new" messages "inbox" and "unread"
notmuch tag +inbox +unread -new -- tag:new

# Tag message according to which email it's from
notmuch tag +bits -- path:bits/** 
notmuch tag +personal -- path:gmail/**

# --------------------- #
# --- Personal tags --- #
# --------------------- #

# tag all messages from "me" as sent and remove tags inbox and unread
notmuch tag -inbox -unread +sent -- from:cupertinorp@gmail.com and tag:personal and not to:cupertinorp@gmail.com

# tag all messages from Github as Github mail
notmuch tag -inbox +github +personal -- from:notifications@github.com and tag:personal

# tag all messages from mlpack mailing list
notmuch tag -inbox +mlpack +personal -- to:mlpack@lists.mlpack.org and tag:personal

# --------------------- #
# ----- BITS tags ----- #
# --------------------- #

# tag all messages from "me" as sent and remove tags inbox and unread
notmuch tag -inbox -unread +sent -- from:f20180193@pilani.bits-pilani.ac.in and tag:bits and not to:f20180193@pilani.bits-pilani.ac.in

# Notify if we have unread messages
i=$(notmuch count -- tag:unread)
echo "$j"
if [ $j -gt 0 ] && [ $i -gt 0 ];
then
    dunstify "You have $i unread mail"
fi
