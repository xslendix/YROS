#!/bin/bash

grep -qx '^root::*' /etc/shadow && echo 'WARNING! NO PASSWORD SET UP YET! SET ONE UP WITH `passwd` OR WITHIN THE APP NOW!'
