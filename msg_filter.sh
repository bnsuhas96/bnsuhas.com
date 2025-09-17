#!/bin/bash
# Read the commit message from stdin
msg=$(cat)

# Remove Claude Code references and co-author lines
echo "$msg" | sed -e '/🤖 Generated with \[Claude Code\]/d' \
                  -e '/Co-Authored-By: Claude/d' \
                  -e '/claude\.ai/d' \
                  -e '/^\s*$/d' \
                  -e '$!{/^$/N;/^\n$/d;}' 