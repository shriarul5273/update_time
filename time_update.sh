#!/bin/bash

UTC_TIME=$(date -u "+%A, %Y-%m-%d %H:%M:%S UTC")
LOCAL_TIME=$(date "+%A, %Y-%m-%d %H:%M:%S %Z")

if grep -q "^The day and time is:" README.md; then
    sed -i "s/^The day and time is:.*$/The day and time is: \"${UTC_TIME}\"/" README.md
else
    echo "The day and time is: \"${UTC_TIME}\"" >> README.md
fi

if grep -q "^The local day and time is:" README.md; then
    sed -i "s/^The local day and time is:.*$/The local day and time is: \"${LOCAL_TIME}\"/" README.md
else
    printf "\nThe local day and time is: \"${LOCAL_TIME}\"\n" >> README.md
fi

git add README.md

COMMIT_TIME=$(date -u "+%Y-%m-%d %H:%M:%S UTC")
git commit -m "Update time: ${COMMIT_TIME}"

git push
    