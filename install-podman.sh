#!/bin/bash

set -e

echo "=============================="
echo "   INSTALADOR PODMAN"
echo "=============================="
echo ""
echo "Escolha sua distribuição:"
echo "1) Arch / CachyOS / Manjaro"
echo "2) Debian / Ubuntu"
echo "3) Red Hat / Fedora / CentOS"
echo ""

read -p "Digite a opção (1-3): " distro

install_arch() {
  echo ">>> Instalando no Arch Linux..."
  sudo pacman -Syu --noconfirm
  sudo pacman -S --noconfirm podman podman-compose buildah skopeo
}

install_debian() {
  echo ">>> Instalando no Debian/Ubuntu..."
  sudo apt update
  sudo apt install -y podman podman-compose buildah skopeo uidmap
}

install_redhat() {
  echo ">>> Instalando no Red Hat/Fedora..."
  if command -v dnf >/dev/null 2>&1; then
    sudo dnf install -y podman podman-compose buildah skopeo
  else
    sudo yum install -y podman podman-compose buildah skopeo
  fi
}

echo ""
case $distro in
  1)
    install_arch
    SYSTEMD_USER=1
    ;;
  2)
    install_debian
    SYSTEMD_USER=1
    ;;
  3)
    install_redhat
    SYSTEMD_USER=1
    ;;
  *)
    echo "Opção inválida"
    exit 1
    ;;
esac

echo ""
echo "=== Ativando Podman (user socket) ==="

systemctl --user enable --now podman.socket || true

echo ""
echo "=== Verificando instalação ==="

podman --version

echo ""
echo "=== Status do socket ==="

systemctl --user status podman.socket --no-pager || true

echo ""
echo "=== Socket path ==="

echo "$XDG_RUNTIME_DIR/podman/podman.sock"

echo ""
echo "=== Teste básico ==="

if podman info >/dev/null 2>&1; then
  echo "Podman OK ✔"
else
  echo "Problema detectado ❌"
fi

echo ""
echo "=============================="
echo "Instalação concluída"
echo "=============================="
