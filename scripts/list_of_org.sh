#!/bin/bash

# List of organisations supported for v1.0 to v6.0
# Contributor: kavita23meena.2002@gmail.com, meetdheerajreddy@gmail.com

if [ ! -d "list_of_orgs" ]; then
    mkdir list_of_orgs
fi

cd ~/archive
git checkout -fq v1.0
grep -Eio '[[:alnum:]_\.-]+@[[:alnum:]_\.-]+\.[[:alpha:].]{2,}' CREDITS | awk -F "@" '{print $2}' | sort -u > ../list_of_orgs/v1.0_orgs.txt

cd ~/linux_v2.0
grep -Eio '[[:alnum:]_\.-]+@[[:alnum:]_\.-]+\.[[:alpha:].]{2,}' MAINTAINERS | awk -F "@" '{print $2}' | sort -u  > ../list_of_orgs/v2.0_orgs.txt

cd ~/linux-stable/linux-stable
for ((i=3; i<=6; i++)); do
    git checkout -fq v$i.0
    grep -Eio '[[:alnum:]_\.-]+@[[:alnum:]_\.-]+\.[[:alpha:].]{2,}' MAINTAINERS | awk -F "@" '{print $2}' | sort -u >  ../list_of_orgs/v$i.0_orgs.txt
done
