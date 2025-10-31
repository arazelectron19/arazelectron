#!/bin/bash

# GitHub Pages Build Script
# Bu script frontend-i build edib /docs qovluğuna köçürür

set -e

echo "🔨 Frontend build başlayır..."
cd /app/frontend
yarn build

echo "📦 Build faylları /docs qovluğuna köçürülür..."
rm -rf /app/docs/*
cp -r /app/frontend/build/* /app/docs/

echo "📄 .nojekyll faylı əlavə edilir..."
cp /app/frontend/public/.nojekyll /app/docs/.nojekyll

echo "✅ GitHub Pages build tamamlandı!"
echo ""
echo "📂 Build yerləşdiyi: /app/docs/"
echo "🔗 Homepage: https://arazelectron19.github.io/arazelectron"
echo ""
echo "🚀 GitHub-a push etmək üçün:"
echo "   1. 'Save to GitHub' düyməsinə klikləyin"
echo "   2. Repo: arazelectron19/arazelectron"
echo "   3. GitHub repo Settings → Pages"
echo "   4. Source: Deploy from a branch"
echo "   5. Branch: main → /docs"
echo "   6. Save"
echo ""
echo "🌐 Saytınız 2-3 dəqiqə sonra hazır olacaq!"
echo "   https://arazelectron19.github.io/arazelectron"
