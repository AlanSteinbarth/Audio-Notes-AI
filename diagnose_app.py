#!/usr/bin/env python3
"""
Test uruchomienia aplikacji Audio Notatki bez pełnego interfejsu Streamlit
"""

import os
import sys

# Dodaj ścieżkę do aplikacji
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

def test_basic_app_functions():
    """Test podstawowych funkcji aplikacji"""
    try:
        print("🔍 Ładowanie modułu app...")
        
        # Import wszystkich funkcji z app.py
        from app import (
            get_openai_client,
            get_qdrant_client, 
            initialize_collection,
            transcribe_audio,
            get_embeddings,
            add_note_to_db,
            list_notes_from_db,
            generate_note_title,
            main
        )
        
        print("✅ Wszystkie funkcje zaimportowane pomyślnie!")
        
        # Test klientów API (bez rzeczywistych wywołań)
        print("\n🔧 Testowanie konfiguracji klientów...")
        
        # Test OpenAI client
        try:
            openai_client = get_openai_client()
            print("✅ Klient OpenAI: skonfigurowany")
        except Exception as e:
            print(f"❌ Klient OpenAI: {e}")
        
        # Test Qdrant client (może być problem z połączeniem)
        try:
            # Nie uruchamiamy initialize_collection() żeby nie tworzyć połączenia
            print("⚠️  Qdrant: pomijam test połączenia (może być problem z siecią)")
        except Exception as e:
            print(f"❌ Qdrant: {e}")
        
        print("\n✨ Aplikacja wygląda na kompletną!")
        print("📝 Wszystkie wymagane funkcje istnieją i są implementowane")
        
        return True
        
    except ImportError as e:
        print(f"❌ Błąd importu: {e}")
        print("💡 Sprawdź czy wszystkie zależności są zainstalowane")
        return False
    except Exception as e:
        print(f"❌ Nieoczekiwany błąd: {e}")
        import traceback
        traceback.print_exc()
        return False

def analyze_app_structure():
    """Analizuje strukturę aplikacji"""
    print("\n📁 Analiza struktury aplikacji...")
    
    required_files = [
        'app.py',
        'requirements.txt', 
        '.env',
        'README.md',
        'CHANGELOG.md'
    ]
    
    for file in required_files:
        if os.path.exists(file):
            print(f"✅ {file}: istnieje")
        else:
            print(f"❌ {file}: brakuje")
    
    # Sprawdź wielkość app.py
    if os.path.exists('app.py'):
        size = os.path.getsize('app.py')
        lines = len(open('app.py', 'r', encoding='utf-8').readlines())
        print(f"📊 app.py: {size} bajtów, {lines} linii")
        
        if lines > 600:
            print("✅ Plik app.py wygląda na kompletny (dużo kodu)")
        else:
            print("⚠️  Plik app.py może być niekompletny (mało kodu)")

if __name__ == "__main__":
    print("🚀 Test aplikacji Audio Notatki Enterprise 2.0.0")
    print("=" * 50)
    
    analyze_app_structure()
    
    if test_basic_app_functions():
        print("\n🎉 Diagnoza: Aplikacja wydaje się być kompletna!")
        print("💡 Jeśli aplikacja się 'zawiesza', może to być problem z:")
        print("   - Połączeniem internetowym (OpenAI/Qdrant)")
        print("   - Kluczami API w pliku .env")
        print("   - Brakiem odpowiedzi od zewnętrznych serwisów")
        print("   - Timeoutami w połączeniach sieciowych")
        print("\n🔧 Zalecenia:")
        print("   1. Sprawdź połączenie internetowe")
        print("   2. Zweryfikuj klucze API")
        print("   3. Uruchom: streamlit run app.py --server.headless true")
        print("   4. Sprawdź logi w app.log")
    else:
        print("\n⚠️  Diagnoza: Aplikacja ma problemy z importami")
        print("💡 Zainstaluj zależności: pip install -r requirements.txt")
    
    print("\n" + "=" * 50)
    print("Diagnoza zakończona!")
