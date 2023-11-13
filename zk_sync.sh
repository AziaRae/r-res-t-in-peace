#!/usr/bin/env sh

#REPO_DIR="/home/mitsuki/git/Logseq-Journals"

#cd "$REPO_DIR"

git pull

if [ "$(git status --porcelain | wc -l)" -eq 0 ]; then
    exit 0
fi

git add .
git commit -S -m "Last Sync: $(date +'%Y-%m-%d %H:%M:%S')"
git push -v origin main
