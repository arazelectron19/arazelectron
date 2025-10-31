# 🚀 GitHub Pages Deploy - /docs Folder Method

## 📋 Overview

Bu layihə GitHub Pages üçün `/docs` qovluğu metodundan istifadə edir. Build output-u `/docs` qovluğundadır və GitHub-a push edildikdə avtomatik deploy olunur.

---

## ✅ Quick Start

### 1️⃣ Build Yaradın (Artıq hazırdır!)

Build artıq `/app/docs` qovluğundadır və commit-ə hazırdır.

Yenidən build etmək üçün:
```bash
# Avtomatik build script
/app/scripts/build-github-pages.sh

# Və ya manual
cd /app/frontend
yarn build
rm -rf /app/docs/*
cp -r /app/frontend/build/* /app/docs/
cp /app/frontend/public/.nojekyll /app/docs/.nojekyll
```

### 2️⃣ GitHub-a Push Edin

**Emergent platformasında:**
1. **"Save to GitHub"** düyməsinə klikləyin
2. Repo seçin: `arazelectron19/arazelectron`
3. Branch: `main` (və ya `master`)
4. **PUSH TO GITHUB** ✅

**IMPORTANT:** `/docs` qovluğu `.gitignore`-da olmadığından avtomatik push olunacaq!

### 3️⃣ GitHub Pages Aktivləşdirin

GitHub repo-da:
1. **Settings** → **Pages**
2. **Source:** "Deploy from a branch"
3. **Branch:** `main` → **Folder:** `/docs` 
4. **Save**

**2-3 dəqiqə gözləyin...**

### 4️⃣ Saytınız Hazırdır! 🎉

```
https://arazelectron19.github.io/arazelectron
```

---

## 🔄 Kod Yeniləmələri

Hər dəfə kod dəyişdirəndə:

```bash
# 1. Build yarat
/app/scripts/build-github-pages.sh

# 2. GitHub-a push et
# Emergent: "Save to GitHub" düyməsi

# 3. Gözlə (2-3 dəq)
# GitHub Pages avtomatik yeniləyəcək
```

---

## 📂 Struktur

```
/app/
├── docs/                    ← GitHub Pages build (commit edilir)
│   ├── index.html
│   ├── 404.html
│   ├── .nojekyll
│   └── static/
│       ├── js/
│       └── css/
├── frontend/
│   ├── build/              ← Local build (ignore edilir)
│   └── src/
└── backend/
```

---

## ⚙️ Konfiqurasiya

### package.json
```json
{
  "homepage": "https://arazelectron19.github.io/arazelectron"
}
```

### .gitignore
```
# /docs qovluğu ignore EDİLMƏMİŞDİR (GitHub Pages üçün lazımdır)
/build        ← ignore edilir
dist/         ← ignore edilir
docs/         ← COMMIT EDİLİR ✅
```

---

## 🆚 /docs vs gh-pages Branch

### `/docs` Metodu (Hazırki) ✅
**Üstünlükləri:**
- ✅ Sadə - hər şey main branch-dadır
- ✅ Vizual - build-i repo-da görə bilərsiniz
- ✅ Sürətli - deploy daha sürətlidir

**Çatışmazlıqları:**
- ⚠️ Repo ölçüsü artır (build faylları)
- ⚠️ Main branch-da həm kod, həm build

### `gh-pages` Branch Metodu
**Üstünlükləri:**
- ✅ Təmiz main branch (yalnız kod)
- ✅ Kiçik repo ölçüsü

**Çatışmazlıqları:**
- ⚠️ Əlavə package lazımdır (`gh-pages`)
- ⚠️ Əlavə addım (yarn deploy)

---

## 🔧 Troubleshooting

### Sayt açılmır?
1. **5 dəqiqə gözləyin** (ilk deploy uzun çəkə bilər)
2. GitHub repo Settings → Pages → URL yoxlayın
3. Build uğurludur? `/docs/index.html` mövcuddur?

### 404 Error?
1. `/docs/.nojekyll` faylı varmı?
2. `/docs/404.html` mövcuddur?
3. `homepage` URL-i düzgündür?

### Dəyişikliklər görünmür?
1. Browser cache təmizləyin (Ctrl+Shift+R)
2. GitHub Actions-da deploy statusunu yoxlayın
3. Yeni commit olduğundan əmin olun

---

## 🌐 Custom Domain (Optional)

Custom domain əlavə etmək üçün:

1. **DNS Provider-də:**
   ```
   Type: CNAME
   Name: www
   Value: arazelectron.github.io
   ```

2. **GitHub Settings → Pages:**
   - Custom domain: `www.arazelectron.com`
   - Save

3. **`/docs/CNAME` faylı:**
   ```
   www.arazelectron.com
   ```

---

## 📊 Xüsusiyyətlər

✅ **Avtomatik Deploy** - Push edildikdə avtomatik yenilənir  
✅ **SSL/HTTPS** - GitHub avtomatik təmin edir  
✅ **CDN** - Global sürətli çatdırılma  
✅ **404 Handling** - SPA routing üçün  
✅ **No Jekyll** - React app düzgün işləyir  

---

## 🎯 Backend Integration

GitHub Pages yalnız static faylları host edir. Backend üçün:

### Option 1: Railway.app (Recommended)
```bash
# Backend-i Railway-də host edin
# Frontend .env:
REACT_APP_BACKEND_URL=https://your-app.up.railway.app
```

### Option 2: Render.com
```bash
# Backend-i Render-də host edin
# Frontend .env:
REACT_APP_BACKEND_URL=https://your-app.onrender.com
```

**Sonra yenidən build:**
```bash
/app/scripts/build-github-pages.sh
# Save to GitHub
```

---

## 📞 Kömək

Problem yaşayırsınız?
- 📖 [GitHub Pages Documentation](https://docs.github.com/en/pages)
- 💬 Emergent Chat-də soruşun

---

**🎉 Deploy uğurlu olsun!**
