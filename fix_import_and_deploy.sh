#!/bin/bash

# Caminho do arquivo que precisa ser corrigido
TARGET="main.py"

# Confirma se o arquivo existe
if [ ! -f "$TARGET" ]; then
  echo "❌ Arquivo $TARGET não encontrado."
  exit 1
fi

# Faz substituição segura no import
echo "🔧 Corrigindo import no $TARGET..."
sed -i '' 's/from routes import router/from app.routes import router/' "$TARGET"

# Mostra diff para revisão
echo "📄 Alterações:"
git diff "$TARGET"

# Confirma com o usuário
read -p "✅ Deseja continuar com o commit e push? (s/n): " confirm
if [[ $confirm != "s" ]]; then
  echo "🚫 Cancelado."
  exit 0
fi

# Git commit e push
echo "📦 Commitando e enviando para o Git..."
git add "$TARGET"
git commit -m "fix: corrigido import para app.routes no main.py"
git push

echo "✅ Pronto. Volte ao Render e clique em: 'Manual Deploy > Deploy latest commit'"
