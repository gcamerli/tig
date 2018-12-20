#!/bin/bash
# ./run.sh

set -uo pipefail

# Colors
red='\033[0;31m'
green='\033[0;32m'
white='\033[0;m'

function clean {
  echo ""
  echo -e "$green[Start]$white Docker system cleanup"
  echo ""
  docker rm -f $(docker ps -aq)
  docker system prune -f
  echo ""
  echo -e "Docker system cleanup ...$green done$white"
}

function network {
  echo ""
  echo -e "$green[Start]$white Docker network"
  echo ""
  bash network.sh
  echo ""
  echo -e "Docker network ...$green done$white"
}

function compose {
  echo ""
  echo -e "$green[Start]$white Docker compose"
  echo ""
  docker-compose up -d
  echo ""
  echo -e "Docker compose ...$green done$white"
}

function main () {
  clean
  network
  compose
}

main
