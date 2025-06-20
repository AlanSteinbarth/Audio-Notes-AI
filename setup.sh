#!/bin/bash

# =============================================================================
# Audio Notes AI - Environment Setup Script
# Enterprise Version 2.1.0
# =============================================================================

set -e

echo "🎤 Audio Notes AI - Environment Setup"
echo "======================================"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

print_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

# Check if Python is installed
check_python() {
    print_info "Checking Python installation..."
    if command -v python3 &> /dev/null; then
        PYTHON_VERSION=$(python3 --version | cut -d " " -f 2)
        print_status "Python $PYTHON_VERSION found"
    else
        print_error "Python 3 is not installed. Please install Python 3.9+ first."
        exit 1
    fi
}

# Check if required system dependencies are installed
check_system_deps() {
    print_info "Checking system dependencies..."
    
    # Check ffmpeg
    if command -v ffmpeg &> /dev/null; then
        print_status "ffmpeg found"
    else
        print_warning "ffmpeg not found. Installing..."
        if [[ "$OSTYPE" == "darwin"* ]]; then
            # macOS
            if command -v brew &> /dev/null; then
                brew install ffmpeg
            else
                print_error "Homebrew not found. Please install ffmpeg manually: brew install ffmpeg"
                exit 1
            fi
        elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
            # Linux
            sudo apt-get update && sudo apt-get install -y ffmpeg
        else
            print_error "Unsupported OS. Please install ffmpeg manually."
            exit 1
        fi
    fi
    
    # Check git
    if command -v git &> /dev/null; then
        print_status "git found"
    else
        print_error "git is not installed. Please install git first."
        exit 1
    fi
}

# Create virtual environment
setup_venv() {
    print_info "Setting up virtual environment..."
    
    if [ ! -d "venv" ]; then
        python3 -m venv venv
        print_status "Virtual environment created"
    else
        print_status "Virtual environment already exists"
    fi
    
    # Activate virtual environment
    source venv/bin/activate
    print_status "Virtual environment activated"
    
    # Upgrade pip
    pip install --upgrade pip
    print_status "pip upgraded"
}

# Install Python dependencies
install_dependencies() {
    print_info "Installing Python dependencies..."
    
    # Install main dependencies
    pip install -r requirements.txt
    print_status "Main dependencies installed"
    
    # Install development dependencies
    if [ -f "requirements-dev.txt" ]; then
        read -p "Install development dependencies? (y/n): " install_dev
        if [[ $install_dev == "y" || $install_dev == "Y" ]]; then
            pip install -r requirements-dev.txt
            print_status "Development dependencies installed"
        fi
    fi
}

# Setup environment file
setup_env_file() {
    print_info "Setting up environment configuration..."
    
    if [ ! -f ".env" ]; then
        if [ -f ".env.example" ]; then
            cp .env.example .env
            print_status ".env file created from template"
            print_warning "Please edit .env file and add your API keys:"
            print_warning "- OPENAI_API_KEY (optional - can be set in app)"
            print_warning "- QDRANT_URL (required)"
            print_warning "- QDRANT_API_KEY (required)"
        else
            print_error ".env.example not found. Creating basic .env file..."
            cat > .env << EOF
# OpenAI API Configuration (optional - can be set in app sidebar)
OPENAI_API_KEY=

# Qdrant Vector Database Configuration (required)
QDRANT_URL=https://your-qdrant-instance.com
QDRANT_API_KEY=your-qdrant-api-key

# Application Configuration
STREAMLIT_SERVER_PORT=8501
STREAMLIT_SERVER_ADDRESS=localhost
EOF
            print_status "Basic .env file created"
        fi
    else
        print_status ".env file already exists"
    fi
}

# Create necessary directories
setup_directories() {
    print_info "Creating necessary directories..."
    
    mkdir -p db
    mkdir -p exports
    mkdir -p logs
    
    print_status "Directories created"
}

# Run basic tests
run_tests() {
    print_info "Running basic tests..."
    
    # Test Python imports
    python3 -c "
import streamlit
import openai
import qdrant_client
print('✅ Core imports successful')
"
    
    if [ $? -eq 0 ]; then
        print_status "Basic import tests passed"
    else
        print_error "Import tests failed. Check your installation."
        exit 1
    fi
}

# Docker setup (optional)
setup_docker() {
    print_info "Docker setup (optional)..."
    
    if command -v docker &> /dev/null; then
        read -p "Setup Docker environment? (y/n): " setup_docker_env
        if [[ $setup_docker_env == "y" || $setup_docker_env == "Y" ]]; then
            print_info "Building Docker image..."
            docker build -t audio-notes-ai:latest .
            print_status "Docker image built successfully"
            
            print_info "To run with Docker Compose:"
            print_info "docker-compose up -d"
        fi
    else
        print_warning "Docker not found. Skipping Docker setup."
    fi
}

# Main setup function
main() {
    echo "Starting Audio Notes AI setup..."
    echo
    
    check_python
    check_system_deps
    setup_venv
    install_dependencies
    setup_env_file
    setup_directories
    run_tests
    setup_docker
    
    echo
    print_status "Setup completed successfully!"
    echo
    print_info "Next steps:"
    print_info "1. Edit .env file with your API keys"
    print_info "2. Activate virtual environment: source venv/bin/activate"
    print_info "3. Run the application: streamlit run app.py"
    print_info "4. Or use quick start: python3 quick_start.py"
    echo
    print_info "For Docker users:"
    print_info "docker-compose up -d"
    echo
}

# Run main function
main
