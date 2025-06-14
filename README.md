# 🎤 Audio Notes AI 🤖 - Enterprise Version 2.1.0

> **🎉 Wersja 2.1.0 dostępna!** 🎤 Audio Notes AI 🤖 Enterprise działa na Windows, macOS i Linux oraz oferuje intuicyjne zarządzanie kluczami API. Wszystkie funkcjonalności działają na każdym systemie operacyjnym.

---

## Opis
Zaawansowany system notatek głosowych z AI-powered wyszukiwaniem semantycznym. Nagrywaj, transkrybuj (Whisper), twórz wektory (embeddings) i wyszukuj notatki głosowe z pomocą sztucznej inteligencji. Funkcje: automatyczna kategoryzacja, tagowanie, eksport do TXT/PDF/DOCX, synchronizacja w chmurze. Nowoczesny, multiplatformowy interfejs (Windows, macOS, Linux). Rewolucja w organizacji wiedzy osobistej i biznesowej.

---

## Instalacja

```bash
   git clone https://github.com/AlanSteinbarth/Audio-Notes-AI.git
   cd Audio-Notes-AI
```

2. **Zainstaluj zależności**
   ```bash
   pip install -r requirements.txt
   ```

3. **Skonfiguruj zmienne środowiskowe**
   ```bash
   cp .env.example .env
   ```
   
   Edytuj plik `.env` i uzupełnij (klucz OpenAI jest opcjonalny):
   ```env
   # Opcjonalnie - można też podać w sidebarze aplikacji
   OPENAI_API_KEY=sk-twój-klucz-openai
   # Wymagane
   QDRANT_URL=https://twoja-instancja-qdrant.com
   QDRANT_API_KEY=twój-klucz-qdrant
   ```

4. **Uruchom aplikację**
   ```bash
   streamlit run app.py
   # lub
   python -m streamlit run app.py
   ```

5. **Podaj klucz OpenAI**
   - Jeśli nie masz klucza w `.env`, wprowadź go w sidebarze aplikacji
   - Klucz jest automatycznie weryfikowany przed użyciem

## 🛠️ Instalacja zależności systemowych

Aby aplikacja działała poprawnie na każdym systemie operacyjnym, wymagane są dodatkowe narzędzia systemowe:

- **ffmpeg** (do obsługi audio)
- **git** (do pobierania repozytorium i ewentualnych aktualizacji)

### Instalacja na macOS
```bash
brew install ffmpeg git
```

### Instalacja na Linux (Debian/Ubuntu)
```bash
sudo apt update
sudo apt install ffmpeg git
```

### Instalacja na Windows (z Chocolatey)
```powershell
choco install ffmpeg git
```

Jeśli nie masz Chocolatey, zobacz: https://chocolatey.org/install

---

## 📦 Instalacja bibliotek opcjonalnych

Niektóre funkcje wymagają dodatkowych bibliotek Python:

- **Nagrywanie audio w przeglądarce:**
  ```bash
  pip install streamlit-audiorecorder
  ```
- **Eksport PDF:**
  ```bash
  pip install fpdf
  ```

Aplikacja działa również bez tych bibliotek, ale niektóre funkcje będą niedostępne.

---

## 🧪 Środowiska wirtualne

Zalecamy korzystanie ze środowiska wirtualnego (venv lub conda):

### Python venv (uniwersalnie)
```bash
python -m venv venv
source venv/bin/activate  # macOS/Linux
venv\Scripts\activate    # Windows
pip install -r requirements.txt
```

### Conda (jeśli używasz)
```bash
conda create -n notatki python=3.11
conda activate notatki
pip install -r requirements.txt
```

---

## 🌍 Przenośność

Aplikacja została przetestowana na Windows, macOS i Linux. Wszystkie ścieżki plików oraz zależności są obsługiwane automatycznie. W przypadku brakujących zależności systemowych lub bibliotek Python, aplikacja wyświetli odpowiedni komunikat i instrukcję instalacji.

---

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

## 🔧 Narzędzia diagnostyczne

Projekt zawiera zestaw narzędzi diagnostycznych dla deweloperów i administratorów:

### `quick_start.py` - Interaktywny przewodnik uruchamiania
```bash
python quick_start.py
```
- Sprawdza konfigurację środowiska
- Testuje połączenia API
- Uruchamia aplikację z przewodnikiem

### `diagnose_app.py` - Kompleksowa diagnostyka
```bash
python diagnose_app.py
```
- Analiza struktury projektu
- Weryfikacja importów i zależności
- Test połączeń zewnętrznych
- Sprawdzenie konfiguracji

### `test_app_simple.py` - Podstawowe testy
```bash
python test_app_simple.py
```
- Testy importów modułów
- Weryfikacja funkcji kluczowych
- Kontrola błędów składni

## 🤝 Współpraca

Chcesz przyczynić się do rozwoju projektu? Świetnie! Zobacz [CONTRIBUTING.md](CONTRIBUTING.md) dla szczegółów.

### Zgłaszanie błędów

Jeśli znalazłeś błąd, [utwórz issue](https://github.com/AlanSteinbarth/Audio-Notes-AI/issues) z:
- Opisem problemu
- Krokami do reprodukcji
- Informacjami o systemie

### Propozycje funkcji

Masz pomysł na nową funkcję? [Otwórz dyskusję](https://github.com/AlanSteinbarth/Audio-Notes-AI/discussions)!

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

### Wersja 2.1.0 (2025-06-14) - UNIWERSALNA WERSJA
- ✅ **Pełna przenośność** - Natywne wsparcie Windows, macOS, Linux
- ✅ **Inteligentne API Key** - Klucz OpenAI w sidebarze lub .env
- ✅ **Automatyczna detekcja systemu** - Wykrywa brakujące zależności
- ✅ **Stabilny interfejs** - Naprawiono czarny ekran przy starcie
- ✅ **Odporne importy** - Elegancka obsługa opcjonalnych bibliotek

### Wersja 2.0.0 (2025-05-27) - ENTERPRISE
- Pierwsza stabilna wersja Enterprise
- Pełna funkcjonalność produkcyjna

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