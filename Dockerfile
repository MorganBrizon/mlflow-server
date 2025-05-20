FROM python:3.10-slim

RUN pip install mlflow psycopg2-binary

ENV MLFLOW_HOME=/mlflow
RUN mkdir -p $MLFLOW_HOME
WORKDIR $MLFLOW_HOME

EXPOSE 5000

CMD ["sh", "-c", \
     "mlflow server \
      --backend-store-uri=$DATABASE_URL \
      --default-artifact-root=/mlflow/artifacts \
      --host=0.0.0.0 \
      --port=8080"]
