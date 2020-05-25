#!/bin/bash

# Shell script to download files from Git repository of Hera-Mi inside C1

mkdir /herami && cd /herami
git init
git remote add origin https://github.com/hera-mi/test_material.git
git pull origin master

# SSH service launch
/usr/sbin/sshd -D
