#!/bin/bash
source "$(dirname "$0")/_header.sh"
print_header "ollama"
docker compose exec ollama bash
