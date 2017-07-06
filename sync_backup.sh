#! /bin/bash

SCRIPT_DIR="$( cd "$( dirname "$0" )" && pwd )"
scp $SCRIPT_DIR/backups/* server-tools@de.arbuz.team:/home/server-tools/backup/cz.arbuz.team
