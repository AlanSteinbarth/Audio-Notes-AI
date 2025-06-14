# Dockerfile dla aplikacji Streamlit z obsługą streamlit-audiorecorder
FROM python:3.9-slim

# Instalacja zależności systemowych (ffmpeg do obsługi pydub/streamlit-audiorecorder)
RUN apt-get update && \
    apt-get install -y ffmpeg git && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Ustawienie katalogu roboczego
WORKDIR /app

# Kopiowanie plików projektu
COPY . /app

# Instalacja zależności Pythona
RUN pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt \
    && pip install --no-cache-dir git+https://github.com/theevann/streamlit-audiorecorder.git

# Domyślny port Streamlit
EXPOSE 8501

# Komenda uruchamiająca aplikację
CMD ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]
