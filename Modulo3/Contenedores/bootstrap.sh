#!/bin/bash
set -e

echo "==> Verificando si Docker ya está instalado..."

if command -v docker >/dev/null 2>&1; then
  echo "==> Docker ya está instalado. No se requiere ninguna acción."
  exit 0
fi

echo "==> Instalando dependencias necesarias..."
dnf -y install dnf-plugins-core

echo "==> Agregando repositorio oficial de Docker..."
dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

echo "==> Instalando Docker Engine..."
dnf -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "==> Habilitando e iniciando el servicio Docker..."
systemctl enable --now docker

echo "==> Agregando usuario vagrant al grupo docker..."
usermod -aG docker vagrant

echo "==> Verificando instalación..."
docker --version || true
docker compose version || true

echo "==> Instalación finalizada."
echo "==> Nota: vuelve a entrar con 'vagrant ssh' para aplicar grupo docker."
