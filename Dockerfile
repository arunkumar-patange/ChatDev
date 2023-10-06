# app/Dockerfile
FROM python:3.9

WORKDIR /app

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    software-properties-common \
    git \
    && rm -rf /var/lib/apt/lists/*

# RUN git clone https://github.com/streamlit/streamlit-example.git .
ADD . /app

RUN pip3 install -r requirements.txt

EXPOSE 8000

# HEALTHCHECK CMD curl --fail http://localhost:8501/_stcore/health
