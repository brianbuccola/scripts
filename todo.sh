#!/bin/bash

# send daily email containing todo's
cat $HOME/todo | mutt -s "todo" -- me
