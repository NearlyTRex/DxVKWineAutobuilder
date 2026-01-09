#!/bin/bash
#
# Clean script for DxVK Wine Autobuilder
# Removes all build artifacts and temporary files
#

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "DxVK Wine Autobuilder - Clean Script"
echo "====================================="
echo ""

# Debian build directories
if ls "${SCRIPT_DIR}"/debian/wineroot/winebuild_* 1>/dev/null 2>&1; then
    echo "Found Debian Wine build directories:"
    du -sh "${SCRIPT_DIR}"/debian/wineroot/winebuild_* 2>/dev/null
    echo ""
    read -p "Remove Debian Wine build directories? [Y/n] " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]] || [[ -z $REPLY ]]; then
        echo "Removing Debian Wine build directories..."
        rm -rf "${SCRIPT_DIR}"/debian/wineroot/winebuild_*
        echo "Done."
    fi
else
    echo "No Debian Wine build directories found."
fi

echo ""

# Wine addons build directories
if ls "${SCRIPT_DIR}"/debian/wine_addons_root/wine_addons_build_* 1>/dev/null 2>&1; then
    echo "Found Wine addons build directories:"
    du -sh "${SCRIPT_DIR}"/debian/wine_addons_root/wine_addons_build_* 2>/dev/null
    echo ""
    read -p "Remove Wine addons build directories? [Y/n] " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]] || [[ -z $REPLY ]]; then
        echo "Removing Wine addons build directories..."
        rm -rf "${SCRIPT_DIR}"/debian/wine_addons_root/wine_addons_build_*
        echo "Done."
    fi
else
    echo "No Wine addons build directories found."
fi

echo ""

# Arch build directories
if ls "${SCRIPT_DIR}"/arch/0-*/pkg 1>/dev/null 2>&1 || ls "${SCRIPT_DIR}"/arch/0-*/src 1>/dev/null 2>&1; then
    echo "Found Arch build artifacts:"
    du -sh "${SCRIPT_DIR}"/arch/0-*/{pkg,src} 2>/dev/null
    echo ""
    read -p "Remove Arch build artifacts? [Y/n] " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]] || [[ -z $REPLY ]]; then
        echo "Removing Arch build artifacts..."
        rm -rf "${SCRIPT_DIR}"/arch/0-*/{pkg,src,*.tar.xz,*.tar.zst,*.sig}
        echo "Done."
    fi
else
    echo "No Arch build artifacts found."
fi

echo ""
echo "Clean complete."
