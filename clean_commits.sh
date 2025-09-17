#!/bin/bash

# Script to clean commit messages by removing Claude references
export FILTER_BRANCH_SQUELCH_WARNING=1

git filter-branch --msg-filter '
    # Remove Claude Code references and co-author lines
    sed -e "/🤖 Generated with \[Claude Code\]/d" \
        -e "/Co-Authored-By: Claude/d" \
        -e "/Claude Code/d" \
        -e "/claude\.ai/d" \
        -e "s/claude code//gi" \
        -e "/^$/N;/^\n$/d"
' --tag-name-filter cat -- --branches --tags