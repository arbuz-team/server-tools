#! /bin/bash

SCRIPT_DIR="$( cd "$( dirname "$0" )" && pwd )"
echo yes | scp $SCRIPT_DIR/backups/$(date +%u).tar.gz server-tools@de.arbuz.team:/home/server-tools/backup/cz.arbuz.team
