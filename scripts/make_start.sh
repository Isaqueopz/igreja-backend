#!/bin/bash

echo "Verificando status do MySQL..."

if systemctl is-active --quiet mysql; then
  echo "MySQL já está rodando."
else
  echo "MySQL não está rodando. Iniciando MySQL..."
  sudo systemctl start mysql
  sleep 5
  if systemctl is-active --quiet mysql; then
    echo "MySQL iniciado com sucesso."
  else
    echo "Falha ao iniciar MySQL. Verifique manualmente."
    exit 1
  fi
fi

echo "Iniciando aplicação NestJS..."
npm run start:dev
