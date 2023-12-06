#!/bin/sh
# Install shell, p10k, basic packages

echo "Starting installation script..."

# Check and install zsh
if ! command -v zsh >/dev/null 2>&1; then
    echo "Installing zsh..."
    sudo apt-get install zsh -y
    chsh -s "$(which zsh)"
else
    echo "zsh is already installed."
fi

# Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "Oh My Zsh is already installed."
fi

# Clone zsh-syntax-highlighting if it doesn't exist
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]; then
    echo "Cloning zsh-syntax-highlighting..."
    git -C ~/.oh-my-zsh/custom/plugins clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git
else
    echo "zsh-syntax-highlighting is already installed."
fi

# Clone zsh-autosuggestions if it doesn't exist
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
    echo "Cloning zsh-autosuggestions..."
    git -C ~/.oh-my-zsh/custom/plugins clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git
else
    echo "zsh-autosuggestions is already installed."
fi

# Clone powerlevel10k if it doesn't exist
if [ ! -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
    echo "Cloning powerlevel10k..."
    git -C ~/.oh-my-zsh/custom/themes clone --depth=1 https://github.com/romkatv/powerlevel10k.git
else
    echo "powerlevel10k is already installed."
fi

# Install ripgrep
if ! command -v rg >/dev/null 2>&1; then
    echo "Installing ripgrep..."
    sudo apt install ripgrep -y
else
    echo "ripgrep is already installed."
fi

# Install bat
if ! command -v batcat >/dev/null 2>&1; then
    echo "Installing bat..."
    sudo apt install bat -y
    mkdir -p ~/.local/bin
    ln -s /usr/bin/batcat ~/.local/bin/bat
else
    echo "bat is already installed."
fi


echo "Checking for fzf installation..."

# Check if fzf is already installed
if ! command -v fzf >/dev/null 2>&1; then
    echo "fzf not found. Installing fzf..."

    # Clone fzf repository
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf

    # Install fzf
    ~/.fzf/install --no-keybindings --no-completions --no-update-rc

    echo "fzf installation completed."
else
    echo "fzf is already installed."
fi

# Install exa
EXA_LOCAL_PATH="$HOME/.local/bin/exa"
if ! command -v exa >/dev/null 2>&1 && [ ! -f "$EXA_LOCAL_PATH" ]; then
    echo "Installing exa..."

    # Check Ubuntu version
    . /etc/os-release
    if [ "$VERSION_ID" = "20.04" ]; then
        echo "Ubuntu 20.04 detected. Installing exa from GitHub releases."

        # Ensure unzip is installed
        sudo apt update
        sudo apt install -y unzip

        # Get the latest version of exa
        EXA_VERSION=$(curl -s "https://api.github.com/repos/ogham/exa/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')

        # Download and unzip exa
        curl -Lo exa.zip "https://github.com/ogham/exa/releases/latest/download/exa-linux-x86_64-v${EXA_VERSION}.zip"
        sudo unzip -q exa.zip bin/exa -d /usr/local
        rm -rf exa.zip

        # Make a symlink to $HOME/.local/bin
        mkdir -p $HOME/.local/bin
        ln -s /usr/local/bin/exa $EXA_LOCAL_PATH
    else
        echo "Installing exa from package manager."
        sudo apt install exa -y
    fi
else
    echo "exa is already installed."
fi

echo "Installation script completed. Restart shell with"
echo "    exec zsh"
