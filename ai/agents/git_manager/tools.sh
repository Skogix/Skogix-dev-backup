#!/bin/bash

function clone_repo() {
    git clone $1
}

function pull_changes() {
    git pull origin main
}

function push_changes() {
    git add .
    git commit -m "Automated commit by GitManager"
    git push origin main
}

function manage_branches() {
    git branch
}
