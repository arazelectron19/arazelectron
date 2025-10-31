# 🚀 Araz Elektron - GitHub Pages Deployment Təlimatı

## 📋 Hazırlıq

Saytınız GitHub Pages üçün hazır vəziyyətdədir! 

**Homepage URL:** `https://arazelectron19.github.io/arazelectron`

---

## 🔧 Deploy Addımları

### 1️⃣ **Kodları GitHub-a Göndərin**

Emergent platformasında:
1. Chat input sahəsinin yanındakı **"Save to GitHub"** düyməsini klikləyin
2. **arazelectron/arazelectron3** repo-sunu seçin (və ya yeni yaradın)
3. Branch seçin (main/master)
4. **"PUSH TO GITHUB"** düyməsinə basın

---

### 2️⃣ **GitHub Pages-i Aktivləşdirin**

GitHub repo-sunuza gedin:
1. **Settings** → **Pages** bölməsinə keçin
2. **Source** dropdown-dan **"gh-pages"** branch-ını seçin
3. **Save** düyməsinə basın
4. 1-2 dəqiqə gözləyin (GitHub Pages deploy edəcək)

---

### 3️⃣ **Deploy Edin**

Local kompüterinizdə (və ya Emergent terminalında):

```bash
cd /app/frontend
yarn deploy
```

Bu əmr:
- Production build yaradacaq
- `build` qovluğunu `gh-pages` branch-ına push edəcək
- GitHub Pages avtomatik yeniləyəcək

---

## 🌐 Saytınız Hazırdır!

Deploy tamamlandıqdan sonra saytınız buradan əlçatan olacaq:

**🔗 https://arazelectron19.github.io/arazelectron**

---

## 🔄 Yeniləmələr

Hər dəyişiklikdən sonra:

1. Emergent-də kodları yeniləyin
2. **"Save to GitHub"** ilə push edin
3. Terminal-da `cd /app/frontend && yarn deploy` əmrini işlədin

---

## ⚠️ Qeydlər

- **Backend API:** GitHub Pages yalnız static faylları host edir. Backend API üçün ayrıca hosting lazımdır (Heroku, Railway, Render, və s.)
- **HashRouter:** GitHub Pages üçün `HashRouter` istifadə olunur (URL-də `#` olacaq)
- **CORS:** Backend API-nizin CORS konfiqurasiyasını yoxlayın

---

## 🛠 Backend Deploy (Tövsiyə)

Backend-i deploy etmək üçün:

**1. Railway.app** (Tövsiyə edilir)
```bash
# Railway CLI install
npm i -g @railway/cli

# Deploy
cd /app/backend
railway login
railway init
railway up
```

**2. Render.com**
- GitHub repo-nu bağlayın
- "New Web Service" yaradın
- Build Command: `pip install -r requirements.txt`
- Start Command: `uvicorn server:app --host 0.0.0.0 --port $PORT`

**3. Heroku**
```bash
heroku create araz-elektron-api
git push heroku main
```

Backend deploy edildikdən sonra, frontend `.env` faylında `REACT_APP_BACKEND_URL` əlavə edin və yenidən deploy edin.

---

## 📞 Dəstək

Suallarınız varsa, Emergent chat-də soruşun! 💬
