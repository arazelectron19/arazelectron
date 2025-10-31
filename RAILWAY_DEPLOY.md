# 🚂 Railway.app Backend Deploy Təlimatı

## 📋 Lazım Olan Hazırlıqlar

### 1️⃣ MongoDB Atlas Quraşdırma (Pulsuz)

Railway pulsuz MongoDB təklif etmir, ona görə MongoDB Atlas işlədəcəyik:

**a) MongoDB Atlas hesabı yaradın:**
- https://www.mongodb.com/cloud/atlas/register
- **Sign Up** (Google ilə daxil ola bilərsiniz)

**b) Pulsuz Cluster yaradın:**
- "Create" düyməsinə klikləyin
- **M0 (Free)** seçin
- Region: **AWS / eu-central-1** (Frankfurt - Azərbaycana yaxın)
- Cluster Name: `araz-elektron`
- **Create Cluster**

**c) Database User yaradın:**
- Sol menyudan: **Database Access**
- **Add New Database User**
- Username: `araz_user`
- Password: Güclü parol yaradın (yadda saxlayın!)
- **Add User**

**d) Network Access konfiqurasiya:**
- Sol menyudan: **Network Access**
- **Add IP Address**
- **Allow Access from Anywhere** (0.0.0.0/0)
- **Confirm**

**e) Connection String əldə edin:**
- **Database** → **Connect**
- **Connect your application**
- **Driver:** Python, **Version:** 3.11 or later
- Connection string-i kopyalayın:
```
mongodb+srv://araz_user:<password>@araz-elektron.xxxxx.mongodb.net/?retryWrites=true&w=majority
```
- `<password>` yerinə öz parolunuzu yazın!

---

## 2️⃣ Railway.app Deploy

### a) Railway Hesabı
- https://railway.app/
- **Login with GitHub** (GitHub ilə daxil olun)

### b) Yeni Project Yaradın
1. **Dashboard** → **New Project**
2. **Deploy from GitHub repo** seçin
3. Repo seçin: `arazelectron/arazelectron3`
4. **Deploy Now**

### c) Backend Service Konfiqurasiya

Railway backend-i avtomatik detect edəcək. Əgər etmirsə:

1. **Settings** → **Root Directory** → `/backend`
2. **Deploy**

### d) Environment Variables Əlavə Et

Railway dashboard-da backend service-ə klikləyin:

**Variables** bölməsinə keçin və əlavə edin:

```env
MONGO_URL=mongodb+srv://araz_user:SIZIN_PAROLUNUZ@araz-elektron.xxxxx.mongodb.net/?retryWrites=true&w=majority

DB_NAME=araz_elektron

CORS_ORIGINS=https://arazelectron.github.io,http://localhost:3000

PORT=8000
```

⚠️ **Qeyd:** `MONGO_URL`-də `<password>` yerinə MongoDB Atlas parolunuzu yazın!

### e) Deploy Başlayacaq

Railway avtomatik build edəcək və deploy edəcək. 2-3 dəqiqə gözləyin.

### f) Backend URL-i Əldə Et

Deploy tamamlandıqdan sonra:
1. **Settings** → **Networking** → **Generate Domain**
2. Domain yaradılacaq: `araz-elektron-backend.up.railway.app`
3. Bu URL-i kopyalayın! ✅

**Backend API test:**
```
https://araz-elektron-backend.up.railway.app/api/
```
Bu URL-ə daxil olun, `{"message":"Araz Elektron - API işləyir!"}` görməlisiniz.

---

## 3️⃣ İlkin Məlumatları Yüklə

Backend işə düşdükdən sonra:

```bash
curl -X POST https://sizin-backend-url.up.railway.app/api/initialize-data
```

Bu əmr:
- 6 sample məhsul əlavə edəcək
- Default kateqoriyalar yaradacaq

---

## 4️⃣ Frontend-i Backend-ə Bağla

Emergent platformasında `/app/frontend/.env` faylını yeniləyin:

```env
REACT_APP_BACKEND_URL=https://sizin-backend-url.up.railway.app
WDS_SOCKET_PORT=443
REACT_APP_ENABLE_VISUAL_EDITS=false
ENABLE_HEALTH_CHECK=false
```

⚠️ **Backend URL-in sonunda `/api` yazMAYIN!** Frontend özü əlavə edəcək.

---

## 5️⃣ Yenidən Build və Deploy

```bash
cd /app/frontend
yarn build
yarn deploy
```

---

## 6️⃣ GitHub Pages-ə Push

1. Emergent-də **"Save to GitHub"** düyməsi
2. Repo: `arazelectron/arazelectron3`
3. **PUSH TO GITHUB**

---

## ✅ Hazırdır! Saytınız İşləyir

- **Frontend:** https://arazelectron19.github.io/arazelectron
- **Backend API:** https://sizin-url.up.railway.app
- **Admin Panel:** https://arazelectron19.github.io/arazelectron/#/araz79

---

## 🔧 Troubleshooting

### Railway deploy uğursuz olarsa:

1. **Logs**-a baxın: Railway dashboard → **Deployments** → **View Logs**

2. **Port error** varsa:
   - Variables-da `PORT=8000` olduğundan əmin olun

3. **MongoDB bağlantı xətası:**
   - Network Access-də 0.0.0.0/0 allow edildiyindən əmin olun
   - Connection string doğru kopyalandığından əmin olun
   - Parol doğrudur?

4. **CORS error frontend-də:**
   - Backend `CORS_ORIGINS`-də GitHub Pages URL-i varmı?
   - `https://arazelectron.github.io` (slash yoxdur!)

---

## 💰 Railway Pulsuz Plan Limitləri

- **$5 pulsuz kredit hər ay**
- **500 saat runtime** (unlimited idle time)
- Kiçik layihələr üçün kifayətdir! 🎉

Əgər limit dolsa:
1. Credit card əlavə edin (charge olunmaz, sadəcə verification)
2. Və ya backend-i Render.com-a köçürün

---

## 📞 Suallar?

Railway ilə problem yaranarsa, Emergent chat-də soruşun! 💬
