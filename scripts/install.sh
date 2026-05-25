#!/bin/bash
# ==============================
# Personalised Arch Linux Setup Script
# Run as user after fresh install using
# sudo pacman -S --noconfirm git curl base-devel && \ git clone https://github.com/FilthyRC/Fresh-Arch-Setup.git ~/.dotfiles && \ cd ~/.dotfiles && ./install.sh
# ==============================

set -euo pipefail

echo "=============================="
echo "Started Arch Linux + Hyprland Setup"
echo "=============================="
echo ""
echo "NB: This script assumes you have already ran:"
echo "           sudo pacman -S git curl base-devel"
echo ""

# ===== Ensure Core Tools Are Installed =====
echo "Ensuring core tools are installed..."
sudo pacman -S --noconfirm --needed git curl base-devel
echo "✅ Required tools installed"

# ===== Backup Exisiting Configs =====
echo "Backing up exisiting configs..."
./scripts/backup-existing.sh || echo "Warning: Backup scipt skipped"

# ===== Install Yay (AUR Helper) =====
if ! command -v yay &> /dev/null; then
    echo "Yay not found. Installing... "
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay
    makepkg -si --noconfirm
    cd ~
    rm -rf /tmp/yay
    echo "✅ Yay installed successfully"
else
    echo "✅ Yay already installed"
fi

