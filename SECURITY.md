# Security Policy 🔒 - Enterprise Version 2.0.0

## Supported Versions

Obsługujemy następujące wersje aplikacji Audio Notatki pod względem aktualizacji bezpieczeństwa:

| Version | Supported          | Enterprise Support | Security Level |
| ------- | ------------------ | ------------------ | -------------- |
| 2.0.x   | :white_check_mark: | :star: Premium     | :shield: Enhanced |
| 1.2.x   | :white_check_mark: | :x: Standard       | :shield: Standard |
| 1.1.x   | :x:                | :x:                | :x:            |
| < 1.1   | :x:                | :x:                | :x:            |

**Enterprise Version 2.0.0** oferuje rozszerzone zabezpieczenia i profesjonalne wsparcie techniczne.

## Reporting a Vulnerability

### 🚨 Jak zgłosić lukę w zabezpieczeniach

Jeśli odkryłeś lukę w zabezpieczeniach w aplikacji Audio Notatki, prosimy o odpowiedzialne zgłoszenie:

#### 1. **Priorytetowe zgłoszenia** (CRITICAL/HIGH)
- **Email:** alan.steinbarth@gmail.com
- **Temat:** `[SECURITY] Audio Notatki - Krytyczna luka`
- **Czas odpowiedzi:** 24 godziny

#### 2. **Standardowe zgłoszenia** (MEDIUM/LOW)
- **GitHub Issues:** [Security Issues](https://github.com/AlanSteinbarth/Notatki-glosowe-i-ich-wyszukiwanie/issues) z tagiem `security`
- **Czas odpowiedzi:** 48-72 godzin

### 📋 Informacje do załączenia

Aby pomóc nam szybko zrozumieć i naprawić problem, prosimy o załączenie:

1. **Opis luki:**
   - Rodzaj podatności (np. injection, XSS, CSRF)
   - Lokalizacja w kodzie (plik, linia)
   - Potencjalny wpływ

2. **Kroki reprodukcji:**
   - Szczegółowe instrukcje
   - Środowisko testowe (OS, Python, biblioteki)
   - Przykładowe dane wejściowe

3. **Proof of Concept:**
   - Screenshots lub logi
   - Kod eksploitujący (jeśli bezpieczny)
   - Video demonstracja (opcjonalnie)

### 🛡️ Nasza odpowiedź

Po otrzymaniu zgłoszenia:

1. **Potwierdzenie** (1-2 dni robocze)
   - Potwierdzimy otrzymanie zgłoszenia
   - Wstępna ocena ważności

2. **Analiza** (3-7 dni roboczych)
   - Szczegółowa analiza techniczna
   - Ocena wpływu i ryzyka
   - Plan naprawy

3. **Naprawa** (7-21 dni roboczych)
   - Implementacja poprawki
   - Testy bezpieczeństwa
   - Code review

4. **Publikacja** (po naprawie)
   - Release z poprawką
   - Security advisory
   - Uznanie dla reportera (jeśli wyrazi zgodę)

### 🏆 Hall of Fame

Dziękujemy następującym osobom za odpowiedzialne zgłaszanie luk:

- *Brak zgłoszeń na dzień 2025-05-26*

## Security Best Practices

### 🔑 Konfiguracja i klucze API

- **Nigdy nie commituj plików `.env`** z prawdziwymi kluczami API
- Używaj zmiennych środowiskowych w produkcji
- Regularnie rotuj klucze API OpenAI i Qdrant
- Używaj najmniejszych możliwych uprawnień dla kluczy

### 🌐 Wdrożenie produkcyjne

- Uruchom aplikację za reverse proxy (nginx/Apache)
- Używaj HTTPS z ważnymi certyfikatami SSL
- Skonfiguruj firewall ograniczający dostęp
- Monitoruj logi aplikacji pod kątem podejrzanej aktywności

### 💾 Bezpieczeństwo danych

- Regularnie twórz backup bazy Qdrant
- Szyfruj backup w spoczynku
- Ograniczaj dostęp do bazy danych
- Implementuj audit log dla operacji na danych

### 🔄 Aktualizacje

- Regularnie aktualizuj zależności Python
- Śledź security advisories dla używanych bibliotek
- Testuj aktualizacje w środowisku testowym
- Automatyzuj skanowanie vulnerabilities

## Known Security Considerations

### 🚨 Obecne ograniczenia

1. **Audio Upload:** Aplikacja przetwarza pliki audio - weryfikuj źródło
2. **API Keys:** Klucze są przechowywane jako zmienne środowiskowe
3. **Input Validation:** Tekst jest wysyłany do API OpenAI - unikaj PII
4. **File Export:** Pliki PDF/DOCX mogą zawierać metadane

### 🛠️ Planowane ulepszenia

- [ ] Rate limiting dla API calls
- [ ] Input sanitization dla tekstu
- [ ] Audit logging
- [ ] Encrypted storage opcji
- [ ] RBAC (Role-Based Access Control)

## Compliance

### 📋 Standardy bezpieczeństwa

- **OWASP Top 10:** Regularnie sprawdzamy zgodność
- **Privacy:** Zgodność z RODO dla danych osobowych
- **OpenAI Usage Policy:** Przestrzeganie zasad OpenAI API

### 🔍 Security Scanning

Używamy następujących narzędzi:

- **Static Analysis:** bandit, semgrep
- **Dependency Scanning:** safety, pip-audit
- **Secrets Detection:** GitHub secret scanning
- **Code Quality:** SonarCloud integration

## Contact

- **Security Team:** alan.steinbarth@gmail.com
- **General Support:** [GitHub Issues](https://github.com/AlanSteinbarth/Notatki-glosowe-i-ich-wyszukiwanie/issues)
- **Documentation:** [README.md](README.md)

---

**Ostatnia aktualizacja:** 2025-05-26  
**Następny przegląd:** 2025-08-26
