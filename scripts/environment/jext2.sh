#!/bin/sh

source $(dirname $0)/../vogon.sh

vogon_testenv_harddisk $VOGON_BLOCKDEV
vogon_testenv "fuse-version" "$(fusermount -V | awk '{ print $3 }')"
vogon_testenv_java

(
    cd $VOGON_TEST_JEXT2_PATH
    vogon_testenv "git-branch" "$(git branch 2>/dev/null | grep '^*' | sed -e 's/\*\ //')"
    vogon_testenv "git-commit-hash" "$(git log --pretty=format:%H -n 1)"
    vogon_testenv "git-commit-subject" "$(git log --pretty=format:%s -n 1)"
    vogon_testenv "git-commit-data" "$(git log --pretty=format:%ci -n 1)"
)
