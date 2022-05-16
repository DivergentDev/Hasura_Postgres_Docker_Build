#!/bin/bash

npx hasura migrate create "$1" --from-server --database-name $2