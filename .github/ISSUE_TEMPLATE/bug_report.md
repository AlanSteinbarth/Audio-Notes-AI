---
name: 🐛 Bug Report
about: Zgłoś błąd w aplikacji Audio Notatki Enterprise 2.0.0
title: '[BUG] '
labels: ['bug', 'triage']
assignees: ['AlanSteinbarth']

---

## 🐛 Opis błędu
Jasny i zwięzły opis problemu.

## 🔄 Kroki do reprodukcji
Kroki do odtworzenia błędu:
1. Przejdź do '...'
2. Kliknij na '....'
3. Przewiń w dół do '....'
4. Zobacz błąd

## ✅ Oczekiwane zachowanie
Jasny i zwięzły opis tego, co oczekiwałeś, że się stanie.

## ❌ Rzeczywiste zachowanie
Jasny i zwięzły opis tego, co się rzeczywiście stało.

## 📸 Zrzuty ekranu
Jeśli to możliwe, dodaj zrzuty ekranu pomocne w wyjaśnieniu problemu.

## 🖥️ Środowisko
**Wersja aplikacji:** Enterprise 2.0.0
**System operacyjny:** [np. Windows 11, macOS 13.0, Ubuntu 22.04]
**Przeglądarka:** [np. Chrome 118, Firefox 119, Safari 17]
**Python:** [np. 3.11.5]
**Node.js:** [jeśli dotyczy]

## 📋 Dodatkowe informacje
### Logi błędów
```
Wklej tutaj logi z app.log lub błędy z konsoli
```

### Konfiguracja .env
```
# Nie ujawniaj kluczy API - tylko strukturę
OPENAI_API_KEY=sk-***
QDRANT_URL=https://***
QDRANT_API_KEY=***
```

### Zależności
```bash
# Wynik: pip list | grep -E "(streamlit|openai|qdrant)"
```

## 🔍 Dodatkowy kontekst
Dodaj tutaj wszelkie inne informacje o problemie.

## ⚠️ Priorytet
- [ ] Niski - kosmetyczny błąd
- [ ] Średni - wpływa na funkcjonalność  
- [ ] Wysoki - blokuje główne funkcje
- [ ] Krytyczny - aplikacja nie działa

## 🏷️ Kategoria
- [ ] UI/UX
- [ ] Transkrypcja audio
- [ ] Wyszukiwanie semantyczne
- [ ] Baza danych Qdrant
- [ ] Eksport dokumentów
- [ ] Konfiguracja/Instalacja
- [ ] Performance
- [ ] Bezpieczeństwo

---
**Enterprise Support:** Dla priorytetowych zgłoszeń, skontaktuj się z alan.steinbarth@gmail.com
