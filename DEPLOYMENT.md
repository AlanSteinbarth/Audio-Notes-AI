# Konfiguracja dla Streamlit Cloud
# =================================

# Ten plik zawiera instrukcje konfiguracji zmiennych środowiskowych
# dla różnych platform deployment

## 🌩️ Streamlit Cloud

1. Idź do Streamlit Cloud (share.streamlit.io)
2. Wybierz swoje repozytorium
3. Kliknij "Advanced settings"
4. W sekcji "Secrets" dodaj:

```toml
# OpenAI Configuration (optional - can be set in app sidebar)
OPENAI_API_KEY = "sk-proj-your-openai-key-here"

# Qdrant Vector Database Configuration (required)
QDRANT_URL = "https://your-qdrant-instance.com"
QDRANT_API_KEY = "your-qdrant-api-key-here"

# Application Configuration
STREAMLIT_SERVER_PORT = 8501
STREAMLIT_SERVER_ADDRESS = "0.0.0.0"
```

## 🐳 Docker/Railway/Render

Ustaw zmienne środowiskowe:
- `OPENAI_API_KEY`
- `QDRANT_URL` 
- `QDRANT_API_KEY`

## 🖥️ Lokalne uruchomienie

1. Skopiuj `.env.example` do `.env`
2. Uzupełnij klucze API
3. Uruchom: `streamlit run app.py`

## 🔧 Qdrant Configuration Examples

### Qdrant Cloud (Recommended)
```
QDRANT_URL=https://xyz-abc-123.eu-central.aws.cloud.qdrant.io:6333
QDRANT_API_KEY=your-qdrant-cloud-api-key
```

### Self-hosted Qdrant
```
QDRANT_URL=http://your-server:6333
QDRANT_API_KEY=your-custom-api-key
```

### Local Docker Qdrant
```
QDRANT_URL=http://localhost:6333
QDRANT_API_KEY=your-local-key
```

## ⚠️ Uwagi bezpieczeństwa

- Nigdy nie commituj kluczy API do repozytorium
- Używaj różnych kluczy dla dev/staging/production
- Regularnie rotuj klucze API
- Sprawdzaj logi dostępu do API
