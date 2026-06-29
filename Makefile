-include .env

# ==============================
# FIRST-TIME SETUP
# ==============================
init: prepare up pull-model

# ==============================
# PREPARE
# ==============================
prepare:
	@[ ! -f .env ] && cp .env.example .env || true
	@mkdir -p data/open-webui data/ollama data/chromadb data/n8n

# ==============================
# DOCKER
# ==============================
up:
	docker compose up -d --build

down:
	docker compose down

restart:
	docker compose restart

build:
	docker compose build --no-cache

logs:
	docker compose logs -f

ps:
	docker compose ps

# ==============================
# MODELOS
# ==============================
MODEL ?= llama3.2

pull-model:
	docker compose exec ollama ollama pull $(MODEL)

list-models:
	docker compose exec ollama ollama list

pull:
	@read -p "Nombre del modelo (ej: llama3.2, qwen2.5, mistral): " model; \
	docker compose exec ollama ollama pull $$model

remove-model:
	@read -p "Nombre del modelo a eliminar: " model; \
	docker compose exec ollama ollama rm $$model

# ==============================
# SYSTEM / DIAGNOSTIC
# ==============================
status:
	docker ps -a
	docker images
	docker volume ls
	docker network ls

# ==============================
# DESTRUCTIVE CLEANUP (DANGER)
# ==============================
nuke:
	@echo "PELIGRO: Esto borrara todos los contenedores, volumenes e imagenes de Docker."
	@echo "No hay vuelta atras."
	@read -p "Confirmas que quieres continuar? [s/N]: " confirm && \
	  [ "$$confirm" = "s" ] || [ "$$confirm" = "S" ] || (echo "Cancelado." && exit 1)
	docker compose down -v
	docker stop $$(docker ps -aq) 2>/dev/null || true
	docker rm $$(docker ps -aq) 2>/dev/null || true
	docker volume rm $$(docker volume ls -q) 2>/dev/null || true
	docker system prune -a --volumes -f
	@echo "Limpieza completada."

# ==============================
# SHELL ACCESS
# ==============================
bash-ollama:
	docker compose exec ollama bash

bash-webui:
	docker compose exec open-webui bash

bash-chromadb:
	docker compose exec chromadb bash

bash-n8n:
	docker compose exec n8n sh

# ==============================
# CLAUDE
# ==============================
github-feature:
	@read -p "Describe la nueva feature: " feature; \
	claude "Eres un asistente de desarrollo. El usuario quiere implementar esta feature: '$$feature'. Haz exactamente estos pasos en orden: 1) Usa el MCP de GitHub para crear un issue con título y descripción detallada de la feature. 2) Crea una rama local con el formato feature/<numero-issue>-<nombre-corto> y haz checkout a ella. 3) Implementa la solución completa en el código del proyecto. 4) Haz commit y push de los cambios a esa rama."
