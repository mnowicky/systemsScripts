#!/bin/bash
if hash ntpdate 2>/dev/null; then
    ntpdate pool.ntp.org
else
    echo "'ntpdate' is not installed. Aborting..."; exit 1
fi
