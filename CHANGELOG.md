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