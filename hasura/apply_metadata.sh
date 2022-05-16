#!/bin/bash

npx hasura metadata apply --version "$1" --skip-execution --database-name $2