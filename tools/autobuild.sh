#!/bin/sh

SLEEP=30

while true; do
    echo -n "Checking for git updates... "
    UPTODATE=$(git pull)
    if [ "$UPTODATE" != "Already up to date." ]; then
        echo "re-building..."
        make all
        git commit -a -m "autobuild"
        git push
    else
        echo "no updates available - sleeping for $SLEEP seconds."
    fi

    sleep "$SLEEP"
done
