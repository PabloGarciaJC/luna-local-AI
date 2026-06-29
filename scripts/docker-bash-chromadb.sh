#!/bin/bash
source "$(dirname "$0")/_header.sh"
print_header "chromadb"
docker compose exec chromadb bash
