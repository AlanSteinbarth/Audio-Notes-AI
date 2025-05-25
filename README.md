# Audio Notatki 🎙️

[![Python](https://img.shields.io/badge/Python-3.11+-blue.svg)](https://python.org)
[![Streamlit](https://img.shields.io/badge/Streamlit-1.28+-red.svg)](https://streamlit.io)
[![OpenAI](https://img.shields.io/badge/OpenAI-Whisper-green.svg)](https://openai.com)
[![Qdrant](https://img.shields.io/badge/Qdrant-Vector%20DB-purple.svg)](https://qdrant.tech)
[![Licencja](https://img.shields.io/badge/Licencja-MIT-yellow.svg)](LICENSE)

Kompleksowa aplikacja do zarządzania notatkami głosowymi z wykorzystaniem sztucznej inteligencji. Nagraj, transkrybuj i przeszukuj swoje notatki semantycznie!

## ✨ Funkcjonalności

- 🎤 **Nagrywanie audio** - Nagraj notatki głosowe bezpośrednio w przeglądarce
- 🤖 **Transkrypcja AI** - Automatyczna konwersja mowy na tekst z OpenAI Whisper
- 🔍 **Wyszukiwanie semantyczne** - Znajdź notatki na podstawie znaczenia, nie tylko słów kluczowych
- 📝 **Edycja notatek** - Modyfikuj treść zapisanych notatek
- 📊 **Baza wektorowa** - Zaawansowane przechowywanie z wykorzystaniem Qdrant
- 📄 **Eksport** - Pobierz notatki w formatach TXT, PDF i DOCX
- 🏷️ **Automatyczne tytuły** - AI generuje opisowe tytuły dla notatek

## 🚀 Szybki start

### Wymagania

- Python 3.11 lub nowszy
- Konto OpenAI z dostępem do API
- Instancja Qdrant (lokalna lub w chmurze)

### Instalacja

1. **Sklonuj repozytorium**
   ```bash
   git clone https://github.com/AlanSteinbarth/Notatki-glosowe-i-ich-wyszukiwanie.git
   cd Notatki-glosowe-i-ich-wyszukiwanie
   ```

2. **Zainstaluj zależności**
   ```bash
   pip install -r requirements.txt
   ```

3. **Skonfiguruj zmienne środowiskowe**
   ```bash
   cp .env.example .env
   ```
   
   Edytuj plik `.env` i uzupełnij:
   ```env
   OPENAI_API_KEY=sk-twój-klucz-openai
   QDRANT_URL=https://twoja-instancja-qdrant.com
   QDRANT_API_KEY=twój-klucz-qdrant
   ```

4. **Uruchom aplikację**
   ```bash
   streamlit run app.py
   ```

## 🛠️ Technologie

### Backend
- **Python 3.11+** - Język programowania
- **Streamlit** - Framework dla interfejsu webowego
- **OpenAI API** - Transkrypcja (Whisper) i embeddingi (text-embedding-3-large)
- **Qdrant** - Baza danych wektorowych

### Przetwarzanie
- **Whisper** - Transkrypcja audio na tekst
- **text-embedding-3-large** - Generowanie wektorów semantycznych
- **GPT-3.5** - Automatyczne generowanie tytułów

### Eksport
- **FPDF** - Generowanie dokumentów PDF
- **python-docx** - Tworzenie plików DOCX
- **Built-in** - Eksport do formatu TXT

## 📖 Jak używać

### 1. Dodawanie notatek
1. Kliknij "Nagraj notatkę" w zakładce "Dodaj notatkę"
2. Nagraj swoją notatkę głosową
3. Kliknij "Transkrybuj audio"
4. Sprawdź i edytuj transkrypcję w razie potrzeby
5. Kliknij "Zapisz notatkę"

### 2. Wyszukiwanie
1. Przejdź do zakładki "Wyszukaj notatkę"
2. Wpisz zapytanie (może być ogólne, np. "spotkanie z klientem")
3. System znajdzie semantycznie podobne notatki

### 3. Zarządzanie notatkami
1. W zakładce "Lista notatek" zobaczysz wszystkie zapisane notatki
2. Możesz edytować, usuwać lub eksportować każdą notatkę
3. Dostępne formaty eksportu: TXT, PDF, DOCX

## ⚙️ Konfiguracja

### Zmienne środowiskowe

| Zmienna | Opis | Przykład |
|---------|------|----------|
| `OPENAI_API_KEY` | Klucz API OpenAI | `sk-proj-...` |
| `QDRANT_URL` | URL instancji Qdrant | `https://xyz.qdrant.cloud:6333` |
| `QDRANT_API_KEY` | Klucz API Qdrant | `abc123...` |

### Modele OpenAI

- **Transkrypcja**: `whisper-1`
- **Embeddingi**: `text-embedding-3-large` (3072 wymiary)
- **Tytuły**: `gpt-3.5-turbo`

## 🏗️ Architektura

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Streamlit UI  │    │   OpenAI API    │    │   Qdrant DB     │
│                 │    │                 │    │                 │
│ • Nagrywanie    │───▶│ • Whisper       │    │ • Embeddingi    │
│ • Edycja        │    │ • Embeddings    │◀──▶│ • Metadane      │
│ • Wyszukiwanie  │    │ • GPT-3.5       │    │ • Wyszukiwanie  │
│ • Eksport       │    │                 │    │                 │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

## 🤝 Współpraca

Chcesz przyczynić się do rozwoju projektu? Świetnie! Zobacz [CONTRIBUTING.md](CONTRIBUTING.md) dla szczegółów.

### Zgłaszanie błędów

Jeśli znalazłeś błąd, [utwórz issue](https://github.com/AlanSteinbarth/Notatki-glosowe-i-ich-wyszukiwanie/issues) z:
- Opisem problemu
- Krokami do reprodukcji
- Informacjami o systemie

### Propozycje funkcji

Masz pomysł na nową funkcję? [Otwórz dyskusję](https://github.com/AlanSteinbarth/Notatki-glosowe-i-ich-wyszukiwanie/discussions)!

## 📋 Roadmapa

- [ ] Obsługa wielu języków transkrypcji
- [ ] Kategorie i tagi notatek
- [ ] API REST dla integracji
- [ ] Aplikacja mobilna
- [ ] Backup i synchronizacja

## 🐛 Rozwiązywanie problemów

### Błędy transkrypcji
- Sprawdź połączenie internetowe
- Upewnij się, że klucz OpenAI API jest poprawny
- Nagraj audio w cichym otoczeniu

### Problemy z wyszukiwaniem
- Sprawdź połączenie z bazą Qdrant
- Upewnij się, że kolekcja została zainicjalizowana
- Spróbuj innych słów kluczowych

### Błędy eksportu
- PDF: Sprawdź czy tekst zawiera znaki specjalne
- DOCX: Upewnij się, że masz wystarczające uprawnienia do zapisu

## 📝 Changelog

Zobacz [CHANGELOG.md](CHANGELOG.md) dla pełnej historii zmian.

### Wersja 1.2.0 (2025-05-25)
- Dodano dokumentację projektu
- Poprawiono obsługę błędów
- Rozszerzono .gitignore

### Wersja 1.1.0 (2025-05-24)
- Naprawiono błędy formatowania
- Poprawiono stabilność aplikacji

## 📄 Licencja

Ten projekt jest licencjonowany na licencji MIT - zobacz plik [LICENSE](LICENSE) dla szczegółów.

## 👨‍💻 Autor

**Alan Steinbarth**
- Email: alan.steinbarth@gmail.com
- GitHub: [@AlanSteinbarth](https://github.com/AlanSteinbarth)

## 🙏 Podziękowania

- [OpenAI](https://openai.com) za API Whisper i GPT
- [Qdrant](https://qdrant.tech) za bazę danych wektorowych
- [Streamlit](https://streamlit.io) za framework UI
- Społeczność open source za inspirację

---

⭐ **Podobał Ci się projekt? Zostaw gwiazdkę!** ⭐