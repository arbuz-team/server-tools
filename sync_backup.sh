#! /bin/bash

scp $(dirname $0)/backups/* server-tools@de.arbuz.team:/home/server-tools/backup/cz.arbuz.team
