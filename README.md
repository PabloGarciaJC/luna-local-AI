# Local AI Stack

Stack completo de IA corriendo 100% en local con Docker. Sin enviar datos a terceros, sin coste por consulta, sin internet requerido.

## AI Stack

| Capa | Tecnología | Rol |
| --- | --- | --- |
| Modelo | **llama3.2** (Luna) | LLM base con personalidad custom |
| Motor LLM | **Ollama** | Descarga, gestiona y ejecuta los modelos de lenguaje |
| Interfaz | **Open WebUI** | Chat visual, gestión de modelos y documentos |
| Memoria / RAG | **ChromaDB** | Vectoriza documentos para búsqueda semántica |
| Agentes | **n8n** | Automatizaciones y flujos con la IA |
| Base de datos | **SQLite** | Almacena usuarios, chats y configuración (gestionado por Open WebUI) |

## Servicios

Una vez levantado el stack, los servicios están disponibles en:

| Servicio | URL | Descripción |
| --- | --- | --- |
| **Open WebUI (Luna)** | <http://localhost:8080> | Interfaz de chat principal |
| **SQLite Web** | <http://localhost:8081> | Visor de la base de datos |
| **Ollama API** | <http://localhost:11434> | API compatible con OpenAI |
| **ChromaDB API** | <http://localhost:8000> | API de base de datos vectorial |
| **n8n** | <http://localhost:5678> | Panel de automatizaciones |

> Los puertos pueden cambiarse en el archivo `.env`.

## Instalación

```bash
git clone <repo>
cd llm_verpa
make init
```

Los datos se sincronizan en `data/` del proyecto:

- `data/open-webui/` — chats, uploads, base de datos
- `data/ollama/` — modelos descargados
- `data/chromadb/` — vectores RAG
- `data/n8n/` — workflows

## Comandos

```bash
make init          # Primera vez: prepara + levanta + descarga modelo
make up            # Levantar servicios
make down          # Parar servicios
make logs          # Ver logs en tiempo real
make ps            # Estado de los contenedores
make pull          # Descargar un modelo nuevo
make list-models   # Ver modelos instalados
make remove-model  # Eliminar un modelo
make nuke          # Destruir todo (cuidado)

# Acceso a contenedores
make bash-ollama    # Entrar al contenedor ollama
make bash-webui     # Entrar al contenedor open-webui
make bash-chromadb  # Entrar al contenedor chromadb
make bash-n8n       # Entrar al contenedor n8n
```

## Requisitos mínimos

| Componente | Mínimo |
| --- | --- |
| RAM | 8 GB |
| Disco | 10 GB libres |
| Docker | 24+ |
