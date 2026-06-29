# Luna Local AI Stack (Ollama + Open WebUI + ChromaDB + n8n)

Stack completo de inteligencia artificial corriendo 100% en local con Docker. Sin enviar datos a terceros, sin coste por consulta, sin conexión a internet requerida.

## Tecnologías principales

- **Ollama** (motor de modelos de lenguaje)
- **Open WebUI** (interfaz de chat)
- **ChromaDB** (base de datos vectorial para RAG)
- **n8n** (automatizaciones y agentes)
- **SQLite** (base de datos interna)
- **Docker** y **Docker Compose**

## Stack de IA

| Capa | Tecnología | Rol |
|------|------------|-----|
| Modelo | **llama3.2** (Luna) | LLM base con personalidad custom |
| Motor LLM | **Ollama** | Descarga, gestiona y ejecuta los modelos |
| Interfaz | **Open WebUI** | Chat visual, gestión de modelos y documentos |
| Memoria / RAG | **ChromaDB** | Vectoriza documentos para búsqueda semántica |
| Agentes | **n8n** | Automatizaciones y flujos con la IA |
| Base de datos | **SQLite** | Almacena usuarios, chats y configuración |

## Instalación

### Requisitos Previos

- Tener **Docker** y **Docker Compose** instalados.
- **Make**: Utilizado para automatizar procesos y gestionar contenedores de manera más eficiente.

### Pasos de Instalación

1. Clona el repositorio desde GitHub.
2. Dentro del repositorio encontrarás un archivo **Makefile** con los comandos necesarios para iniciar y gestionar la aplicación.
3. Usa los siguientes comandos de **Make** para interactuar con la aplicación:

   - **`make init-app`**: Inicializa los contenedores, prepara el entorno y descarga el modelo base.
   - **`make up`**: Levanta todos los servicios.
   - **`make down`**: Detiene los contenedores.
   - **`make bash-ollama`**: Accede al shell del contenedor Ollama.
   - **`make bash-webui`**: Accede al shell del contenedor Open WebUI.
   - **`make bash-chromadb`**: Accede al shell del contenedor ChromaDB.
   - **`make bash-n8n`**: Accede al shell del contenedor n8n.

4. Además de estos comandos, dentro del **Makefile** encontrarás otros que te permiten interactuar de manera más específica con los contenedores y servicios.

5. Accede a los siguientes servicios una vez levantado el stack:

| Servicio | URL | Descripción |
|----------|-----|-------------|
| **Open WebUI (Luna)** | [http://localhost:8080](http://localhost:8080) | Interfaz de chat principal |
| **SQLite Web** | [http://localhost:8081](http://localhost:8081) | Visor de la base de datos |
| **Ollama API** | [http://localhost:11434](http://localhost:11434) | API compatible con OpenAI |
| **ChromaDB API** | [http://localhost:8000](http://localhost:8000) | API de base de datos vectorial |
| **n8n** | [http://localhost:5678](http://localhost:5678) | Panel de automatizaciones |

> Los puertos pueden cambiarse en el archivo `.env`.

## Requisitos mínimos

| Componente | Mínimo |
|------------|--------|
| RAM | 8 GB |
| Disco | 10 GB libres |
| Docker | 24+ |

---

## Contáctame / Sígueme en mis redes sociales

| Red Social | Descripción | Enlace |
|------------|-------------|--------|
| **Facebook** | Conéctate y mantente al tanto de mis actualizaciones. | [Presiona aquí](https://www.facebook.com/PabloGarciaJC) |
| **YouTube** | Fundamentos de la programación, tutoriales y noticias. | [Presiona aquí](https://www.youtube.com/@pablogarciajc) |
| **Página Web** | Más información sobre mis proyectos y servicios. | [Presiona aquí](https://pablogarciajc.com/) |
| **LinkedIn** | Sigue mi carrera profesional y establece conexiones. | [Presiona aquí](https://www.linkedin.com/in/pablogarciajc) |
| **Instagram** | Fotos, proyectos y contenido relacionado. | [Presiona aquí](https://www.instagram.com/pablogarciajc) |
| **Twitter** | Proyectos, pensamientos y actualizaciones. | [Presiona aquí](https://x.com/PabloGarciaJC) |

---
> _"La inteligencia artificial no reemplaza al ser humano, lo potencia."_
