#!/bin/bash
source "$(dirname "$0")/_header.sh"
print_header "open-webui"
docker compose exec open-webui bash
