# API Documentation - Audio Notes AI v2.1.0

## 🚀 Planowane API REST (v3.0.0)

Audio Notes AI będzie w przyszłości oferować RESTful API dla integracji z zewnętrznymi aplikacjami i systemami.

### Planowane Endpointy

#### 🎤 Audio Management
```http
POST /api/v1/audio/upload
POST /api/v1/audio/transcribe
GET /api/v1/audio/{id}
DELETE /api/v1/audio/{id}
```

#### 📝 Notes Management
```http
GET /api/v1/notes
POST /api/v1/notes
GET /api/v1/notes/{id}
PUT /api/v1/notes/{id}
DELETE /api/v1/notes/{id}
```

#### 🔍 Search
```http
POST /api/v1/search
GET /api/v1/search/suggest
```

#### 📤 Export
```http
POST /api/v1/export/pdf
POST /api/v1/export/docx
POST /api/v1/export/txt
```

### Przykładowe Zapytania

#### Dodawanie notatki
```bash
curl -X POST "http://localhost:8501/api/v1/notes" \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "title": "Spotkanie z klientem",
    "content": "Omówiliśmy wymagania projektu...",
    "tags": ["spotkanie", "klient", "projekt"]
  }'
```

#### Wyszukiwanie notatek
```bash
curl -X POST "http://localhost:8501/api/v1/search" \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "query": "spotkanie z klientem",
    "limit": 10,
    "similarity_threshold": 0.7
  }'
```

### Odpowiedzi API

#### Sukces
```json
{
  "status": "success",
  "data": {
    "id": "note_123",
    "title": "Spotkanie z klientem",
    "content": "...",
    "created_at": "2025-06-20T10:00:00Z",
    "updated_at": "2025-06-20T10:00:00Z"
  }
}
```

#### Błąd
```json
{
  "status": "error",
  "error": {
    "code": "INVALID_REQUEST",
    "message": "Wymagane pole 'content' jest puste",
    "details": {}
  }
}
```

### Uwierzytelnianie

Planowane metody uwierzytelniania:
- API Keys
- JWT Tokens
- OAuth 2.0

### Rate Limiting

Planowane limity:
- 100 zapytań/minutę dla podstawowych operacji
- 10 zapytań/minutę dla operacji z AI (transkrypcja, wyszukiwanie)
- 5 zapytań/minutę dla operacji eksportu

### Webhooks

Planowane eventy:
- `note.created`
- `note.updated`
- `note.deleted`
- `transcription.completed`
- `export.completed`

---

## 🔧 Aktualna Architektura Wewnętrzna

Dla deweloperów chcących zrozumieć obecną implementację:

### Główne Funkcje

#### `get_openai_client()`
Inicjalizuje klienta OpenAI z kluczem API.

#### `transcribe_audio(audio_data)`
Transkrybuje audio używając Whisper API.

#### `get_embeddings(text)`
Generuje embeddingi używając text-embedding-3-large.

#### `search_notes(query, limit=10)`
Wyszukuje notatki używając similarity search.

#### `export_to_pdf(notes, filename)`
Eksportuje notatki do formatu PDF.

### Struktura Danych

#### Notatka w Qdrant
```python
{
    "id": "unique_note_id",
    "payload": {
        "title": "Tytuł notatki",
        "content": "Treść notatki",
        "created_at": "2025-06-20T10:00:00Z",
        "updated_at": "2025-06-20T10:00:00Z",
        "tags": ["tag1", "tag2"],
        "audio_filename": "audio_file.wav"
    },
    "vector": [0.1, 0.2, 0.3, ...]  # 3072 dimensions
}
```

### Konfiguracja

#### Zmienne Środowiskowe
- `OPENAI_API_KEY`: Klucz API OpenAI
- `QDRANT_URL`: URL instancji Qdrant
- `QDRANT_API_KEY`: Klucz API Qdrant

#### Streamlit Secrets
Można też używać `st.secrets` dla bezpiecznego przechowywania kluczy.

---

*Dokumentacja API będzie rozszerzona w wersji 3.0.0 z pełnym API REST.*
