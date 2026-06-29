#!/bin/bash
source "$(dirname "$0")/_header.sh"
print_header "n8n"
docker compose exec n8n sh
