#!/bin/bash
docker ps --filter "expose=8000" -q | xargs -r docker stop
docker ps -a --filter "expose=8000" -q | xargs -r docker rm
docker-compose down
