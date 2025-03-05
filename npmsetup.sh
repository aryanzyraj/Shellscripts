#!/bin/bash

# Define color codes
INFO='\033[0;36m'  # Cyan
BANNER='\033[0;35m' # Magenta
YELLOW='\033[0;33m' # Yellow
RED='\033[0;31m'    # Red
GREEN='\033[0;32m'  # Green
BLUE='\033[0;34m'   # Blue
NC='\033[0m'        # No Color

# Display social details and channel information
echo "========================================"
echo -e "${YELLOW} Script is made by Aryanzyraj${NC}"
echo "----------------------------------------"

echo -e '\e[34m'
cat << "EOF"
 __| |______________________________________________________| |__
__   ______________________________________________________   __
  | |                                                      | |  
  | |    _                             ____        _   _ _ | |  
  | |   / \   _ __ _   _  __ _ _ __   |  _ \ __ _ (_) | | || |  
  | |  / _ \ | '__| | | |/ _` | '_ \  | |_) / _` || | | | || |  
  | | / ___ \| |  | |_| | (_| | | | | |  _ < (_| || | |_|_|| |  
  | |/_/   \_\_|   \__, |\__,_|_| |_| |_| \_\__,_|/ | (_|_)| |  
  | |              |___/                        |__/       | |  
__| |______________________________________________________| |__
__   ______________________________________________________   __
  | |                                                      | |  
EOF
echo -e '\e[0m'

echo "======================================================="
echo -e "${YELLOW}Telegram: ${GREEN}https://t.me/localhostserver${NC}"
echo -e "${YELLOW}Twitter: ${GREEN}@aryanyzraj${NC}"
echo "======================================================="

# Update and upgrade the system
echo -e "${INFO}Updating system packages...${NC}"
sudo apt update -y && sudo apt upgrade -y

# Check and install required packages
install_package() {
    if ! command -v "$1" &> /dev/null; then
        echo -e "${INFO}$1 is not installed. Installing...${NC}"
        sudo apt install -y "$1"
    else
        echo -e "${INFO}$1 is already installed.${NC}"
    fi
}

install_package curl
install_package git
install_package screen
install_package npm

# Check and install NVM
if ! command -v nvm &> /dev/null; then
    echo -e "${INFO}NVM is not installed. Installing...${NC}"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    echo -e "${INFO}Installing Node.js using NVM...${NC}"
    nvm install node
    nvm install 20
    nvm use 20
else
    echo -e "${INFO}NVM is already installed. Skipping Node.js setup.${NC}"
fi

# Install project dependencies
echo -e "${INFO}Installing project dependencies...${NC}"
npm install

# Display thank you message
echo "==================================="
echo -e "${BANNER}   Localhostserver       ${NC}"
echo "==================================="
echo -e "${GREEN}   Thanks for using this script!${NC}"
echo "==================================="
