#!/usr/bin/env bash

# Get the Operating System type
OS_TYPE=$(uname -s)

case "$OS_TYPE" in
    Darwin)
        echo "🍎 macOS detected."
        if command -v brew >/dev/null 2>&1; then
            bash ./setups/setup-mac.sh
        else
            echo "❌ Homebrew not found. Please install it first."
            exit 1
        fi
        ;;
    Linux)
        pushd "./setups/" || exit 10
        if [ -f /etc/os-release ]; then
            . /etc/os-release
            case "$ID" in
                ubuntu|debian|pop)
                    echo "🐧 Ubuntu/Debian-based system detected ($ID)."
                    bash ./setup-ubuntu.sh
                    ;;
                arch|manjaro)
                    echo "󰣇 Arch Linux-based system detected ($ID)."
                    bash ./setup-arch.sh
                    ;;
                rhel|fedora|centos)
                    echo "🎩 Red Hat-based system detected ($ID)."
                    bash ./setup-redhat.sh
                    ;;
                *)
                    echo "❓ Unsupported Linux distribution: $ID"
                    exit 1
                    ;;
            esac
        else
            echo "❌ Could not determine Linux distribution."
            exit 1
        fi
        popd || exit 11
        ;;
    *)
        echo "❌ Unknown Operating System: $OS_TYPE"
        exit 1
        ;;
esac