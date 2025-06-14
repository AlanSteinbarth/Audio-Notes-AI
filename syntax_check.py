#!/usr/bin/env python3
"""
Test składni pliku test_app_simple.py
"""

import ast

def test_syntax():
    """Test składni pliku test_app_simple.py"""
    try:
        with open('test_app_simple.py', 'r', encoding='utf-8') as f:
            content = f.read()
        
        # Parsuj kod aby sprawdzić składnię
        ast.parse(content)
        print("✅ Składnia test_app_simple.py jest poprawna!")
        return True
        
    except SyntaxError as e:
        print(f"❌ Błąd składni w test_app_simple.py: {e}")
        return False
    except Exception as e:
        print(f"❌ Błąd podczas sprawdzania składni: {e}")
        return False

if __name__ == "__main__":
    test_syntax()
