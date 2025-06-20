# Audio Notes AI - Setup Script for Windows
# Enterprise Version 2.1.0

param(
    [switch]$SkipDocker,
    [switch]$DevDependencies
)

Write-Host "🎤 Audio Notes AI - Windows Setup" -ForegroundColor Blue
Write-Host "=================================" -ForegroundColor Blue

function Write-Success {
    param([string]$Message)
    Write-Host "✅ $Message" -ForegroundColor Green
}

function Write-Warning {
    param([string]$Message)
    Write-Host "⚠️  $Message" -ForegroundColor Yellow
}

function Write-Error {
    param([string]$Message)
    Write-Host "❌ $Message" -ForegroundColor Red
}

function Write-Info {
    param([string]$Message)
    Write-Host "ℹ️  $Message" -ForegroundColor Cyan
}

# Check if Python is installed
function Test-Python {
    Write-Info "Checking Python installation..."
    try {
        $pythonVersion = python --version 2>&1
        if ($pythonVersion -match "Python (\d+\.\d+\.\d+)") {
            Write-Success "Python $($matches[1]) found"
            return $true
        }
    }
    catch {
        Write-Error "Python is not installed or not in PATH"
        Write-Info "Please install Python 3.9+ from https://python.org"
        return $false
    }
}

# Check system dependencies
function Test-SystemDeps {
    Write-Info "Checking system dependencies..."
    
    # Check ffmpeg
    try {
        $ffmpegVersion = ffmpeg -version 2>&1
        Write-Success "ffmpeg found"
    }
    catch {
        Write-Warning "ffmpeg not found"
        Write-Info "Installing ffmpeg with Chocolatey..."
        
        if (Get-Command choco -ErrorAction SilentlyContinue) {
            choco install ffmpeg -y
            Write-Success "ffmpeg installed"
        }
        else {
            Write-Error "Chocolatey not found. Please install ffmpeg manually:"
            Write-Info "1. Install Chocolatey: https://chocolatey.org/install"
            Write-Info "2. Run: choco install ffmpeg"
            return $false
        }
    }
    
    # Check git
    try {
        $gitVersion = git --version 2>&1
        Write-Success "git found"
        return $true
    }
    catch {
        Write-Error "git not found. Please install Git from https://git-scm.com"
        return $false
    }
}

# Setup virtual environment
function Set-VirtualEnv {
    Write-Info "Setting up virtual environment..."
    
    if (-not (Test-Path "venv")) {
        python -m venv venv
        Write-Success "Virtual environment created"
    }
    else {
        Write-Success "Virtual environment already exists"
    }
    
    # Activate virtual environment
    & "venv\Scripts\Activate.ps1"
    Write-Success "Virtual environment activated"
    
    # Upgrade pip
    python -m pip install --upgrade pip
    Write-Success "pip upgraded"
}

# Install dependencies
function Install-Dependencies {
    Write-Info "Installing Python dependencies..."
    
    # Install main dependencies
    pip install -r requirements.txt
    Write-Success "Main dependencies installed"
    
    # Install development dependencies if requested
    if ($DevDependencies -and (Test-Path "requirements-dev.txt")) {
        pip install -r requirements-dev.txt
        Write-Success "Development dependencies installed"
    }
}

# Setup environment file
function Set-EnvFile {
    Write-Info "Setting up environment configuration..."
    
    if (-not (Test-Path ".env")) {
        if (Test-Path ".env.example") {
            Copy-Item ".env.example" ".env"
            Write-Success ".env file created from template"
        }
        else {
            # Create basic .env file
            @"
# OpenAI API Configuration (optional - can be set in app sidebar)
OPENAI_API_KEY=

# Qdrant Vector Database Configuration (required)
QDRANT_URL=https://your-qdrant-instance.com
QDRANT_API_KEY=your-qdrant-api-key

# Application Configuration
STREAMLIT_SERVER_PORT=8501
STREAMLIT_SERVER_ADDRESS=localhost
"@ | Out-File -FilePath ".env" -Encoding UTF8
            Write-Success "Basic .env file created"
        }
        
        Write-Warning "Please edit .env file and add your API keys:"
        Write-Warning "- OPENAI_API_KEY (optional - can be set in app)"
        Write-Warning "- QDRANT_URL (required)"
        Write-Warning "- QDRANT_API_KEY (required)"
    }
    else {
        Write-Success ".env file already exists"
    }
}

# Create directories
function New-Directories {
    Write-Info "Creating necessary directories..."
    
    @("db", "exports", "logs") | ForEach-Object {
        if (-not (Test-Path $_)) {
            New-Item -ItemType Directory -Path $_ | Out-Null
        }
    }
    
    Write-Success "Directories created"
}

# Run tests
function Test-Installation {
    Write-Info "Running basic tests..."
    
    try {
        python -c @"
import streamlit
import openai
import qdrant_client
print('✅ Core imports successful')
"@
        Write-Success "Basic import tests passed"
        return $true
    }
    catch {
        Write-Error "Import tests failed. Check your installation."
        return $false
    }
}

# Docker setup
function Set-Docker {
    if ($SkipDocker) {
        Write-Info "Skipping Docker setup"
        return
    }
    
    Write-Info "Docker setup (optional)..."
    
    if (Get-Command docker -ErrorAction SilentlyContinue) {
        $dockerSetup = Read-Host "Setup Docker environment? (y/n)"
        if ($dockerSetup -eq "y" -or $dockerSetup -eq "Y") {
            Write-Info "Building Docker image..."
            docker build -t audio-notes-ai:latest .
            Write-Success "Docker image built successfully"
            
            Write-Info "To run with Docker Compose:"
            Write-Info "docker-compose up -d"
        }
    }
    else {
        Write-Warning "Docker not found. Skipping Docker setup."
        Write-Info "Install Docker Desktop: https://docker.com/products/docker-desktop"
    }
}

# Main setup function
function Start-Setup {
    Write-Host "Starting Audio Notes AI setup..." -ForegroundColor Blue
    Write-Host ""
    
    if (-not (Test-Python)) { exit 1 }
    if (-not (Test-SystemDeps)) { exit 1 }
    
    Set-VirtualEnv
    Install-Dependencies
    Set-EnvFile
    New-Directories
    if (-not (Test-Installation)) { exit 1 }
    Set-Docker
    
    Write-Host ""
    Write-Success "Setup completed successfully!"
    Write-Host ""
    Write-Info "Next steps:"
    Write-Info "1. Edit .env file with your API keys"
    Write-Info "2. Activate virtual environment: venv\Scripts\Activate.ps1"
    Write-Info "3. Run the application: streamlit run app.py"
    Write-Info "4. Or use quick start: python quick_start.py"
    Write-Host ""
    Write-Info "For Docker users:"
    Write-Info "docker-compose up -d"
    Write-Host ""
}

# Run setup
Start-Setup
