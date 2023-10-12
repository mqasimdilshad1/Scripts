#!/bin/bash

local_ip=$(ifconfig | grep -o '192\.168\.[0-9]\+\.[0-9]\+' | head -1)

  echo "$local_ip"

