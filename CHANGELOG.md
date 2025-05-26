# Changelog

Wszystkie istotne zmiany w tym projekcie będą dokumentowane w tym pliku.

Format bazuje na [Keep a Changelog](https://keepachangelog.com/pl/1.0.0/),
a projekt stosuje [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Niepublikowane]

### Planowane
- Obsługa wielu języków transkrypcji
- Kategorie i tagi notatek
- API REST dla integracji zewnętrznych
- Aplikacja mobilna
- Backup i synchronizacja w chmurze

## [2.0.0] - 2025-05-26 - ENTERPRISE VERSION

### Dodane
- 🚀 **Enterprise Version 2.0.0** - Kompleksowe przygotowanie dla środowisk produkcyjnych
- 🔄 **CI/CD Pipeline** - GitHub Actions z automatycznymi testami i deploymentem
- 🛡️ **Security Scanning** - Automatyczne skanowanie bezpieczeństwa z bandit i safety
- 📊 **Code Quality** - Automatyczne sprawdzanie jakości kodu z flake8 i pylint
- 🧪 **Matrix Testing** - Testy na Python 3.8-3.11 i różnych systemach operacyjnych
- 📋 **Issue Templates** - Szablony dla bug reportów, feature requestów i pytań
- 🔀 **Pull Request Template** - Standaryzowany szablon dla PR
- 📦 **Auto Release** - Automatyczne tworzenie releasów na podstawie tagów
- 🗂️ **Database Structure** - Przygotowana struktura folderów dla bazy danych
- 📚 **Enterprise Documentation** - Rozszerzona dokumentacja SECURITY.md i CODE_OF_CONDUCT.md
- 🏷️ **Semantic Versioning** - Pełne wsparcie dla semantic versioning z tagami
- 🌐 **GitHub Integration** - Kompletna integracja z ekosystemem GitHub

### Zmienione
- Zaktualizowano wersję aplikacji z 1.2.0 na 2.0.0
- Rozszerzono requirements.txt o narzędzia enterprise (pytest, flake8, bandit, safety)
- Przepisano dokumentację README.md z Enterprise focus
- Dodano informacje o Enterprise features w całej dokumentacji

### Techniczne Usprawnienia
- Clean git history z semantic commit messages
- Przygotowanie do tagowania v2.0.0 i v2.1.0
- Struktura projektu gotowa dla środowisk CI/CD
- Automatyzacja procesów developerskich
- Konfiguracja dla Matrix Testing

## [1.2.0] - 2025-05-25

### Dodane
- Kompletna dokumentacja projektu (README.md)
- Licencja MIT (LICENSE)
- Przewodnik współpracy (CONTRIBUTING.md)
- Ten plik changelog
- Rozszerzony .gitignore z kompletnymi regułami

### Zmienione
- Zaktualizowano wersję aplikacji do 1.2.0
- Poprawiono formatowanie kodu i komentarze
- Uporządkowano strukturę projektu

### Naprawione
- Błędy formatowania w docstring funkcji log_error()
- Poprawiono obsługę błędów w całej aplikacji
- Stabilność połączeń z API

## [1.1.0] - 2025-05-24

### Dodane
- Automatyczne generowanie tytułów notatek za pomocą GPT-3.5
- Lepsze logowanie błędów do pliku app.log
- Walidacja długości notatek (minimum 5 znaków)

### Zmienione
- Poprawiono interfejs użytkownika
- Ulepszona obsługa sesji w Streamlit
- Zoptymalizowano wydajność wyszukiwania

### Naprawione
- Błędy związane z kodowaniem znaków w eksporcie PDF
- Problemy z cache'owaniem w Streamlit
- Stabilność transkrypcji audio

## [1.0.0] - 2025-05-20

### Dodane
- Podstawowa funkcjonalność nagrywania audio
- Transkrypcja za pomocą OpenAI Whisper
- Wyszukiwanie semantyczne z Qdrant
- Eksport do formatów TXT, PDF, DOCX
- Edycja i usuwanie notatek
- Interfejs użytkownika w Streamlit
- Konfiguracja przez zmienne środowiskowe

### Zabezpieczenia
- Walidacja kluczy API
- Bezpieczne przechowywanie danych
- Logowanie błędów bez ujawniania wrażliwych danych

---

## Typy zmian

- **Dodane** - dla nowych funkcjonalności
- **Zmienione** - dla zmian w istniejących funkcjonalnościach
- **Przestarzałe** - dla funkcjonalności, które wkrótce zostaną usunięte
- **Usunięte** - dla usuniętych funkcjonalności
- **Naprawione** - dla poprawek błędów
- **Zabezpieczenia** - w przypadku luk w zabezpieczeniach