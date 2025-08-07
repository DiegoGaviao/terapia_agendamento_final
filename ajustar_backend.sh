#!/bin/bash

# Saída imediata se algum comando falhar
set -e

echo "Movendo routes.py para a raiz do projeto..."
mv backend/app/routes.py .

echo "Atualizando main.py para importar diretamente de routes.py..."

# Substitui linha de importação antiga por nova (funciona no Mac)
sed -i '' 's/from .*routes import/from routes import/' main.py

echo "Limpando pastas vazias..."
rmdir backend/app || true
rmdir backend || true

echo "Pronto! Agora basta dar push no GitHub e fazer o deploy no Render."
