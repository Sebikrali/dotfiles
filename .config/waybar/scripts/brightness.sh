#!/bin/bash

if [[ "$SXK_HOST" == "pc" ]]; then
    ddcutil getvcp 10 | awk -F 'current value = |,' '{ gsub(/^ +| +$/, "", $2); print $2 }'
else
    # TODO: Add laptop specific commands
    ddcutil getvcp 10 | awk -F 'current value = |,' '{ gsub(/^ +| +$/, "", $2); print $2 }'
fi
