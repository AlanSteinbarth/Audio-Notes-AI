# Przewodnik współpracy 🤝

Dziękujemy za zainteresowanie projektem Audio Notatki! Każdy wkład jest ceniony i pomoże uczynić ten projekt jeszcze lepszym.

## 📋 Spis treści

- [Kod postępowania](#kod-postępowania)
- [Jak mogę pomóc?](#jak-mogę-pomóc)
- [Zgłaszanie błędów](#zgłaszanie-błędów)
- [Propozycje funkcji](#propozycje-funkcji)
- [Proces pull request](#proces-pull-request)
- [Standardy kodu](#standardy-kodu)
- [Środowisko deweloperskie](#środowisko-deweloperskie)
- [Kontakt](#kontakt)

## 📜 Kod postępowania

Ten projekt przyjmuje [Contributor Covenant Code of Conduct](https://www.contributor-covenant.org/pl/version/2/1/code_of_conduct/). Uczestnicząc w projekcie, zobowiązujesz się przestrzegać tego kodeksu.

## 🛠️ Jak mogę pomóc?

Istnieje wiele sposobów na wniesienie wkładu w projekt:

### 🐛 Zgłaszanie błędów
- Sprawdź [istniejące issues](https://github.com/AlanSteinbarth/Notatki-glosowe-i-ich-wyszukiwanie/issues)
- Utwórz szczegółowy raport błędu
- Dołącz kroki reprodukcji

### ✨ Propozycje funkcji
- Sprawdź [roadmapę](README.md#📋-roadmapa)
- Otwórz [dyskusję](https://github.com/AlanSteinbarth/Notatki-glosowe-i-ich-wyszukiwanie/discussions)
- Opisz przypadek użycia

### 📖 Dokumentacja
- Popraw dokumentację
- Dodaj przykłady użycia
- Tłumacz na inne języki

### 💻 Kod
- Napraw błędy
- Implementuj nowe funkcje
- Popraw wydajność
- Dodaj testy

## 🐛 Zgłaszanie błędów

Przed zgłoszeniem błędu:

1. **Sprawdź istniejące issues** - może ktoś już zgłosił ten problem
2. **Sprawdź dokumentację** - upewnij się, że to nie jest oczekiwane zachowanie
3. **Zaktualizuj projekt** - użyj najnowszej wersji

### Template raportu błędu

```markdown
**Opis błędu**
Krótki i jasny opis problemu.

**Kroki reprodukcji**
1. Przejdź do '...'
2. Kliknij na '...'
3. Przewiń do '...'
4. Pojawia się błąd

**Oczekiwane zachowanie**
Jasny opis tego, co powinno się wydarzyć.

**Zrzuty ekranu**
Jeśli to możliwe, dodaj zrzuty ekranu.

**Środowisko:**
- OS: [np. Windows 11]
- Python: [np. 3.11.5]
- Wersja aplikacji: [np. 1.2.0]
- Przeglądarka: [np. Chrome 120]

**Dodatkowy kontekst**
Wszelkie inne informacje o problemie.
```

## 💡 Propozycje funkcji

Przed zaproponowaniem nowej funkcji:

1. **Sprawdź roadmapę** - może już jest planowana
2. **Otwórz dyskusję** - przedyskutuj pomysł z społecznością
3. **Opisz przypadek użycia** - wyjaśnij problem, który funkcja ma rozwiązać

### Template propozycji funkcji

```markdown
**Problem do rozwiązania**
Jasny opis problemu, który chcesz rozwiązać.

**Proponowane rozwiązanie**
Opisz jak wyobrażasz sobie rozwiązanie.

**Alternatywy**
Opisz alternatywne rozwiązania, które rozważałeś.

**Dodatkowy kontekst**
Wszelkie inne informacje o propozycji.
```

## 🔄 Proces pull request

1. **Fork repozytorium**
   ```bash
   git clone https://github.com/twój-nick/Notatki-glosowe-i-ich-wyszukiwanie.git
   ```

2. **Utwórz branch dla funkcji**
   ```bash
   git checkout -b feature/nazwa-funkcji
   ```

3. **Wprowadź zmiany**
   - Pisz czytelny kod
   - Dodaj testy
   - Aktualizuj dokumentację

4. **Testuj zmiany**
   ```bash
   python -m pytest
   ```

5. **Commit zmian**
   ```bash
   git commit -m "feat: dodaj nową funkcję XYZ"
   ```

6. **Push do brancha**
   ```bash
   git push origin feature/nazwa-funkcji
   ```

7. **Otwórz Pull Request**
   - Używaj jasnego tytułu
   - Opisz wprowadzone zmiany
   - Połącz z odpowiednim issue

### Konwencje commit

Używamy [Conventional Commits](https://www.conventionalcommits.org/):

- `feat:` - nowa funkcja
- `fix:` - poprawka błędu
- `docs:` - zmiany w dokumentacji
- `style:` - formatowanie kodu
- `refactor:` - refaktoryzacja kodu
- `test:` - dodanie testów
- `chore:` - aktualizacje narzędzi

## 🎨 Standardy kodu

### Python
- Używaj [PEP 8](https://pep8.org/)
- Formatuj kod z [black](https://black.readthedocs.io/)
- Sprawdzaj z [flake8](https://flake8.pycqa.org/)
- Dodawaj type hints
- Pisz docstringi w stylu Google

### Struktura plików
```
├── app.py              # Główna aplikacja
├── tests/              # Testy
├── docs/               # Dokumentacja
├── requirements.txt    # Zależności
└── .env.example       # Przykład konfiguracji
```

### Komentarze
- Pisz komentarze w języku polskim
- Wyjaśniaj "dlaczego", nie "co"
- Aktualizuj komentarze przy zmianach kodu

## 🏗️ Środowisko deweloperskie

### Wymagania
- Python 3.11+
- Git
- Konto OpenAI (do testów)
- Instancja Qdrant (lokalna lub chmura)

### Konfiguracja
1. **Klonuj repozytorium**
   ```bash
   git clone https://github.com/AlanSteinbarth/Notatki-glosowe-i-ich-wyszukiwanie.git
   cd Notatki-glosowe-i-ich-wyszukiwanie
   ```

2. **Utwórz środowisko wirtualne**
   ```bash
   python -m venv venv
   venv\Scripts\activate  # Windows
   # source venv/bin/activate  # Linux/Mac
   ```

3. **Zainstaluj zależności**
   ```bash
   pip install -r requirements.txt
   pip install -r requirements-dev.txt
   ```

4. **Skonfiguruj zmienne środowiskowe**
   ```bash
   cp .env.example .env
   # Edytuj .env z własnymi kluczami
   ```

5. **Uruchom testy**
   ```bash
   python -m pytest
   ```

6. **Uruchom aplikację**
   ```bash
   streamlit run app.py
   ```

### Narzędzia deweloperskie

```bash
# Formatowanie kodu
black app.py

# Sprawdzanie stylu
flake8 app.py

# Sprawdzanie typów
mypy app.py

# Uruchomienie testów
pytest tests/

# Pokrycie testów
pytest --cov=app tests/
```

## 🧪 Testowanie

- Pisz testy dla nowych funkcji
- Sprawdź pokrycie testów
- Testuj na różnych systemach operacyjnych
- Testuj z różnymi wersjami Python

### Uruchamianie testów
```bash
# Wszystkie testy
pytest

# Konkretny plik
pytest tests/test_app.py

# Z pokryciem
pytest --cov=app --cov-report=html
```

## 📚 Dokumentacja

- Aktualizuj README.md przy większych zmianach
- Dodaj docstringi do nowych funkcji
- Aktualizuj CHANGELOG.md
- Używaj jasnego i zwięzłego języka

## 🤔 Pytania i pomoc

Jeśli masz pytania:

1. Sprawdź [dokumentację](README.md)
2. Przeszukaj [issues](https://github.com/AlanSteinbarth/Notatki-glosowe-i-ich-wyszukiwanie/issues)
3. Otwórz [dyskusję](https://github.com/AlanSteinbarth/Notatki-glosowe-i-ich-wyszukiwanie/discussions)
4. Skontaktuj się: alan.steinbarth@gmail.com

## 📄 Licencja

Współpracując z projektem, zgadzasz się na licencjonowanie swojego wkładu na licencji MIT.

---

**Dziękujemy za Twój wkład! 🎉**