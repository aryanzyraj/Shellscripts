#!/bin/bash

# Define color codes
RED='\033[0;31m'    # Red
GREEN='\033[0;32m'  # Green
BLUE='\033[0;34m'   # Blue
NC='\033[0m'        # No Color

# Display social details and channel information
echo "========================================"
echo -e "${GREEN} Script is made by Localhostserver${NC}"
echo -e "-------------------------------------"
echo -e ""

# ASCII Art with color formatting
echo -e "${RED}"
echo "                                      _____              _      _____                                     "
echo "     /\                              |  __ \            (_)    / ____|                                   "
echo -e "${GREEN}    /  \     _ __   _   _   _ __     | |__) |   __ _     _    | (___     ___   _ __  __   __   ___   _ __ ${NC}"
echo -e "${GREEN}   / /\ \   | '__| | | | | | '_ \    |  _  /   / _\` |   | |    \___ \   / _ \ | '__| \ \ / /  / _ \ | '__|${NC}"
echo -e "${GREEN}  / ____ \  | |    | |_| | | | | |   | | \ \  | (_| |   | |    ____) | |  __/ | |     \ V /  |  __/ | |   ${NC}"
echo -e "${GREEN} /_/    \_\ |_|     \__, | |_| |_|   |_|  \_\  \__,_|   | |   |_____/   \___| |_|      \_/    \___| |_|   ${NC}"
echo -e "${BLUE}                     __/ |                             _/ |                                               ${NC}"
echo -e "${BLUE}                    |___/                             |__/                                                ${NC}"


echo -e '\e[0m'
echo "======================================================="

echo -e "${YELLOW}Telegram: ${GREEN}https://t.me/localhostserver${NC}"
echo -e "${YELLOW}Twitter: ${RED}@aryanzyraj${NC}"
echo "======================================================="


# Update package lists and upgrade installed packages
echo -e "${YELLOW}Updating and upgrading system packages...${NC}"
sudo apt update -y

# Install Screen if not installed
if command -v screen &> /dev/null; then
    echo -e "${YELLOW}Screen is already installed, skipping installation.${NC}"
else
    echo -e "${YELLOW}Screen is not installed. Installing Screen...${NC}"
    sudo apt install -y screen
fi

# Check if Docker is already installed
if command -v docker &> /dev/null; then
    echo -e "${YELLOW}Docker is already installed, skipping Docker installation.${NC}"
else
    # Install dependencies for Docker installation
    echo -e "${YELLOW}Installing required dependencies for Docker...${NC}"
    sudo apt install -y \
      apt-transport-https \
      ca-certificates \
      curl \
      software-properties-common \
      lsb-release \
      gnupg2

    # Add Docker's official GPG key
    echo -e "${YELLOW}Adding Docker's official GPG key...${NC}"
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

    # Add Docker repository
    echo -e "${YELLOW}Adding Docker repository...${NC}"
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    # Update package lists to include Docker's repository
    echo -e "${YELLOW}Updating package lists...${NC}"
    sudo apt update -y

    # Install Docker
    echo -e "${YELLOW}Installing Docker...${NC}"
    sudo apt install -y docker-ce docker-ce-cli containerd.io

    # Check if Docker is installed successfully
    if ! command -v docker &> /dev/null; then
        echo -e "${RED}Docker installation failed!${NC}"
        exit 1
    else
        echo -e "${YELLOW}Docker is successfully installed!${NC}"
    fi
fi

# Check if Docker Compose is already installed
if command -v docker-compose &> /dev/null; then
    echo -e "${YELLOW}Docker Compose is already installed, skipping Docker Compose installation.${NC}"
else
    echo -e "${YELLOW}Docker Compose not found. Installing Docker Compose...${NC}"
    VER=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep tag_name | cut -d '"' -f 4)
    curl -L "https://github.com/docker/compose/releases/download/$VER/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
    echo -e "${YELLOW}Docker Compose has been installed!${NC}"
fi

# Add current user to Docker group
if ! groups $USER | grep -q '\bdocker\b'; then
    echo "Adding user to Docker group..."
    sudo groupadd docker
    sudo usermod -aG docker $USER
else
    echo "User is already in the Docker group."
fi


# Display thank you message
echo "========================================"
echo -e "${YELLOW} Thanks for using the script${NC}"
echo -e "-------------------------------------"
