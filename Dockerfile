FROM python:3.10-slim

RUN pip install mlflow psycopg2-binary

# Crée un dossier pour les artefacts
RUN mkdir -p /mlflow/artifacts
WORKDIR /mlflow

ENV PORT=8080
ENV BACKEND_STORE_URI=""
ENV ARTIFACT_ROOT="/mlflow/artifacts"

# Déclare le port explicitement pour Render
EXPOSE 8080

# CMD direct (sans sh -c)
CMD mlflow server \
    --host 0.0.0.0 \
    --port 8080 \
    --backend-store-uri ${BACKEND_STORE_URI} \
    --default-artifact-root ${ARTIFACT_ROOT}
