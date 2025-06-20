# Rozwiązywanie problemów z streamlit-audiorecorder

## Problem
```
StreamlitAPIException: No such component directory: 
'/home/adminuser/venv/lib/python3.11/site-packages/audiorecorder/frontend/build'
```

## Rozwiązania

### 1. Reinstalacja biblioteki
```bash
pip uninstall streamlit-audiorecorder
pip install streamlit-audiorecorder
```

### 2. Alternatywna instalacja
```bash
pip install streamlit-audiorecorder --no-cache-dir --force-reinstall
```

### 3. Użycie alternatywnej biblioteki
```bash
pip install streamlit-mic-recorder
```

### 4. Uruchomienie bez nagrywania
Aplikacja jest zaprojektowana tak, aby działała bez komponetu nagrywania. Można:
- Wgrywać pliki audio z dysku
- Używać zewnętrznych narzędzi do nagrywania
- Pracować tylko z tekstem

### 5. Dla środowisk produkcyjnych (Docker/Cloud)
W `requirements.txt` można zastąpić:
```
# streamlit-audiorecorder  # problematyczny
st-audiorec>=0.0.5  # alternatywa
```

### 6. Workaround w kodzie
Aplikacja automatycznie wykrywa dostępność biblioteki i pokazuje odpowiednie opcje:
- Jeśli audiorecorder jest dostępny: pokazuje przycisk nagrywania
- Jeśli nie: pokazuje tylko opcję upload pliku

## Testowanie
Po naprawie uruchom:
```bash
python3 -c "from audiorecorder import audiorecorder; print('✅ Audiorecorder OK')"
```
