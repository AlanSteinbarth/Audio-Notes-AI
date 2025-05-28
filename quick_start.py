#!/usr/bin/env python3
"""
Quick Start Guide dla Audio Notatki Enterprise 2.0.0
Ten skrypt pomoże uruchomić aplikację w różnych trybach
"""

import subprocess
import sys
import os

def check_dependencies():
    """Sprawdź czy wszystkie zależności są zainstalowane"""
    print("🔍 Sprawdzanie zależności...")
    
    required_packages = [
        'streamlit',
        'openai', 
        'qdrant-client',
        'streamlit-audiorecorder',
        'python-dotenv',
        'fpdf2',
        'python-docx',
        'pydub'
    ]
    
    missing = []
    for package in required_packages:
        try:
            __import__(package.replace('-', '_'))
            print(f"✅ {package}")
        except ImportError:
            print(f"❌ {package} - BRAKUJE")
            missing.append(package)
    
    if missing:
        print(f"\n💡 Zainstaluj brakujące pakiety:")
        print(f"pip install {' '.join(missing)}")
        return False
    
    print("✅ Wszystkie zależności OK!")
    return True

def check_config():
    """Sprawdź konfigurację"""
    print("\n🔧 Sprawdzanie konfiguracji...")
    
    if not os.path.exists('.env'):
        print("❌ Brak pliku .env")
        print("💡 Skopiuj .env.example do .env i uzupełnij klucze API")
        return False
    
    from dotenv import dotenv_values
    env = dotenv_values('.env')
    
    required = ['OPENAI_API_KEY', 'QDRANT_URL', 'QDRANT_API_KEY']
    
    for key in required:
        if key in env and env[key]:
            print(f"✅ {key}: skonfigurowane")
        else:
            print(f"❌ {key}: brakuje")
            return False
    
    print("✅ Konfiguracja OK!")
    return True

def run_quick_test():
    """Szybki test aplikacji"""
    print("\n🧪 Szybki test aplikacji...")
    
    try:
        import app
        print("✅ Import app.py: OK")
        
        # Test klienta OpenAI
        client = app.get_openai_client()
        print("✅ Klient OpenAI: OK")
        
        print("✅ Aplikacja gotowa do uruchomienia!")
        return True
        
    except Exception as e:
        print(f"❌ Błąd: {e}")
        return False

def run_streamlit():
    """Uruchom aplikację Streamlit"""
    print("\n🚀 Uruchamianie aplikacji...")
    print("💡 Aplikacja otworzy się w przeglądarce")
    print("💡 Naciśnij Ctrl+C aby zatrzymać")
    
    try:
        subprocess.run([
            sys.executable, '-m', 'streamlit', 'run', 'app.py',
            '--server.headless', 'false',
            '--server.port', '8501',
            '--browser.gatherUsageStats', 'false'
        ])
    except KeyboardInterrupt:
        print("\n👋 Aplikacja zatrzymana przez użytkownika")

def main():
    """Główna funkcja quick start"""
    print("🚀 AUDIO NOTATKI - ENTERPRISE VERSION 2.0.0")
    print("=" * 50)
    
    # Sprawdź wszystko
    deps_ok = check_dependencies()
    config_ok = check_config()
    
    if not deps_ok:
        print("\n❌ Zainstaluj brakujące zależności przed kontynuowaniem")
        return
    
    if not config_ok:
        print("\n❌ Skonfiguruj plik .env przed kontynuowaniem")
        return
    
    test_ok = run_quick_test()
    
    if not test_ok:
        print("\n❌ Aplikacja ma problemy - sprawdź logi")
        return
    
    print("\n" + "=" * 50)
    print("🎉 WSZYSTKO GOTOWE!")
    print("\nWybierz opcję:")
    print("1. Uruchom aplikację w przeglądarce")
    print("2. Zakończ")
    
    try:
        choice = input("\nTwój wybór (1/2): ").strip()
        
        if choice == '1':
            run_streamlit()
        else:
            print("\n👋 Do zobaczenia!")
            
    except KeyboardInterrupt:
        print("\n👋 Do zobaczenia!")

if __name__ == "__main__":
    main()
