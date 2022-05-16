#!/bin/bash

npx hasura migrate apply --version "$1" --skip-execution --database-name $2