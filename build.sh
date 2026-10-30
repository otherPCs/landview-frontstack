#!/bin/bash
set -e

echo "Clonando o Flutter..."
git clone --depth 1 --branch stable https://github.com/flutter/flutter.git "$HOME/flutter"
export PATH="$HOME/flutter/bin:$PATH"

echo "Configurando o Flutter..."
flutter config --enable-web
flutter pub get

echo "Construindo o app..."
flutter build web --release \
  --dart-define=DEMO=false \
  --dart-define=API_URL=https://landview-api.onrender.com \
  --base-href="/"

echo "Fazendo o deploy..."
npx wrangler deploy