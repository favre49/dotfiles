#!/bin/zsh

i=$(notmuch count -- tag:unread)

echo " $i"
