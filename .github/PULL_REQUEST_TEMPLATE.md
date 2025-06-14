# Pull Request Template - Audio Notatki Enterprise 2.0.0

## 📋 Opis zmian
Krótki opis tego, co zostało zmienione i dlaczego.

## 🎯 Typ PR
- [ ] 🐛 **Bug fix** - naprawia błąd (non-breaking change)
- [ ] ✨ **New feature** - dodaje funkcjonalność (non-breaking change)
- [ ] 💥 **Breaking change** - naprawia błąd lub dodaje funkcjonalność, która powoduje breaking changes
- [ ] 📚 **Documentation** - tylko zmiany w dokumentacji
- [ ] 🎨 **Style** - zmiany formatowania, białe znaki, etc.
- [ ] ♻️ **Refactor** - refaktor kodu bez zmiany funkcjonalności
- [ ] ⚡ **Performance** - zmiany poprawiające wydajność
- [ ] ✅ **Test** - dodawanie lub poprawianie testów
- [ ] 🔧 **Chore** - zmiany w build procesie, dependencies, etc.

## 🔗 Powiązane Issues
Closes #(issue number)
Related to #(issue number)

## 🧪 Testy
Opisz testy, które uruchomiłeś, aby zweryfikować swoje zmiany:

### Test Environment
- [ ] **Python 3.8**
- [ ] **Python 3.9** 
- [ ] **Python 3.10**
- [ ] **Python 3.11**

### Operating Systems
- [ ] **Windows**
- [ ] **macOS**
- [ ] **Linux/Ubuntu**

### Functionality Tests
- [ ] **Nagrywanie audio** - test mikrofonu i zapisu
- [ ] **Transkrypcja** - test OpenAI Whisper API
- [ ] **Wyszukiwanie** - test semantycznego wyszukiwania
- [ ] **Eksport** - test eksportu TXT/PDF/DOCX
- [ ] **CRUD notatek** - test dodawania/edycji/usuwania
- [ ] **Database** - test połączenia Qdrant

## 📸 Screenshots/GIFs
Jeśli aplikuje się do UI changes, dodaj screenshots lub GIFs pokazujące zmiany.

## ✅ Checklist przed merge

### 🔍 Code Quality
- [ ] Mój kod następuje style guidelines tego projektu
- [ ] Wykonałem self-review mojego kodu
- [ ] Skomentowałem kod, szczególnie w trudnych do zrozumienia obszarach
- [ ] Zaktualizowałem dokumentację zgodnie ze zmianami
- [ ] Moje zmiany nie generują nowych warnings
- [ ] Dodałem testy pokrywające nowe zmiany
- [ ] Wszystkie nowe i istniejące unit tests przechodzą lokalnie

### 🛡️ Security & Performance
- [ ] Sprawdziłem kod pod kątem problemów bezpieczeństwa
- [ ] Nie wprowadzam secret keys lub credentials do kodu
- [ ] Zmiany nie wpływają negatywnie na performance
- [ ] Obsługuję edge cases i error handling

### 📚 Documentation
- [ ] Zaktualizowałem README.md (jeśli dotyczy)
- [ ] Zaktualizowałem CHANGELOG.md
- [ ] Dodałem docstrings do nowych funkcji
- [ ] Zaktualizowałem requirements.txt (jeśli dotyczy)

### 🔄 CI/CD
- [ ] GitHub Actions workflow przechodzi
- [ ] Flake8 linting nie ma błędów
- [ ] Bandit security scan przechodzi
- [ ] Safety dependency check przechodzi
- [ ] All tests pass w CI

## 🚀 Impact na Enterprise Version

### Breaking Changes
- [ ] **Tak** - to jest breaking change
- [ ] **Nie** - backward compatible

Jeśli tak, opisz migration path:
```
Kroki migracji dla istniejących użytkowników
```

### Performance Impact
- [ ] **Pozytywny** - poprawa wydajności
- [ ] **Neutralny** - brak wpływu na performance
- [ ] **Negatywny** - wymaga optymalizacji

### Enterprise Features
- [ ] Wpływa na Enterprise-specific functionality
- [ ] Kompatybilne z wymaganiami produkcyjnymi
- [ ] Zachowuje SLA i reliability standards

## 📝 Dodatkowe uwagi
Wszelkie dodatkowe informacje dla reviewers, deployment notes, etc.

## 🔍 Review Guidelines dla Maintainers

### Co sprawdzić:
1. **Funkcjonalność** - czy kod robi to, co ma robić
2. **Architektura** - czy rozwiązanie jest eleganckie i skalowalne
3. **Performance** - czy nie wprowadza bottlenecks
4. **Security** - czy nie ma luk bezpieczeństwa
5. **Tests** - czy testy są comprehensive i maintenance-friendly
6. **Documentation** - czy zmiany są dobrze udokumentowane

---
**Enterprise Review:** Dla krytycznych zmian, wymagany review od @AlanSteinbarth
