# 🚀 ADDIM-ADDIM DEPLOY TƏLİMATI

Bu təlimat sizə **5-10 dəqiqə** ərzində saytınızı tam işlək vəziyyətdə deploy etməyə kömək edəcək.

---

## ✅ Ön Hazırlıq (5 dəqiqə)

### 1. MongoDB Atlas Hesabı (2 dəqiqə)

**a) Qeydiyyat:**
```
🔗 https://www.mongodb.com/cloud/atlas/register
```
- Google ilə daxil ola bilərsiniz
- Heç bir ödəniş məlumatı lazım deyil

**b) Pulsuz Cluster yarat:**
- "Create" → **M0 Free** seçin
- Region: **AWS / Frankfurt (eu-central-1)**
- **Create Cluster** (2 dəqiqə gözləməli olacaq)

**c) Database User:**
- Sol menyu: **Database Access**
- **Add New Database User**
  - Username: `araz_user`
  - Password: Güclü parol (kopyalayın! 📋)
- **Add User**

**d) IP Access:**
- Sol menyu: **Network Access**
- **Add IP Address**
- **Allow Access from Anywhere**
- **Confirm**

**e) Connection String:**
- **Database** → **Connect** → **Connect your application**
- Connection string-i kopyalayın:
```
mongodb+srv://araz_user:PAROL@cluster.xxxxx.mongodb.net/?retryWrites=true&w=majority
```
- `PAROL` yerinə öz parolunuzu yazın! ⚠️

✅ **MongoDB hazırdır!**

---

### 2. Railway.app Hesabı (1 dəqiqə)

```
🔗 https://railway.app/
```

- **Login with GitHub** düyməsini klikləyin
- GitHub ilə daxil olun
- Railway hesabınız yaradıldı! ✅

---

## 🚂 Railway Backend Deploy (3 dəqiqə)

### 1. GitHub-a Push

**Emergent platformasında:**
- Chat input sahəsinin yanında **"Save to GitHub"** düyməsi
- Repo seçin: `arazelectron19/arazelectron` 
  - Əgər yoxdursa, **"Create new repository"**
  - Repo adı: `arazelectron3`
  - Public
  - Create
- Branch: `main`
- **PUSH TO GITHUB** ✅

### 2. Railway-də Backend Deploy

**Railway Dashboard:**

1. **New Project** → **Deploy from GitHub repo**
2. Repo seçin: `arazelectron3`
3. **Add variables** (aşağıdakıları əlavə edin):

```env
MONGO_URL=mongodb+srv://araz_user:SIZIN_PAROLUNUZ@cluster.xxxxx.mongodb.net/?retryWrites=true&w=majority
DB_NAME=araz_elektron
CORS_ORIGINS=https://arazelectron.github.io
```

⚠️ **MONGO_URL-də öz connection string-inizi istifadə edin!**

4. **Settings** → **Root Directory** → `/backend` ✏️
5. **Deploy** düyməsi (yuxarı sağ küncdə)

### 3. Backend URL Əldə Et

Deploy tamamlanandan sonra (2 dəqiqə):

1. **Settings** → **Networking**
2. **Generate Domain** düyməsi
3. URL yaradılacaq: `xxx.up.railway.app`
4. **Kopyalayın! 📋** Bunu lazım olacaq!

### 4. Backend Testi

Brauzerdə açın:
```
https://sizin-url.up.railway.app/api/
```

Görməlisiniz:
```json
{"message":"Araz Elektron - API işləyir!"}
```

✅ **Backend hazırdır!**

### 5. İlkin Məlumatları Yüklə

Terminalda (və ya brauzerdə açın):
```bash
curl -X POST https://sizin-url.up.railway.app/api/initialize-data
```

Cavab:
```json
{"message":"6 ilkin məhsul əlavə edildi"}
```

✅ **Məlumatlar yükləndi!**

---

## 🎨 Frontend Deploy (2 dəqiqə)

### 1. Frontend .env Yenilə

**Emergent platformasında `/app/frontend/.env` faylını açın və yeniləyin:**

```env
REACT_APP_BACKEND_URL=https://sizin-railway-url.up.railway.app
WDS_SOCKET_PORT=443
REACT_APP_ENABLE_VISUAL_EDITS=false
ENABLE_HEALTH_CHECK=false
```

⚠️ URL-in **sonunda `/api` YAZMAYIN!**

### 2. Build və Deploy

**Terminalda:**
```bash
cd /app/frontend
yarn build
yarn deploy
```

Bu 1-2 dəqiqə çəkəcək. ⏳

### 3. GitHub Pages Aktivləşdir

**GitHub repo-da:**
1. **Settings** → **Pages**
2. **Source:** `gh-pages` branch
3. **Save**

2-3 dəqiqə gözləyin. 🕐

---

## 🎉 HAZIRDıR! Saytınız Canlıdır!

### Test Edin:

**Frontend:**
```
https://arazelectron19.github.io/arazelectron
```

**Admin Panel:**
```
https://arazelectron19.github.io/arazelectron/#/araz79
```

**Backend API:**
```
https://sizin-url.up.railway.app/api/products
```

---

## 🔄 Gələcək Yeniləmələr

Kod dəyişdirib yeniləmək istəyəndə:

1. **Emergent-də kod yaz**
2. **"Save to GitHub"** düyməsi
3. Railway avtomatik yenidən deploy edəcək (backend)
4. Frontend üçün: `cd /app/frontend && yarn build && yarn deploy`

---

## ❌ Problem Yaranarsa?

### Backend işləmir:
- Railway logs yoxlayın: Dashboard → Deployments → View Logs
- MongoDB connection string doğrudur?
- MONGO_URL-də parol doğrudur?

### Frontend məhsulları göstərmir:
- Browser console açın (F12)
- CORS error varmı?
- `REACT_APP_BACKEND_URL` doğru yazılıb?
- Backend URL-də `/api` yazılıbmı? (YAZILMAMALIDIR!)

### GitHub Pages açılmır:
- 5 dəqiqə gözləyin
- Settings → Pages → Source `gh-pages` branch seçilmiş?
- Repo public-dir?

---

## 💡 Məsləhətlər

1. **Railway pulsuz limiti:** $5/ay kredit (500 saat). Lazım olarsa credit card əlavə edin (charge olmaz).

2. **MongoDB Atlas pulsuz:** 512MB storage. Layihə böyüyəndə upgrade edin.

3. **Custom domain:** Railway və GitHub Pages ikisində də custom domain əlavə edə bilərsiniz.

4. **HTTPS:** Hər ikisi avtomatik SSL sertifikat verir. ✅

---

## 📞 Kömək

Hələ də problem var? **Emergent chat-də soruşun!** 💬

Bu təlimat addım-addım izlənərsə, 10 dəqiqədə tam işlək sayt əldə edəcəksiniz! 🚀
