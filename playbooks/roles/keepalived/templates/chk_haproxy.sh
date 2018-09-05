#!/bin/bash
# author: Netonline
# version: 2018-8-16 v0.1 

if [ $(ps -C haproxy --no-header | wc -l) -ne 0 ]; then
     exit 0
else
     exit 1
fi
