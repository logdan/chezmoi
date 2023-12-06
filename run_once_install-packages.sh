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
    sudo apt install ripgrep
else
    echo "ripgrep is already installed."
fi

# Install bat
if ! command -v batcat >/dev/null 2>&1; then
    echo "Installing bat..."
    sudo apt install bat
    mkdir -p ~/.local/bin
    ln -s /usr/bin/batcat ~/.local/bin/bat
else
    echo "bat is already installed."
fi

# Install exa
if ! command -v exa >/dev/null 2>&1; then
    echo "Installing exa..."
    sudo apt install exa
else
    echo "exa is already installed."
fi

echo "Installation script completed."
