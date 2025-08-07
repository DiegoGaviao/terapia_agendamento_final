#!/bin/bash

echo "🔧 Corrigindo importação em main.py..."
sed -i '' 's/from app.routes/from routes/' main.py

echo "✅ Arquivo main.py ajustado."

echo "📦 Adicionando mudanças ao Git..."
git add main.py
git commit -m "fix: corrigida importação do router no main.py"
git push

echo "🚀 Agora vá até o Render e clique em: Manual Deploy > Deploy latest commit"
echo "🔗 Link: https://dashboard.render.com/"
