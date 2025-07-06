#!/bin/bash

ddcutil getvcp 10 | awk -F 'current value = |,' '{ gsub(/^ +| +$/, "", $2); print $2 }'
