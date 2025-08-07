#!/bin/bash

# Caminho do arquivo
TARGET="main.py"

# Verifica se existe
if [ ! -f "$TARGET" ]; then
  echo "❌ Arquivo main.py não encontrado."
  exit 1
fi

# Corrige o import
echo "🔁 Corrigindo import: app.routes → routes"
sed -i '' 's/from app.routes import router/from routes import router/' "$TARGET"

# Mostra alterações
git diff "$TARGET"

# Commit e push
read -p "⚠️ Deseja commitar e fazer push? (s/n): " confirm
if [[ "$confirm" == "s" ]]; then
  git add "$TARGET"
  git commit -m "fix: corrigido caminho do import do router"
  git push
  echo "✅ Push feito. Vá ao Render e clique em: 'Manual Deploy > Deploy latest commit'"
else
  echo "🚫 Cancelado."
fi
