#!/bin/bash

FORMATTERPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

$JULIA_185 --project=$FORMATTERPATH $FORMATTERPATH/format.jl
